# Build Stage

FROM maven AS build

WORKDIR /MusicBot
COPY . .

# Insert the current version and build the JAR
RUN sed "s%<version>Snapshot</version>%<version>0.3.7</version>%g" pom.xml -i && \
    mvn package

# Run Stage

FROM openjdk AS run

WORKDIR /MusicBot

COPY --from=build /MusicBot/target/JMusicBot-*-All.jar /MusicBot/JMusicBot.jar

RUN groupadd -r musicbot && \
    useradd -g musicbot musicbot && \
    chown -R musicbot:musicbot /MusicBot

USER musicbot

CMD ["java", "-Dnogui=true", "-jar", "JMusicBot.jar"]
