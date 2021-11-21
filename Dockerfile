# Build Stage

FROM maven AS build

RUN microdnf install git

RUN git clone https://github.com/jagrosh/MusicBot

WORKDIR /MusicBot

RUN mvn package


# Run Stage

FROM openjdk AS run

WORKDIR /MusicBot

COPY --from=build /MusicBot/target/JMusicBot-Snapshot-All.jar /MusicBot/JMusicBot.jar

RUN groupadd -r musicbot && useradd -g musicbot musicbot

RUN chown -R musicbot:musicbot /MusicBot

USER musicbot

CMD ["java", "-Dnogui=true", "-jar", "JMusicBot.jar"]


