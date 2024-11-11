enrolldashboardApp = container "Enrollment Dashboard Web Application" "Deliver HTML content to teacher, student, admin accessing module." {
    group "Presentation Layer" {
        enrollWebUI = component "Enrollment User Interface" "Provides HTML of the UI"
        enrollController = component "Enrollment Controller" "Process user's request to manage enrollment"
        classMatWebUI = component "Class Material User Interface" "Provides HTML of the UI"
        classMatController = component "Class Material Controller" "Process user's request to manage class Material"
        courseEstaWebUI = component "Course Establishment User Interface" "Provides HTML of the UI"
        courseEstaController = component "Course Establishment Controller" "Process user's request to manage course establishment"
    }
    group "Business layer" {
        enrollModel = component "Enrollment Manager" "Business logic for enrollment"
        classMatModel = component "Class Material Manager" "Business logic for ClassMaterial"
        courseEstaModel = component "CourseEstablishment" "Business logic for CourseEstablishment"
    }
    group "Persistence Layer" {
        enrollRepository = component "Enrollment Repository" "Persists enrollment in database"
        classMatRepository = component "Class Material Database Comunicator" "Persists ClassMaterial in database"
        courseEstaRepository = component "Course Establishment Repository" "Persists Course Establishment in database"
    }
}

# relationships of enrolldashboard Application components
// enrolldashboardHTML -> enrollController "Sends requests to"
// enrolldashboardHTML -> classMatController "Sends requests to"
// enrolldashboardHTML -> courseEstaController "Sends requests to"
// enrollController -> enrolldashboardHTML "Deliver content to"
// classMatController -> enrolldashboardHTML "Deliver content to"
// courseEstaController -> enrolldashboardHTML "Deliver content to"

enrolldashboardHTML -> enrollWebUI "Sends requests to"
enrolldashboardHTML -> classMatWebUI "Sends requests to"
enrolldashboardHTML -> courseEstaWebUI "Sends requests to"
enrollWebUI -> enrolldashboardHTML "Deliver content to"
classMatWebUI -> enrolldashboardHTML "Deliver content to"
courseEstaWebUI -> enrolldashboardHTML "Deliver content to"

enrollController -> enrollWebUI "Use to render content for enrollment management"
enrollController -> enrollModel "Get and update enrollment data"
enrollWebUI -> enrollController "Request access to HTML content"
classMatController -> classMatWebUI "Use to render content for classMaterial management"
classMatController -> classMatModel "Get and update ClassMaterial data"
classMatWebUI -> classMatController "Request access to HTML content"
courseEstaController -> courseEstaWebUI "Use to render content for courseEstablishment management"
courseEstaController -> courseEstaModel "Get and update CourseEstablishment data"
courseEstaWebUI -> courseEstaController "Request access to HTML content"

enrollModel -> enrollRepository "Uses to persist enrollment data"
classMatModel -> classMatRepository "Uses to persist classMaterial data"
courseEstaModel -> courseEstaRepository "Uses to persist courseEstablishment data"
