dynamic enrollManager "EnrollmentHistory_Container_Dynamic" "Student view enrollment history - Container Dynamics" {
            description "Shows the component interactions within Enrollment Manager when a student requests to view their enrollment history."
         
            apiGateWay -> enrollmentHistoryController "Routes request to retrieve enrollment history"
           
            enrollmentHistoryController -> enrollmentHistory "Calls business logic to process enrollment history request"

            enrollmentHistory -> enrollmentRepository "Fetches student enrollment data"
            enrollmentRepository -> enrollDB "Queries database for enrollment records"
            enrollDB -> enrollmentRepository "Returns enrollment records"
            enrollmentRepository -> enrollmentHistory "Returns enrollment data"

            enrollmentHistory -> courseEsta "Fetches course metadata (names, codes, etc)"
            courseEsta -> enrollmentHistory "Returns course metadata"
            
            enrollmentHistory -> enrollmentHistoryController "Returns compiled enrollment history data"

            enrollmentHistoryController -> apiGateWay "Returns enrollment history response"
            

        }