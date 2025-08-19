#!/bin/bash

# Profile info
make info

# Main configuration name
PROFILE=""
PACKAGES=""

# Base packages
PACKAGES+=" -dnsmasq dnsmasq-full cgi-io libiwinfo libiwinfo-data libiwinfo-lua liblua \
luci-base luci-lib-base luci-lib-ip luci-lib-jsonc luci-lib-nixio luci-mod-admin-full \
cpusage ttyd dmesg kmod-tun luci-lib-ipkg \
zram-swap adb parted losetup resize2fs luci luci-ssl block-mount htop bash curl wget-ssl \
tar unzip unrar gzip jq luci-app-ttyd nano httping screen openssh-sftp-server \
liblucihttp liblucihttp-lua libubus-lua lua luci-app-firewall luci-app-opkg \
ca-bundle ca-certificates luci-compat coreutils-sleep fontconfig coreutils-whoami file lolcat \
luci-base luci-lib-base luci-lib-ip luci-lib-jsonc luci-lib-nixio luci-mod-admin-full \
luci-mod-network luci-mod-status luci-mod-system luci-proto-ipv6 luci-proto-ppp \
luci-theme-bootstrap px5g-wolfssl rpcd rpcd-mod-file rpcd-mod-iwinfo rpcd-mod-luci \
rpcd-mod-rrdns uhttpd uhttpd-mod-ubus coreutils coreutils-base64 coreutils-nohup coreutils-stty libc coreutils-stat \
ip-full libuci-lua microsocks resolveip ipset iptables iptables-legacy \
iptables-mod-iprange iptables-mod-socket iptables-mod-tproxy kmod-ipt-nat luci-lua-runtime zoneinfo-asia zoneinfo-core \
perl perlbase-base perlbase-bytes perlbase-class perlbase-config perlbase-cwd perlbase-dynaloader perlbase-errno perlbase-essential perlbase-fcntl perlbase-file \
perlbase-filehandle perlbase-i18n perlbase-integer perlbase-io perlbase-list perlbase-locale perlbase-params perlbase-posix \
perlbase-re perlbase-scalar perlbase-selectsaver perlbase-socket perlbase-symbol perlbase-tie perlbase-time perlbase-unicore perlbase-utf8 perlbase-xsloader"

# Modem and UsbLAN Driver
PACKAGES+=" kmod-usb-net-rtl8150 kmod-usb-net-rtl8152 kmod-usb-net-asix kmod-usb-net-asix-ax88179"
PACKAGES+=" kmod-mii kmod-usb-net kmod-usb-wdm kmod-usb-net-qmi-wwan uqmi luci-proto-qmi \
kmod-usb-net-cdc-ether kmod-usb-serial-option kmod-usb-serial kmod-usb-serial-wwan qmi-utils \
kmod-usb-serial-qualcomm kmod-usb-acm kmod-usb-net-cdc-ncm kmod-usb-net-cdc-mbim umbim \
modemmanager  modemmanager-rpcd luci-proto-modemmanager libmbim libqmi usbutils luci-proto-mbim luci-proto-ncm \
kmod-usb-net-huawei-cdc-ncm kmod-usb-net-cdc-ether kmod-usb-net-rndis kmod-usb-net-sierrawireless kmod-usb-ohci kmod-usb-serial-sierrawireless \
kmod-usb-uhci kmod-usb2 kmod-usb-ehci kmod-usb-net-ipheth usbmuxd libusbmuxd-utils libimobiledevice-utils usb-modeswitch kmod-nls-utf8 mbim-utils xmm-modem \
kmod-phy-broadcom kmod-phylib-broadcom kmod-tg3 libusb-1.0-0"

# Modem Tools
# PACKAGES+=" modeminfo luci-app-modeminfo atinout modemband luci-app-modemband luci-app-mmconfig sms-tool luci-app-sms-tool-js luci-app-lite-watchdog luci-app-3ginfo-lite picocom minicom"

# Tunnel option
NEKO="bash kmod-tun php8 php8-cgi luci-app-neko"
NIKKI="ca-bundle curl ip-full kmod-inet-diag kmod-nft-tproxy kmod-tun luci-app-nikki luci-i18n-nikki-zh-cn nikki"
OPENCLASH="coreutils-nohup bash dnsmasq-full curl ca-certificates ipset ip-full libcap libcap-bin ruby ruby-yaml kmod-tun kmod-inet-diag unzip kmod-nft-tproxy luci-compat luci luci-base luci-app-openclash"
PASSWALL="chinadns-ng resolveip dns2socks ipt2socks microsocks tcping xray-core xray-plugin luci-app-passwall"

