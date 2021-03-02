#!/bin/bash

OLD_TXT=$(grep -oP "[a-zA-Z0-9\-]{43}" /etc/bind/db.{domain})
NEW_TXT=$(grep -oP "[a-zA-Z0-9\-]{43}" certbot.log)

cp -r /etc/bind/db.{domain} /etc/bind/db.{domain}.bak
sed -i "s/$OLD_TXT/$NEW_TXT/g" /etc/bind/db.{domain}

service bind9 restart

