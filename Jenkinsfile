pipeline {
    agent any
    triggers {
        pollSCM('H/2 * * * *')
    }
    stages {
        stage('Build') {
         steps {
             chmod +x build.sh
             sh "./build.sh"
         }
         post{
            always{

                println "ava se exportan los resultados de los test unitarios"
            }
         }

        }
        stage('Deploy') {
          steps {
              chmod +x deploy.sh
              sh "./deploy.sh"
          }
        }
        stage('Verify') {
           steps {
               chmod +x verify.sh
               sh "./verify.sh"
           }
           post{
               always{
                   junit 'build/test-results/test/*.xml'
                   junit 'integration-test/newman/*.xml'
               }
           }
        }

    }
    post {
        success {
            echo 'El job finalizó OK! :)'
        }
        failure {
            echo 'El job rompio! :('
        }
    }
}