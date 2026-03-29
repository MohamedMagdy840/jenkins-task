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
                echo "hello"
                echo "Task Done by Mohamed MaGdy"
                echo "Jenkins Course"
                current_date_time=$(date +"%Y-%m-%d %H:%M:%S")
                
                # Print the current date and time
                echo "Current date and time: $current_date_time"
                '''
               
              
            }
        }
    }
}
