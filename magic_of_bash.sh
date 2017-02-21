#!/bin/bash
echo "PLEASE TYPE YOUR DOMAIN,OTHERWISE IT WILL BE YA.RU"
domain=ya.ru 
if [ $# -eq 1 ]; then domain=$1;fi
echo "YOUR DOMAIN" $domain
for ip in `dig $domain A +noquestion | grep "IN" | cut -d "A" -f 2`
do 
    echo "DOMAIN IP" $ip
    as=`whois -h whois.cymru.com -v $ip| cut -d "|" -f 1 | tail -1 `
    echo "NUMBER OF AS" $as
    echo
    echo
    whois -h whois.radb.net -- "-i origin" $as | grep -Eo "([0-9.]+){4}/[0-9]+" | head 
done

