FROM tomcat:9.0-jdk11-openjdk

COPY ./src/main/webapp /usr/local/tomcat/webapps/ROOT

COPY ./build/classes /usr/local/tomcat/webapps/ROOT/WEB-INF/classes

COPY ./src/main/webapp/WEB-INF/lib /usr/local/tomcat/webapps/ROOT/WEB-INF/lib

EXPOSE 8080
CMD ["catalina.sh", "run"]