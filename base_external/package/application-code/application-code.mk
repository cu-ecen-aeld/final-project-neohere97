
##############################################################
#
# APPLICATION-CODE
#
##############################################################

#TODO: Fill up the contents below in order to reference your assignment 3 git contents
APPLICATION_CODE_VERSION = 'deb5d5cf38643800b819b1118e1e38eabcbea985'
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
APPLICATION_CODE_SITE = 'git@github.com:cu-ecen-aeld/final-project-GautamaGandhi.git'
APPLICATION_CODE_SITE_METHOD = git
APPLICATION_CODE_GIT_SUBMODULES = YES

define APPLICATION_CODE_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/gpio_test/libgpiod all
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/gpio_test/pigpio all
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/client-render/rpi_ws281x all
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/capture_server all
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/gpio_test/bare-metal-Linux all
endef

# TODO add your writer, finder and finder-test utilities/scripts to the installation steps below
define APPLICATION_CODE_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/gpio_test/pigpio/pigpio-test $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(@D)/gpio_test/libgpiod/libgpiod-test $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(@D)/client-render/rpi_ws281x/client $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(@D)/capture_server/server $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(@D)/gpio_test/bare-metal-Linux/pwm_test $(TARGET_DIR)/usr/bin/
endef

$(eval $(generic-package))