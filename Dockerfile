FROM maven:latest
RUN mkdir -p /usr/src/demo
WORKDIR /usr/src/demo
ADD . /usr/src/demo
ENV MAVEN_OPTS="-XX:+TieredCompilation -XX:TieredStopAtLevel=1"
RUN mvn deploy