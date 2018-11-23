#!/bin/bash

gpio mode 5 in
gpio mode 5 up

a=$(gpio read 5)
echo $a

while true
do
    until [ "$a" -eq 0 ]
    do
        echo "waiting not pressed"
        sleep 5
    done
    
    until [ "$a" -eq 1 ]
    do
        echo "waiting pressed"
        sleep 5
    done
done