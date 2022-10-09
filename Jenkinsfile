pipeline {
    environment {
        registry = "oholic/aurora"
        registryCredential = 'dockerhub'
        dockerImage = ''
    }
agent any
    stages {
        stage('Cloning our Git') {
            steps {
                git 'https://github.com/AndreiBrandes/jenkins.git'
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