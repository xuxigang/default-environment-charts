pipeline {
  options {
    disableConcurrentBuilds()
  }
  agent {
    label "jenkins-maven"
  }
  environment {
    DEPLOY_NAMESPACE = "change-me"
  }
  stages {
    stage('Validate Environment') {
      steps {
        container('maven') {
            sh 'make build'
        }
      }
    }
    stage('Update Environment') {
      when {
        branch 'master'
      }
      steps {
        container('maven') {
            sh 'make install'
        }
      }
    }
  }
}
