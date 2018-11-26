#!/bin/bash

counter=0
read=$(gpio read 5)
bcount=0
while true
do
    read=$(gpio read 5)
    if [ "$read" -eq 0 ]
    then
        #echo $counter
        ((counter++))
        ./waitForButtonPress.sh
        ((bcount++))
        ./setbits.sh "$counter"
        echo $bcount
        if [ "$counter" -eq 16 ]
        then
            counter=0
        fi

        if [ "$counter" -eq 0 ]
        then
            gpio write 4 1 # buzzer beeps
            sleep 1
            gpio write 4 0
        fi
    fi
done
