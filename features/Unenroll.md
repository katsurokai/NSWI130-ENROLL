# Enrollment System

## Core features and responsibilities

## Feature: Unenroll Course

As a student, I want to be able to unenroll a course I've enrolled in so that I can free up space in my schedule or make changes to my course plan.


### Feature breakdown

1. The student accesses the course enrollment dashboard.
2. The system retrieves student’s enrolled courses.
   *  The system retrieves the list of courses the student is currently enrolled in and displays them on the dashboard.
3. The student selects the course they want to drop.
4. The system checks the course's drop policy:
   1. Within Allowed Drop Period: 
      * If the course is within the allowed drop period, the system allows the student to proceed with the drop.
   
   2. Past Drop Deadline: 
     * If the course is past the drop deadline, the system displays a warning or blocks the unenrollment based on institutional rules.
5. The student confirms the drop action.
   * The student confirms the action to drop the course.
   * The system logs the confirmation, recording the student’s ID, the course ID, the timestamp, and whether the action was within the allowed period or after a warning.
6. The system updates enrollment data.
   * The system updates the database by removing the student’s enrollment from the selected course.
   * The system logs the successful unenrollment, capturing the student’s ID, course details, and the timestamp of the action.
7. The student’s dashboard is updated to reflect the changes.
8. Manage Waiting List
   * If the dropped course had a waiting list, the system automatically enrolls the next student in line and notifies them of the change.
   * The system logs the automatic enrollment, recording the newly enrolled student’s ID, course details, and when the notification was sent.


### Responsibilities

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
