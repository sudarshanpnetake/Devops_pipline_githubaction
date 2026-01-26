FROM eclipse-temurin:17.0.10_7-jre-alpine

EXPOSE 8080

ENV APP_HOME=/usr/src/app
WORKDIR $APP_HOME

RUN addgroup -S appgroup && adduser -S appuser -G appgroup

ARG JAR_FILE
COPY ${JAR_FILE} app.jar

RUN chown -R appuser:appgroup $APP_HOME

USER appuser

HEALTHCHECK --interval=30s --timeout=5s --start-period=30s --retries=3 \
  CMD wget -qO- http://localhost:8080/actuator/health || exit 1

ENTRYPOINT ["java","-jar","app.jar"]
