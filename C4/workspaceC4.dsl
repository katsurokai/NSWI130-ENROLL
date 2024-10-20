workspace "Enrollment Workspace" "This workspace documents the architecture of the Enrollment" {
    
    model {
        # software systems
        enrollmentSys = softwareSystem "Enrollment System" "manage the process of registering individuals for courses, class material, unenroll, course establishment"{
            # Enrollment System front-end containers
            adminApp = container "Administration Web Application" "add here" 
            adminHTML = container "Administration HTML" "add here" "HTML+Reach.js" "Web Front-End"

            enrolldashboardApp = container "Enrollment Dashboard Web Application" "Deliver HTML content to teacher, student, admin accessing module."
            enrolldashboardHTML = container "Enrollment Dashboard HTML" "Provide functionality for enrollment page in a web browser." "HTML+Reach.js" "Web Front-End"

            # Enrollment System back-end containers
            enrollManager = container "Enrollment Manager" "Provides functionality for enrollment in course with appropriate validation" {
                
                courseEnrollmentController = component "Course Enrollment Controller" "Process user request to manage course enrollment"
                unEnrollmentController = component "Unenrollment Controller" "Process user request to manage unenrollment"
                EnrollmentHistoryController = component "Enrollment History Controller" "Process user request to manage enrollment history"
                recommendataionController = component "Course Recommendation Controller" "Process user request to manage course recommendationr"
                courseEnrollment = component "Course Enrollment" "business logic for enrollemnt service"
                unEnrollment = component "Unenrollment" "business logic for unenrollemnt service"
                enrollmentHistory = component "Enrollment History" "business logic for enrollemnt history service"
                Recomendation = component "Course Recommendation" "business logic for corse recommendation service"
                notificationService = component "Notification Service" "provide notification service"
                enrollmentRepository = component "Enrollment Repository" "persistes enrollemnt data into the database"
                auditLogRepository = component "Audit Log Repository" "persistes log event into the database"
                
            }
            
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

        sisApi = softwareSystem "Student Information System (SIS)" "Provides user profile data"
        notif = softwareSystem "Email/SMS Notification System" "Used to send updates to student, teacher, or admin"

        # actors
        student = person "Student" "Access courses available to enroll, check class material, or unenroll"
        teacher = person "Teacher" "Access their own upload courses, class material, enroll a student or unenroll a student from their course"
        admin = person "Business administrator" "Administers the whole process of enroll and unenroll"

        # relationships of Enrollment system containers
        adminApp -> adminHTML "Delivers content to"
        adminHTML -> enrollManager "API call read/write enrollment information"
        adminHTML -> courseEsta "API call ..."

        enrolldashboardApp -> enrolldashboardHTML "Deliver content to"
        enrolldashboardHTML -> enrollManager "API call read/write enrollment information"
        enrolldashboardHTML -> classMat "API call ...."
        enrolldashboardHTML -> courseEsta "API call ..."

        enrollManager -> enrollDB "Reads from and Write to"
        enrollManager -> auditLogDB "Write to"
        enrollManager -> courseEstaDB "Read for courses data"
        enrollManager -> sisApi "API call for information"
        enrollManager -> notif "Send notification to student"


        classMat -> classMatDB "Write and Read"
        classMat -> courseEstaDB "Read from"
        classMat -> notif "send notification to student"

        courseEsta -> courseEstaDB "Write to"
        courseEsta -> notif "send notification to user"

        ### relationships of Enrollment Manager components

        courseEnrollmentController -> courseEnrollment "get and update data"
        unEnrollmentController -> unEnrollment "Gets and update data"
        EnrollmentHistoryController -> enrollmentHistory "get and update data"
        recommendataionController -> Recomendation "get and update"
        
        courseEnrollment -> enrollmentRepository "uses to persist course enrollment data" 
        courseEnrollment -> sisApi "retrieve student information"
        courseEnrollment -> notificationService "trigger notification"
        courseEnrollment -> auditLogRepository "log event"
        
        unEnrollment -> enrollmentRepository "uses to update course enrollment data"
        unEnrollment -> auditLogRepository "logs event"
        unEnrollment -> notificationService "trigger notification"
        
        enrollmentHistory -> enrollmentRepository "uses to get student course enrollment data"
        Recomendation -> enrollmentRepository "uses to get student course enrollment data"
        Recomendation -> sisApi "retrieve student information"
        Recomendation ->  "auditLogRepository" "logs event"
        
        enrollmentRepository -> enrollDB "read from and writes to"
        notificationService -> notif "send notifications"
        auditLogRepository -> auditLogDB "writes to"
        
        

        # user relationship
        admin -> adminHTML "Manage enroll and unenroll"
        student -> enrolldashboardHTML "View, enroll in courses. Check for class material"
        teacher -> enrolldashboardHTML "View, establish courses. View and manage class material"

    }

    views {

        systemContext enrollmentSys "enrollmentSystemContextDiagram" {
            include *
        }

        container enrollmentSys "enrollmentSystemContainerDiagram" {
            include *
        }

        component enrollManager "enrollmentSystemComponentDiagram" {
            include *
        }
         
        theme default

        styles {
            element "Existing System" {
                background #999999
                color #ffffff
            }

            element "Web Front-End"  {
                shape WebBrowser
            }

            element "Database"  {
                shape Cylinder
            }
            
        }

    }
    

}
