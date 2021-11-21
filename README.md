# MusicBot

Builds and runs the latest Version of [JMusicBot](https://github.com/jagrosh/MusicBot).
_A cross-platform Discord music bot with a clean interface, and that is easy to set up and run yourself!_

Clone this repository using the following command so you also get the submodule:
```
git clone --recursive <this-repo-url>
```

## Image (Dockerfile)
2-Stage Build

- First Stage: 
  - based on latest maven-Container
  - installs git, pulls repo, compiles binary

- Second Stage:
  - based in openjdk-Container
  - runs compiled binary with user privileges
  - needs config-Files! 


## Run (Docker-Compose)
- starts various instances of the image as described above
- mounts neccessary config files into the containers
