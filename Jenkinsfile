pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/MohamedMagdy840/jenkins-task.git'  // Replace with your repository URL
            }
        }
        stage('Run Hello World') {
            steps {
                script {
                    sh'''
                    chmod +x hello.sh
                    ./hello.sh   
                    '''
                }
            }
        }
    }
    post {
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}
