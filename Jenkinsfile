pipeline{
    environment {
        imageName = "vladyslavobochuk/test"
        registryCredential = 'docker'
        gitUrl= 'https://github.com/Obochuk/jenkins'
        gitCredential = 'for_git'
    }
    parameters {
            string(name: 'branch', defaultValue:'develop', description:"Put the branch for build")
    }

    agent any

    stages{
        stage("Clone Git") {
            steps {
                git([url: "${gitUrl}", branch: "${params.branch}", credentialsId: "${gitCredential}"])
            }
        }
        stage("Build") {
            steps {
                script {
                    dockerImage = docker.build(imageName, "-v /root/.m2:/root/.m2")
                }
            }
        }
        stage("Deploy image") {
            steps {
                script {
                    docker.withRegistry( '', registryCredential ) {
                        dockerImage.push("$BUILD_NUMBER")
                        dockerImage.push('latest')
                    }
                }
            }
        }
    }
}