enrollmentSys = softwareSystem "Enrollment System" "manage the process of registering individuals for courses, class material, unenroll, course establishment"{
    # Enrollment System front-end containers
    enrolldashboardHTML = container "Enrollment Dashboard HTML" "Provide functionality for enrollment page in a web browser." "HTML+Reach.js" "Web Front-End"
    !include containers/enrolldashboardApp.dsl

    # Enrollment System back-end containers
    !include containers/enrollManager.dsl
    // unenroll = container "Unenrollment Manager" "add"
    !include containers/classMat.dsl
    !include containers/courseEstablishment.dsl

    # Enrollment System databases
    enrollDB = container "Enroll Database" "Store register enrollment for each student's user" {
        tags "Database"
    }
    classMatDB = container "ClassMaterial Database" "Holds files such as student homeworks, lecture recordings, notes etc. " {
        tags "Database"
    }
    courseEstaDB = container "CourseEstablisment Database" "do something" {
        tags "Database"
    }

    auditLogDB = container "AuditLog Database" "store events..." {
        tags "Database"
    }
}

# =============== Container <-> Container relationships ===============

enrollManager -> enrollDB "Write to"
enrollManager -> courseEstaDB "Read for courses data"
enrollManager -> sisApi "API call for information"
enrollManager -> notif "Send notification to student"

classMat -> classMatDB "Write and Read"
classMat -> courseEstaDB "Read from"
classMat -> notif "send notification to student"

courseEsta -> courseEstaDB "Write to"
courseEsta -> notif "send notification to user"


# relationships of Enrollment system containers

enrolldashboardApp -> enrolldashboardHTML "Delivers content to"
enrolldashboardApp -> enrollManager "API call read/write enrollment information"
enrolldashboardApp -> classMat "API call read/write enrollment information"
enrolldashboardApp -> courseEsta "API call read/write enrollment information"
enrollManager -> auditLogDB "Write to"
enrolldashboardApp -> enrollInterface "Enroll or unenroll courses"
enrolldashboardApp -> historyInterface "Access Enroll history"

# =============== Component <-> Container relationships ===============
# enrollment manager outside relationsships
enrollRep -> enrollDB "Send data to database"
dataSync -> courseEstaDB "Read from"
enrollRep -> auditLogDB "Write to"

# enrolldashboardapp outside relationsships
<<<<<<< HEAD
// enrollRepository -> enrollDB "Reads and write to"
// courseEstaRepository -> courseEstaDB "Read and write to"
// classMatRepository -> classMatDB "Read and write to"
=======
# enrollRepository -> enrollDB "Reads and write to"
# courseEstaRepository -> courseEstaDB "Read and write to"
# classMatRepository -> classMatDB "Read and write to"
>>>>>>> 1adcb9054709826bff3ad6c1d823ad09f9d0a06f

# class Material
classMatDBComm -> classMatDB "Builds requests + Querries database"
courseEstablismentDBComm -> courseEstaDB "Builds requests + Querries database"

enrolldashboardApp -> homeworkAPI "Create/submit homework"
enrolldashboardApp -> lectureMaterial "Add course material"

# Class Establishment
courseDatabaseCommunicator -> courseEstaDB "Writes/reads data"
courseNotifer -> notif "Send notification request"
enrolldashboardApp -> courseChangerInterface "Gives data to change course"
enrolldashboardApp -> courseCreationInterface "Gives data for creating new course"
