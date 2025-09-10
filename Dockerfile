# Step 1: Use OpenJDK as base image
FROM openjdk:17-jdk-slim

# Step 2: Set working directory inside container
WORKDIR /app

# Step 3: Copy the built jar from your project
COPY target/CiCdJenkinsGitHubActionsDemoSpringbootApp-0.0.1-SNAPSHOT.jar app.jar

# Step 4: Expose port
EXPOSE 8080

# Step 5: Command to run the app
ENTRYPOINT ["java", "-jar", "app.jar"]
