# Study With Me
Find and connect with classmates!



Names: Ben Wu (bnw36), Ethan Mah (ecm237) *insert your names and netids here*
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
