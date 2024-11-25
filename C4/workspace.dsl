workspace "Enrollment Workspace" "This workspace documents the architecture of the Enrollment" {
    model {

        !include actors.dsl
        # software systems
        sisApi = softwareSystem "Student Information System (SIS)" "Provides user profile data"
        notif = softwareSystem "Email/SMS Notification System" "Used to send updates to student, teacher, or admin"
        !include enrolment-system/enrolment-system.dsl

        !include enrolment-system/deployment/deployment.dsl

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

        // dynamic enrollManager "enrollDynamicView" {
        //     enrollInterface -> enrollIn "Send enrollment information from user to validate"
        //     enrollInterface -> unenrollIn "Send unenrollment information from user to validate"

        //     enrollIn -> enrollValidation "Request validation for enrollment"
        //     unenrollIn -> enrollValidation "Request validation for unenrollment"

        //     enrollValidation -> dataSync "Read from"
        //     dataSync -> sisApi "Read from"
        //     enrollValidation -> errorHandler "Send error to"
        //     errorHandler -> enrollLog "Send error to"
        //     errorHandler -> notifer "Send error to"
        //     notifer -> notif "Send notification"

        //     enrollValidation -> enrollHistory "Send enroll/unenroll to history"
        //     enrollHistory -> enrollRep "Send data to repository"
        //     enrollLog -> enrollRep "Send data to repository"
        //     enrollRep -> enrollDB "Store data in database"

        // }

        // dynamic enrollManager "enrollHistoryDynamicView"{
        //     historyInterface -> enrollHistory "Send enrollment history information from user to get information"
        //     enrollHistory -> enrollRep "Send data to repository"
        //     enrollRep -> enrollDB "read Data from database"
        // }

        dynamic courseEsta "courseEstaDynamicView"{
            apiCourseController -> courseController "Sends request to change course enroll status"
            courseController -> courseValidator
            courseValidator -> courseDatabaseCommunicator
            courseDatabaseCommunicator -> courseEstaDB
            courseController -> courseNotifer
            courseNotifer -> enrollManager
            courseNotifer -> notif
        }

        // component enrolldashboardApp "enrolldashboardAppComponentDiagram" {
        //     include *
        // }

        component classMat "classMaterialComponentDiagram" {
            include *
            include classMatDB
            include classMatDB
            include courseEstaDB
            include apiGateWay
        }

        /*
        dynamic classMat "classMaterialDynamicView" {
            homeworkAPI -> homeworkHandler "Forward request"
            homeworkHandler -> homeworkSubmisionVerifier
            homeworkHandler -> authenticator "3"
            homeworkHandler -> classMatDBComm "4"

            lectureMaterial -> lectureMaterialHandler "1"
            lectureMaterialHandler -> authenticator "2"
            lectureMaterialHandler -> courseEstablismentDBComm "3"

        }
        */

        !include /enrolment-system/dynamic/class_material_homework_submision.dsl

        deployment enrollmentSys "Live" "Live_Deployment"   {
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
