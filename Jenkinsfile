pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                script {
                    // Build Docker image
                    sh 'docker build -t my-flask-app .'
                }
            }
        }
        stage('Run') {
            steps {
                script {
                    // Run Docker container
                    sh 'docker run -d -p 5000:5000 --name flask-app my-flask-app'
                }
            }
        }
    }
    post {
        always {
            // Clean up Docker container after completion
            sh 'docker stop flask-app'
            sh 'docker rm flask-app'
        }
    }
}
