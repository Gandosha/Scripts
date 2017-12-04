#!/bin/bash

printf "\n\e[1;34mWhat is the domain name that you want to map?\n\e[0m"
read domainame
printf "\n\e[1;34mStarting Fiercing...\n\e[0m"
python /home/yrn/Tools/fierce/./fierce.py --domain $domainame --delay 3
printf "\n\e[1;34mStarting Sublisting...\n\e[0m"
python /home/yrn/Tools/Sublist3r/./sublist3r.py -d $domainame -o /tmp/TargetSubdomains
touch /tmp/TargetIPs  
for subdomain in $(cat /tmp/TargetSubdomains);do
host $subdomain | grep "has address" | cut -d" " -f4 >> /tmp/TargetIPs 
done
printf "\n\e[1;34mStarting Nmaping...\n\e[0m"
nmap -sS -sV -Pn -p- -T4 -iL /tmp/TargetIPs
rm /tmp/TargetIPs


