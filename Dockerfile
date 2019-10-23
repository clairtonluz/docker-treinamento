FROM openjdk:8-jdk as build
WORKDIR /app
COPY . .
RUN ./gradlew assemble

FROM openjdk:8-jre-alpine3.9
WORKDIR /app
COPY --from=build /app/build/libs/*.jar app.jar
CMD [ "java", "-jar", "app.jar"]

EXPOSE 8080