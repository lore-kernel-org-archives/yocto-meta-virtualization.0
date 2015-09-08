Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1A9BAE00C62; Tue,  8 Sep 2015 07:04:01 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.160.169 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yk0-f169.google.com (mail-yk0-f169.google.com
	[209.85.160.169])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8E171E00B5A
	for <meta-virtualization@yoctoproject.org>;
	Tue,  8 Sep 2015 07:03:58 -0700 (PDT)
Received: by ykdu9 with SMTP id u9so44217728ykd.2
	for <meta-virtualization@yoctoproject.org>;
	Tue, 08 Sep 2015 07:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=QGn2gn+bJ7nxY1oDES44tIuEhAV7SL4kQwk2/mDnlw0=;
	b=uAlRGFn5E9tnPJW9m3PqQ6+UO5JkDahdicaXV1QyzxihKnB9jBVb6V01m8rHhmIR9r
	a1WS21kcsCoDo6Xsv4ulzsjOFCgS1ArkC41HEUrv9siHKhvNgbgSeIJ/ag7FNk0ucjat
	NKIjKUXon7FmYgeI4YW99Gt7lup3/yEDJbHzbGVKjGVlPZUThkyhHe5PUlrCqIV59vpd
	QlxXRK+re4o9bOidkvxSrENS2YJMlm7x1D5gRBHLd5+cu3bJoNww1yYwH4NIIDV3pJoW
	+IWiK680wPJshRD6+cp7YlnyLrfDKMfDGZq2QYmueNxRd5Xc7jkTfCSQbkME6szfKKZW
	E5Bg==
MIME-Version: 1.0
X-Received: by 10.13.215.200 with SMTP id z191mr11023076ywd.123.1441721035393; 
	Tue, 08 Sep 2015 07:03:55 -0700 (PDT)
Received: by 10.129.34.212 with HTTP; Tue, 8 Sep 2015 07:03:55 -0700 (PDT)
In-Reply-To: <1441695081-24118-1-git-send-email-zhe.he@windriver.com>
References: <1441695081-24118-1-git-send-email-zhe.he@windriver.com>
Date: Tue, 8 Sep 2015 10:03:55 -0400
Message-ID: <CADkTA4PUZh-PWpZp4ffkfdxw3TrRJ+KiqMK+rJxFv582xh-GcA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: He Zhe <zhe.he@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 1/1] lxc: Uprev 1.1.2 to 1.1.3
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Tue, 08 Sep 2015 14:04:01 -0000
Content-Type: text/plain; charset=UTF-8

merged.

Bruce

