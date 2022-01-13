#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
sed -i 's/192.168.1.1/192.168.1.2/g' package/base-files/files/bin/config_generate

# HelloWorld
git clone https://github.com/jerrykuku/lua-maxminddb.git package/lean/lua-maxminddb
git clone https://github.com/jerrykuku/luci-app-vssr.git package/lean/luci-app-vssr

# Argon
rm -rf package/lean/luci-theme-argon
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/lean/luci-theme-argon
git clone https://github.com/jerrykuku/luci-app-argon-config.git package/lean/luci-app-argon-config

# OpenClash
mkdir package/OpenClash
cd package/OpenClash
git init
git remote add origin https://github.com/vernesong/OpenClash.git
git config core.sparsecheckout true
echo "luci-app-openclash" >> .git/info/sparse-checkout
git pull --depth 1 origin master
mv luci-app-openclash ../
cd ../..
rm -rf package/OpenClash

# MosDNS
mkdir package/openwrt-mos
cd package/openwrt-mos
git init
git remote add origin https://github.com/QiuSimons/openwrt-mos.git
git config core.sparsecheckout true
echo "luci-app-mosdns" >> .git/info/sparse-checkout
echo "mosdns" >> .git/info/sparse-checkout
git pull --depth 1 origin master
mv luci-app-mosdns ../
mv mosdns ../
cd ../..
rm -rf package/openwrt-mos

