DEBUG=0
INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = ModuleViews

ModuleViews_FILES = Tweak.xm
ModuleViews_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk

internal-stage:: 
	mkdir -p "$(THEOS_STAGING_DIR)/Library/Application Support/ModuleViews.bundle"
	cp Resources/* "$(THEOS_STAGING_DIR)/Library/Application Support/ModuleViews.bundle/"

