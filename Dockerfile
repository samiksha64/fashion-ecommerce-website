FROM tomcat:9.0-jdk17-openjdk

# Delete everything to prevent old 404 files from staying
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy the new WAR and name it ROOT.war
COPY ROOT.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]