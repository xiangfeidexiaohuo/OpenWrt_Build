#!/bin/bash
#=================================================
# DIY script
# jsjson@163.com 
#=================================================
##链接
ln -s -f ../../../feeds/xiangfeidexiaohuo/k3/k3screenctrl package/feeds/xiangfeidexiaohuo/k3screenctrl
rm -rf package/feeds/packages/smartdns
ln -s -f ../../../feeds/xiangfeidexiaohuo/smartdns package/feeds/xiangfeidexiaohuo/smartdns            

rm -rf package/feeds/packages/aria2
rm -rf package/feeds/packages/ariang
ln -s -f ../../../feeds/xiangfeidexiaohuo/aria2-op/aria2 package/feeds/xiangfeidexiaohuo/aria2
ln -s -f ../../../feeds/xiangfeidexiaohuo/aria2-op/ariang package/feeds/xiangfeidexiaohuo/ariang


##补充汉化       
cp -f ./feeds/xiangfeidexiaohuo/files/udpxy.lua ./feeds/luci/applications/luci-app-udpxy/luasrc/model/cbi
cp -f ./feeds/xiangfeidexiaohuo/files/mwan3.po ./feeds/luci/applications/luci-app-mwan3/po/zh-cn
              
 ##配置ip等
sed -i 's|^TARGET_|# TARGET_|g; s|# TARGET_DEVICES += phicomm-k3|TARGET_DEVICES += phicomm-k3| ; s|# TARGET_DEVICES += phicomm_k3|TARGET_DEVICES += phicomm_k3|' target/linux/bcm53xx/image/Makefile
sed -i 's/192.168.1.1/192.168.2.1/g' package/base-files/files/bin/config_generate

##更改主机名
sed -i "s/hostname='OpenWrt'/hostname='AE86'/g" package/base-files/files/bin/config_generate

##取消bootstrap为默认主题
sed -i '/set luci.main.mediaurlbase=\/luci-static\/bootstrap/d' feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap
sed -i 's/luci-theme-bootstrap/luci-theme-argon-18.06/g' feeds/luci/collections/luci/Makefile
sed -i 's/luci-theme-bootstrap/luci-theme-argon-18.06/g' feeds/luci/collections/luci-nginx/Makefile

##清除登录密码
#sed -i 's/$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.//g' package/lean/default-settings/files/zzz-default-settings

##加入作者信息
sed -i "s/DISTRIB_REVISION='*.*'/DISTRIB_REVISION='By YaoDao $(date +%Y%m%d)'/g" package/lean/default-settings/files/zzz-default-settings



##FQ全部调到VPN菜单
sed -i 's/services/vpn/g' package/feeds/helloworld/luci-app-ssr-plus/luasrc/controller/*.lua
sed -i 's/services/vpn/g' package/feeds/helloworld/luci-app-ssr-plus/luasrc/model/cbi/shadowsocksr/*.lua
sed -i 's/services/vpn/g' package/feeds/helloworld/luci-app-ssr-plus/luasrc/view/shadowsocksr/*.htm

sed -i 's/services/vpn/g' package/feeds/passwall/luci-app-passwall/luasrc/controller/*.lua
sed -i 's/services/vpn/g' package/feeds/passwall/luci-app-passwall/luasrc/model/cbi/passwall/api/*.lua
sed -i 's/services/vpn/g' package/feeds/passwall/luci-app-passwall/luasrc/model/cbi/passwall/client/*.lua
sed -i 's/services/vpn/g' package/feeds/passwall/luci-app-passwall/luasrc/model/cbi/passwall/server/*.lua
sed -i 's/services/vpn/g' package/feeds/passwall/luci-app-passwall/luasrc/view/passwall/app_update/*.htm
sed -i 's/services/vpn/g' package/feeds/passwall/luci-app-passwall/luasrc/view/passwall/global/*.htm
sed -i 's/services/vpn/g' package/feeds/passwall/luci-app-passwall/luasrc/view/passwall/haproxy/*.htm
sed -i 's/services/vpn/g' package/feeds/passwall/luci-app-passwall/luasrc/view/passwall/log/*.htm
sed -i 's/services/vpn/g' package/feeds/passwall/luci-app-passwall/luasrc/view/passwall/node_list/*.htm
sed -i 's/services/vpn/g' package/feeds/passwall/luci-app-passwall/luasrc/view/passwall/rule/*.htm
sed -i 's/services/vpn/g' package/feeds/passwall/luci-app-passwall/luasrc/view/passwall/server/*.htm

sed -i 's/services/vpn/g' package/feeds/xiangfeidexiaohuo/luci-app-vssr/luasrc/controller/*.lua
sed -i 's/services/vpn/g' package/feeds/xiangfeidexiaohuo/luci-app-vssr/luasrc/model/cbi/vssr/*.lua
sed -i 's/services/vpn/g' package/feeds/xiangfeidexiaohuo/luci-app-vssr/luasrc/view/vssr/*.htm

sed -i 's/services/vpn/g' package/lean/luci-app-openclash/luasrc/controller/*.lua
sed -i 's/services/vpn/g' package/lean/luci-app-openclash/luasrc/*.lua
sed -i 's/services/vpn/g' package/lean/luci-app-openclash/luasrc/model/cbi/openclash/*.lua
sed -i 's/services/vpn/g' package/lean/luci-app-openclash/luasrc/view/openclash/*.htm

