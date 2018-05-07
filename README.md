# cron-in-docker
Sample repository which shows how to run cron job in background in Docker container

# Build image
`docker build -t cron-test:v1`

# Run container
`docker run cron-test:v1`

# Kill container (if only one is running)
`docker kill $(docker container ls -q)`