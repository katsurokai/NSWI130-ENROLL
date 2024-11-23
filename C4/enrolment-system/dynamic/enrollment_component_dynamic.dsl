dynamic enrollManager "Student_Enrollment_Component_Dynamic" "Student to enroll in a course - Container Dynamics"{

            description "Shows the component interactions within Enrollment Manager when a student enrolls in a course."

            apiGateWay -> courseEnrollmentController "Routes enrollment request to manage course enrollment"
            courseEnrollmentController -> courseEnrollment "Calls business logic to process enrollment request"
            courseEnrollment -> sisApi "Retrieve student profile information"
            courseEnrollment -> courseEsta "Fetch course details for enrollment verification"
            courseEnrollment -> enrollmentRepository "Saves enrollment data"
            enrollmentRepository -> enrollDB "Persistes data into the database"
            courseEnrollment -> auditLogRepository "Logs enrollment event for auditing"
            courseEnrollment -> notif "Send confirmation notification to student"
            courseEnrollment -> courseEnrollmentController "Returns enrollment status"
            courseEnrollmentController -> apiGateWay "Returns enrollment response"

        }