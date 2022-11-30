
##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################

#TODO: Fill up the contents below in order to reference your assignment 3 git contents
APPLICATION_CODE_VERSION = 'b4c59671afb0274463387064e504d43ab0e71d8a'
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
APPLICATION_CODE_SITE = 'git@github.com:cu-ecen-aeld/final-project-GautamaGandhi.git'
APPLICATION_CODE_SITE_METHOD = git
APPLICATION_CODE_GIT_SUBMODULES = YES
# APPLICATION_CODE_MODULE_SUBDIRS = aesd-char-driver/

define APPLICATION_CODE_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/gpio_test/libgpiod all
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/gpio_test/pigpio all
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/client-render/rpi_ws281x all
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/capture_server all
endef

# TODO add your writer, finder and finder-test utilities/scripts to the installation steps below
define APPLICATION_CODE_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/gpio_test/pigpio/pigpio-test $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(@D)/gpio_test/libgpiod/libgpiod-test $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(@D)/client-render/rpi_ws281x/test $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(@D)/capture_server/server $(TARGET_DIR)/usr/bin/
endef

$(eval $(generic-package))