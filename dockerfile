FROM openjdk:17-jdk-slim

COPY target/myapp.jar /app/myapp.jar

WORKDIR  /app

ENTRYPOINT ["java", "-jar", "myapp.jar"]

