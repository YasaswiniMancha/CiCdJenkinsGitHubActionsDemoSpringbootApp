# Step 1: Use OpenJDK as base image
FROM openjdk:17-jdk-slim

# Step 2: Set working directory inside container
WORKDIR /app

# Step 3: Copy the built jar from your project
COPY target/CiCdPipelineJenkinDocker-0.0.1-SNAPSHOT.jar app.jar

# Step 4: Expose port
EXPOSE 8080


# Step 5: Add health check
HEALTHCHECK --interval=30s --timeout=5s --retries=3 \
  CMD curl -f http://localhost:8080/actuator/health || exit 1

# Step 5: Command to run the app
ENTRYPOINT ["java", "-jar", "app.jar"]
