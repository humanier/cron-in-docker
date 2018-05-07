# cron-in-docker
Sample repository which shows how to run cron job in background in Docker container

# Build image
`docker build -t cron-test:v1`

# Run container
`docker run cron-test:v1`

# Kill container (if only one is running)
`docker kill $(docker container ls -q)`

# Sample output
```
$ docker run cron-test:v1
* * * * * echo -n `date ` >> /work/test.txt; echo -n ' at ' >> /work/test.txt; echo `hostname` >> /work/test.txt 2>/work/error.log
root         1  0.0  0.0   4624   800 ?        Ss   15:17   0:00 /bin/sh -c cron; crontab -l; (ps aux | grep cron); tail -f ${WORKDIR}/*
root         8  0.0  0.0  28352  2304 ?        Ss   15:17   0:00 cron
root        10  0.0  0.0   4624    92 ?        S    15:17   0:00 /bin/sh -c cron; crontab -l; (ps aux | grep cron); tail -f ${WORKDIR}/*
root        12  0.0  0.0  11460  1088 ?        S    15:17   0:00 grep cron
==> /work/error.txt <==

==> /work/test.txt <==
Mon May 7 15:18:01 UTC 2018 at 61c82688c376
Mon May 7 15:19:01 UTC 2018 at 61c82688c376
```
