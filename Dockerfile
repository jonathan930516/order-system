FROM tomcat:10.1-jdk17-temurin

RUN rm -rf /usr/local/tomcat/webapps/ROOT
RUN mkdir -p /usr/local/tomcat/webapps/ROOT

COPY orderservlet.war /tmp/orderservlet.war

RUN cd /usr/local/tomcat/webapps/ROOT && \
    jar -xf /tmp/orderservlet.war && \
    rm /tmp/orderservlet.war

EXPOSE 8080

CMD ["catalina.sh", "run"]
