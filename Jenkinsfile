pipeline {
agent any
    stages {
        stage('Cloning our Git') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: '29dd1f8b-c632-4c10-818e-967f7053453f', url: 'https://github.com/AndreiBrandes/jenkins']]])

            }
        }
    stage('Building our image') {
            steps{
                script {
                    dockerImage = docker.build registry + ":$BUILD_NUMBER"
                }
            }
    }
    stage('Deploy our image') {
        steps{
            script {
                docker.withRegistry( '', registryCredential ) {
                dockerImage.push()
    }
            }
        }
    }


    stage('Cleaning up') {
        steps{
            sh "docker rmi $registry:$BUILD_NUMBER"
        }
    }
    }
}