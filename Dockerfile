### Stage 1: Build
FROM maven:3.9-eclipse-temurin-21 AS build
COPY src /usr/src/app/src
COPY pom.xml /usr/src/app
RUN mvn -f /usr/src/app/pom.xml -B package -DskipTests

# DEBUG: List the contents of the target directory to see what was built
RUN echo "--- Listing target directory contents ---" && ls -R /usr/src/app/target

### Stage 2: Runtime
FROM eclipse-temurin:21-jre-jammy
WORKDIR /app
# This COPY command will still fail, but the log from the step above will tell us what to copy instead.
COPY --from=build /usr/src/app/target/quarkus-app/ /app/
EXPOSE 8080
ENV PORT=8080
CMD ["java", "-jar", "quarkus-run.jar"]
