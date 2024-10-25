enrolldashboardApp = container "Enrollment Dashboard Web Application" "Deliver HTML content to teacher, student, admin accessing module." {
    group "Presentation Layer" {
        enrollWebUI = component "Enrollment User Interface" "Provides HTML of the UI"
        enrollController = component "Enrollment Controller" "Process user's request to manage enrollment"
        unenrollWebUI = component "Unenroll User Interface" "Provides HTML of the UI"
        unenrollController = component "Unenrollment Controller" "Process user's request to manage unenrollment"
        classMatWebUI = component "Class Material User Interface" "Provides HTML of the UI"
        classMatController = component "Class Material Controller" "Process user's request to manage class Material"
        courseEstaWebUI = component "Course Establishment User Interface" "Provides HTML of the UI"
        courseEstaController = component "Course Establishment Controller" "Process user's request to manage course establishment"
    }
    group "Business layer" {
        enrollModel = component "Enrollment" "Business logic for enrollment"
        unenrollModel = component "Unenrollment" "Business logic for Unenrollment"
        classMatModel = component "ClassMaterial" "Business logic for ClassMaterial"
        courseEstaModel = component "CourseEstablishment" "Business logic for CourseEstablishment"
    }
    group "Persistence Layer" {
        enrollRepository = component "Enrollment Repository" "Persists enrollment in database"
        unenrollRepository = component "Unenrollment Repository" "Persists Unenrollment in database"
        classMatRepository = component "ClassMaterial Repository" "Persists ClassMaterial in database"
        courseEstaRepository = component "Course Establishment Repository" "Persists Course Establishment in database"
    }
}

# relationships of enrolldashboard Application components
enrolldashboardHTML -> enrollController "Sends requests to"
enrolldashboardHTML -> unenrollController "Sends requests to"
enrolldashboardHTML -> classMatController "Sends requests to"
enrolldashboardHTML -> courseEstaController "Sends requests to"
enrollController -> enrolldashboardHTML "Deliver content to"
unenrollController -> enrolldashboardHTML "Deliver content to"
classMatController -> enrolldashboardHTML "Deliver content to"
courseEstaController -> enrolldashboardHTML "Deliver content to"

enrollController -> enrollWebUI "Use to render content for enrollment management"
enrollController -> enrollModel "Get and update enrollment data"
unenrollController -> unenrollWebUI "Use to render content for unenroll management"
unenrollController -> unenrollModel "Get and update unenrollment data"
classMatController -> classMatWebUI "Use to render content for classMaterial management"
classMatController -> classMatModel "Get and update ClassMaterial data"
courseEstaController -> courseEstaWebUI "Use to render content for courseEstablishment management"
courseEstaController -> courseEstaModel "Get and update CourseEstablishment data"

enrollModel -> enrollRepository "Uses to persist enrollment data"
unenrollModel -> unenrollRepository "Uses to persist unenrollment data"
classMatModel -> classMatRepository "Uses to persist classMaterial data"
courseEstaModel -> courseEstaRepository "Uses to persist courseEstablishment data"
