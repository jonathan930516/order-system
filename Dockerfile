FROM tomcat:10.1-jdk21-temurin

RUN rm -rf /usr/local/tomcat/webapps/ROOT \
           /usr/local/tomcat/webapps/ROOT.war

COPY orderservlet.war /tmp/orderservlet.war

RUN mkdir -p /usr/local/tomcat/webapps/ROOT && \
    cd /usr/local/tomcat/webapps/ROOT && \
    jar -xf /tmp/orderservlet.war && \
    rm /tmp/orderservlet.war

COPY p1_2.html /usr/local/tomcat/webapps/ROOT/p1_2.html
EXPOSE 8080

CMD ["catalina.sh", "run"]
