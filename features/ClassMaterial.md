# Enrollment System

## Core features and responsibilities

### Feature: Class Material(teacher)

As a teacher, I want to share class material with the students.

#### Feature breakdown

1. The user accesses the Student Information System (SIS) main page and clicks on the enrollment feature.
2. The SIS retrieves the user’s profile data and sends it to the enrollment system.
3. The system displays the list of available courses on the user’s dashboard.
4. The system show the courses he teaches in in 'Tought classes' tab.
5. User selects the course.
6. Modifying course information:
    1. Teacher clicks change course description. If the character limit is not exceeded description is updated.
    2. Teacher clicks attach file. If the maximum number of attached files and maximum total file size for given course is not exceeded file is attached.
    3. Teacher clicks remove selected file.

# Enrollment System

## Core features and responsibilities

### Feature: Class Material(Student)

As a student I want to access said material for my education and studying purpuses.

#### Feature breakdown

1. The user accesses the Student Information System (SIS) main page and clicks on the enrollment feature.
2. The SIS retrieves the user’s profile data and sends it to the enrollment system.
3. The system displays the list of available courses on the user’s dashboard.
4. The system show the courses he enrolled in in 'Enrolled in' tab.
5. User selects the course.
6. Viewing material
    1. Student can see the course description.
    2. Student can download attached files by clicking on them.

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

