luci-wifdog
===========

wifidog的luci管理界面，基于openwert的可编译package

注意：里面的脚本要注意文件格式及可执行属性，到了linux系统里要用chmod及dos2unix命令作适当调整  
/etc/init.d/wifidog  
/etc/uci-defaults/luci-wifidog


编译是sdk环境中要有wifidog选项：
1. 将该包放到 package目录，可以在根目录或任意子目录中。
2. 执行make menuconfig，在LuCI -》3. Applications-》luci-app-wifidog 找到该包，勾选上。
3. 编译整个skd，或者 make package/luci-wifidog/install 单独编译。

---
## 使用方法 for wifidog v1.3.0

首先需要安装wifidog
```bash
opkg update
opkg install wifidog
```


拷贝各文件到相应文件夹中替换原文件, __注意：__  
/etc/uci-defaults 不需要拷贝，之前的作者写的我也不知道有什么用.  
/etc/init.d/wifidog 替换源文件， 并使用 chmod +x wifidog 增加可执行权限.

在LUCI中就可以看见出现wifidog配置菜单了，填写相应参数，保存+应用;  
LUCI -> System -> Startup  找到Wiifidog 启用之，重启路由器即可自动执行脚本运行wifidog，并生效配置。
