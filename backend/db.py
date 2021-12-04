from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()

# implement database model classes
association_table = db.Table(
    "association",
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
    students = db.relationship("User", secondary=association_table, back_populates="courses_student")

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
            "prerequisites": self.prerequisites,
            "assignments": [a.sub_serialize() for a in self.assignments],
            "students": [s.sub_serialize() for s in self.students],
        }

    def sub_serialize(self):
        return {
            "id": self.id,
            "code": self.code,
            "name": self.name,
            "department": self.department,
            "professor": self.professor,
            "prerequisites": self.prerequisites,
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
    dueDate = db.Column(db.Integer, nullable = False)
    course_id = db.Column(db.Integer, db.ForeignKey("course.id"))

    def __init__(self, **kwargs):
        self.title = kwargs.get("title")
        self.dueDate = kwargs.get("dueDate")

    def serialize(self):
        return {
            "id": self.id,
            "title": self.title,
            "dueDate": self.dueDate,
            "course": self.course_id
        }

    def sub_serialize(self):
        return {
            "id": self.id,
            "title": self.title,
            "dueDate": self.dueDate,
        }

class User(db.Model):
    __tablename__ = 'user'
    id = db.Column(db.Integer, primary_key = True)
    name = db.Column(db.String, nullable = False)
    netid = db.Column(db.String, nullable = False)
    email = db.Column(db.String, nullable = False)
    major = db.Column(db.String, nullable = False)
    gradYear = db.Column(db.Integer, nullable = False)
    courses_student = db.relationship("Course", secondary=association_table, back_populates = "students")

    def __init__(self, **kwargs):
        self.name = kwargs.get("name")
        self.netid = kwargs.get("netid")
        self.email = kwargs.get("email")
        self.major = kwargs.get("major")
        self.gradYear = kwargs.get("gradYear")

    def serialize(self):
        return {
            "id": self.id,
            "name": self.name,
            "netid": self.netid,
            "email": self.email,
            "major": self.major,
            "gradYear": self.gradYear,
            "courses": [c.sub_serialize() for c in self.courses_student]
        }

    def sub_serialize(self):
        return {
            "id": self.id,
            "name": self.name,
            "netid": self.netid,
            "email": self.email,
            "major": self.major,
            "gradYear": self.gradYear,
        }
