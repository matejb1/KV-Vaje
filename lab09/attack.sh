#!/bin/bash

for i in $(seq 1 100);
do
        ssh testuser@172.17.0.2 -p $i
done
