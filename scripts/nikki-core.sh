#!/bin/bash

echo "Start Nikki Core Download !"
echo "Current Path: $PWD"

base_url="https://github.com/MetaCubeX/meta-rules-dat/releases/download/latest/"

geoip_dat_url="${base_url}/geoip.dat"
geoip_mmdb_url="${base_url}/geoip.metadb"
geosite_dat_url="${base_url}/geosite.dat"

nikki_dir="/etc/nikki"

mkdir -p $nikki_dir

geoip_dat_path="${nikki_dir}/run/geoip.dat"
geoip_mmdb_path="${nikki_dir}/run/geoip.metadb"
geosite_dat_path="${nikki_dir}/run/geosite.dat"

if [ -f ${geoip_dat_path} ]; then
    echo "[ $(date +%T) ] - GeoIP Dat OK"
else
    echo "[ $(date +%T) ] - Downloading GeoIP Dat"
    wget -q --no-check-certificate -O ${geoip_dat_path} ${geoip_dat_url}
fi

if [ -f ${geoip_mmdb_path} ]; then
    echo "[ $(date +%T) ] - GeoIP MMDB OK"
else
    echo "[ $(date +%T) ] - Downloading GeoIP MMDB"
    wget -q --no-check-certificate -O ${geoip_mmdb_path} ${geoip_mmdb_url}
fi

if [ -f ${geoip_mmdb_path} ]; then
    echo "[ $(date +%T) ] - GeoSite Dat OK"
else
    echo "[ $(date +%T) ] - Downloading GeoSite Dat"
    wget -q --no-check-certificate -O ${geosite_dat_path} ${geosite_dat_url}
fi
