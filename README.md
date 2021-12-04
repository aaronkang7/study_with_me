# Study With Me
Find and connect with classmates!

<img width="320" alt="SearchVC" src="https://user-images.githubusercontent.com/94802937/144695894-a4d5734c-2375-4c13-8c12-f990f0ee5b4b.png">

<img width="321" alt="MyCoursesVC" src="https://user-images.githubusercontent.com/94802937/144695879-4426d91b-540b-4171-99bc-4b2394562378.png">

<img width="322" alt="ProfileVC" src="https://user-images.githubusercontent.com/94802937/144695861-d8c2624f-8873-4f59-a13d-1c980a0eb955.png">

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
