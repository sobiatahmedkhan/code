pipeline {
    agent any
    tools {
        
        'org.jenkinsci.plugins.docker.commons.tools.DockerTool' 'Docker'
    }
    stages{
     
        stage ('testing project') {
            steps {
                script {
                    sh 'sonar-scanner \
  			-Dsonar.projectKey=web-page \
  			-Dsonar.sources=. \
  			-Dsonar.host.url=http://localhost:5000 \
  			-Dsonar.login=webpage'
                }
            }
        }

     stage ('creating docker image') {
            steps {
                script {
                    sh 'docker build -t jimsparrow/web-page:latest .'
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
                    
                     sh 'docker push jimsparrow/web-page:latest'
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
