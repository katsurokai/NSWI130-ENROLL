enrollmentSys = softwareSystem "Enrollment System" "manage the process of registering individuals for courses, class material, unenroll, course establishment"{
    # Enrollment System front-end containers
    adminApp = container "Administration Web Application" "add here"
    adminHTML = container "Administration HTML" "add here" "HTML+Reach.js" "Web Front-End"

    enrolldashboardHTML = container "Enrollment Dashboard HTML" "Provide functionality for enrollment page in a web browser." "HTML+Reach.js" "Web Front-End"
    !include containers/enrolldashboardApp.dsl

    # Enrollment System back-end containers
    enrollHandler = container "Enrollment Handler" "Handle module access to enroll Manager"
    !include containers/enrollManager.dsl
    unenroll = container "Unenrollment Manager" "add"
    classMat = container "Class Material Manager" "add"
    courseEsta = container "Course Establishment Manager" "add"

    # Enrollment System databases
    enrollDB = container "Enroll Database" "Store register enrollment for each student's user" "Database" {
        tags "Database"
    }
    classMatDB = container "ClassMaterial Database" "do something" "Database" {
        tags "Database"
    }
    courseEstaDB = container "CourseEstablisment Database" "do something" "Database" {
        tags "Database"
    }

    auditLogDB = container "AuditLog Database" "store events..." {
        tags "Database"
    }

}


# =============== Container <-> Container relationships ===============
adminHTML -> adminApp "Sends request to"
adminApp -> adminHTML "Delivers content to"
adminApp -> enrollDB "Read and write to"
adminApp -> sisApi "API call to get student information"
adminApp -> courseEsta "Get courses information"

enrolldashboardHTML -> sisApi "API call to get student information"
enrolldashboardHTML -> courseEstaDB "Get courses information"
enrolldashboardHTML -> classMatDB "Get class material data"

enrollManager -> enrollDB "Write to"
enrollManager -> courseEstaDB "Read for courses data"
enrollManager -> sisApi "API call for information"
enrollManager -> notif "Send notification to student"

unenroll -> enrollDB "Read and Write"
unenroll -> notif "Send notification to users"

classMat -> classMatDB "Write and Read"
classMat -> courseEstaDB "Read from"
classMat -> notif "send notification to student"

courseEsta -> courseEstaDB "Write to"
courseEsta -> notif "send notification to user"


# relationships of Enrollment system containers
enrolldashboardApp -> enrolldashboardHTML "Delivers content to"
enrolldashboardApp -> enrollHandler "API call read/write enrollment information"
enrolldashboardApp -> classMat "API call read/write enrollment information"
enrolldashboardApp -> courseEsta "API call read/write enrollment information"
enrollManager -> auditLogDB "Write to"

# relationships of Enrollment system containers
adminHTML -> enrollManager "API call read/write enrollment information"
adminHTML -> unenroll "API call read/write to enrollment DB"
adminHTML -> courseEsta "API call ..."

enrolldashboardHTML -> enrollManager "API call read/write enrollment information"
enrolldashboardHTML -> unenroll "API call read/write to enrollment DB"
enrolldashboardHTML -> classMat "API call ...."
enrolldashboardHTML -> courseEsta "API call ..."


# =============== Component <-> Container relationships ===============
# enrollment manager outside relationsships
enrollRep -> enrollDB "Send data to database"
enrollLog -> enrollDB "Write to"
dataSync -> courseEstaDB "Read from"
enrollLog -> auditLogDB "Write to"
enrollValidation -> courseEstaDB "Read from"

# enrolldashboardapp outside relationsships
enrollRepository -> enrollDB "Reads and write to"
unenrollRepository -> enrollDB "Read and write to"
classMatRepository -> classMatDB "Read and write to"
courseEstaRepository -> courseEstaDB "Read and write to"
