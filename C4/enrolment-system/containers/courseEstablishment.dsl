courseEsta = container "Course Establishment Manager" "add" {
        group "Presentation Layer" {
        courseCreationApiConnector = component "Course creation API connector" "Provides public API for course creation"
        courseChangerApiConnector = component "Course changer API connector" "Provides public API for course change"
    }
    group "Business layer" {
        courseCreator = component "CourseCreator" "Creates courses"
        courseController = component "CourseController" "Controll courses"
        courseValidator = component "CourseValidator" "Validates course data"
        courseErrorHandler = component "Course Error Handler" "Detect and handle any errors that occur"
        courseNotifer = component "Course Enroll Status Notifier" "Send notification to notif container"
    }
    group "Persistence Layer" {
        courseDatabaseCommunicator = component "Course database communicator" "Interface for communicating with course establishment database"
    }
}

courseCreationApiConnector -> courseCreator "Delegates request"
courseChangerApiConnector -> courseController "Delegates request"
courseCreator -> courseValidator "Checks course info"
courseController -> courseValidator "Checks course change info"
courseController -> courseNotifer "Gives command to notify subscribed students about enroll opening"
courseCreator -> courseDatabaseCommunicator "Gives command to create course"
courseController -> courseDatabaseCommunicator "Gives command to change course"
courseValidator -> courseErrorHandler "Sends error"
courseValidator -> courseDatabaseCommunicator "Sends request to get proper data"
courseErrorHandler -> courseNotifer "Send error to"