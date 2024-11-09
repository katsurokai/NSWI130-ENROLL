enrollManager = container "Enrollment Manager" "Provides functionality for enrollment in course with appropriate validation" {
    group "Presentation Layer" {
        enrollInterface = component "Enrollment Interface" "Handle module access to enroll Manager"
        historyInterface = component "Enrollment History Interface" "Handle module access to enroll history in enroll Manager"
    }
    group "Business layer" {
        enrollValidation = component "Enrollment Validation" "Check for requirement on courses"
        enrollHistory = component "Enrollment History" "Store enrollment data to history"
        enrollIn = component "Enrollment Logic" "Make enrollment"
        unenrollIn = component "Unrollment Logic" "Make unenrollment"
        notifer = component "Notifier" "Send notification to notif container"
        errorHandler = component "Error Handler" "Detect and handle any errors that occur"
        enrollLog = component "Enrollment Logger" "Logs all enrollment actions"
    }
    group "Persistence Layer" {
        dataSync = component "DataSync" "handle data retrieval and synchronication with SIS API"
        enrollRep = component "Enrollment Repository" "Store data to database"
    }
}

# relationships of Enrollment Manager components
enrollInterface -> enrollIn "Send enrollment information from user to validate"
enrollInterface -> unenrollIn "Send unenrollment information from user to validate"
historyInterface -> enrollHistory "Send enrollment history information from user to get information"

enrollValidation -> dataSync "Read from"
notifer -> notif "Send notification"
dataSync -> sisApi "Read from"
enrollValidation -> errorHandler "Send error to"
errorHandler -> notifer "Send error to"
errorHandler -> enrollLog "Send error to"
enrollIn -> enrollValidation "Request validation for enrollment"
unenrollIn -> enrollValidation "Request validation for unenrollment"
enrollValidation -> enrollHistory "Send enroll/unenroll to history"
enrollHistory -> enrollRep "Send data to repository"
enrollLog -> enrollRep "Send data to repository"
