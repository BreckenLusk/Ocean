ARCHS = armv7 arm64
GO_EASY_ON_ME = 1
DEBUG = NO

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Ocean
Ocean_FILES = $(wildcard *.xm *.m)
Ocean_FRAMEWORKS = UIKit MessageUI WebKit
Ocean_LDFLAGS += -lCSColorPicker -lCSPreferencesProvider
Ocean_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 Sileo"
SUBPROJECTS += oceanprefs
include $(THEOS_MAKE_PATH)/aggregate.mk
