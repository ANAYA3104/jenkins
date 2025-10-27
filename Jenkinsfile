pipeline {
    agent any

    environment {
        IMAGE_NAME = "myapp"
        CONTAINER_NAME = "myapp_container"
    }

    stages {
        stage('Checkout') {
            steps {
                echo '📦 Checking out code from GitHub...'
                checkout scm
            }
        }

        stage('Build') {
            steps {
                echo '🏗️ Building the application...'
                // Add real build command here if applicable
                // Example for Node.js: bat 'npm install'
                // Example for Java: bat 'mvn clean package'
            }
        }

        stage('Test') {
            steps {
                echo '🧪 Running tests...'
                // Add your test commands here if any
            }
        }

        stage('Docker Build') {
            steps {
                echo '🐋 Building Docker image...'
                bat "docker build -t %IMAGE_NAME% ."
            }
        }

        stage('Run Docker Container') {
            steps {
                echo '🚀 Running Docker container...'
                bat """
                docker rm -f %CONTAINER_NAME% || echo "No old container to remove"
                docker run -d --name %CONTAINER_NAME% -p 8080:8080 %IMAGE_NAME%
                docker ps -a
                """
            }
        }
    }

    post {
        success {
            echo '✅ Build and Dockerization successful!'
        }
        failure {
            echo '❌ Build failed — check console output.'
        }
    }
}
