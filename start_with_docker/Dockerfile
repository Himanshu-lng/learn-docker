
  
# pulling ubuntu image from docker hub
FROM ubuntu:latest

# Updating System packages
RUN apt-get -y update && apt-get -y upgrade

# installing java 8 and wget utility
RUN apt-get -y install openjdk-8-jdk wget

#set JAVA_HOME 
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64

RUN echo "The JAVA_HOME variable value is $JAVA_HOME"

#creating directory 
RUN mkdir /usr/local/tomcat

# downloading and dumping tomcat 8 gz file  to /tmp folder.
RUN wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.72/bin/apache-tomcat-9.0.72.tar.gz -O /tmp/tomcat.tar.gz

#changing directoty to /tmp and  extracting tomcat gz file to tmp directory. 
RUN cd /tmp && tar -zxvf tomcat.tar.gz

#Copy all files from tomcat extracted folder to /usr/local/tomcat/
RUN cp -Rv /tmp/apache-tomcat-9.0.72/* /usr/local/tomcat/

#LABEL Java version and tomcat version. 
LABEL java.version="open jdk 1.8" tomcat.version="9"

#Copy war packages from host system to image. 
COPY app.war /usr/local/tomcat/webapps/

#opening container port 8080 as by default tomcat runs on port 8080
EXPOSE 8080

#Changing Work Directory
WORKDIR /usr/local/tomcat/bin/

#starting tomcat
#CMD /usr/local/tomcat/bin/catalina.sh run

ENTRYPOINT /usr/local/tomcat/bin/catalina.sh run
