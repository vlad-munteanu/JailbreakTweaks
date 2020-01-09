INSTALL_TARGET_PROCESSES = SpringBoard
PROJECT_CFLAGS = -DUSE_THEOS
include $(THEOS)/makefiles/common.mk

TWEAK_NAME = PreferenceDemo

PreferenceDemo_FILES = Tweak.x
PreferenceDemo_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += preferencedemopreferences
include $(THEOS_MAKE_PATH)/aggregate.mk
