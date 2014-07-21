#!/bin/bash

PEM_FILE=$1

for i in {1..7}
do
    ssh -i $PEM_FILE ubuntu@telles-storm-slave$i 'sudo rm -rf /usr/local/storm/logs/worker-6703.log'
#ssh -i $PEM_FILE ubuntu@telles-storm-slave2 'sudo rm -rf /usr/local/storm/logs/worker-6703.log'
#ssh -i $PEM_FILE ubuntu@telles-storm-slave3 'sudo rm -rf /usr/local/storm/logs/worker-6703.log'
#ssh -i $PEM_FILE ubuntu@telles-storm-slave4 'sudo rm -rf /usr/local/storm/logs/worker-6703.log'
#ssh -i $PEM_FILE ubuntu@telles-storm-slave5 'sudo rm -rf /usr/local/storm/logs/worker-6703.log'
#ssh -i $PEM_FILE ubuntu@telles-storm-slave6 'sudo rm -rf /usr/local/storm/logs/worker-6703.log'
#ssh -i $PEM_FILE ubuntu@telles-storm-slave7 'sudo rm -rf /usr/local/storm/logs/worker-6703.log'
done
