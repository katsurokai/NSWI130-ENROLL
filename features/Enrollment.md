# Enrollment System

## Core features and responsibilities

### Feature: Student Enrollment

As a student, I want to easily enroll in courses through the enrollment system so that I can secure my spot in the required classes and track my enrollment status.

#### Feature breakdown

1. The user accesses the Student Information System (SIS) main page and clicks on the enrollment feature.
2. The SIS retrieves the user’s profile data and sends it to the enrollment system.
3. The system displays the list of available courses on the user’s dashboard.
4. The system show the courses to user dashboard.
5. When the user selects a course to enroll in, the system performs a validation check based on the type of enrollment:
   1. Enroll in lecture:
      1. The system checks the course's current capacity.
      2. If space is available, the user is successfully enrolled in the lecture, and the system stores the enrollment data in the database.
      3. If the course is full, the user is placed on a waiting list, and the system records this status in the database.
   2. Enroll in practical:
      1. The system verifies the practical course's capacity.
      2. If space are available, the user is enrolled in the practical, and the system logs the enrollment details in the database.
      3. If no space are available, the user is added to the waiting list for that practical, with all relevant data stored in the database.
6. System update the dashboard in enrollment for user to view the most recent enrollment status and waiting list information.

#### Responsibilities

##### Data data retrieval responsibilities
* Retrieve user profile data from the SIS when the enrollment feature is accessed.
* Ensure that user information is accurately transferred to the enrollment system.
* Protect user data integrity during the data transfer process.

##### Course data management responsibilities
* Identify the user's specialty to filter relevant courses.
* Fetch the list of courses from the database according to the user's program.
* Display the list of courses on the user's dashboard in a structured and clear manner.

##### Enrollment validation responsibilities
* Check the type of course enrollment (lecture or practical).
* Verify course capacity to determine availability.
* Handle both successful enrollments and full course scenarios efficiently.

##### Data storage responsibilities
* Record the enrollment details in the database for each successful registration.
* Update the waiting list with user information if the course capacity is reached.
* Maintain accurate records of all enrollment actions for auditing purposes.

##### Dashboard update responsibilities
* Dynamically update the user’s dashboard with the latest enrollment status.
* Highlight changes in the course enrollment status and waiting list position.
* Provide clear feedback and next steps to the user regarding their enrollment process.

##### User notification responsibilities

* Inform the user of successful enrollment or waiting list placement immediately.
* Provide status updates on the dashboard and via email or SMS if requested.
* Alert users if a seat becomes available in a course they are on the waiting list for.

##### Error handling and troubleshooting responsibilities

* Detect and handle errors that might occur during the data retrieval and enrollment process.
* Provide helpful error messages to guide users if enrollment fails.
* Log any system issues for further analysis and troubleshooting.
