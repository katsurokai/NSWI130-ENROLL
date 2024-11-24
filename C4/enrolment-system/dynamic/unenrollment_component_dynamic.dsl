dynamic enrollManager "Student_Unenrollment_Component_Dynamic" "Student unenrolls from a course - Component Dynamics" {
    description "Shows the component interactions within Enrollment Manager when a student requests to unenroll from a course."

    apiGateWay -> unEnrollmentController "Routes unenrollment request to manage course unenrollment"
    
    unEnrollmentController -> unEnrollment "Calls business logic to process unenrollment request"

    unEnrollment -> sisApi "Retrieve student profile information for validation"
    unEnrollment -> courseEsta "Fetch course details for unenrollment verification"

    unEnrollment -> enrollmentRepository "Updates enrollment record to mark unenrollment"
    enrollmentRepository -> enrollDB "Persist unenrollment changes to the database"
    enrollmentRepository -> unEnrollment "Confirm data persistence"

    unEnrollment -> auditLogRepository "Logs unenrollment event for auditing"
    auditLogRepository -> auditLogDB "Persist audit event"
    
    unEnrollment -> notif "Send unenrollment confirmation to student"
    
    unEnrollment -> unEnrollmentController "Returns unenrollment status"
    unEnrollmentController -> apiGateWay "Returns unenrollment response"
}
