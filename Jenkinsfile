pipeline{
    agent {docker true}
    stages{
        stage("Build"){
            steps{
                docker image build -t jenkins-demo:${BUILD_NUMBER} .
                docker tag jenkins-demo:${BUILD_NUMBER} jenkins-demo:latest
                docker tag jenkins-demo:latest vladyslavobochuk/test:jenkins-demo
                docker push vladyslavobochuk/test:jenkins-demo
            }
        }
    }
}
