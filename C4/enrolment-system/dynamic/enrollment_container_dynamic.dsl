dynamic enrollmentSys "Student_Enrollment_Container_Dynamic" "Student to enroll in a course - Container Dynamics" {
            student -> enrolldashboardHTML "Access enrollment page and submit course enrollment request"
            enrolldashboardHTML -> apiGateWay "Send enrollment API request"
            
            apiGateWay -> enrollManager "Route request to process enrollment"
            enrollManager -> courseEsta "Check course availability"
            courseEsta -> courseEstaDB "Query course detail"
            courseEstaDB -> courseEsta "Returns course detail"
            courseEsta -> enrollManager "Return course availability and detail"

            enrollManager -> enrollDB "Validate and store enrollment data"
            enrollManager -> auditLogDB "Log enrollment event"
            enrollManager -> notif "Send confirmation to student"

            enrollManager -> apiGateWay "Return enrollment status"
            apiGateWay -> enrolldashboardHTML "Deliver enrollment status"
            enrolldashboardHTML -> student "Displays enrollment confirmation message"

        }