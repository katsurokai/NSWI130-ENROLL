deploymentEnvironment "Live"  {
            deploymentNode "Users's Device" "OS: (Windows, Linux, Mac)"{
                deploymentNode "Users Web Browser" "" "Chrome, Firefox, Safari, Edge"  {
                    dashboardHTMLInstance = containerInstance dashboardHTML
                }
                
            }

            deploymentNode "Web Server" "Red Hat Enterprise Linux 9.4" {
                deploymentNode "Apache HTTP Server" "" "Apache HTTP Server 2.4.62"  {
                    webServerInstance = containerInstance webServer
                }
            
            }
            
            deploymentNode "API Gateway Server" "" "Red Hat Enterprise Linux 9.4"  {
                deploymentNode "API Gateway Service" "Request Routing" "Apache Tomact 11.0.0" {
                    apiGateWayInstance = containerInstance apiGateWay
                }
                
            }
            deploymentNode "Application Server" "" "Red Hat Enterprise Linux 9.4"  {
                deploymentNode "Backend Application Services" "" "Apache Tomcat 11.0.0" {
                    enrollmentMangerInstance = containerInstance enrollManager
                    courseEstaInstance = containerInstance courseEsta
                    classMatInstance = containerInstance classMat
                }
            }
            deploymentNode "Database Server" "" "Red Hat Enterprise Linux 9.4"  {
                deploymentNode "Relational DB Server" "PostgreSQL 17.0 "{
                    enrollDBInstance = containerInstance enrollDB
                    courseEstaDBInstance = containerInstance courseEstaDB
                    classMatDBInstance = containerInstance classMatDB
                }
                deploymentNode "log Storage" "" "Elasticsearch 8.15.0" {
                    auditLogDBInstance = containerInstance auditLogDB
                }
            }
            

        }

   