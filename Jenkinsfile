pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh "echo ${BUILD_NUMBER} && id ; pwd "
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}
