## Course Recommendations (Non-MVP):
As a student, I want the system to suggest courses based on my academic history, major, and degree requirements so that I can make informed decisions about future enrollments.

### Feature Breakdown:

1. The student accesses the recommended-courses page from enrollment dashboard.
2. The system retrieves student information from SIS and academic history from the database.
3. The system analyzes the student's academic history, including courses completed, and declared major.
4. Based on the analysis, the system suggests courses that:
   * Fulfill degree requirements
   * Are relevant to the student’s major or minor
5. The recommendations are displayed on the student’s dashboard under a "Recommended Courses" section.
6. The student can explore the recommendations and view details about each course, including:
   * Course description
   * Prerequisites
   * Instructor details
   * Available seats
   * Class schedule
7. Students can enroll directly from the recommendation list.
 * System logs the enrollment event.
8. The system updates recommendations after each enrollment. 

### Responsibilities:

#### Data Retrieval Responsibility:

 * Fetch student’s academic profile, including declared major/minor from SIS.
 * Fetch Academic History from Database. 

#### Data Analysis Responsibility : 

* Use historical enrollment including completed courses and major to generate accurate recommendations.
 
#### User Interaction Responsibilities:

 * Display recommended courses on the student’s dashboard.
 * Provide an option for students to click on the recommendations to view details or enroll.
 
#### Audit log Responsibilities: 
 
 * Log the student’s enrollment action for auditing purposes.

#### Data Update Responsibilities:

 * Update recommendations based on the student's latest enrollments or actions.
