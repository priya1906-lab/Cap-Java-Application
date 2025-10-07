FROM openjdk:11-jdk AS build
WORKDIR /app 
COPY . .
RUN mkdir -p build/WEB-INF/classes \ && find . -name "*.java" -exec javac -d build/WEB-INF/classes {} \;

FROM tomcat:9.0
RUN rm -rf /usr/local/tomcat/webapps/*
COPY --from=build /app/build/ /usr/local/tomcat/webapps/ROOT/
EXPOSE 8080
CMD [ "catalina.sh" , "run"]