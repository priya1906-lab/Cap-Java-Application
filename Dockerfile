FROM maven:3.9.4-amazoncorretto AS builder
WORKDIR /app
COPY . .
RUN mvn clean package
 

FROM tomcat:9.0
COPY --from=builder /app/target/maven-web-application.war /user/local/tomcat/webapps/ROOT.war
