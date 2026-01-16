#!/bin/bash
cat urls.txt | grep -v '^[[:space:]]*$' | awk '/^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$/ {print "  - IP-CIDR,"$1"/32,REJECT"} !/^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$/ {print "  - DOMAIN-SUFFIX,"$1",REJECT"}' > clash_rules.yaml
cat urls.txt | sed '/^[0-9]\{1,3\}\./s/^/||/ ; /^[0-9]\{1,3\}\./s/$/^/ ; /^[^0-9|]/s/^/||/ ; /^[^0-9|]/s/$/^/' > adguard_rules.txt
