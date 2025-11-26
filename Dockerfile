### Stage 1: Build
FROM maven:3.9-eclipse-temurin-21 AS build
COPY src /usr/src/app/src
COPY pom.xml /usr/src/app
RUN mvn -f /usr/src/app/pom.xml -B package -DskipTests

# DEBUG: List the contents of the target directory and then exit.
# This forces the build log to show the file list right before stopping.
RUN ls -R /usr/src/app/target && exit 1

### Stage 2: Runtime
FROM eclipse-temurin:21-jre-jammy
WORKDIR /app
# This part of the Dockerfile will not be reached, which is expected for this debug step.
COPY --from=build /usr/src/app/target/quarkus-app/ /app/
EXPOSE 8080
ENV PORT=8080
CMD ["java", "-jar", "quarkus-run.jar"]
