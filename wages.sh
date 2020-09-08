#!/bin/bash -x
fullday=16
halfday=8
full=1
half=2
totaldays=20
presentday=0
day=1
perhourcharges=20
presenthours=0
totalhours=350



daystatus(){

        if [ $1 -eq 1 ]
        then
        echo $fullday
        elif [ $1 -eq 2 ]
        then
        echo $halfday
	else
	echo 0
        fi
        }

until [ $day -gt $totaldays ] || [ $presenthours -gt $totalhours ]
do
attendance=$(( RANDOM%3 ))

    workinghours="$( daystatus $attendance )"

    dailycharges[$day]=$(( $perhourcharges * $workinghours ))
    presenthours=$(( $presenthours + $workinghours ))
    totalwages[$day]=$(( $presenthours * $perhourcharges ))
	((day++))
done

for ((i=1;i<=$totaldays;i++)) 
do
	echo $i" "${dailycharges[i]}"  "  ${totalwages[i]}
done


