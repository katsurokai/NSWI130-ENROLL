enrollManager = container "Enrollment Manager" "Provides functionality for enrollment in course with appropriate validation" {
    
    technology "Spring Boot"
    
    group "Presentation Layer" {

        courseEnrollmentController = component "Course Enrollment Controller" "Process user request to manage course enrollment"
        unEnrollmentController = component "Unenrollment Controller" "Process user request to manage unenrollment"
        enrollmentHistoryController = component  "Enrollment History Controller" "Process user request to manage enrollment history"
    
    }
    group "Business layer" {
        
        courseEnrollment = component "Course Enrollment" "business logic for enrollemnt service"
        unEnrollment = component "Unenrollment" "business logic for unenrollemnt service"
        enrollmentHistory = component "Enrollment History" "business logic for enrollemnt history service"
        #waitingList = component "Waiting List" "business logic for waiting list service"
    
    }
    group "Persistence Layer" {
        
        enrollmentRepository = component "Enrollment Repository" "persistes enrollemnt data into the database"
        auditLogRepository = component "Audit Log Repository" "persistes log event into the database"
    
    }
}

# relationships of Enrollment Manager components
apiGateWay -> courseEnrollmentController "Routes enrollment requests"
apiGateWay -> EnrollmentHistoryController "Routes enrollment history requests" 
apiGateWay -> unEnrollmentController "Routes unenrollment requests"


courseEnrollmentController -> courseEnrollment "get and update data"
unEnrollmentController -> unEnrollment "Gets and update data"
enrollmentHistoryController -> enrollmentHistory "get and update data"

courseEnrollment -> enrollmentRepository "uses to persist course enrollment data"
courseEnrollment -> courseEsta "reads for course data" 
courseEnrollment -> sisApi "retrieve student information"
courseEnrollment -> notif "send notification"
courseEnrollment -> auditLogRepository "log event"
// courseEnrollment -> waitingList "add to waiting list"

unEnrollment -> enrollmentRepository "uses to update course enrollment data"    
unEnrollment -> auditLogRepository "logs event"
// unEnrollment -> waitingList "remove from waiting list"
unEnrollment -> notif "send notification"

enrollmentHistory -> courseEsta "reads for course data"
enrollmentHistory -> enrollmentRepository "uses to get student course enrollment data"

// waitingList -> enrollmentRepository "read from and writes to"

enrollmentRepository -> enrollDB "read from and writes to"
auditLogRepository -> auditLogDB "writes to"