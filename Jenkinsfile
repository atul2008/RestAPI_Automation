pipeline {
  agent any
  stages {
    stage('CheckOut') {
      steps {
        git(url: 'https://github.com/atul2008/RestAPI_Automation', branch: 'Master')
      }
    }
    stage('EnvSetup') {
      steps {
        bat '  cd RestAPI_Automation & pip3 install -r requirements.txt'
      }
    }
  }
}