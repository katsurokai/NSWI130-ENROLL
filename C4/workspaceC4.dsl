workspace "Enrollment Workspace" "This workspace documents the architecture of the Enrollment" {
    
    model {
        # software systems
        enrollmentSys = softwareSystem "Enrollment System" "manage the process of registering individuals for courses, class material, unenroll, course establishment"{
            # Enrollment System front-end containers
            // adminApp = container "Administration Web Application" "add here" 
            // adminHTML = container "Administration HTML" "add here" "HTML+Reach.js" "Web Front-End"

            enrolldashboardApp = container "Enrollment Dashboard Web Application" "Deliver HTML content to teacher, student, admin accessing module." {
                group "Presentation Layer" {
                    enrollWebUI = component "Enrollment User Interface" "Provides HTML of the UI"
                    enrollController = component "Enrollment Controller" "Process user's request to manage enrollment"
                    unenrollWebUI = component "Unenroll User Interface" "Provides HTML of the UI"
                    unenrollController = component "Unenrollment Controller" "Process user's request to manage unenrollment"
                    classMatWebUI = component "Class Material User Interface" "Provides HTML of the UI"
                    classMatController = component "Class Material Controller" "Process user's request to manage class Material"
                    courseEstaWebUI = component "Course Establishment User Interface" "Provides HTML of the UI"
                    courseEstaController = component "Course Establishment Controller" "Process user's request to manage course establishment"
                }
                group "Business layer" {
                    enrollModel = component "Enrollment" "Business logic for enrollment"
                    unenrollModel = component "Unenrollment" "Business logic for Unenrollment"
                    classMatModel = component "ClassMaterial" "Business logic for ClassMaterial"
                    courseEstaModel = component "CourseEstablishment" "Business logic for CourseEstablishment"
                }
                group "Persistence Layer" {
                    enrollRepository = component "Enrollment Repository" "Persists enrollment in database"
                    unenrollRepository = component "Unenrollment Repository" "Persists Unenrollment in database"
                    classMatRepository = component "ClassMaterial Repository" "Persists ClassMaterial in database"
                    courseEstaRepository = component "Course Establishment Repository" "Persists Course Establishment in database"
                }
            }
            enrolldashboardHTML = container "Enrollment Dashboard HTML" "Provide functionality for enrollment page in a web browser." "HTML+Reach.js" "Web Front-End"

            # Enrollment System back-end containers
            enrollHandler = container "Enrollment Handler" "Handle module access to enroll Manager"
            enrollManager = container "Enrollment Manager" "Provides functionality for enrollment in course with appropriate validation" {
                enrollValidation = component "Enrollment Validation" "Check for requirement on courses"
                enrollHistory = component "Enrollment History" "Store enrollment data to history"
                enrollIn = component "Enrollment Logic" "Make enrollment"
                unenrollIn = component "Unrollment Logic" "Make unenrollment"
                notifer = component "Notifier" "Send notification to notif container"
                dataSync = component "DataSync" "handle data retrieval and synchronication with SIS API"
                enrollLog = component "Enrollment Logger" "Logs all enrollment actions"
                errorHandler = component "Error Handler" "Detect and handle any errors that occur"
                enrollRep = component "Enrollment Repository" "Store data to database"
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

        # relationships of enrolldashboard Application components

        enrolldashboardHTML -> enrollController "Sends requests to"
        enrolldashboardHTML -> unenrollController "Sends requests to"
        enrolldashboardHTML -> classMatController "Sends requests to"
        enrolldashboardHTML -> courseEstaController "Sends requests to"
        enrollController -> enrolldashboardHTML "Deliver content to"
        unenrollController -> enrolldashboardHTML "Deliver content to"
        classMatController -> enrolldashboardHTML "Deliver content to"
        courseEstaController -> enrolldashboardHTML "Deliver content to"

        enrollController -> enrollWebUI "Use to render content for enrollment management"
        enrollController -> enrollModel "Get and update enrollment data"
        unenrollController -> unenrollWebUI "Use to render content for unenroll management"
        unenrollController -> unenrollModel "Get and update unenrollment data"
        classMatController -> classMatWebUI "Use to render content for classMaterial management"
        classMatController -> classMatModel "Get and update ClassMaterial data"
        courseEstaController -> courseEstaWebUI "Use to render content for courseEstablishment management"
        courseEstaController -> courseEstaModel "Get and update CourseEstablishment data"

        enrollModel -> enrollRepository "Uses to persist enrollment data"
        unenrollModel -> unenrollRepository "Uses to persist unenrollment data"
        classMatModel -> classMatRepository "Uses to persist classMaterial data"
        courseEstaModel -> courseEstaRepository "Uses to persist courseEstablishment data"

        enrollRepository -> enrollDB "Reads and write to"
        unenrollRepository -> enrollDB "Read and write to"
        classMatRepository -> classMatDB "Read and write to"
        courseEstaRepository -> courseEstaDB "Read and write to"

        # relationships of Enrollment system containers

        enrolldashboardApp -> enrolldashboardHTML "Delivers content to"
        enrolldashboardApp -> enrollHandler "API call read/write enrollment information"
        enrolldashboardApp -> classMat "API call read/write enrollment information"
        enrolldashboardApp -> courseEsta "API call read/write enrollment information"
        enrollManager -> enrollDB "Write to"
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

        enrollHandler -> enrollIn "Send enrollment information from user to validate"
        enrollHandler -> unenrollIn "Send unenrollment information from user to validate"
        enrollValidation -> dataSync "Read from"
        notifer -> notif "Send notification"
        dataSync -> sisApi "Read from"
        dataSync -> courseEstaDB "Read from"
        enrollLog -> auditLogDB "Write to"
        enrollValidation -> errorHandler "Send error to"
        errorHandler -> notifer "Send error to"
        errorHandler -> enrollLog "Send error to"
        enrollIn -> enrollValidation "Request validation for enrollment"
        unenrollIn -> enrollValidation "Request validation for unenrollment"
        enrollValidation -> enrollHistory "Send enroll/unenroll to history"
        enrollHistory -> enrollRep "Send data to repository"
        enrollRep -> enrollDB "Send data to database"

        # user relationship
        admin -> enrolldashboardHTML "Manage enroll and unenroll"
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

        component enrolldashboardApp "enrolldashboardAppComponentDiagram" {
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