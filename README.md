# NSWI130-ENROLL

## (10/21/2024)

> I have edited the diagram to all:
> - lvl1 add admin stake holder
> - lvl2 restructure the diagram and leave out some space for class material and course establishment
> - lvl3 enrollment: add Betse unrollment and history to the diagram

> Edit [workspaceC4.dsl ](./C4/workspaceC4.dsl) for all the diagram changes

## Meeting Minute

> As we have discuess, we would use the dsl file to make our diagram like in the lecture video.

> I have create a template for it from lvl1 to lvl3 (Software System, Containers, Components).

> Use this latest [file](./C4/workspaceC4.dsl) to add your part

> This dsl file require Structurizr to be running on your machine to generate the diagram. (View the lecture videos)

> **Note**: lvl1 have already been define. Please add lvl2 (containers) and lvl3 (components) which related to your features.

## (10/16/2024)
> I have created C4 model folder and add a base software system level 1 to the repo. [Software System](./C4/lvl1-System-Software/structurizr-1-enrollmentSystemContextDiagram.png)
> I use Structurizr from lecture video to make the diagram with workspace.dsl file. Feel free to add more to the software system if it require more. Create an issue if you want to add to the dsl file but cannot generate the diagram. 

> The most important part that each individual of us need to do is the **lvl2 containers** and **lvl3 components**

> Here is my take on lvl2 containers [Containers](./C4/lvl2-Containers/structurizr-lvl2-enrollmentSystemContainerDiagram.png)

> Level 3 which is component of each feature in in detail that we each need to do [component](./C4/lvl3-Components/structurizr-lvl3-enrollmentSystemComponentDiagram.png)

> Lastly, this is the whole model with presentation, business, and persistence layer [C4](./C4/C4-enrolldashboardAppComponentDiagram.png)

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


- [Unenrollment](./features/Unenroll.md)
> As a student I might want to change my schedules/ subjects to better fit my schedule/ study plan 

## Pretty Essential

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



