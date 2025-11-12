pipeline {

    agent any

    environment {

        DOCKERHUB_CREDENTIALS = credentials('dockerhub-credentials') // ID from Jenkins

        DOCKER_IMAGE = "your_dockerhub_username/my-java-app"

    }

    stages {

        stage('Checkout') {

            steps {

                echo 'Cloning GitHub Repository...'

                git branch: 'main', url: 'https://github.com/yourusername/yourrepo.git'

            }

        }

        stage('Build with Maven') {

            steps {

                echo 'Building application with Maven...'

                sh 'mvn clean install'

            }

        }

        stage('Build Docker Image') {

            steps {

                echo 'Building Docker Image...'

                sh 'docker build -t ${DOCKER_IMAGE}:latest .'

            }

        }

        stage('Login to Docker Hub') {

            steps {

                echo 'Logging in to Docker Hub...'

                sh 'echo ${DOCKERHUB_CREDENTIALS_PSW} | docker login -u ${DOCKERHUB_CREDENTIALS_USR} --password-stdin'

            }

        }

        stage('Push Docker Image') {

            steps {

                echo 'Pushing Docker Image to Docker Hub...'

                sh 'docker push ${DOCKER_IMAGE}:latest'

            }

        }

    }

    post {

        success {

            echo ' Build and Push Successful!'

        }

        failure {

            echo ' Build Failed!'

        }

    }

}
 
