#!/bin/bash

counter=0
bcount=0
while true
do
    #echo $counter
    ((counter++))
    ./waitForButtonPress.sh
    ((bcount++))
    ./setbits.sh "$counter"
    echo $bcount

    if [ "$counter" -eq 16 ]
    then
        echo "hello world"
        counter=0
    fi

    if [ "$counter" -eq 0 ]
    then
        gpio write 4 1 # buzzer beeps
        sleep 1
        gpio write 4 0
    fi   
done
