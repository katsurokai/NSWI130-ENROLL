workspace "Enrollment Workspace" "This workspace documents the architecture of the Enrollment" {
    model {

        !include actors.dsl
        # software systems
        sisApi = softwareSystem "Student Information System (SIS)" "Provides user profile data"
        notif = softwareSystem "Email/SMS Notification System" "Used to send updates to student, teacher, or admin"
        !include enrolment-system/enrolment-system.dsl

        !include enrolment-system/deployment/deployment_dev.dsl
        !include enrolment-system/deployment/deployment_live.dsl

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
        }

        container enrollmentSys "enrollmentSystemContainerDiagram" {
            include *
            exclude "notif -> teacher"
            exclude "notif -> student"
        }

        component enrollManager "enrollmentSystemComponentDiagram" {
            include *
            exclude "apiGateWay -> courseEsta"
            exclude "courseEsta -> notif"
        }

        component courseEsta "courseEstaSystemComponentDiagram" {
            include *
        }

        !include /enrolment-system/dynamic/enrollment_container_dynamic.dsl

        !include /enrolment-system/dynamic/enrollment_component_dynamic.dsl

        !include /enrolment-system/dynamic/unenrollment_component_dynamic.dsl

        !include /enrolment-system/dynamic/enrollmenthistory_component_dynamic.dsl

        dynamic courseEsta "courseEstaDynamicView"{
            apiCourseController -> courseController "Sends request to change course enroll status"
            courseController -> courseValidator
            courseValidator -> courseDatabaseCommunicator
            courseDatabaseCommunicator -> courseEstaDB
            courseController -> courseNotifer
            courseNotifer -> enrollManager
            courseNotifer -> notif
        }

        component classMat "classMaterialComponentDiagram" {
            include *
            include classMatDB
            include classMatDB
            include courseEstaDB
            include apiGateWay
        }

        !include /enrolment-system/dynamic/class_material_homework_submision.dsl

        deployment enrollmentSys "Live" "Live_Deployment"   {
            include *
        }

        deployment enrollmentSys "Development" "Development_Deployment"   {
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
