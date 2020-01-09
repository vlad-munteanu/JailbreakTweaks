include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = PreferenceDemoPreferences

PreferenceDemoPreferences_FILES = XXXRootListController.m XXXRootListController.m
PreferenceDemoPreferences_INSTALL_PATH = /Library/PreferenceBundles
PreferenceDemoPreferences_FRAMEWORKS = UIKit
PreferenceDemoPreferences_PRIVATE_FRAMEWORKS = Preferences
PreferenceDemoPreferences_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/PreferenceDemoPreferences.plist$(ECHO_END)
