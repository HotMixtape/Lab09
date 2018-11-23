#!/bin/bash

gpio mode 5 in
gpio mode 5 up

a=$(gpio read 5)

while true
do
    until [ "$a" -eq 0 ]
    do
        a=$(gpio read 5)
        echo "waiting not pressed"
        sleep 5
    done
    
    until [ "$a" -eq 1 ]
    do
        a=$(gpio read 5)
        echo "waiting pressed"
        sleep 5
    done
done
