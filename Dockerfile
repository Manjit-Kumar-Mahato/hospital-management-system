FROM tomcat:9.0

COPY target/Hospital_System.war /usr/local/tomcat/webapps/

EXPOSE 8080
