luci-wifdog
===========

wifidog的luci管理界面，基于openwert的可编译package

注意：里面的脚本要注意文件格式及可执行属性，到了linux系统里要用chmod及dos2unix命令作适当调整
/etc/init.d/wifidog
/etc/uci-defaults/luci-wifidog


编译是sdk环境中要有wifidog选项：
1.将该包放到 package目录，可以在根目录或任意子目录中
2.执行make menuconfig，在LuCI -》3. Applications-》luci-app-wifidog 找到该包，勾选上
3.编译整个skd，或者 make package/luci-wifidog/install 单独编译



