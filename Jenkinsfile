pipeline {
  agent any
  options { timestamps() }
  environment {
    IMAGE = 'sirvin703/frontend'
    VERSION = "0.1.${env.BUILD_NUMBER}"
    DOCKER_BUILDKIT = '1'
  }
  stages {
    stage('Checkout') { steps { checkout scm } }
    stage('Docker Login') {
      steps {
        withCredentials([usernamePassword(credentialsId: 'dockerhub',
                                          usernameVariable: 'DOCKERHUB_USER',
                                          passwordVariable: 'DOCKERHUB_PASS')]) {
          sh 'echo "$DOCKERHUB_PASS" | docker login -u "$DOCKERHUB_USER" --password-stdin'
        }
      }
    }
    stage('Build') { steps { sh 'docker build -t $IMAGE:$VERSION -t $IMAGE:latest .' } }
    stage('Push')  { steps { sh 'docker push $IMAGE:$VERSION && docker push $IMAGE:latest' } }

    // ----- Environment stages for the deliverable (placeholders only) -----
    stage('Dev')     { steps { sh 'echo "Deploy to Dev (placeholder for screenshot)"' } }
    stage('Staging') { steps { sh 'echo "Deploy to Staging (placeholder for screenshot)"' } }
    stage('Prod')    { steps { sh 'echo "Deploy to Prod (placeholder for screenshot)"' } }
  }
  post { always { sh 'docker logout || true' } }
}

