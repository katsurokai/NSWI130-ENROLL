dynamic classMat "HomeworkSubmission" {
    student -> enrolldashboardHTML
    enrolldashboardHTML -> apiGateWay
    apiGateWay -> homeworkAPI
    homeworkAPI -> homeworkHandler
    homeworkHandler -> authenticator "Verifies that it's a 'submit request' not a 'create request' (which is only for teachers)"
    homeworkHandler -> homeworkSubmisionVerifier "Maximum filesize, filetype ..."
    homeworkHandler -> classMatDBComm "Asks to build querry for database"
    classMatDBComm -> classMatDB "Writes (exetes querry on database)"
}
