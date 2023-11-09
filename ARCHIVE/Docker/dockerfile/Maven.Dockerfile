FROM ubuntu:20.04
ARG MAVEN_VERSION=3.5.4
RUN apt-get update && apt-get install -y curl
# Download maven binaries
RUN wget --no-verbose -O /tmp/apache-maven-$MAVEN_V-bin.tar.gz http://apache.cs.utah.edu/maven/maven-3/$MAVEN_V/binaries/apache-maven-$MAVEN_V-bin.tar.gz
# install maven
RUN tar xzf /tmp/apache-maven-$MAVEN_V-bin.tar.gz -C /opt/ \
    && ln -s /opt/apache-maven-$MAVEN_V /opt/maven \
    && ln -s /opt/maven/bin/mvn /usr/local/bin \
    && rm -f /tmp/apache-maven-$MAVEN_V-bin.tar.gz

# Give Jenkins user permission to use mvn properly
RUN chown -R jenkins:jenkins /opt/maven
