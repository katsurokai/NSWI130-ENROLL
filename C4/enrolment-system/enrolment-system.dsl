enrollmentSys = softwareSystem "Enrollment System" "manage the process of registering individuals for courses, class material, unenroll, course establishment"{
    # Enrollment System front-end containers
    enrolldashboardHTML = container "Dashboard HTML" "Provide functionality for enrollment page in a web browser." "HTML+Reach.js" "Web Front-End"
    webServer = container "Web Server" "Hosts the static assets for Dashboard HTML (HTML, CSS, JavaScript)" "Apache/Nginx Static Content Hosting" "Static Hosting"
    apiGateWay = container "API Gate Way" "Handles routing, load balancing and API security" "Spring Boot, Spring Cloud Gateway"
  
    

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
      # Enrollment System back-end containers
    !include containers/courseEstablishment.dsl
    !include containers/classMat.dsl
    !include containers/enrollManager.dsl

    !docs docs
}

# =============== Container <-> Container relationships ===============



// enrollManager -> enrollDB "Write to"
// enrollManager -> sisApi "API call for information"
// enrollManager -> notif "Send notification to student"

classMat -> classMatDB "Write and Read"
classMat -> notif "send notification to student"

courseEsta -> courseEstaDB "Write to"
courseEsta -> notif "send notification to user"


# relationships of Enrollment system containers
enrolldashboardHTML -> webServer "Served from"
enrolldashboardHTML -> apiGateWay "Make API calls to"
 
apiGateWay -> classMat "Routes class material requests"
apiGateWay -> courseEsta "Route course establishment requests"

// enrolldashboardApp -> enrolldashboardHTML "Delivers content to"
// enrolldashboardApp -> enrollManager "API call read/write enrollment information"
// enrolldashboardApp -> classMat "API call read/write enrollment information"
// enrolldashboardApp -> courseEsta "API call read/write enrollment information"
// enrollManager -> auditLogDB "Write to"
// enrolldashboardApp -> enrollInterface "Enroll or unenroll courses"
// enrolldashboardApp -> historyInterface "Access Enroll history"

# =============== Component <-> Container relationships ===============
# enrollment manager outside relationsships
// enrollRep -> enrollDB "Send data to database"
// dataSync -> courseEstaDB "Read from"
// enrollRep -> auditLogDB "Write to"

# enrolldashboardapp outside relationsships
// enrollRepository -> enrollDB "Reads and write to"
// courseEstaRepository -> courseEstaDB "Read and write to"
// classMatRepository -> classMatDB "Read and write to"

# class Material
classMatDBComm -> classMatDB "Builds requests + Querries database"
#courseEstablismentDBComm -> courseEstaDB "Builds requests + Querries database"

// enrolldashboardApp -> homeworkAPI "Create/submit homework"
// enrolldashboardApp -> lectureMaterial "Add course material"

# Class Establishment
courseDatabaseCommunicator -> courseEstaDB "Writes/reads data"
courseDatabaseCommunicator -> courseEstaDB "Writes/reads data"
courseNotifer -> courseEnrollment "Gets list of subscribed users"
courseNotifer -> notif "Send notification request"
//enrolldashboardApp -> apiCourseController "Gives data to change course"