if [ "$2" == "neko" ]; then
    PACKAGES+=" $NEKO"
elif [ "$2" == "nikki" ]; then
    PACKAGES+=" $NIKKI"
elif [ "$2" == "openclash" ]; then
    PACKAGES+=" $OPENCLASH"
elif [ "$2" == "passwall" ]; then
    PACKAGES+=" $PASSWALL"
elif [ "$2" == "neko-nikki-openclash-passwall" ]; then
    PACKAGES+=" $NEKO"
    PACKAGES+=" $NIKKI"
    PACKAGES+=" $OPENCLASH"
    PACKAGES+=" $PASSWALL"
fi

# Adguardhome
PACKAGES+=" luci-app-adguardhome ca-certificates ca-bundle tar unzip bind-tools"

# NAS and Hard disk tools
PACKAGES+=" luci-app-diskman luci-app-hd-idle luci-app-disks-info smartmontools kmod-usb-storage kmod-usb-storage-uas ntfs-3g"
PACKAGES+=" samba4-server luci-app-samba4 aria2 ariang luci-app-aria2 luci-app-tinyfm"

# Bandwidth And Network Monitoring
PACKAGES+=" internet-detector luci-app-internet-detector internet-detector-mod-modem-restart nlbwmon luci-app-nlbwmon vnstat2 vnstati2 luci-app-vnstat2 luci-app-netmonitor"

# Speedtest
PACKAGES+=" librespeed-go python3-speedtest-cli iperf3 luci-app-netspeedtest"

# Base64 Encode Decode
PACKAGES+=" luci-app-base64"

# Argon Theme
PACKAGES+=" luci-theme-argon luci-app-argon-config"

# Alpha Theme
PACKAGES+=" luci-theme-alpha luci-app-alpha-config"

# Material Theme
PACKAGES+=" luci-theme-material"

# RTA Theme
PACKAGES+=" luci-theme-rta luci-app-rtaconfig"

# PHP8
PACKAGES+=" php8 php8-fastcgi php8-fpm php8-mod-session php8-mod-ctype php8-mod-fileinfo php8-mod-zip php8-mod-iconv php8-mod-mbstring"

# More
PACKAGES+=" luci-app-irqbalance luci-app-log-viewer luci-app-poweroff luci-app-ramfree"

# Misc and some custom .ipk files
if [ "${RELEASE_BRANCH%:*}" == "openwrt" ]; then
    PACKAGES+=" luci-app-temp-status luci-app-cpu-status-mini"
fi

if [ "$1" == "rpi-4" ]; then
    PACKAGES+=" kmod-i2c-bcm2835 i2c-tools kmod-i2c-core kmod-i2c-gpio luci-app-oled"
elif [ "$ARCH_2" == "x86_64" ]; then
    PACKAGES+=" kmod-iwlwifi iw-full pciutils"
fi

if [ "$TYPE" == "AMLOGIC" ]; then
    PACKAGES+=" luci-app-amlogic ath9k-htc-firmware btrfs-progs hostapd hostapd-utils kmod-ath kmod-ath9k kmod-ath9k-common kmod-ath9k-htc kmod-cfg80211 kmod-crypto-acompress kmod-crypto-crc32c kmod-crypto-hash kmod-fs-btrfs kmod-mac80211 wireless-tools wpa-cli wpa-supplicant"
    EXCLUDED+=" -procd-ujail"
fi

# Exclude package (must use - before packages name)
EXCLUDED=""
if [ "${RELEASE_BRANCH%:*}" == "openwrt" ]; then
    EXCLUDED+=" -dnsmasq"
elif [ "${RELEASE_BRANCH%:*}" == "immortalwrt" ]; then
    EXCLUDED+=" -dnsmasq -automount -libustream-openssl -default-settings-chn -luci-i18n-base-zh-cn"
    if [ "$ARCH_2" == "x86_64" ]; then
        EXCLUDED+=" -kmod-usb-net-rtl8152-vendor"
    fi
fi

# Custom Files
FILES="files"

# Disable service
# DISABLED_SERVICES="AdGuardHome"

# Start build firmware
make image PROFILE="$1" PACKAGES="$PACKAGES $EXCLUDED" FILES="$FILES" DISABLED_SERVICES="$DISABLED_SERVICES"
