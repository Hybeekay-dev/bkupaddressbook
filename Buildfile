pipeline {
    agent any
tools {
maven 'mymaven'
}
    stages {
        stage('Build') {
            steps {
                sh "mvn clean package"
            }
        }
stage('Deploy') {
            steps {
                sshagent(['jentomcat']) {
    sh "scp -O StrictHostKeyChecking=no target/*.war ansadmin@3.26.225.210:/home/ansadmin/tomcat/webapp"
}
            }
        }
    }
}
