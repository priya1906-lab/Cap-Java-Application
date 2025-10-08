FROM maven:3.8.7-eclipse-temurin-8 AS builder
WORKDIR /app
COPY . .
RUN mvn clean package
 

FROM jetty:9.4-jdk8
COPY --from=builder /app/target/maven-web-application.war /var/lib/jetty/webapps/root.war
EXPOSE 8080