deploymentEnvironment "Live"    {
    deploymentNode "Web Server" "" "Red Hat Enterprise Linux 9.4"   {
        deploymentNode "Nginx" "" "Nginx 1.27.2"  {
            webServerInstance = containerInstance webServer
        }
    }
    deploymentNode "Users's Device" "OS: (Windows, Linux, Mac)"  {
        deploymentNode "User's web browser" "" "Chrome, Firefox, Safari, Edge"    {
            dashboardHTMLInstance = containerInstance enrolldashboardHTML
        }
    }    
    deploymentNode "API Gateway Server" "" "Red Hat Enterprise Linux 9.4"  {
        deploymentNode "API Gateway Service" "Request Routing" "Apache Tomact 11.0.0" {
            apiGateWayInstance = containerInstance apiGateWay
        }
                
    }
    group "Application Server" {
    deploymentNode "Enrollment Server" "" "Red Hat Enterprise Linux 9.4"   {
        deploymentNode "enrollBackend server" "" "Spring Boot 3.0"  {
            enrollInstance = containerInstance enrollManager
        }
    }
    deploymentNode "Class Material Server" "" "Red Hat Enterprise Linux 9.4"   {
        deploymentNode "classMatBackend server" "" "Spring Boot 3.0"  {
            classMatInstance = containerInstance classMat
        }
    }
    deploymentNode "Course Establishment Server" "" "Red Hat Enterprise Linux 9.4"   {
        deploymentNode "courseEstaBackend server" "" "Spring Boot 3.0"  {
            courseEstaInstance = containerInstance courseEsta
        }
    }
    }

    deploymentNode "Database Server" "" "Red Hat Enterprise Linux 9.4"   {
        deploymentNode "Relational DB server" "" "PostgreSQL 17" {
            enrollDBInstance = containerInstance enrollDB
            deviceDBInstance = containerInstance courseEstaDB
        }
        deploymentNode "File storage" "" "MongoDB 8.15"  {
            classMatDBInstance = containerInstance classMatDB # GridFS
        }
        deploymentNode "Log storage" "" "Elasticsearch 8.15"  {
            auditLogDBInstance = containerInstance auditLogDB
        }
    }
    
}