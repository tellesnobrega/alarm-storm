#!/bin/bash

echo "rodando latency"
python latency.py /local/storm/experimentos/experimento_latency telles-storm-nimbus 1 7 target/alarm-storm-latency.jar
wait
echo "rodando scalability"
python experiment.py /local/storm/experimentos/experimento_scalability2 telles-storm-nimbus 1 7 target/alarm-storm-scalability.jar
