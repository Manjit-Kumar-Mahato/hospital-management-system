# Build stage
FROM maven:3.9.9-eclipse-temurin-21 AS build
WORKDIR /app
COPY . .
RUN mvn -B -DskipTests clean package

# Run stage
FROM tomcat:9.0
COPY --from=build /app/target/Hospital_System.war /usr/local/tomcat/webapps/
EXPOSE 8080
