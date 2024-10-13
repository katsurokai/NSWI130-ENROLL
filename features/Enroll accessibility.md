# Enrollment System

## Core features and responsibilities

### Feature: Enroll accessibility

As an administrator, I would like to have the ability to open and close enrollment access for any course.

#### Feature breakdown

1. The user accesses the Student Information System (SIS) main page and clicks on the enrollment feature.
2. The SIS retrieves the user’s profile data and displays the list of managed courses dashboard.
3. User selects the course button.
- To open course enrollment:
    1. The user submits the course to the public.
- To close course enrollment:
    1. The user selects the Close Enrollment button.


#### Responsibilities

##### Data data retrieval responsibilities
* Retrieve user profile data from the SIS when the course management feature is accessed.
* Ensure that course infromation is accurately transferred to the enrollment system.
* Protect course data integrity during the data transfer process.

##### Course data management responsibilities
* Control the enrollment status of each course 
* The system must track which courses are publicly available for enrollment and which are not. It ensures that only courses with open enrollment are visible to potential students, maintaining data consistency.
* Each time the enrollment access is opened or closed, the system needs to log the changes, update the course's access status, and possibly notify students of changes in enrollment availability.
