pipeline {
    agent any
     tools{
		nodejs 'nodejs'
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
		  -Dsonar.projectKey=code \
		  -Dsonar.sources=. \
		  -Dsonar.host.url=http://sonarqube:9000 \
		  -Dsonar.login=60031d3b2cc36e8a16745dd74af95a135471c859'
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
