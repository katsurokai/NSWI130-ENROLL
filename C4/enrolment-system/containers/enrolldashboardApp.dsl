enrolldashboardApp = container "Enrollment Dashboard Web Application" "Deliver HTML content to teacher, student, admin accessing module." {
    group "Presentation Layer" {
        enrollWebUI = component "Enrollment User Interface" "Provides HTML of the UI"
        enrollController = component "Enrollment Controller" "Process user's request to manage enrollment"
        classMatWebUI = component "Class Material User Interface" "Provides HTML of the UI"
        classMatController = component "Class Material Controller" "Process user's request to manage class Material"
        courseEstaWebUI = component "Course Establishment User Interface" "Provides HTML of the UI"
        courseEstaController = component "Course Establishment Controller" "Process user's request to manage course establishment"
    }
    group "Request handling to appropriate Business logic" {
        enrollModel = component "Enrollment Manager" "Business logic for enrollment"
        classMatModel = component "Class Material Manager" "Business logic for ClassMaterial"
        courseEstaModel = component "CourseEstablishment" "Business logic for CourseEstablishment"
    }
}

# relationships of enrolldashboard Application components

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

