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

# classMat -> classMatDB "Write and Read"
classMat -> notif "send notification to student"

courseEsta -> courseEstaDB "Write to"
courseEsta -> notif "send notification to user"


# relationships of Enrollment system containers
enrolldashboardHTML -> webServer "Served from"
enrolldashboardHTML -> apiGateWay "Make API calls to"

apiGateWay -> classMat "Routes class material requests"
apiGateWay -> courseEsta "Route course establishment requests"

# class Material
classMatDBComm -> classMatDB "Builds requests + Querries database"
courseEstablismentDBComm -> courseEstaDB "Builds requests + Querries database"
apiGateWay -> homeworkAPI "Routes homework Requests"
apiGateWay -> lectureMaterial "Routes lecture Material requests"

# Class Establishment
courseDatabaseCommunicator -> courseEstaDB "Writes/reads data"
courseNotifer -> enrollManager "fetch enrollment data"
courseNotifer -> notif "Send notification request"
