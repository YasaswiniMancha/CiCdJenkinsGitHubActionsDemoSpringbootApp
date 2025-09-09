pipeline {
    agent any

    tools {
        maven 'Maven3'
        jdk 'JDK17'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/YasaswiniMancha/CiCdJenkinsGitHubActionsDemoSpringbootApp.git'
            }
        }

        stage('Build') {
            steps {
                bat 'mvn clean install -DskipTests'
            }
        }

        stage('Test') {
            steps {
                bat 'mvn test'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat 'docker build -t yasaswinigayathrimancha/cicdemo .'
            }
        }

        stage('Push Docker Image') {
            steps {
                withCredentials([string(credentialsId: 'docker-hub-password', variable: 'DOCKER_HUB_PASS')]) {
                    bat "echo %DOCKER_HUB_PASS% | docker login -u yasaswinigayathrimancha --password-stdin"
                    bat 'docker push yasaswinigayathrimancha/cicdemo'
                }
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying... (optional if you deploy to another server)'
            }
        }
    }
}
