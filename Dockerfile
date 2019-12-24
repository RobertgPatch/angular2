FROM maven:3.6.0-jdk-8-alpine as build

WORKDIR /app

COPY . .

WORKDIR /app/application-backend

RUN mvn clean package -DskipTests=true

FROM openjdk:8

WORKDIR /app

COPY --from=build /app/application-backend/target/*.jar ./

EXPOSE 8080

# Run the jar file
ENTRYPOINT ["java", "-jar", "/app/application_backend.jar"]