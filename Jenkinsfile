pipeline {
    agent any
    stages{
      
        stage ('testing project') {
            steps {
                script {
                    sh 'sonar-scanner \
  		-Dsonar.projectKey=web-page.html \
  		-Dsonar.sources=. \
  		-Dsonar.host.url=http://sonarqube:9000 \
  		-Dsonar.login=eabaef1d91676c4646601daafb8c0ee85e1b679 '
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
                    sh 'docker rmi jimsparrow/web-page:latest'
                }

            }
        } 
               
    }
}
