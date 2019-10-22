FROM openjdk:8-jdk as build
WORKDIR /app
COPY . .
RUN ./gradlew assemble

FROM openjdk:8-jre
WORKDIR /app
COPY --from=build /app/build/libs/*.jar app.jar
CMD [ "java", "-jar", "app.jar"]
