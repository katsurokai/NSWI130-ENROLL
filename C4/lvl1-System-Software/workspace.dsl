workspace "Enrollment Workspace" "This workspace documents the architecture of the Enrollment" {

    model {
        # software systems
        enrollmentSys = softwareSystem "Enrollment System" "manage the process of registering individuals for courses, class material, unenroll, course establishment"
        sisApi = softwareSystem "Student Information System (SIS)" "Provides user profile data"
        notif = softwareSystem "Email/SMS Notification System" "Used to send updates to student, teacher, or admin"

        # actors
        student = person "Student" "Access courses available to enroll, check class material, or unenroll"
        teacher = person "Teacher" "Access their own upload courses, class material, enroll a student or unenroll a student from their course"
        admin = person "Business administrator" "Administers the whole process of enroll and unenroll"

        # relationships between users and Enrollment System
        student -> enrollmentSys "View, enroll, unenroll in courses and class material"
        teacher -> enrollmentSys "Establish course, unenroll or enroll student base on request, and upload class material"
        admin -> enrollmentSys "administer enroll, unenroll for student in courses"
        notif -> student "Notify studend about changese in courses"
        notif -> teacher "Notify teacher on the courses established"

        # relationships between external systems and Enrollment System
        enrollmentSys -> sisApi "Get user profile data for validation"
        enrollmentSys -> notif "send data notification base on appropriate action"
    }

    views {

        systemContext enrollmentSys "enrollmentSystemContextDiagram" {
            include *
        }

        theme default

        styles {
            element "Existing System" {
                background #999999
                color #ffffff
            }
        }

    }


}
