classMat = container "Class Material Manager" "Handles howmework and other class material" {
    group "Presentation Layer" {
        homeworkAPI = component "Homework submission/creation Interface" "Provides public API for homework submission/viewing"
        lectureMaterial = component "Lecture material" "Lecture recordings/notes/transcripts"
    }
    group "Business layer" {
        homeworkHandler = component "Homework Handler" "Verifies requests acording to buisness logic"
        lectureMaterialHandler = component "lecture material controller" "Verifies buisness logic about lecture material"
        homeworkSubmisionVerifier = component "Homework verifier" "Verifies that uploaded files don't exceed maximum filesize have correct extensions ..."
        authenticator = component "Class material authenticator" "Authenticates teachers and students"
    }
    group "Persistence Layer" {
        classMatDBComm = component "Class Material Database Comunicator" "Interface for comunicating with Class Material database"
        courseEstablismentDBComm = component "Course establishment Database comunicator" "Interface for comunicating with course establishment database"
    }
}

homeworkAPI -> homeworkHandler "Delegates requests"
homeworkHandler -> homeworkSubmisionVerifier "Delegates file verification"
homeworkHandler -> authenticator "Delegates that request is (create, teacher) or (submit, student)"
homeworkHandler -> classMatDBComm "Stores submited homework/ stores record of `new homework`"

lectureMaterial -> lectureMaterialHandler "Delegates requests"
lectureMaterialHandler -> authenticator "Verifies user is teacher"
lectureMaterialHandler -> courseEstablismentDBComm "Verifies teacher teaches given subject"

