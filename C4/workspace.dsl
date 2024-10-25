workspace "Enrollment Workspace" "This workspace documents the architecture of the Enrollment" {
    model {

        !include actors.dsl
        # software systems
        sisApi = softwareSystem "Student Information System (SIS)" "Provides user profile data"
        notif = softwareSystem "Email/SMS Notification System" "Used to send updates to student, teacher, or admin"
        !include enrolment-system/enrolment-system.dsl

        # user relationship - system level
        student -> enrollmentSys "View, enroll, unenroll in courses and class material"
        teacher -> enrollmentSys "Establish course, unenroll or enroll student base on request, and upload class material"
        admin -> enrollmentSys "administer enroll, unenroll for student in courses"
        notif -> student "Notify studend about changese in courses"
        notif -> teacher "Notify teacher on the courses established"

        # user relationship - container level
        admin -> enrolldashboardHTML "Manage enroll and unenroll"
        student -> enrolldashboardHTML "View, enroll in courses. Check for class material"
        teacher -> enrolldashboardHTML "View, establish courses. View and manage class material"
    }

    views {
        systemContext enrollmentSys "enrollmentSystemContextDiagram" {
            include *
            autolayout tb
        }

        container enrollmentSys "enrollmentSystemContainerDiagram" {
            include *
            autolayout tb
        }

        component enrollManager "enrollmentSystemComponentDiagram" {
            include *
            autolayout tb
        }

        component enrolldashboardApp "enrolldashboardAppComponentDiagram" {
            include *
            autolayout tb
        }

        component classMat "classMaterialComponentDiagram" {
            include *
            # include enrolldashboardApp ->
            autolayout tb
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
