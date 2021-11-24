from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()

# implement database model classes
association_table = db.Table(
    "association",
    db.Model.metadata,
    db.Column("course_id", db.Integer, db.ForeignKey("course.id")),
    db.Column("user_id", db.Integer, db.ForeignKey("user.id"))
)

association_table_2 = db.Table(
    "association_2",
    db.Model.metadata,
    db.Column("course_id", db.Integer, db.ForeignKey("course.id")),
    db.Column("user_id", db.Integer, db.ForeignKey("user.id"))
)

class Course(db.Model):
    __tablename__ = 'course'
    id = db.Column(db.Integer, primary_key = True)
    code = db.Column(db.String, nullable = False)
    name = db.Column(db.String, nullable = False)
    department = db.Column(db.String, nullable = False)
    professor = db.Column(db.String, nullable = False)
    prerequisites = db.Column(db.String, nullable = False)
    assignments = db.relationship("Assignment", cascade="delete")
    instructors = db.relationship("User", secondary=association_table, back_populates="courses_instructor")
    students = db.relationship("User", secondary=association_table_2, back_populates="courses_student")

    def __init__(self, **kwargs):
        self.code = kwargs.get("code")
        self.name = kwargs.get("name")
        self.department = kwargs.get("department")
        self.professor = kwargs.get("professor")
        self.prerequisites = kwargs.get("prerequisites")

    def serialize(self):
        return {
            "id": self.id,
            "code": self.code,
            "name": self.name,
            "department": self.department,
            "professor": self.professor,
            "prerequisites": [p.sub_serialize() for p in self.prerequisites],
            "assignments": [a.sub_serialize() for a in self.assignments],
            "instructors": [i.sub_serialize() for i in self.instructors],
            "students": [s.sub_serialize() for s in self.students],
        }

    def sub_serialize(self):
        return {
            "id": self.id,
            "code": self.code,
            "name": self.name,
            "department": self.department,
            "professor": self.professor,
            "prerequisites": [p.sub_serialize() for p in self.prerequisites],
            "assignments": [a.serialize() for s in self.assignments],
        }

    def sub_serialize_2(self):
        return {
            "id": self.id,
            "code": self.code,
            "name": self.name,
        }

class Assignment(db.Model):
    __tablename__ = 'assignment'
    id = db.Column(db.Integer, primary_key = True)
    title = db.Column(db.String, nullable = False)
    due_date = db.Column(db.Integer, nullable = False)
    course_id = db.Column(db.Integer, db.ForeignKey("course.id"))

    def __init__(self, **kwargs):
        self.title = kwargs.get("title")
        self.due_date = kwargs.get("due_date")

    def serialize(self):
        return {
            "id": self.id,
            "title": self.title,
            "due_date": self.due_date,
            "course": self.course_id
        }

    def sub_serialize(self):
        return {
            "id": self.id,
            "title": self.title,
            "due_date": self.due_date,
        }

class User(db.Model):
    __tablename__ = 'user'
    id = db.Column(db.Integer, primary_key = True)
    name = db.Column(db.String, nullable = False)
    netid = db.Column(db.String, nullable = False)
    email = db.Column(db.String, nullable = False)
    major = db.Column(db.String, nullable = False)
    grad_year = db.Column(db.Integer, nullable = False)
    courses_instructor = db.relationship("Course", secondary=association_table, back_populates = "instructors")
    courses_student = db.relationship("Course", secondary=association_table_2, back_populates = "students")

    def __init__(self, **kwargs):
        self.name = kwargs.get("name")
        self.netid = kwargs.get("netid")
        self.email = kwargs.get("email")
        self.major = kwargs.get("major")
        self.grad_year = kwargs.get("grad_year")

    def serialize(self):
        return {
            "id": self.id,
            "name": self.name,
            "netid": self.netid,
            "email": self.email,
            "major": self.major,
            "graduation year": self.grad_year,
            "courses": [c.sub_serialize() for c in self.courses_student] + [c.sub_serialize() for c in self.courses_instructor]
        }

    def sub_serialize(self):
        return {
            "id": self.id,
            "name": self.name,
            "netid": self.netid,
            "email": self.email,
            "major": self.major,
            "graduation year": self.grad_year,
        }

# class Instructor(db.Model):
#     __tablename__ = 'instructor'
#     id = db.Column(db.Integer, primary_key = True)
#     name = db.Column(db.String, nullable = False)
#     netid = db.Column(db.String, nullable = False)
#     courses = db.relationship("Course", secondary=association_table, back_populates = "instructors")
#
#     def __init__(self, **kwargs):
#         self.name = kwargs.get("name")
#         self.netid = kwargs.get("netid")
#
#     def serialize(self):
#         return {
#             "id": self.id,
#             "name": self.name,
#             "netid": self.netid,
#             "courses": [c.serialize() for c in self.courses]
#         }
#
#     def sub_serialize(self):
#         return {
#             "id": self.id,
#             "name": self.name,
#             "netid": self.netid,
#         }
#
# class Student(db.Model):
#     __tablename__ = 'student'
#     id = db.Column(db.Integer, primary_key = True)
#     name = db.Column(db.String, nullable = False)
#     netid = db.Column(db.String, nullable = False)
#     courses = db.relationship("Course", secondary=association_table, back_populates = "student")
#
#     def __init__(self, **kwargs):
#         self.name = kwargs.get("name")
#         self.netid = kwargs.get("netid")
#
#     def serialize(self):
#         return {
#             "id": self.id,
#             "name": self.name,
#             "netid": self.netid,
#             "courses": [c.serialize() for c in self.courses]
#         }
#
#     def sub_serialize(self):
#         return {
#             "id": self.id,
#             "name": self.name,
#             "netid": self.netid,
#         }