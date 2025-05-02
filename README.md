# CNAD-Assignment4
> This is the Assignment 04 of  CNAD 2025 Spring 
* This is a simple flask web application that can only show "Hello World" on the web page.

## Setup
### Prerequisites
* Docker
  * Docker Hub account: shuxian12
  * Docker Registry: 2025cloud
  * [Docker Hub](hhttps://hub.docker.com/r/shuxian12/2025cloud/tags)

### Clone the repository
```bash
git clone https://github.com/shuxian12/CNAD-Assignment4.git
cd CNAD-Assignment4
```

### Build the docker image
```bash
docker build -t 2025cloud .
```

### Run the docker container
```bash
docker run -p 8000:8000 --name cnad-assignment4 2025cloud
```

### Access the web application
* Open your web browser and go to `http://localhost:8000` or `http://127.0.0.1:8000` to see the "Hello World" message.

### Stop the docker container
```bash
docker stop cnad-assignment4
# or just press `Ctrl+C` in the terminal where the container is running
```

### Remove the docker container
```bash
docker rm cnad-assignment4
```

## Docker Hub
> Please login to your Docker Hub account before pushing the image.

### Push the docker image to Docker Hub
```bash
docker tag 2025cloud shuxian12/2025cloud:latest
docker push shuxian12/2025cloud:latest
```

### Pull the docker image from Docker Hub
```bash
docker pull shuxian12/2025cloud:latest
```


