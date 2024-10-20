workspace "Enrollment Workspace" "This workspace documents the architecture of the Unenrollment" {

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
                enrollValidation = component "Enrollment Validation" "Check for requirement on courses"
                notifer = component "Notifier" "Send notification to notif container"
                dataSync = component "DataSync" "handle data retrieval and synchronication with SIS API"
                enrollLog = component "Enrollment Logger" "Logs all enrollment actions (and unenrollment)"
                errorHandler = component "Error Handler" "Detect and handle any errors that occur"
            }
            unenroll = container "Unenrollment Manager" "add"
            classMat = container "Class Material Manager" "add"
            courseEsta = container "Course Establishment Manager" "add"

            # Enrollment System databases
            enrollDB = container "Enroll Database" "Store register enrollment for each student's user" "Database"
            unenrollDB = container "Unenroll Database" "do something" "Database"
            classMatDB = container "ClassMaterial Database" "do something" "Database"
            courseEstaDB = container "CourseEstablisment Database" "do something" "Database"
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
        adminHTML -> unenroll "API call read/write to enrollment DB"
        adminHTML -> courseEsta "API call ..."

        enrolldashboardApp -> enrolldashboardHTML "Deliver content to"
        enrolldashboardHTML -> enrollManager "API call read/write enrollment information"
        enrolldashboardHTML -> unenroll "API call read/write to enrollment DB"
        enrolldashboardHTML -> classMat "API call ...."
        enrolldashboardHTML -> courseEsta "API call ..."

        enrollManager -> enrollDB "Write to"
        enrollManager -> courseEstaDB "Read for courses data"
        enrollManager -> sisApi "API call for information"
        enrollManager -> notif "Send notification to student"

        unenroll -> unenrollDB "Write to"
        unenroll -> enrollDB "Read from"
        unenroll -> notif "Send notification to users"

        classMat -> classMatDB "Write and Read"
        classMat -> courseEstaDB "Read from"
        classMat -> notif "send notification to student"

        courseEsta -> courseEstaDB "Write to"
        courseEsta -> notif "send notification to user"

        ### relationships of Enrollment Manager components

        enrollValidation -> courseEstaDB "Read from"
        notifer -> notif "Send notification"
        dataSync -> sisApi "Read from"
        enrollLog -> enrollDB "Write to"
        errorHandler -> notifer "Send error to"
        errorHandler -> enrollLog "Send error to"

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
