FROM ubuntu as clone
RUN apt-get update
RUN apt-get install -y git
WORKDIR /app
RUN git clone https://DharaniMoorthy:Moorthy28@github.com/DharaniMoorthy/webapp.git

FROM maven:3.5-jdk-8-alpine as build
WORKDIR /app
COPY --from=clone /app/webapp/ /app
RUN mvn package

FROM tomcat:8.0.20-jre8
WORKDIR /app
COPY --from=build /app/target/WebApp.war  /usr/local/tomcat/webapps/WebApp.war
