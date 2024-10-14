# Enrollment System

## Core features and responsibilities

### Feature: Class Material(student)
### Feature: Class Material(teacher)
#### Responsibilities

##### Data data retrieval responsibilities
* Retrieve user profile data from the SIS when the enrollment feature is accessed.
* Ensure that user information is accurately transferred to the enrollment system.
* Protect user data integrity during the data transfer process.

##### Course data management responsibilities
* Identify the user's specialty to filter relevant courses.
* Fetch the list of courses from the database according to the user's enrolled in status.
* Display the list of courses on the user's dashboard in a structured and clear manner.

##### Student notification responsibilities
* Inform the students that enrolled in given subject on change in the course description/ attached new files.
* Provide status updates on the dashboard and via email or SMS if requested.

#### Safe data storage responsibilities
* Files upload to SIS must be secure and not visible to non-users.
* Files should be encrypted or otherwise protected.

# Enrollment System

## Core features and responsibilities

### Feature: Enroll accessibility
#### Responsibilities

##### Data data retrieval responsibilities
* Retrieve user profile data from the SIS when the course management feature is accessed.
* Ensure that course infromation is accurately transferred to the enrollment system.
* Protect course data integrity during the data transfer process.

##### Course data management responsibilities
* Control the enrollment status of each course
* The system must track which courses are publicly available for enrollment and which are not. It ensures that only courses with open enrollment are visible to potential students, maintaining data consistency.
* Each time the enrollment access is opened or closed, the system needs to log the changes, update the course's access status, and possibly notify students of changes in enrollment availability.
## Feature: Student Enrollment
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
# Enrollment System

# Feature: Unenroll Course
#### Data Retrieval Responsibilities

* Retrieve the student’s enrollment information from the database.
* Display the list of currently enrolled courses on the dashboard.

#### Validation Responsibilities

* Check the course's drop policy based on the current date and course-specific rules.
* Determine whether the student is allowed to drop the course or if the action should be blocked or warned.

#### User Interaction Responsibilities

* Provide a user interface for the student to select a course and confirm their decision to unenroll.
* Show appropriate warnings or messages when the student attempts to unenroll from a course past the drop deadline.

#### Data Update Responsibilities

* Remove the student’s enrollment record from the course in the database.
* Update the student's dashboard to reflect the unenrolled course.

#### Waitlist Management Responsibilities

* Automatically enroll the next student in the waiting list (if applicable).
* Notify the newly enrolled student via email or system notification.

#### Audit Logging Responsibilities

* Log the student’s unenrollment action for auditing purposes.
* Record any system notifications sent to students in the waitlist for tracking purposes.
