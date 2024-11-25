## Views

### Overview

Views represent the structure and behavior of the **Student Enrollment System**, showing how its components interact and how they are deployed. These views help stakeholders and developers understand the system's architecture and its various elements.

---

### Container View

The container view decomposes the system into its core containers.

#### Key Containers:
1. **Frontend (enrolldashboardHTML)**:
   - Provides the user interface for student interaction.
2. **API Gateway**:
   - Routes requests to appropriate backend services.
3. **Backend Services**:
   - **Enrollment Manager**: Handles core enrollment business logic.
   - **Class Material Manager**: Manages class material files.
   - **Course Establishment Manager**: Maintains course metadata.
4. **Databases**:
   - **Enrollment Database**: Stores enrollment records.
   - **Class Material Database**: Stores files such as notes and lectures.
   - **Course Establishment Database** : Stores course information
   - **Audit Log Database**: Tracks system events for auditing.

These core containers and thier interaction are shown in the following diagram.
![](embed:enrollmentSystemContainerDiagram)

---


### Component View

Some backend services are decomposed further into components.

#### Enrollment Manager Components:
The following diagram shows the components view for Enrollment Manager container.

![](embed:enrollmentSystemComponentDiagram)

#### Course Establishment Manager Components:
The following diagram shows the components view for Course Establishment Manager container.

![](embed:courseEstaSystemComponentDiagram)

#### Class Material Manager Components:
The following diagram shows the components view for Class Material Manager container.

![](embed:classMaterialComponentDiagram)


---

### Dynamic Diagram

#### Enrollment Flow

The dynamic diagram below illustrates the interactions when a student enrolls in a course (container level diagram and component level diagram):

![](embed:Student_Enrollment_Container_Dynamic)

![](embed:Student_Enrollment_Component_Dynamic)

The dynamic diagram below illustrates the interactions within Enrollment Manager when a student requests to unenroll from a course.

![](embed:Student_Unenrollment_Component_Dynamic)


The following diagram below illustrates the flow of interactions within the Enrollment Manager when a student requests to view their enrollment history.
![](embed:EnrollmentHistory_Container_Dynamic)



#### Course Establishment Flow

The following diagram below illustrates the interactions when an administrator wants to add/update a course.

![](embed:courseEstaDynamicView)


#### Class material Flow

The following diagram below illustrates the interactions when a student wants to submit homework material

![](embed:HomeworkSubmission)

---

### Deployment

The following diagram shows the production/live deployment of the software system

![](embed:Live_Deployment)
