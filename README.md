# RabbitMQ AMQP Broker

Message bus for message based communication between microservices.

## Installation

### Development only (using docker)

#### Prerequisites

- [Docker](https://www.docker.com/products/docker-desktop) running on Mac, Windows or Linux
- Docker Know-How (recommended)
    - [Official Docker Cheatsheet](https://docs.docker.com/get-started/docker_cheatsheet.pdf)

#### Step-by-step

1. Check out the repository

    ```bash
    git clone git@github.com:dmetzler1988-org/infra-rabbitmq.git /path/to/project
    ```

2. Copy the files - Adjust these according to your requirements

    ```bash
    cd /path/to/project
    cp .env.dist .env
    ```

3. Build & run the container

    ```bash
    docker-compose up --build -d --force-recreate
    ```

6. Finish
   
    Open [http://localhost:15672](http://localhost:15672) (use broker management port from your .env file) in your browser. You should see the RabbitMQ login screen.

## Deployment

### Update latest version

Simple check the version on Dockerfile: `rabbitmq:3-management` contains each 3.x.x version of RabbitMQ.

Then create a new release version on GitHub - this will trigger the CD-Pipline which will build the latest image (given from Dockerfile) and push it to DockerHub automatically.

After that, simple restart your Pod.
