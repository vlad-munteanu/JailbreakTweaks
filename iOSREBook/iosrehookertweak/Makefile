INSTALL_TARGET_PROCESSES = iOSRETargetApp

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = iOSREHookerTweak

iOSREHookerTweak_FILES = Tweak.x
iOSREHookerTweak_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk

after-intall:: 
	install.exec "killall -9 iOSRETargetApp"
