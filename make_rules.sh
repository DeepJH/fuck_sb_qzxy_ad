#!/bin/bash
grep -v '^\[source' urls.txt | tr -d '\r' | awk '{if ($1 ~ /^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$/) print "  - IP-CIDR,"$1"/32,REJECT"; else print "  - DOMAIN,"$1",REJECT"}' > clash_rules.yaml
cat urls.txt | sed '/^[0-9]\{1,3\}\./s/^/||/ ; /^[0-9]\{1,3\}\./s/$/^/ ; /^[^0-9|]/s/^/||/ ; /^[^0-9|]/s/$/^/' > adguard_rules.txt
