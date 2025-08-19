#!/bin/bash

# Neko
neko_download="$(curl -s https://api.github.com/repos/nosignals/neko/releases/latest | jq -r '.assets[] | select(.name | endswith("_23_05.ipk")) | .browser_download_url')"

# Nikki
nikki_package_file="nikki_aarch64_cortex-a53-openwrt-24.10.tar.gz"
nikki_package_download="https://github.com/nikkinikki-org/OpenWrt-nikki/releases/latest/download/nikki_aarch64_cortex-a53-openwrt-24.10.tar.gz"

# Openclash
openclash_api="https://api.github.com/repos/vernesong/OpenClash/releases"
openclash_file="luci-app-openclash"
openclash_download="$(curl -s ${openclash_api} | grep "browser_download_url" | grep -oE "https.*${openclash_file}.*.ipk" | head -n 1)"

# Passwall
passwall_file="luci-app-passwall"
passwall_download="https://github.com/xiaorouji/openwrt-passwall/releases/latest/download/luci-24.10_luci-app-passwall_25.8.5-r2_all.ipk"
passwall_package_file="passwall_packages_ipk_aarch64_cortex-a53.zip"
passwall_package_download="https://github.com/xiaorouji/openwrt-passwall/releases/latest/download/passwall_packages_ipk_aarch64_cortex-a53.zip"

if [ "$1" == "neko" ]; then
    echo "Downloading Neko packages"
    wget ${neko_download} -nv -P packages
elif [ "$1" == "nikki" ]; then
    echo "Downloading Nikki packages"
    wget ${nikki_package_download} -nv -P packages
    tar --wildcards -xf "packages/${nikki_package_file}" -C packages "*.ipk"
elif [ "$1" == "openclash" ]; then
    echo "Downloading Openclash packages"
    wget ${openclash_download} -nv -P packages
elif [ "$1" == "passwall" ]; then
    echo "Downloading Passwall packages"
    wget "${passwall_download}" -nv -P packages
    wget "${passwall_package_download}" -nv -P packages
    unzip -qq "packages/${passwall_package_file}" -d packages
elif [ "$1" == "neko-nikki-openclash-passwall" ]; then
    echo "Downloading Neko packages"
    wget ${neko_download} -nv -P packages
    echo "Downloading Nikki packages"
    wget ${nikki_package_download} -nv -P packages
    tar --wildcards -xf "packages/${nikki_package_file}" -C packages "*.ipk"
    echo "Downloading Openclash packages"
    wget ${openclash_download} -nv -P packages
    echo "Downloading Passwall packages"
    wget "${passwall_download}" -nv -P packages
    wget "${passwall_package_download}" -nv -P packages
    unzip -qq "packages/${passwall_package_file}" -d packages
fi
if [ "$?" -ne 0 ]; then
    echo "Error: Download or extraction failed."
    exit 1
else
    echo "Download complete."
fi
