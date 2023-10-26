#!/bin/bash

declare -A sites
#sites[vanillaJS]="a4f1e09c"
#sites[vanillaJSWithAstroBlob]="ac1d3adc"
sites[cloudflareWithEPAstroStarterBlog]="67329b3f.cf-thgaltitude.com/blog"
sites[cloudflareAstroStarterBlog]="dc256aeebfd5710a-ssr.shaun-hall.workers.dev/blog"
sites[cloudflareWithEPAstroStarterBlogHello]="67329b3f.cf-thgaltitude.com/hello"
sites[cloudflareAstroStarterBlogHello]="dc256aeebfd5710a-ssr.shaun-hall.workers.dev/hello"
#sites[altitudeMTCWithMiddleware]="a7cbe441"
#sites[altitudeMTCNoMiddleware]="3c34dea7"
sites[denoAstroStarterBlog]="famous-cod-81.deno.dev/blog"
sites[denoAstroStarterBlogHello]="famous-cod-81.deno.dev/hello"
rm -rf results

for key in "${!sites[@]}"
do 
	echo "Testing $key"
	#./ab-graph.sh -l "$key" -n 100 -c 1 -E  "-H 'x-altitude-instance: altitude.www.allsole.com' -H \"X-Forwarded-Host: ${sites[$key]}.thgaltitude.com\" -H 'X-Forwarded-Proto: https' " -u https://${sites[$key]}.cf-thgaltitude.com/hello  
	./ab-graph.sh -l "$key" -n 100 -c 1 -u https://${sites[$key]}  
done
./ab-graph_merge.sh $PWD/results/*/*
