#!/bin/bash

RUNNING_TIME=$1
MESSAGES_PER_SECOND=$2
NUM_SPOUTS=$3
STORAGE_FOLDER=$4
PEM_FILE=$5

mkdir -p $STORAGE_FOLDER

/usr/local/storm/bin/storm jar target/alarm-storm.jar main.java.alarm.Main $MESSAGES_PER_SECOND $NUM_SPOUTS &

sleep "$RUNNING_TIME"m

/usr/local/storm/bin/storm kill sg-app-storm

#Copy files to folder
for i in {1..7}
do
    scp -i $PEM_FILE ubuntu@telles-storm-slave$i:/usr/local/storm/logs/worker-6703.log $STORAGE_FOLDER/worker-ack-1.$i.log
done

for i in {1..7}
do
    if [ -f $STORAGE_FOLDER/worker-ack-1.$i.log ];
    then
        python parser.py $STORAGE_FOLDER/worker-ack-1.$i.log $STORAGE_FOLDER/worker-ack-$i.log
    else
        echo "hour;minute;second;event;total" >> $STORAGE_FOLDER/worker-ack-$i.log
    fi
done

#Delete local unecessary files
#for i in {1..7}
#do
#    rm -rf $STORAGE_FOLDER/worker-ack-1.$i.log
#done 

#Delete files from remote
for i in {1..7}
do
    ssh -i $PEM_FILE ubuntu@telles-storm-slave$i 'sudo rm -rf /usr/local/storm/logs/worker-6703.log'
done

sleep 1m
