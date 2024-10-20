workspace "Course establishment " "This workspace documents the architecture of the Course establishment" {
    
    model {
        # software systems
        coursesEstablishmentSys = softwareSystem "Course establishment" "add later" {
            # containers
            coursesAdministationDashHTML = container "Courses administration dashboard HTML" "Provides functionality for courses administration in a web browser." "Web Front-End"
            coursesAdministationDashController = container "Courses Administration Dashboard Controller" "Provides functionality for course administation." 
            coursesCreationHTML = container "Courses creation HTML" "Provides functionality for course creation in a web browser." "Web Front-End"
            coursesCreator = container "Courses Creator" "Provides functionality for course creation." 
            coursesAdministationController = container "Courses Administration Controller" "Provides functionality for course administration." 
            coursesAdministationDashboardHTML = container " Course administration dashboard HTML" "Provides functionality for course administration in a web browser." "Web Front-End"
        }

        # software systems
        cisApi = softwareSystem "Courses Information System" "Manages courses data"

        # actors
            teacher = person "Teacher" "Manages content of their tought courses"
        admin = person "Business administrator" "Administers courses"

        teacher -> coursesEstablishmentSys "Add materials to their tought courses"
        admin -> coursesEstablishmentSys "Rules courses lifecycle, stes enroll access status"

        # relationships of Enrollment system containers
        coursesAdministationDashHTML -> coursesAdministationDashController "Notifies about user requests, requests to get content to display"
        coursesAdministationDashController -> coursesAdministationDashHTML "Delivers content"
        coursesAdministationDashController -> coursesCreationHTML "Sends request to display"
        coursesCreationHTML -> coursesCreator "Sends data"
        coursesCreator -> coursesAdministationDashController "Notifies about course creation"
        coursesAdministationDashController -> coursesAdministationDashboardHTML "Provides functionality for course administration in a web browser."
        coursesAdministationDashboardHTML -> coursesAdministationController "Provides functionality for course administration."
        coursesCreator -> cisApi "Make API call to add data"
        coursesAdministationController -> cisApi "Make API call to add data"

        # user relationship
        teacher -> coursesAdministationDashHTML "Add materials to their tought courses"
        admin -> coursesAdministationDashHTML "Manages courses lifecycle and status"

    }

    views {

        systemContext coursesEstablishmentSys "coursesEstablishmentSystemContextDiagram" {
            include *
        }


        container coursesEstablishmentSys "coursesEstablishmentSystemContainerDiagram" {
            include *
        }

        theme default

        styles {

            element "Web Front-End"  {
                shape WebBrowser
            }
        }

    }
    

}