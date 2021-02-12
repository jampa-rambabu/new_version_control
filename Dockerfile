FROM tomcat:9.0.43-jdk15-openjdk-oraclelinux7
COPY /var/lib/jenkins/workspace/Jenkins_git_maven_docker_terra_s3_1/target/PersistentWebApp.war /usr/local/tomcat/webapps
CMD ["catalina.sh","run"]