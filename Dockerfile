FROM ubuntu

ENV WORKDIR /work

WORKDIR ${WORKDIR}

# install cron
RUN apt-get update && apt-get install -y cron

# create output and error log files to be able to `tail` them later
RUN touch ${WORKDIR}/test.txt
RUN touch ${WORKDIR}/error.txt

# add cron job which runs every minute
RUN echo "* * * * * echo -n \`date \` >> $WORKDIR/test.txt; echo -n ' at ' >> $WORKDIR/test.txt; echo \`hostname\` >> $WORKDIR/test.txt 2>$WORKDIR/error.log"  | crontab -

# run container
# - start `cron`
# - list processes to make sure `cron` is running
# - `tail` output and error files to display updates
CMD cron; crontab -l; (ps aux | grep cron); tail -f ${WORKDIR}/*