#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Modify default theme
sed -i 's|luci-theme-bootstrap|luci-theme-argon|g' feeds/luci/collections/luci-light/Makefile

# Modify smb
#sed -i 's|445|25445|g' feeds/packages/net/samba4/files/samba.init
#sed -i 's|invalid users = root|#invalid users = root|g' feeds/packages/net/samba4/files/smb.conf.template
#sed -i 's|null passwords = yes|#null passwords = yes|g' feeds/packages/net/samba4/files/smb.conf.template
#sed -i 's|#dns proxy = No|dns proxy = No|g' feeds/packages/net/samba4/files/smb.conf.template

# Modify hostname
sed -i 's|LEDE|NanoPC-T6|g' package/base-files/files/bin/config_generate

# Change ash to bash
sed -i 's|/bin/ash|/bin/bash|g' package/base-files/files/etc/passwd

# Change default root password
sed -i 's|root:::0:99999:7:::|root:$1$CVCXbKh9$r5w6F.rsYfy3Uszzi7TuD0:8210:0:99999:7:::|g' package/base-files/files/etc/shadow

# Modify argon pages
sed -i '23,33d' package/feeds/luci/luci-theme-argon/luasrc/view/themes/argon/footer.htm
sed -i '24,26d' package/feeds/luci/luci-theme-argon/luasrc/view/themes/argon/footer_login.htm

# Change ttyd from services to system
sed -i 's|/services/|/system/|g' feeds/luci/applications/luci-app-ttyd/root/usr/share/luci/menu.d/luci-app-ttyd.json

# Change from services to nas
#sed -i 's|/services/|/nas/|g' feeds/luci/applications/luci-app-samba4/root/usr/share/luci/menu.d/luci-app-samba4.json
sed -i 's|/services/|/nas/|g' feeds/luci/applications/luci-app-ksmbd/root/usr/share/luci/menu.d/luci-app-ksmbd.json

