FROM eclipse-temurin:17-jre-alpine

EXPOSE 8080

ENV APP_HOME=/usr/src/app

WORKDIR $APP_HOME

# JAR passed from pipeline
ARG JAR_FILE
COPY ${JAR_FILE} app.jar

ENTRYPOINT ["java","-jar","app.jar"]
