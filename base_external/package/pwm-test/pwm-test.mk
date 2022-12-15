
##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################

#TODO: Fill up the contents below in order to reference your assignment 3 git contents
PWM_TEST_VERSION = '0fce0329ec540cf10c2dceecd5b852f9b35c5273'
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
PWM_TEST_SITE = 'git@github.com:GautamaGandhi/rpi_ws281x.git'
PWM_TEST_SITE_METHOD = git
PWM_TEST_GIT_SUBMODULES = YES

define PWM_TEST_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
endef

# TODO add your writer, finder and finder-test utilities/scripts to the installation steps below
define PWM_TEST_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/pwm $(TARGET_DIR)/usr/bin/
endef

$(eval $(generic-package))