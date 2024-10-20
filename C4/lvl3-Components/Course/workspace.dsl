workspace "Course establishment" "This workspace documents the architecture of the Course establishment" {

    model {
        # software systems
        coursesEstablishmentSys = softwareSystem "Course establishment" "Handles course establishment functionalities" {
            creator = container "Creator" "Creates course if validation is true."
            dataValidationHandler = container "Data Validation Handler" "Handles data."
        }

        # external systems
        cisApi = softwareSystem "Courses Information System" "Manages courses data"

        # Define coursesAdministationDashboardHTML as a container within an external software system
        coursesAdministationDashboardSys = softwareSystem "Courses Administration Dashboard System" "Provides functionality for course administration." {
            coursesAdministationDashboardHTML = container "Course administration dashboard HTML" "Provides functionality for course administration in a web browser." "Web Front-End"
        }

        # relationships
        creator -> dataValidationHandler "Validates data before creating course"
        creator -> cisApi "Make API call to add data (external)"
        dataValidationHandler -> cisApi "Make API call to validate data (external)"
        coursesAdministationDashboardHTML -> creator "Delivers course data (external)"
    }

    views {

        systemContext coursesEstablishmentSys "coursesEstablishmentSystemContextDiagram" {
            include *
        }

        container coursesEstablishmentSys "coursesEstablishmentSystemContainerDiagram" {
            include *
        }

        component creator "coursesCreatorComponentDiagram" {
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
        }
    }
}
