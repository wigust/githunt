pipeline {
    agent { label "master" }
    stages {
        stage("Build") {
            steps {
                sh "docker build -t githunt:latest ."
            }
        }
    }
    post {
        always {
            sendNotifications currentBuild.result
        }
    }
}
