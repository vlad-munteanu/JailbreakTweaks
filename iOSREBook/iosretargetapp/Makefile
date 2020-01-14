
include $(THEOS)/makefiles/common.mk

APPLICATION_NAME = iOSRETargetApp

iOSRETargetApp_FILES = main.m Chp4AppDelegate.m Chp4RootViewController.mm
iOSRETargetApp_FRAMEWORKS = UIKit CoreGraphics
iOSRETargetApp_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/application.mk

after-install::
	install.exec "killall \"iOSRETargetApp\"" || true
	install.exec "su mobile -c uicache"
