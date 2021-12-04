# Study With Me
Find and connect with classmates!

<img width="320" alt="SearchVC" src="https://user-images.githubusercontent.com/94802937/144695771-cfbe32d6-2a8e-42ac-affe-42ab34ffde6d.png">

<img width="321" alt="MyCoursesVC" src="https://user-images.githubusercontent.com/94802937/144695827-a83ce2db-d348-488a-98c8-a13ad5bbb16b.png">

<img width="322" alt="ProfileVC" src="https://user-images.githubusercontent.com/94802937/144695829-7efdff10-ac5b-4a6e-8de5-d077b259de56.png">

<img width="316" alt="StudentsInCourseVC" src="https://user-images.githubusercontent.com/94802937/144695832-440c4eec-9ff2-49ec-abc6-aba6c76d0e52.png">


This app is intended to allow users to connect with classmates in order to form study groups and/or friends.



Names: Ben Wu (bnw36), Ethan Mah (ecm237), Aaron Kang (uk44), Alexia Adams (aa862), Prachi Kelkar (pak226)

Frontend:


Backend:

Server Address: https://hack-challenge-study-with-me.herokuapp.com/
Endpoints:

@app.route("/api/courses/", methods=["GET"])
-> returns a list of all courses. each course has id, course code, course name, department, professor, prerequisites, assignments, students
 
@app.route("/api/courses/", methods=["POST"])
-> creates a new course with course code, course name, department, professor, prerequisites. if no input for prerequisites, it is set to "None"
 
@app.route("/api/courses/<int:course_id>/")
-> returns given information about a specified course (course_id is the actual id and not to be confused with course code)
 
@app.route("/api/courses/<int:course_id>/", methods=["DELETE"])
-> deletes a specified course
 
@app.route("/api/users/", methods=["GET"])
-> returns a list of all users. each user has id, name, netid, email, major, graduation year and courses they're in
  
@app.route("/api/users/", methods=["POST"])
-> creates a new course with name, netid, email, major, and graduation year
   
@app.route("/api/users/<int:user_id>/")
-> returns given information about a specified user
    
@app.route("/api/courses/<int:course_id>/add/", methods=["POST"])
-> adds a specified user to a specified course
     
@app.route("/api/courses/<int:course_id>/assignment/", methods=["POST"])
-> creates an assignment with title and due date, and adds it to specified course

@app.route("/api/courses/<int:course_id>/delete/", methods=["DELETE"])
-> removes a specified user from a specified course
