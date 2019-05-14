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
    stage('Test') {
      steps {
        bat ' cd RestAPI_Automation & python run_features.py'
      }
    }
    stage('Report'){
      steps {
        script {
            allure([
                    includeProperties: false,
                    jdk: 'C:\\Jdk\\jdk-12.0.1\\',
                    properties: [],
                    reportBuildPolicy: 'ALWAYS',
                    results: [[path: 'report-source-data']]
            ])
    }      
      }
    }
  }
}
