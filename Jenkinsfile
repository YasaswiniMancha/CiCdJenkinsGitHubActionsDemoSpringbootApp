pipeline {
    agent any

    tools {
		 git 'Git'
        maven 'Maven3'
        jdk 'JDK17'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'master', url: 'https://github.com/YasaswiniMancha/CiCdJenkinsGitHubActionsDemoSpringbootApp.git'
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
        
        //use this if used id, Secret text and password for security 

        /* 
        stage('Push Docker Image') {
            steps {
                withCredentials([string(credentialsId: 'docker-hub-password', variable: 'DOCKER_HUB_PASS')]) {
                    bat "echo %DOCKER_HUB_PASS% | docker login -u yasaswinigayathrimancha --password-stdin"
                    bat 'docker push yasaswinigayathrimancha/cicdemo'
                }
            }
        } 
        */
        
        
         //use this if used id and token for security 
        stage('Push Docker Image') {
           steps {
               withCredentials([usernamePassword(credentialsId: 'docker-hub-creds', usernameVariable: 'DOCKER_HUB_USER', passwordVariable: 'DOCKER_HUB_PASS')]) {
               bat "echo %DOCKER_HUB_PASS% | docker login -u %DOCKER_HUB_USER% --password-stdin"
               bat 'docker push yasaswinigayathrimancha/cicdemo'
        }
    }
}


        stage('Deploy') {
              steps {
                    bat 'docker run -d -p 9090:8080 --name cicd-app yasaswinigayathrimancha/cicdemo:latest'
                   }
                }

    }
}
