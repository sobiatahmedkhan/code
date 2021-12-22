pipeline {
    agent any
     tools{
		nodejs 'nodejs' 'org.jenkinsci.plugins.docker.commons.tools.DockerTool' 'Docker'
            
    }
    stages{

		
	stage('building nodejs package') {
            steps {
                script {
                    sh ' npm  install '
                }
            }
        }

     stage ('testing project') {
                steps {
                    script {
                        sh 'sonar-scanner \
                            -Dsonar.projectKey=index.html \
                            -Dsonar.sources=. \
                            -Dsonar.host.url=http://sonarqube:9000 \
                            -Dsonar.login=25d311047a3a45500d2c3c0d3e0810c9cce568db'
                    }
                }
            }

     stage ('creating docker image') {
            steps {
                script {
                    sh 'docker build -t jimsparrow/node-app:latest .'
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
                    
                     sh 'docker push jimsparrow/node-app:latest'
                     sh 'docker logout'
                    
                }
	        }
        }

        
                        
                    

	 stage ('removing docker image') {
            steps {
                script {
                    sh 'docker rmi jimsparrow/node-app:latest'
                }

            }
        } 
               
    }
}
