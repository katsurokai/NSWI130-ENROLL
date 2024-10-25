classMat = container "Class Material Manager" "Handles howmework and other class material" {
    group "Presentation Layer" {
        homeworkAPI = component "Homework submission/creation Interface" "Provides public API for homework submission/viewing"
        lectureMaterial = component "Lecture material" "Lecture recordings/notes/transcripts"
    }
    group "Business layer" {
        homeworkController = component "Homework Controller" "Verifies requests acording to buisness logic"
        lectureMaterialController = component "lecture material controller" "Verifies buisness logic about lecture material"
        homeworkSubmisionVerifier = component "Homework verifier" "Verifies that uploaded files don't exceed maximum filesize have correct extensions ..."
        authenticator = component "Class material authenticator" "Authenticates teachers and students"
    }
    group "Persistence Layer" {
        classMatDBComm = component "Class Material Database Comunicator" "Interface for comunicating with Class Material database"
        courseEstablismentDBComm = component "Course establishment Database comunicator" "Interface for comunicating with course establishment database"
    }
}

homeworkAPI -> homeworkController "Delegates requests"
homeworkController -> homeworkSubmisionVerifier "Delegates file verification"
homeworkController -> authenticator "Delegates that request is (create, teacher) or (submit, student)"
homeworkController -> classMatDBComm "Stores submited homework/ stores record of `new homework`"

lectureMaterial -> lectureMaterialController "Delegates requests"
lectureMaterialController -> authenticator "Verifies user is teacher"
lectureMaterialController -> courseEstablismentDBComm "Verifies teacher teaches given subject"

