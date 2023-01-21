pipeline {
    agent any
    environment {        
        DOCKERHUB_USERNAME = "dilipnigam007"
        APP_NAME = "gitops-demo"
        IMAGE_TAG = "${BUILD_NUMBER}"
        IMAGE_NAME = "${DOCKERHUB_USERNAME}" + "/" + "${APP_NAME}"
        REGISTRY_CREDS = 'dockerhub'        
        }

    stages {
        stage('Build') {
            steps {
                sh "curl ifconfig.me. && id ;pwd;whoami"
                sh "echo hi && echo ${BUILD_NUMBER} && cd /var/lib/jenkins/workspace/akanksha_pipeline && sudo docker build -t ${IMAGE_NAME}:latest ." 
                sh " sudo docker build -t ${IMAGE_NAME}:${IMAGE_TAG} ."
            }
        }
        stage('Push Docker Image'){
            steps {
                 withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'pass', usernameVariable: 'user')]) {
                     sh "sudo docker login -u $user --password $pass"
                     sh "sudo docker push ${IMAGE_NAME}:latest"
                     
                     sh "ls -lrt"
                     
                     
                 }
            }
        }

        stage('Delete Docker Images'){
            steps {
                sh "sudo docker rmi ${IMAGE_NAME}:${IMAGE_TAG}"
                sh "sudo docker rmi ${IMAGE_NAME}:latest"
                
            }
        }

        stage('deploy') {

            steps {
               
    
                 sh "scp -vv -o StrictHostkeychecking=no /var/lib/jenkins/workspace/akanksha_pipeline/*.yml ec2-user@18.205.17.190:/home/ec2-user"
                 
                 sh "ssh ec2-user@18.205.17.190 kubectl apply -f deployment.yml"
                 sh "id"
                 
                 
                
                 
                 
                
                
            }

        }   
             

        
    
        
        
    }
}
