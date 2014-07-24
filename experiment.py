#!/usr/bin/python

import sys, getopt
import subprocess

path = sys.argv[1]

base_value = 420
#values = [420, 840, 1260, 2100, 4200, 8400, 16800, 33600, 67200]

values = [33600]
for value in values:
    if(value < base_value):
        num_spouts=1
    else:
        num_spouts=(value/base_value)

    storage_path=path+"/%s" % str(value)
    process = subprocess.Popen(["./run_topology.sh 41 500 %s %s ~/Downloads/telles.pem" % (str(num_spouts), storage_path)], shell=True)

    process.wait()
