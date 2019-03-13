# informatica-centos-docker
Script to create Docker image with CentOS and Informatica Cloud Secure Agent

# Steps to create the Docker image
# Step #1
  Checkout all the file from this repository and execute the below docker commands
  1. docker build -t unico/centosinfa .
  2. docker images
  3. docker run --cpus [#_CPUS] --name [DOCKER_RUN_NAME] -h [HOST_NAME] [DOCKER_IMAGE_NAME] [INFA USERNAME] [TOKEN]
# Step #2
  Execute the below command to access running container
  1. docker ps
  1. docker exec -it [CONTAINER_ID] /bin/bash
# Step #3
  Execute the below commands to stop and remove the container
  1. docker ps --all
  2. docker container stop [CONTAINER_ID]
  3. docker container rm [CONTAINER_ID]

# NOTE:
  When you stop/delete the cluster and restart after sometime, the Runtime Secure Agent Group/Runtime Agent/Host name will be changed. In order to resolve it, we have to specifically mention the Hostname when run the docker using -h parameter as mention in Step #1.3

Docker Commands reference: https://linuxize.com/post/how-to-remove-docker-images-containers-volumes-and-networks/#removing-all-unused-objects
