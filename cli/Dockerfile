FROM alpine:3.16

# Install OpenJDK-8 and Ant
RUN apk update && \
    apk add --no-cache openjdk8-jre-base && \
    rm -rf /var/cache/apk/*

# Fix certificate issues
RUN apk add --no-cache ca-certificates curl && \
    update-ca-certificates

# Setup JAVA_HOME -- useful for docker commandline
ENV JAVA_HOME /usr/lib/jvm/java-1.8-openjdk/
ENV PATH $JAVA_HOME/bin:$PATH

WORKDIR /app

COPY tables.sql .
#RUN curl -fsSL -O trino-cli.jar https://repo1.maven.org/maven2/io/trino/trino-cli/414/trino-cli-414-executable.jar
COPY trino-cli-414-executable.jar .
RUN mv trino-cli-414-executable.jar trino
RUN chmod +x trino

ENTRYPOINT ["/bin/sh", "-c", "sleep 180 && ./trino --server http://trino:8080 --file ./tables.sql"]