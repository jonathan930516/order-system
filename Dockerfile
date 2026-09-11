FROM tomcat:10.1-jdk17-temurin

RUN rm -rf /usr/local/tomcat/webapps/ROOT
RUN mkdir -p /usr/local/tomcat/webapps/ROOT

COPY orderservlet.war /tmp/orderservlet.war

RUN cd /usr/local/tomcat/webapps/ROOT && \
    jar -xf /tmp/orderservlet.war && \
    rm /tmp/orderservlet.war
    COPY p1_2.html /usr/local/tomcat/webapps/ROOT/p1_2.html
EXPOSE 8080

CMD ["sh", "-c", "sed -i 's/port=\"8005\"/port=\"-1\"/' /usr/local/tomcat/conf/server.xml && catalina.sh run"]
