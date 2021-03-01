pipeline
{
  agent any
  environment{
          PATH = "/opt/maven/apache-maven-3.6.3/bin:$PATH"
      }
    stages
	{
	stage('SCM GitCheckout'){
	      steps{
		    git credentialsId: '3dd0fa55-769d-4326-af17-46c823c096ee', url: 'https://github.com/jampa-rambabu/Dockerwebapp1.git'
		    }
	}
	stage('Package and Generate artifacts'){
	steps{
	sh "mvn clean package -DskipTests=true"
	}
	}
	stage('deployment of Application using Docker'){
	steps{
	sh "docker version"
	sh "cd /opt/docker; docker build  -t 8297762265/archiveartifacts:newtag -f Dockerfile ."  
	sh "docker run -p 1234:8080 -d 8297762265/archiveartifacts:newtag"
		
	}
	}
	stage('War file to S3'){
	steps{
	withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'AWS_credentials', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
        sh "aws s3 ls "
        sh "aws s3 mb s3://ram-bucket-for-aws"
        sh "aws s3 cp /var/lib/jenkins/workspace/Jenkins_maven_docker_git_s3_1/target/PersistentWebApp.war s3://ram-bucket-for-aws"
    }
	}
	}
}
}
