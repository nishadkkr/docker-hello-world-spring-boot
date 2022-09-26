# Maven build container 

FROM maven:3.8.5-openjdk-11 AS build
COPY pom.xml ./
COPY src ./src
WORKDIR /docker-hello-world-spring-boot
RUN mvn clean install

#pull base image

FROM openjdk
#expose port 8080
EXPOSE 9000
#default command
CMD java -jar hello-world-0.1.0.jar
#copy hello world to docker image from builder image
COPY --from=build /target/hello-world-0.1.0.jar ./hello-world-0.1.0.jar
