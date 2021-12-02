import json
import os

from db import db
from db import Course
from db import Assignment
from db import User
from flask import Flask
from flask import request

# define db filename
db_filename = "courses.db"
app = Flask(__name__)

# setup config
app.config["SQLALCHEMY_DATABASE_URI"] = f"sqlite:///{db_filename}"
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False
app.config["SQLALCHEMY_ECHO"] = True

# initialize app
db.init_app(app)
with app.app_context():
    db.create_all()


# generalized response formats
def success_response(data, code=200):
    return json.dumps(data), code


def failure_response(message, code=404):
    return json.dumps({"error": message}), code


# -- COURSE ROUTES ------------------------------------------------------


@app.route("/")
@app.route("/api/courses/")
def get_courses():
    return success_response(
        {"courses": [c.serialize() for c in Course.query.all()]}
    )


@app.route("/api/courses/", methods=["POST"])
def create_course():
    body = json.loads(request.data)
    code = body.get("code")
    name = body.get("name")
    department = body.get("department")
    professor = body.get("professor")
    prerequisites = body.get("prerequisites","None")
    if not code or not name or not department or not professor:
        return failure_response("Missing fields!", 400)
    new_course = Course(code=code, name=name, department=department, professor=professor, prerequisites=prerequisites)
    db.session.add(new_course)
    db.session.commit()
    return success_response(new_course.serialize(),201)


@app.route("/api/courses/<int:course_id>/")
def get_course(course_id):
    course = Course.query.filter_by(id=course_id).first()
    if course is None:
        return failure_response("Course not found!")
    return success_response(course.serialize())


@app.route("/api/courses/<int:course_id>/", methods=["DELETE"])
def delete_course(course_id):
    course = Course.query.filter_by(id=course_id).first()
    if course is None:
        return failure_response("Course not found!")
    db.session.delete(course)
    db.session.commit()
    return success_response(course.serialize())


# -- USER ROUTES ---------------------------------------------------

@app.route("/api/users/")
def get_users():
    return success_response(
        {"users": [u.serialize() for u in User.query.all()]}
    )

@app.route("/api/users/", methods=["POST"])
def create_user():
    body = json.loads(request.data)
    name = body.get("name")
    netid = body.get("netid")
    email = body.get("email")
    major = body.get("major")
    grad_year = body.get("grad_year")
    if not name or not netid or not email or not major or not grad_year:
        return failure_response("Missing fields!",400)
    new_user = User(name = name,netid = netid, email = email, major = major, grad_year = grad_year)
    db.session.add(new_user)
    db.session.commit()
    return success_response(new_user.serialize(),201)

@app.route("/api/users/<int:user_id>/")
def get_user(user_id):
    user = User.query.filter_by(id=user_id).first()
    if user is None:
        return failure_response("User not found!")
    return success_response(user.serialize())

@app.route("/api/courses/<int:course_id>/add/", methods=["POST"])
def add_user_to_course(course_id):
    course = Course.query.filter_by(id=course_id).first()
    if course is None:
        return failure_response("Course not found!")
    body = json.loads(request.data)
    user_id = body.get("user_id")
    user = User.query.filter_by(id=user_id).first()
    course.students.append(user)
    db.session.commit()
    return success_response(course.serialize())

# -- ASSIGNMENT ROUTES --------------------------------------------------


@app.route("/api/courses/<int:course_id>/assignment/", methods=["POST"])
def create_assignment(course_id):
    course = Course.query.filter_by(id=course_id).first()
    if course is None:
        return failure_response("Course not found!")
    body = json.loads(request.data)
    title = body.get("title")
    due_date = body.get("due_date")
    if not title or not due_date:
        return failure_response("Missing fields!", 400)
    new_assignment = Assignment(title = title,due_date = due_date)
    course.assignments.append(new_assignment)
    db.session.add(new_assignment)
    db.session.commit()
    res = new_assignment.serialize()
    res["course"] = course.sub_serialize_2()
    return success_response(res,201)


if __name__ == "__main__":
    port = int(os.environ.get("PORT", 5000))
    app.run(host='0.0.0.0', port=port)
