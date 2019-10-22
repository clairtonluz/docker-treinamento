FROM openjdk:8-jdk
WORKDIR /app
COPY . .
RUN ls -l
RUN ./gradlew assemble --no-daemon
RUN cp build/libs/*.jar app.jar

CMD [ "java", "-jar", "app.jar"]