On Tue, Sep 8, 2015 at 2:51 AM,  <zhe.he@windriver.com> wrote:
> From: He Zhe <zhe.he@windriver.com>
>
> Uprev to 1.1.3
> Remove Generate-lxc-restore-net-properly.patch since related code
> has been removed.
>
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
>  recipes-containers/lxc/lxc_1.1.2.bb | 150 ------------------------------------
>  recipes-containers/lxc/lxc_1.1.3.bb | 149 +++++++++++++++++++++++++++++++++++
>  2 files changed, 149 insertions(+), 150 deletions(-)
>  delete mode 100644 recipes-containers/lxc/lxc_1.1.2.bb
>  create mode 100644 recipes-containers/lxc/lxc_1.1.3.bb
>
> diff --git a/recipes-containers/lxc/lxc_1.1.2.bb b/recipes-containers/lxc/lxc_1.1.2.bb
> deleted file mode 100644
> index a20b8e4..0000000
> --- a/recipes-containers/lxc/lxc_1.1.2.bb
> +++ /dev/null
> @@ -1,150 +0,0 @@
> -DESCRIPTION = "lxc aims to use these new functionnalities to provide an userspace container object"
> -SECTION = "console/utils"
> -LICENSE = "GPLv2"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
> -PRIORITY = "optional"
> -DEPENDS = "libxml2 libcap"
> -RDEPENDS_${PN} = " \
> -               rsync \
> -               gzip \
> -               libcap-bin \
> -               bridge-utils \
> -               dnsmasq \
> -               perl-module-strict \
> -               perl-module-getopt-long \
> -               perl-module-vars \
> -               perl-module-warnings-register \
> -               perl-module-exporter \
> -               perl-module-constant \
> -               perl-module-overload \
> -               perl-module-exporter-heavy \
> -"
> -RDEPENDS_${PN}-ptest += "file make"
> -
> -SRC_URI = "http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
> -       file://lxc-1.0.0-disable-udhcp-from-busybox-template.patch \
> -       file://runtest.patch \
> -       file://run-ptest \
> -       file://automake-ensure-VPATH-builds-correctly.patch \
> -       file://add-lxc.rebootsignal.patch \
> -       file://document-lxc.rebootsignal.patch \
> -       file://lxc-busybox-use-lxc.rebootsignal-SIGTERM.patch \
> -       file://lxc-fix-B-S.patch \
> -       file://lxc-busybox-add-OpenSSH-support.patch \
> -       file://make-some-OpenSSH-tools-optional.patch \
> -       file://Generate-lxc-restore-net-properly.patch \
> -       file://lxc-doc-upgrade-to-use-docbook-3.1-DTD.patch \
> -       "
> -
> -SRC_URI[md5sum] = "3ebadacf5fe8bfe689fd7a09812b682c"
> -SRC_URI[sha256sum] = "34ba517ffd7b38a14e5d12d56a4928b78602d56311d5f47c3ef90f4e714b9604"
> -
> -S = "${WORKDIR}/${BPN}-${PV}"
> -
> -# Let's not configure for the host distro.
> -#
> -PTEST_CONF = "${@base_contains('DISTRO_FEATURES', 'ptest', '--enable-tests', '', d)}"
> -EXTRA_OECONF += "--with-distro=${DISTRO} ${PTEST_CONF}"
> -
> -EXTRA_OECONF += "--with-init-script=\
> -${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'sysvinit,', '', d)}\
> -${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
> -
> -PACKAGECONFIG ??= "templates \
> -    ${@base_contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \
> -"
> -PACKAGECONFIG[doc] = "--enable-doc --enable-api-docs,--disable-doc --disable-api-docs,,"
> -PACKAGECONFIG[rpath] = "--enable-rpath,--disable-rpath,,"
> -PACKAGECONFIG[apparmour] = "--enable-apparmor,--disable-apparmor,apparmor,apparmor"
> -PACKAGECONFIG[templates] = ",,, ${PN}-templates"
> -PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux,libselinux"
> -PACKAGECONFIG[seccomp] ="--enable-seccomp,--disable-seccomp,libseccomp,libseccomp"
> -
> -inherit autotools pkgconfig ptest update-rc.d systemd
> -
> -SYSTEMD_PACKAGES = "${PN}-setup"
> -SYSTEMD_SERVICE_${PN}-setup = "lxc.service"
> -SYSTEMD_AUTO_ENABLE_${PN}-setup = "disable"
> -
> -INITSCRIPT_PACKAGES = "${PN}-setup"
> -INITSCRIPT_NAME_{PN}-setup = "lxc"
> -INITSCRIPT_PARAMS_${PN}-setup = "${OS_DEFAULT_INITSCRIPT_PARAMS}"
> -
> -FILES_${PN}-doc = "${mandir} ${infodir}"
> -# For LXC the docdir only contains example configuration files and should be included in the lxc package
> -FILES_${PN} += "${docdir}"
> -FILES_${PN}-dbg += "${libexecdir}/lxc/.debug"
> -PACKAGES =+ "${PN}-templates ${PN}-setup ${PN}-networking"
> -FILES_${PN}-templates += "${datadir}/lxc/templates"
> -RDEPENDS_${PN}-templates += "bash"
> -
> -ALLOW_EMPTY_${PN}-networking = "1"
> -
> -FILES_${PN}-setup += "/etc/tmpfiles.d"
> -FILES_${PN}-setup += "/lib/systemd/system"
> -FILES_${PN}-setup += "/usr/lib/systemd/system"
> -FILES_${PN}-setup += "/etc/init.d"
> -
> -PRIVATE_LIBS_${PN}-ptest = "liblxc.so.1"
> -
> -do_install_append() {
> -       # The /var/cache/lxc directory created by the Makefile
> -       # is wiped out in volatile, we need to create this at boot.
> -       rm -rf ${D}${localstatedir}/cache
> -       install -d ${D}${sysconfdir}/default/volatiles
> -       echo "d root root 0755 ${localstatedir}/cache/lxc none" \
> -            > ${D}${sysconfdir}/default/volatiles/99_lxc
> -
> -       for i in `grep -l "#! */bin/bash" ${D}${datadir}/lxc/hooks/*`; do \
> -           sed -e 's|#! */bin/bash|#!/bin/sh|' -i $i; done
> -
> -       if ${@base_contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
> -           install -d ${D}${sysconfdir}/init.d
> -           install -m 755 config/init/sysvinit/lxc* ${D}${sysconfdir}/init.d
> -       fi
> -}
> -
> -EXTRA_OEMAKE += "TEST_DIR=${D}${PTEST_PATH}/src/tests"
> -
> -do_install_ptest() {
> -       oe_runmake -C src/tests install-ptest
> -}
> -
> -pkg_postinst_${PN}() {
> -       if [ -z "$D" ] && [ -e /etc/init.d/populate-volatile.sh ] ; then
> -               /etc/init.d/populate-volatile.sh update
> -       fi
> -}
> -
> -pkg_postinst_${PN}-networking() {
> -       if [ "x$D" != "x" ]; then
> -               exit 1
> -       fi
> -
> -       # setup for our bridge
> -        echo "lxc.network.link=lxcbr0" >> ${sysconfdir}/lxc/default.conf
> -
> -cat >> /etc/network/interfaces << EOF
> -
> -auto lxcbr0
> -iface lxcbr0 inet dhcp
> -       bridge_ports eth0
> -       bridge_fd 0
> -       bridge_maxwait 0
> -EOF
> -
> -cat<<EOF>/etc/network/if-pre-up.d/lxcbr0
> -#! /bin/sh
> -
> -if test "x\$IFACE" = xlxcbr0 ; then
> -        brctl show |grep lxcbr0 > /dev/null 2>/dev/null
> -        if [ \$? != 0 ] ; then
> -                brctl addbr lxcbr0
> -                brctl addif lxcbr0 eth0
> -                ip addr flush eth0
> -                ifconfig eth0 up
> -        fi
> -fi
> -EOF
> -chmod 755 /etc/network/if-pre-up.d/lxcbr0
> -}
> diff --git a/recipes-containers/lxc/lxc_1.1.3.bb b/recipes-containers/lxc/lxc_1.1.3.bb
> new file mode 100644
> index 0000000..d1e80c4
> --- /dev/null
> +++ b/recipes-containers/lxc/lxc_1.1.3.bb
> @@ -0,0 +1,149 @@
> +DESCRIPTION = "lxc aims to use these new functionnalities to provide an userspace container object"
> +SECTION = "console/utils"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
> +PRIORITY = "optional"
> +DEPENDS = "libxml2 libcap"
> +RDEPENDS_${PN} = " \
> +               rsync \
> +               gzip \
> +               libcap-bin \
> +               bridge-utils \
> +               dnsmasq \
> +               perl-module-strict \
> +               perl-module-getopt-long \
> +               perl-module-vars \
> +               perl-module-warnings-register \
> +               perl-module-exporter \
> +               perl-module-constant \
> +               perl-module-overload \
> +               perl-module-exporter-heavy \
> +"
> +RDEPENDS_${PN}-ptest += "file make"
> +
> +SRC_URI = "http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
> +       file://lxc-1.0.0-disable-udhcp-from-busybox-template.patch \
> +       file://runtest.patch \
> +       file://run-ptest \
> +       file://automake-ensure-VPATH-builds-correctly.patch \
> +       file://add-lxc.rebootsignal.patch \
> +       file://document-lxc.rebootsignal.patch \
> +       file://lxc-busybox-use-lxc.rebootsignal-SIGTERM.patch \
> +       file://lxc-fix-B-S.patch \
> +       file://lxc-busybox-add-OpenSSH-support.patch \
> +       file://make-some-OpenSSH-tools-optional.patch \
> +       file://lxc-doc-upgrade-to-use-docbook-3.1-DTD.patch \
> +       "
> +
> +SRC_URI[md5sum] = "197abb5a28ab0b689c737eb1951023fb"
> +SRC_URI[sha256sum] = "933b87f773ea6213c912fcd25b8f24d66fb66d285b80797dac530a8b94b7d1ad"
> +
> +S = "${WORKDIR}/${BPN}-${PV}"
> +
> +# Let's not configure for the host distro.
> +#
> +PTEST_CONF = "${@base_contains('DISTRO_FEATURES', 'ptest', '--enable-tests', '', d)}"
> +EXTRA_OECONF += "--with-distro=${DISTRO} ${PTEST_CONF}"
> +
> +EXTRA_OECONF += "--with-init-script=\
> +${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'sysvinit,', '', d)}\
> +${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
> +
> +PACKAGECONFIG ??= "templates \
> +    ${@base_contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \
> +"
> +PACKAGECONFIG[doc] = "--enable-doc --enable-api-docs,--disable-doc --disable-api-docs,,"
> +PACKAGECONFIG[rpath] = "--enable-rpath,--disable-rpath,,"
> +PACKAGECONFIG[apparmour] = "--enable-apparmor,--disable-apparmor,apparmor,apparmor"
> +PACKAGECONFIG[templates] = ",,, ${PN}-templates"
> +PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux,libselinux"
> +PACKAGECONFIG[seccomp] ="--enable-seccomp,--disable-seccomp,libseccomp,libseccomp"
> +
> +inherit autotools pkgconfig ptest update-rc.d systemd
> +
> +SYSTEMD_PACKAGES = "${PN}-setup"
> +SYSTEMD_SERVICE_${PN}-setup = "lxc.service"
> +SYSTEMD_AUTO_ENABLE_${PN}-setup = "disable"
> +
> +INITSCRIPT_PACKAGES = "${PN}-setup"
> +INITSCRIPT_NAME_{PN}-setup = "lxc"
> +INITSCRIPT_PARAMS_${PN}-setup = "${OS_DEFAULT_INITSCRIPT_PARAMS}"
> +
> +FILES_${PN}-doc = "${mandir} ${infodir}"
> +# For LXC the docdir only contains example configuration files and should be included in the lxc package
> +FILES_${PN} += "${docdir}"
> +FILES_${PN}-dbg += "${libexecdir}/lxc/.debug"
> +PACKAGES =+ "${PN}-templates ${PN}-setup ${PN}-networking"
> +FILES_${PN}-templates += "${datadir}/lxc/templates"
> +RDEPENDS_${PN}-templates += "bash"
> +
> +ALLOW_EMPTY_${PN}-networking = "1"
> +
> +FILES_${PN}-setup += "/etc/tmpfiles.d"
> +FILES_${PN}-setup += "/lib/systemd/system"
> +FILES_${PN}-setup += "/usr/lib/systemd/system"
> +FILES_${PN}-setup += "/etc/init.d"
> +
> +PRIVATE_LIBS_${PN}-ptest = "liblxc.so.1"
> +
> +do_install_append() {
> +       # The /var/cache/lxc directory created by the Makefile
> +       # is wiped out in volatile, we need to create this at boot.
> +       rm -rf ${D}${localstatedir}/cache
> +       install -d ${D}${sysconfdir}/default/volatiles
> +       echo "d root root 0755 ${localstatedir}/cache/lxc none" \
> +            > ${D}${sysconfdir}/default/volatiles/99_lxc
> +
> +       for i in `grep -l "#! */bin/bash" ${D}${datadir}/lxc/hooks/*`; do \
> +           sed -e 's|#! */bin/bash|#!/bin/sh|' -i $i; done
> +
> +       if ${@base_contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
> +           install -d ${D}${sysconfdir}/init.d
> +           install -m 755 config/init/sysvinit/lxc* ${D}${sysconfdir}/init.d
> +       fi
> +}
> +
> +EXTRA_OEMAKE += "TEST_DIR=${D}${PTEST_PATH}/src/tests"
> +
> +do_install_ptest() {
> +       oe_runmake -C src/tests install-ptest
> +}
> +
> +pkg_postinst_${PN}() {
> +       if [ -z "$D" ] && [ -e /etc/init.d/populate-volatile.sh ] ; then
> +               /etc/init.d/populate-volatile.sh update
> +       fi
> +}
> +
> +pkg_postinst_${PN}-networking() {
> +       if [ "x$D" != "x" ]; then
> +               exit 1
> +       fi
> +
> +       # setup for our bridge
> +        echo "lxc.network.link=lxcbr0" >> ${sysconfdir}/lxc/default.conf
> +
> +cat >> /etc/network/interfaces << EOF
> +
> +auto lxcbr0
> +iface lxcbr0 inet dhcp
> +       bridge_ports eth0
> +       bridge_fd 0
> +       bridge_maxwait 0
> +EOF
> +
> +cat<<EOF>/etc/network/if-pre-up.d/lxcbr0
> +#! /bin/sh
> +
> +if test "x\$IFACE" = xlxcbr0 ; then
> +        brctl show |grep lxcbr0 > /dev/null 2>/dev/null
> +        if [ \$? != 0 ] ; then
> +                brctl addbr lxcbr0
> +                brctl addif lxcbr0 eth0
> +                ip addr flush eth0
> +                ifconfig eth0 up
> +        fi
> +fi
> +EOF
> +chmod 755 /etc/network/if-pre-up.d/lxcbr0
> +}
> --
> 1.9.1
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

