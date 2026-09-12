FROM tomcat:10.1-jdk17-temurin

COPY orderservlet.war /usr/local/tomcat/webapps/ROOT.war
COPY p1_2..html /usr/local/tomcat/webapps/ROOT/p1_2..html
EXPOSE 8080

CMD ["catalina.sh", "run"]