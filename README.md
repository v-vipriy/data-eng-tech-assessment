## Task

This is a timeboxed task that requires you to develop a set of datapipelines / tasks that:

1. Loads an external street data file and then sends into a kafka topic
2. Read from the topic and enrich the message with the true location names
3. Finally load the enriched data then loads into the 
4. Have at least one unit test

Use the provided docker-compose file to get you started, this will spin up the required services.
Check the compose file for the ports

### Further information

- The language preference is Java and then other JVM
- Changes to the docker-compose are fine, including changing the container services or versions. Swapped out services should be something equivilant
- The current database is iceberg, in this case backed onto minio and presented via trino with a metastore catalog
- The data pipeline framework is apache beam, a flink server and worker are a park of the docker-compose
- There is a metabase container, this is optional to try and visualise data

### Getting started

- Fork this repo as a starting point
- unzip the pedestrian.zip file in source-data
- Setup docker - see instructions below
- You will need to define and create the schema and tables, see example in the cli folder
- You will need to create additional topics (the default could get used), they can be added in the "KAFKA_CREATE_TOPICS" variable for the kafka container
- Copy or rename the .env.example to .env and populate the values for the containers
- Run the docker-compose file to spin up the containers (see below on how to startup)
- Use the minio cli to create the minio bucket, the create-assets.sh has an example of installing the mc tool and creating the bucket or you can create via the minio console
- You can upload and run your jar to the flink master
- When submitting, share the github/gitlab project

### Solutions, assumtions and design choices

### Task files
1. Melbourne pedestrian data
2. Location data

## Setup

### Docker Desktop

#### Windows:

1. Go to [Docker Desktop for Windows](https://docs.docker.com/docker-for-windows/install/) and download the executable file.
2. Run the executable file and follow the instructions to complete the installation.

#### Mac:

1. Go to [Docker Desktop for Mac](https://docs.docker.com/docker-for-mac/install/) and download the .dmg file.
2. Open the .dmg file and drag the Docker icon to the Applications folder.
3. Double-click the Docker icon in the Applications folder to launch Docker.

#### Linux:

1. Go to [Docker Desktop for Linux](https://docs.docker.com/engine/install/ubuntu/) and choose the appropriate installation method for your distribution.
2. Follow the instructions to complete the installation.

### Docker Compose

#### Windows, Mac, and Linux:

1. Go to [Docker Compose](https://docs.docker.com/compose/install/) and follow the instructions to install Docker Compose for your operating system.

### Podman

#### Linux:

1. Go to the [Podman documentation](https://podman.io/getting-started/installation) and choose the appropriate installation method for your distribution.
2. Follow the instructions to complete the installation.

#### Mac:

1. Install [Homebrew](https://brew.sh/) if you haven't already.
2. Run `brew install podman`.

#### Windows:

1. Install [Windows Subsystem for Linux (WSL)](https://docs.microsoft.com/en-us/windows/wsl/install-win10) if you haven't already.
2. Install Podman using the WSL terminal. Instructions can be found on the [Podman documentation](https://podman.io/getting-started/installation#windows-subsystem-for-linux-wsl) page.

### Podman Compose

#### Linux:

1. Go to the [Podman Compose GitHub page](https://github.com/containers/podman-compose) and follow the instructions to download and install Podman Compose.

#### Mac and Windows:

1. Install Podman Compose using pip. Run `pip install podman-compose` in a terminal window.

### CLI tools required

### Containers

To spin up the containers run below:
```
docker-compose up -d --force-recreate --remove-orphans
```

To stop run:
```
docker-compose down
```