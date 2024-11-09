deploymentEnvironment "Live"    {
    deploymentNode "User's web browser" "" ""    {
        dashboardHTMLInstance = containerInstance enrolldashboardHTML
    }
    deploymentNode "Application Server" "" "Red Hat Enterprise Linux 9.4"   {
        deploymentNode "Web server" "" "Wildfly 34"  {
            dashboardAppInstance = containerInstance enrolldashboardApp
        }
    deploymentNode "Enrollment Server" "" "Red Hat Enterprise Linux 9.4"   {
        deploymentNode "enrollBackend server" "" "Wildfly 34"  {
            enrollInstance = containerInstance enrollManager
        }
    }
    deploymentNode "Class Material Server" "" "Red Hat Enterprise Linux 9.4"   {
        deploymentNode "classMatBackend server" "" "Wildfly 34"  {
            classMatInstance = containerInstance classMat
        }
    }
    deploymentNode "Course Establishment Server" "" "Red Hat Enterprise Linux 9.4"   {
        deploymentNode "courseEstaBackend server" "" "Wildfly 34"  {
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