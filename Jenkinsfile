pipeline {
agent any
    stages {
        stage('Cloning our Git') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: '29dd1f8b-c632-4c10-818e-967f7053453f', url: 'https://github.com/AndreiBrandes/jenkins']]])

            }
        }
    stage('Build docker image') {
            steps {  
                sh 'docker build -t oholic/aurora:$BUILD_NUMBER .'
            }
        }
    stage('login to dockerhub') {
            steps{
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u oholic --password-stdin'
            }
        }
    stage('push image') {
            steps{
                sh 'docker push oholic/aurora:$BUILD_NUMBER'
            }
        }

    stage('Cleaning up') {
        steps{
            sh "docker rmi $registry:$BUILD_NUMBER"
        }
    }
    }
}