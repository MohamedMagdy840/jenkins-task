pipeline {
    agent any

    stages {
        stage('Hello jenkins') {
            steps {
                echo 'Hello Jenkins'
               
              
            }
        }
        stage('Hello world') {
            steps {
                sh'''

                chmod +x script.sh
                ./script.sh
                
                '''
               
              
            }
        }
    }
}
