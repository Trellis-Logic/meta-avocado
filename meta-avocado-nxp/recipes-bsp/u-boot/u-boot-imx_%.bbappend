FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}/envs:"

SRC_URI:append:class-target = " \
  file://avocado.cfg \
  file://env-mmc.cfg \
"

MKENVIMAGE_EXTRA_ARGS = "-r"

UBOOT_DEFCONFIG = "${@'${UBOOT_CONFIG}'.split((',', 1)[0])}"

do_configure:append:class-target () {
  cat ${WORKDIR}/avocado.cfg >> ${S}/configs/${UBOOT_DEFCONFIG}
  cat ${WORKDIR}/env-mmc.cfg >> ${S}/configs/${UBOOT_DEFCONFIG}
}

require recipes-bsp/u-boot/u-boot-env.inc
