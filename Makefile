#PO = wifidog
#by walkingsky

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/package.mk

PKG_NAME:=luci-wifidog
PKG_VERSION:=1.0
PKG_RELEASE:=1

USELOCAL:=1
ifeq ($(USELOCAL),1)
  PKG_VERSION:=0.11.1
else
  PKG_VERSION:=0.11.1
endif

PKG_BUILD_DIR:=$(BUILD_DIR)/luci/applications/luci-wifidog

### Templates ###
define Package/luci/install/template
	$(CP) -a $(BUILD_DIR)/luci/$(2)/dist/* $(1)/ -R
	$(CP) -a $(BUILD_DIR)/luci/$(2)/ipkg/* $(1)/CONTROL/ 2>/dev/null || true
endef


define Package/luci-app-wifidog  
  SECTION:=luci
  CATEGORY:=LuCI
  SUBMENU:=3. Applications
  $(call Package/luci/webtemplate)
  DEPENDS+=+wifidog +luci
  TITLE:=wifidog luci control interface(by walkingsky)
endef

define Build/Prepare
	mkdir -p 	$(PKG_BUILD_DIR)
	cp -a src/* $(PKG_BUILD_DIR)
endef

define Package/luci-app-wifidog/install
        $(call Package/luci/install/template,$(1),applications/luci-wifidog)
endef
ifneq ($(CONFIG_PACKAGE_luci-app-wifidog),)
        PKG_SELECTED_MODULES+=applications/luci-wifidog
endif
$(eval $(call BuildPackage,luci-app-wifidog))
