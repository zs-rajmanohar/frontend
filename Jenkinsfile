pipeline {
  agent {
    label 'agent1'
  }

  stages {

    stage('download dependencies') {
      steps {
        sh '''
          npm install
        '''
      }
    }

    stage('build the project') {
      steps {
        sh '''
          npm run build
        '''
      }
    }

    stage('prepare artifacts') {
      steps {
        sh '''
          zip -r frontend.zip *
        '''
      }
    }
  }
}
//     stage('upload artifacts') {
//       steps {
//         sh '''
//           curl -v -u admin:admin123 --upload-file frontend.zip http://localhost:8081/repositories/frontend/frontend.zip
//         '''
//       }
//     }
//   }
// }


