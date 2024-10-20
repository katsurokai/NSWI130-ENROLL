workspace "Course establishment " "This workspace documents the architecture of the Course establishment" {
    
    model {
        # software systems
        coursesEstablishmentSys = softwareSystem "Course establishment" "add later"
        cisApi = softwareSystem "Courses Information System" "Manages courses data"

        # actors
        teacher = person "Teacher" "Manages content of their tought courses"
        admin = person "Business administrator" "Administers courses"

        # relationships between users and Enrollment System
        teacher -> coursesEstablishmentSys "Add materials to their tought courses"
        admin -> coursesEstablishmentSys "Rules courses lifecycle, stes enroll access status"

        # relationships between external systems and Enrollment System
        coursesEstablishmentSys -> cisApi "Make API calls to write/read courses information"
    }

    views {

        systemContext coursesEstablishmentSys "coursesEstablishmentSystemContextDiagram" {
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