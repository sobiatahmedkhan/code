pipeline {
    agent any
    tools {
        maven 'Maven3'
        'org.jenkinsci.plugins.docker.commons.tools.DockerTool' 'Docker'
    }
    stages{
        stage ('building project') {
            steps {
                script {
                    sh 'mvn clean  install -DskipTests'
                }
            }
        }
    
        stage ('testing project') {
            steps {
                script {
                    sh 'mvn clean verify sonar:sonar \
                    -Dsonar.projectKey=java-app-testing \
                    -Dsonar.host.url=http://sonarqube:9000 \
                    -Dsonar.login=07526f87f409640a3e523fd2e75f4602e9ef7548'
                }
            }
        }

     stage ('creating docker image') {
            steps {
                script {
                    sh 'docker build -t jimsparrow/java-app:latest .'
                }
    
            }
        }
	    
     

	 stage ('pushing to docker-hub') {
            steps {
                script {
                    sh 'docker logout'
                        withCredentials([
                        usernamePassword(credentialsId: 'docker-hub-credentials' , usernameVariable: 'USER' , passwordVariable:'PWD')
                        ]){
                        sh "docker login -u $USER -p $PWD " 
                        }
                    
                     sh 'docker push jimsparrow/java-app:latest'
                     sh 'docker logout'
                    
                }
	        }
        }

        
                        
                    

	 stage ('removing docker image') {
            steps {
                script {
                    sh 'docker rmi jimsparrow/java-app:latest'
                }

            }
        } 
               
    }
}