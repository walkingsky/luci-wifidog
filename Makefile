#PO = wifidog
#by walkingsky

include $(TOPDIR)/rules.mk

PKG_NAME:=luci-wifidog
PKG_VERSION:=1.0
PKG_RELEASE:=1

define Package/luci-wifidog  
  SECTION:=luci
  CATEGORY:=LuCI
  SUBMENU:=3. Applications
  $(call Package/luci/webtemplate)
  DEPENDS+=+wifidog +luci
  TITLE:=wifidog luci control interface(by walkingsky)
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
endef

define Package/luci-wifidog/install
    $(INSTALL_DIR) $(1)/etc/config	
	$(CP) ./files/etc/config/* $(1)/etc/config/
	$(INSTALL_DIR) $(1)/etc/init.d	
	$(INSTALL_BIN)./files/etc/init.d/* $(1)/etc/init.d/
	$(INSTALL_DIR) $(1)/etc/uci-defaults	
	$(INSTALL_BIN) ./files/etc/uci-defaults/* $(1)/etc/uci-defaults/
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) ./files/usr/sbin/* $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) ./files/usr/lib/* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,luci-wifidog))
