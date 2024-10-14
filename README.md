# NSWI130-ENROLL

## Random thoughts & problems
what does teacher see x what does students see on a dashboard (admin???)

# Terminology
I'm proposing this terminology I did not change anything in features/Enrollment.md in case you disagree

*Enrolment* -  the action of signing for a subject
*Sign up for lecture/practical* - the action of choosing specific time of a class from the available, given from the subject we enrolled in
course
lecture
practical

user x student x teacher

does class material-feature contain students sending files(homework) to teachers or do we not support this? Is it seperate feature?
Should class material be split between teacher and student more clearly?
does it track HW deadlines?

## CORE
- [Student Enrollment](./features/Enrollment.md)
> As a student I need to be able to enroll in a class as my rights according to \<legal document\>

- Course establishment
> As a administator, I would like to have the ability to manage courses, including the following capabilities:
> - Adding/archiving courses.
> - Open courses for student enrollment.
> - [Enroll or unenroll students in courses.](./features/Enroll%20accessibility.md)
> - Rescheduling classes

> As a teacher, I would like to modify course details as needed.

- [Class material](./features/ClassMaterial.md)
> As a teacher I want to share class material with the students
> As a student I want to access said material for my education and studying purpuses

## Pretty Essential
#### Unenrollment
> As a student I might want to change my schedules/ subjects to better fit my schedule/ study plan

#### Enrollment assistant
> As a student I have an assistant remiding me of
> - Mandatory subjects I forgot to enroll in
> - Whether or not my credit is sufficient

#### Collision dettection
> As a student, I have a system that checks that what I enrolled in (and classes I signed for as an extension) is correct and feasable
> Detecting Collisions in schedules including, but not limited to: diffrent buildings, same time ...

note: diffrence between Enrollment assistant and Collision dettection is in executions time; Enrollment assistant works preemptivly and gives suggestions
as opposed to Collision dettection which checks that what we enrolled in makes sense.

#### Waiting list
> As a Student, should the class I want to sign up for be full, I want to be put on a waiting list to be automaticly signed up for the class
Student in a waiting list is considered enrolled

## QoL

#### Statistics
Students might to acess data from previous years to help with decision making
- Success rate
- Number of sudents
- Popularity
// Teachers might want to  ???



