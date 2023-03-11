docker build -t ubuntu_java8_tomcat8 .
docker run -d -p 8080:8080 ubuntu_java8_tomcat8
start http://localhost:8080/app