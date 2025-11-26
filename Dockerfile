### Stage 1: Build
FROM maven:3.9-eclipse-temurin-21 AS build
COPY src /usr/src/app/src
COPY pom.xml /usr/src/app
RUN mvn -f /usr/src/app/pom.xml -B package -DskipTests

### Stage 2: Runtime
FROM eclipse-temurin:21-jre-jammy
WORKDIR /app
# Copy the runner JAR created by Quarkus to a standard name
COPY --from=build /usr/src/app/target/*-runner.jar /app/app.jar
EXPOSE 8080
ENV PORT=8080
# Execute the runner JAR
CMD ["java", "-jar", "app.jar"]
