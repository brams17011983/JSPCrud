pipeline {
	environment {
EMAIL_TO = 'b.rams@yahoo.com'
EMAIL_FROM = 'b.rams@yahoo.com'
}
	
	
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'mvn -B -DskipTests clean package'
            }
        }
        
        
        stage('ExecuteSonarQubeReport'){
            steps{
                sh  "mvn clean sonar:sonar"
            }
        }
       
        stage('Test') {
            steps {
                sh 'mvn test'
            }
            post {
                always {
                    junit 'target/surefire-reports/*.xml'
                }
            }
        }
        stage('Deliver') {
            steps {
                sh './jenkins/scripts/deliver.sh'
            }
        }
    }
    
    post{
	
always{
 emailext to: "${EMAIL_TO}",
	  from: "${EMAIL_FROM}",
          subject: "CSE-A Pipeline Build is over .. Build # is ..${env.BUILD_NUMBER} and Build status is.. ${currentBuild.result}.",
          body: "CSE-A Pipeline Build is over .. Build # is ..${env.BUILD_NUMBER} and Build status is.. ${currentBuild.result}."
/* 	,
          replyTo: "${EMAIL_TO}" */
 }
/* 
success{
 emailext to: 'b.rams17011983@gmail.com',
          subject: "Pipeline Build is over .. Build # is ..${env.BUILD_NUMBER} and Build status is.. ${currentBuild.result}.",
          body: "Pipeline Build is over .. Build # is ..${env.BUILD_NUMBER} and Build status is.. ${currentBuild.result}.",
          replyTo: 'b.rams17011983@gmail.com'
 }
 
 failure{
 emailext to: 'b.rams17011983@gmail.com',
          subject: "Pipeline Build is over .. Build # is ..${env.BUILD_NUMBER} and Build status is.. ${currentBuild.result}.",
          body: "Pipeline Build is over .. Build # is ..${env.BUILD_NUMBER} and Build status is.. ${currentBuild.result}.",
          replyTo: 'b.rams17011983@gmail.com'
 }*/
 
}
    
    
}
