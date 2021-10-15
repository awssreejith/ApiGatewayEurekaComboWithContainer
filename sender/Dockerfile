FROM openjdk:8-jre-alpine
WORKDIR /usr/app/bin
RUN mkdir /tmp/log
COPY ./target/sender-1.0.0.jar /usr/app/bin
ENTRYPOINT ["java","-jar","sender-1.0.0.jar"]