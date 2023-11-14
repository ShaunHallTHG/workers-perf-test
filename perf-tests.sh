#!/bin/bash

declare -A sites
sites[vanillaJS]="a4f1e09c"
sites[astroStarter]="67329b3f"
sites[altitudeMTCWithMiddleware]="a7cbe441"
sites[altitudeMTCNoMiddleware]="3c34dea7"
rm -rf results

for key in "${!sites[@]}"
do 
	echo "Testing $key"
	./ab-graph.sh -l "$key" -n 100 -c 1 -E  "-H 'x-altitude-cf-access: $ALTITUDE_ACCESS_KEY' -H 'x-altitude-instance: altitude.www.allsole.com' -H \"X-Forwarded-Host: ${sites[$key]}.thgaltitude.com\" -H 'X-Forwarded-Proto: https' " -u https://${sites[$key]}.cf-thgaltitude.com/hello  
done
./ab-graph_merge.sh $PWD/results/*/*
