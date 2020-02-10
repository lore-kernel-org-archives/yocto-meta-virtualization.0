Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.17464.1581311311216918045
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 09 Feb 2020 21:08:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=caWbbE3U;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: christopher.w.clark@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 165F5E01713; Sun,  9 Feb 2020 21:08:31 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: 
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.215.182 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      (christopher.w.clark[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3BED1E016B8
	for <meta-virtualization@yoctoproject.org>; Sun,  9 Feb 2020 21:08:27 -0800 (PST)
Received: by mail-pg1-f182.google.com with SMTP id b35so3223639pgm.13
        for <meta-virtualization@yoctoproject.org>; Sun, 09 Feb 2020 21:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=dnEVf9wYk8f63FARwxePeO+7jtx2c5sa5ljk6GB2uWw=;
        b=caWbbE3Udz2tmatxXmCWpjun6u7Ugj8x9ssVE6jk8ylwje9tmdUTtx6B5XVe54Yb3w
         dJMxXbN48s5oWIi4OPnU9MRZDMqWtWsFphcfSDLfU+0CYtRjDR4+ORI55Uqn1QbFRruE
         rS20DJr7PSLuM6/pEdVqyX/ZXjnYhjMxqybc3rDYg1clasno1zHzUoU9IBF4+u8wESHM
         pHY7oQkRSlFBHEX+mEo4ybpBz42ENigHEiRoro52roEPg/r4qoLTeVlOKIV71bwFHoDl
         0X4mPUyYmYCHEgmwoX9/OjSEV4Q6d1OrG5Qk0d0VKfUncbqST8tydu1ZXVoIpm73VxWQ
         TAOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=dnEVf9wYk8f63FARwxePeO+7jtx2c5sa5ljk6GB2uWw=;
        b=TXGduuixWUzfalIuGuWDiX3uxnpOyu9ATfKdinwG6ajLZqx0Jyv0OR4UCS207jVD+7
         DwZ4SIOflo2bhfmItxikh/fpmsT1jw/GEHcGeSCLaQAdmnqiQXoySBH+NSV/xtAEoAsZ
         L5di3GTZLTqv/MC6RBKvyyh0PzscVl9OJkmHGO49Sk+9BXa8eCmKsSt9ZsujiMtJNmhe
         CMQj2fAdZl8BA9DcvLSdiSN114odTJFEqH2UaXVFCOJ9iJRIw2FSzFHnOEiRvWJSopfS
         V4RaYx80tA+Yi+u/OURb5/AqFQIj4vizlD85kLzW2SUY8KgYuIdWUOUGSWwdrF28Veag
         fKIQ==
X-Gm-Message-State: APjAAAViB6cysBsFQHeLTgigo8BZEvGMfbdzjtMVS3J9QNMXX6STX96f
	0R/0007ItcGHvDaJMi5jNIxdZIqs
X-Google-Smtp-Source: APXvYqzAAW1TZyFTEWlF4v5xcRRt6LR1uHQO0vBMYI41XZcC2+mxBfSzbZmc5zhMmlN74DDqr63bRQ==
X-Received: by 2002:a63:9257:: with SMTP id s23mr12971908pgn.0.1581311305683;
        Sun, 09 Feb 2020 21:08:25 -0800 (PST)
Received: from desktop.ice.pyrology.org (static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
        by smtp.gmail.com with ESMTPSA id 70sm10921120pgd.28.2020.02.09.21.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2020 21:08:24 -0800 (PST)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	Christopher Clark <christopher.w.clark@gmail.com>,
	cardoe@gentoo.org,
	Rich Persaud <persaur@gmail.com>,
	Daniel Smith <dpsmith@apertussolutions.com>,
	Jason Andryuk <jandryuk@gmail.com>,
	Eric Chanudet <eric.chanudet@gmail.com>
Subject: [meta-virtualization][PATCH 07/16] xen: separate recipes for hypervisor and tools; switch to git as source
Date: Sun,  9 Feb 2020 21:07:45 -0800
Message-Id: <20200210050754.3534-11-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200210050754.3534-1-christopher.w.clark@gmail.com>
References: <20200210050754.3534-1-christopher.w.clark@gmail.com>

From: Christopher Clark <christopher.w.clark@gmail.com>

This change changes the names of many packages produced: the
xen-tools recipe now builds packages previous built by the xen
recipe, so the package prefix changes from "xen-" to "xen-tools-".
A temporary bbappend is provided for qemu to ease the transition.

Multiple motivations for recipe separation:
- improves efficiency of incremental build and development
- supports building the hypervisor and tools with different toolchains
  and for different architectures

Switch to using a git recipe on the Xen stable branch:
- enables easier tracking of critical XSA security updates applied
  upstream by just advancing SRCREV along the branch
Revision has been set to the tip of the stable-4.12 branch, which
has the one XSA-312 patch applied on top of RELEASE-4.12.2.

The recipe refactor externalizes the block tap components, to enable optional
building of blktap in a separate recipe outside xen-tools, as per OpenXT.

xenstored is made a virtual package to support switching between
alternative implementations (several exist).

Update xen-image-minimal to install the xen-tools package, which
replaces what was previously xen-base.

Determine the flask policy filename, which is Xen-version specific,
using the same method as the Xen build system.

qemu: update PACKAGECONFIG[xen] for xen package renaming: allows builds
to continue correctly in the meantime while openembedded core and poky
are updated.

OpenXT ticket reference: OXT-1694

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
---
 recipes-devtools/qemu/qemu_%.bbappend        |   1 +
 recipes-extended/images/xen-image-minimal.bb |   2 +-
 recipes-extended/xen/xen-blktap.inc          |  76 ++
 recipes-extended/xen/xen-hypervisor.inc      |  94 +++
 recipes-extended/xen/xen-tools.inc           | 743 ++++++++++++++++
 recipes-extended/xen/xen-tools_git.bb        |   3 +
 recipes-extended/xen/xen-version.inc         |  15 +
 recipes-extended/xen/xen.inc                 | 842 +------------------
 recipes-extended/xen/xen_4.12.2.bb           |  12 -
 recipes-extended/xen/xen_git.bb              |  19 +-
 10 files changed, 941 insertions(+), 866 deletions(-)
 create mode 100644 recipes-devtools/qemu/qemu_%.bbappend
 create mode 100644 recipes-extended/xen/xen-blktap.inc
 create mode 100644 recipes-extended/xen/xen-hypervisor.inc
 create mode 100644 recipes-extended/xen/xen-tools.inc
 create mode 100644 recipes-extended/xen/xen-tools_git.bb
 create mode 100644 recipes-extended/xen/xen-version.inc
 delete mode 100644 recipes-extended/xen/xen_4.12.2.bb

diff --git a/recipes-devtools/qemu/qemu_%.bbappend b/recipes-devtools/qemu/qemu_%.bbappend
new file mode 100644
index 0000000..150f92b
--- /dev/null
+++ b/recipes-devtools/qemu/qemu_%.bbappend
@@ -0,0 +1 @@
+PACKAGECONFIG[xen] = "--enable-xen,--disable-xen,xen-tools,xen-tools-libxenstore xen-tools-libxenctrl xen-tools-libxenguest"
diff --git a/recipes-extended/images/xen-image-minimal.bb b/recipes-extended/images/xen-image-minimal.bb
index c39d378..63a1086 100644
--- a/recipes-extended/images/xen-image-minimal.bb
+++ b/recipes-extended/images/xen-image-minimal.bb
@@ -12,7 +12,7 @@ IMAGE_INSTALL += " \
     kernel-module-xen-netback \
     ${@bb.utils.contains('MACHINE_FEATURES', 'pci', "${XEN_PCIBACK_MODULE}", '', d)} \
     kernel-module-xen-wdt \
-    xen-base \
+    xen-tools \
     qemu \
     "
 
diff --git a/recipes-extended/xen/xen-blktap.inc b/recipes-extended/xen/xen-blktap.inc
new file mode 100644
index 0000000..5f385dd
--- /dev/null
+++ b/recipes-extended/xen/xen-blktap.inc
@@ -0,0 +1,76 @@
+# The Xen block tap components are packaged separately here to support
+# the option to build them in a separate recipe from xen-tools.
+
+BLKTAP_PACKAGES ?= " \
+    ${PN}-blktap \
+    ${PN}-libblktap \
+    ${PN}-libblktapctl \
+    ${PN}-libblktapctl-dev \
+    ${PN}-libblktap-dev \
+    ${PN}-libvhd \
+    ${PN}-libvhd-dev \
+    ${PN}-blktap-staticdev \
+    "
+
+BLKTAP_PROVIDES ?= " \
+    virtual/blktap \
+    virtual/libblktap \
+    virtual/libblktapctl \
+    virtual/libvhd \
+    "
+
+BLKTAP_RRECOMMENDS ?= " \
+    virtual/blktap \
+    virtual/libblktap \
+    virtual/libblktapctl \
+    virtual/libvhd \
+    "
+
+RPROVIDES_${PN}-blktap = "virtual/blktap"
+RPROVIDES_${PN}-libblktap = "virtual/libblktap"
+RPROVIDES_${PN}-libblktapctl = "virtual/libblktapctl"
+RPROVIDES_${PN}-libvhd = "virtual/libvhd"
+
+FILES_${PN}-blktap-staticdev += "\
+    ${libdir}/libblktapctl.a \
+    ${libdir}/libvhd.a \
+    ${libdir}/libblktap.a \
+    "
+
+FILES_${PN}-libblktapctl = "${libdir}/libblktapctl.so.*"
+FILES_${PN}-libblktapctl-dev = " \
+    ${libdir}/libblktapctl.so \
+    ${libdir}/pkgconfig/xenblktapctl.pc \
+    ${datadir}/pkgconfig/xenblktapctl.pc \
+    "
+
+FILES_${PN}-libvhd = "${libdir}/libvhd.so.*"
+FILES_${PN}-libvhd-dev = " \
+    ${libdir}/libvhd.so \
+    ${libdir}/pkgconfig/vhd.pc \
+    ${datadir}/pkgconfig/vhd.pc \
+    "
+
+FILES_${PN}-libblktap = "${libdir}/libblktap.so.*"
+FILES_${PN}-libblktap-dev = " \
+    ${libdir}/libblktap.so \
+    ${libdir}/pkgconfig/blktap.pc \
+    ${datadir}/pkgconfig/blktap.pc \
+    "
+
+FILES_${PN}-blktap = "\
+    ${sbindir}/blktapctrl \
+    ${sbindir}/img2qcow \
+    ${sbindir}/lock-util \
+    ${sbindir}/qcow2raw \
+    ${sbindir}/qcow-create \
+    ${sbindir}/tap-ctl \
+    ${sbindir}/tapdisk \
+    ${sbindir}/tapdisk2 \
+    ${sbindir}/tapdisk-client \
+    ${sbindir}/tapdisk-diff \
+    ${sbindir}/tapdisk-stream \
+    ${sbindir}/td-util \
+    ${sbindir}/vhd-update \
+    ${sbindir}/vhd-util \
+    "
diff --git a/recipes-extended/xen/xen-hypervisor.inc b/recipes-extended/xen/xen-hypervisor.inc
new file mode 100644
index 0000000..c0df158
--- /dev/null
+++ b/recipes-extended/xen/xen-hypervisor.inc
@@ -0,0 +1,94 @@
+SUMMARY = "Xen hypervisor"
+DESCRIPTION = "The Xen hypervisor"
+
+# This recipe is for just the Xen hypervisor.
+# Separate recipes are used to build Xen and its components:
+# this allows for varying the target architecture or toolchain used
+# to build the different components. eg. 32-bit tools and a 64-bit hypervisor.
+
+inherit deploy
+
+PACKAGES = " \
+    ${PN} \
+    ${PN}-dbg \
+    ${PN}-efi \
+    "
+
+FILES_${PN} = " \
+    /boot/xen-* \
+    /boot/xen \
+    /boot/xen-*.gz \
+    /boot/xen.gz \
+    /boot/xen-syms-* \
+    "
+
+FILES_${PN}-dbg += "${libdir}/debug/*"
+
+FILES_${PN}-efi = " \
+    /boot/xen.efi \
+    ${exec_prefix}/lib64/efi/xen* \
+    "
+
+do_configure() {
+    do_configure_common
+}
+
+do_compile() {
+    oe_runmake xen
+}
+
+do_install() {
+    oe_runmake DESTDIR="${D}" install-xen
+}
+
+do_deploy() {
+    install -d ${DEPLOYDIR}
+
+    if [ -f ${D}/boot/xen ]; then
+        install -m 0644 ${D}/boot/xen ${DEPLOYDIR}/xen-${MACHINE}
+    fi
+
+    if [ -f ${D}/boot/xen.gz ]; then
+        install -m 0644 ${D}/boot/xen.gz ${DEPLOYDIR}/xen-${MACHINE}.gz
+    fi
+
+    if [ -f ${D}/usr/lib64/efi/xen.efi ]; then
+        install -m 0644 ${D}/usr/lib64/efi/xen.efi ${DEPLOYDIR}/xen-${MACHINE}.efi
+    fi
+}
+
+addtask deploy after do_populate_sysroot
+
+# Enable use of menuconfig directly from bitbake and also within the devshell
+OE_TERMINAL_EXPORTS += "HOST_EXTRACFLAGS HOSTLDFLAGS TERMINFO"
+HOST_EXTRACFLAGS = "${BUILD_CFLAGS} ${BUILD_LDFLAGS}"
+HOSTLDFLAGS = "${BUILD_LDFLAGS}"
+TERMINFO = "${STAGING_DATADIR_NATIVE}/terminfo"
+do_devshell[depends] += "ncurses-native:do_populate_sysroot"
+
+KCONFIG_CONFIG_COMMAND ??= "menuconfig"
+python do_menuconfig() {
+    import shutil
+
+    try:
+        mtime = os.path.getmtime("xen/.config")
+        shutil.copy("xen/.config", "xen/.config.orig")
+    except OSError:
+        mtime = 0
+
+    oe_terminal("${SHELL} -c \"cd xen; XEN_CONFIG_EXPERT=y make %s; if [ \$? -ne 0 ]; then echo 'Command failed.'; printf 'Press any key to continue... '; read r; fi\"" % d.getVar('KCONFIG_CONFIG_COMMAND'),
+        d.getVar('PN') + ' Configuration', d)
+
+    try:
+        newmtime = os.path.getmtime("xen/.config")
+    except OSError:
+        newmtime = 0
+
+    if newmtime > mtime:
+        bb.note("Configuration changed, recompile will be forced")
+        bb.build.write_taint('do_compile', d)
+}
+do_menuconfig[depends] += "ncurses-native:do_populate_sysroot"
+do_menuconfig[nostamp] = "1"
+do_menuconfig[dirs] = "${B}"
+addtask menuconfig after do_configure
diff --git a/recipes-extended/xen/xen-tools.inc b/recipes-extended/xen/xen-tools.inc
new file mode 100644
index 0000000..f37968b
--- /dev/null
+++ b/recipes-extended/xen/xen-tools.inc
@@ -0,0 +1,743 @@
+SUMMARY = "Xen hypervisor tools"
+DESCRIPTION = "Tools and utility software for the Xen hypervisor"
+
+inherit setuptools update-rc.d systemd deploy
+require xen-blktap.inc
+
+RDEPENDS_${PN} = "\
+    bash perl xz \
+    ${PN}-console \
+    ${PN}-libxenguest \
+    ${PN}-libxenlight \
+    ${PN}-libxenvchan \
+    ${PN}-libxenctrl \
+    ${PN}-libxlutil \
+    ${PN}-libxenstat \
+    ${PN}-libxenstore \
+    ${PN}-libfsimage \
+    ${PN}-fsimage \
+    ${PN}-scripts-block \
+    ${PN}-scripts-network \
+    ${PN}-xen-watchdog \
+    ${PN}-xencommons \
+    ${PN}-xendomains \
+    ${PN}-xenstore \
+    virtual/xenstored \
+    ${PN}-xl \
+    "
+
+RDEPENDS_${PN}-dev = ""
+
+RRECOMMENDS_${PN} = " \
+    ${@bb.utils.contains('PACKAGECONFIG', 'externalblktap', '', '${BLKTAP_RRECOMMENDS}', d)} \
+    ${PN}-flask \
+    ${PN}-hvmloader \
+    ${PN}-shim \
+    ${PN}-xenpaging \
+    "
+
+RDEPENDS_${PN}-devd = " \
+    ${PN}-xl \
+    "
+
+RDEPENDS_${PN}-fsimage = " \
+    libext2fs \
+    "
+
+RDEPENDS_${PN}-misc = " \
+    perl \
+    python \
+    "
+
+RDEPENDS_${PN}-python = " \
+    python \
+    "
+
+RDEPENDS_${PN}-pygrub = " \
+    ${PN}-python \
+    "
+
+RDEPENDS_${PN}-remus = " \
+    bash \
+    python \
+    "
+
+RDEPENDS_${PN}-scripts-block = "\
+    bash \
+    ${PN}-scripts-common \
+    ${PN}-volatiles \
+    "
+
+RDEPENDS_${PN}-scripts-common = "bash"
+
+RDEPENDS_${PN}-scripts-network = "\
+    bash \
+    bridge-utils \
+    ${PN}-scripts-common \
+    ${PN}-volatiles \
+    "
+
+RDEPENDS_${PN}-xencommons = "\
+    bash \
+    ${PN}-console \
+    ${PN}-xenstore \
+    virtual/xenstored \
+    ${PN}-xl \
+    ${PN}-scripts-common \
+    "
+
+RDEPENDS_${PN}-xendomains = "\
+    bash \
+    ${PN}-console \
+    ${PN}-scripts-block \
+    ${PN}-scripts-common \
+    virtual/xenstored \
+    "
+
+RDEPENDS_${PN}-xl = "libgcc"
+
+RDEPENDS_${PN}-xentrace = "python"
+
+RDEPENDS_${PN}-xen-watchdog = "bash"
+
+PACKAGES = " \
+    ${PN} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'externalblktap', '', '${BLKTAP_PACKAGES}', d)} \
+    ${PN}-console \
+    ${PN}-cpuid \
+    ${PN}-dbg \
+    ${PN}-dev \
+    ${PN}-devd \
+    ${PN}-doc \
+    ${PN}-flask \
+    ${PN}-flask-tools \
+    ${PN}-fsimage \
+    ${PN}-gdbsx \
+    ${PN}-hvmloader \
+    ${PN}-init-xenstore-dom \
+    ${PN}-kdd \
+    ${PN}-libfsimage \
+    ${PN}-libfsimage-dev \
+    ${PN}-libxencall \
+    ${PN}-libxencall-dev \
+    ${PN}-libxenctrl \
+    ${PN}-libxenctrl-dev \
+    ${PN}-libxendevicemodel \
+    ${PN}-libxendevicemodel-dev \
+    ${PN}-libxenevtchn \
+    ${PN}-libxenevtchn-dev \
+    ${PN}-libxenforeignmemory \
+    ${PN}-libxenforeignmemory-dev \
+    ${PN}-libxengnttab \
+    ${PN}-libxengnttab-dev \
+    ${PN}-libxenguest \
+    ${PN}-libxenguest-dev \
+    ${PN}-libxenlight \
+    ${PN}-libxenlight-dev \
+    ${PN}-libxenstat \
+    ${PN}-libxenstat-dev \
+    ${PN}-libxenstore \
+    ${PN}-libxenstore-dev \
+    ${PN}-libxentoolcore \
+    ${PN}-libxentoolcore-dev \
+    ${PN}-libxentoollog \
+    ${PN}-libxentoollog-dev \
+    ${PN}-libxenvchan \
+    ${PN}-libxenvchan-dev \
+    ${PN}-libxlutil \
+    ${PN}-libxlutil-dev \
+    ${PN}-livepatch \
+    ${PN}-misc \
+    ${PN}-pygrub \
+    ${PN}-python \
+    ${PN}-remus \
+    ${PN}-scripts-block \
+    ${PN}-scripts-common \
+    ${PN}-scripts-network \
+    ${PN}-shim \
+    ${PN}-staticdev \
+    ${PN}-volatiles \
+    ${PN}-xcutils \
+    ${PN}-xencommons \
+    ${PN}-xend \
+    ${PN}-xend-examples \
+    ${PN}-xendomains \
+    ${PN}-xenmon \
+    ${PN}-xenpaging \
+    ${PN}-xenpmd \
+    ${PN}-xenstat \
+    ${PN}-xenstore \
+    ${PN}-xenstored \
+    ${PN}-xentrace \
+    ${PN}-xen-watchdog \
+    ${PN}-xl \
+    ${PN}-xl-examples \
+    ${PN}-xm \
+    ${PN}-xm-examples \
+    "
+
+PROVIDES =+ " \
+    virtual/xenstored \
+    ${@bb.utils.contains('PACKAGECONFIG', 'externalblktap', '', '${BLKTAP_PROVIDES}', d)} \
+    "
+
+# There are multiple implementations of the XenStore daemon, so we use a
+# virtual package to allow for substitution.
+RPROVIDES_${PN}-xenstored = "virtual/xenstored"
+
+FILES_${PN}-dbg += "\
+    ${libdir}/xen/bin/.debug \
+    ${libdir}/python2.7/site-packages/.debug \
+    ${libdir}/python2.7/site-packages/xen/lowlevel/.debug \
+    ${libdir}/fs/xfs/.debug \
+    ${libdir}/fs/ufs/.debug \
+    ${libdir}/fs/ext2fs-lib/.debug \
+    ${libdir}/fs/fat/.debug \
+    ${libdir}/fs/zfs/.debug \
+    ${libdir}/fs/reiserfs/.debug \
+    ${libdir}/fs/iso9660/.debug \
+    ${libdir}/fs/*/.debug \
+    ${sbindir}/.debug \
+    ${libdir}exec/.debug \
+    ${libdir}/xen/libexec/.debug \
+    ${bindir}/.debug \
+    ${libdir}/python2.7/dist-packages/.debug \
+    ${libdir}/python2.7/dist-packages/xen/lowlevel/.debug \
+    "
+
+FILES_${PN}-dev = "\
+    ${includedir} \
+    "
+
+FILES_${PN}-doc = "\
+    ${sysconfdir}/xen/README \
+    ${sysconfdir}/xen/README.incompatibilities \
+    ${datadir}/doc \
+    ${datadir}/man \
+    "
+
+FILES_${PN}-staticdev += "\
+    ${libdir}/libxenguest.a \
+    ${libdir}/libxenlight.a \
+    ${libdir}/libxenvchan.a \
+    ${libdir}/libxenctrl.a \
+    ${libdir}/libxlutil.a \
+    ${libdir}/libxenstat.a \
+    ${libdir}/libxenstore.a \
+    "
+
+FILES_${PN}-libxencall = "${libdir}/libxencall.so.*"
+FILES_${PN}-libxencall-dev = " \
+    ${libdir}/libxencall.so \
+    ${libdir}/pkgconfig/xencall.pc \
+    ${datadir}/pkgconfig/xencall.pc \
+    "
+
+FILES_${PN}-libxenctrl = "${libdir}/libxenctrl.so.*"
+FILES_${PN}-libxenctrl-dev = " \
+    ${libdir}/libxenctrl.so \
+    ${libdir}/pkgconfig/xencontrol.pc \
+    ${datadir}/pkgconfig/xencontrol.pc \
+    "
+
+FILES_${PN}-libxendevicemodel = "${libdir}/libxendevicemodel.so.*"
+FILES_${PN}-libxendevicemodel-dev = " \
+    ${libdir}/libxendevicemodel.so \
+    ${libdir}/pkgconfig/xendevicemodel.pc \
+    ${datadir}/pkgconfig/xendevicemodel.pc \
+    "
+
+FILES_${PN}-libxenevtchn = "${libdir}/libxenevtchn.so.*"
+FILES_${PN}-libxenevtchn-dev = " \
+    ${libdir}/libxenevtchn.so \
+    ${libdir}/pkgconfig/xenevtchn.pc \
+    ${datadir}/pkgconfig/xenevtchn.pc \
+    "
+
+FILES_${PN}-libxenforeignmemory = "${libdir}/libxenforeignmemory.so.*"
+FILES_${PN}-libxenforeignmemory-dev = " \
+    ${libdir}/libxenforeignmemory.so \
+    ${libdir}/pkgconfig/xenforeignmemory.pc \
+    ${datadir}/pkgconfig/xenforeignmemory.pc \
+    "
+
+FILES_${PN}-libxengnttab = "${libdir}/libxengnttab.so.*"
+FILES_${PN}-libxengnttab-dev = " \
+    ${libdir}/libxengnttab.so \
+    ${libdir}/pkgconfig/xengnttab.pc \
+    ${datadir}/pkgconfig/xengnttab.pc \
+    "
+
+FILES_${PN}-libxenguest = "${libdir}/libxenguest.so.*"
+FILES_${PN}-libxenguest-dev = " \
+    ${libdir}/libxenguest.so \
+    ${libdir}/pkgconfig/xenguest.pc \
+    ${datadir}/pkgconfig/xenguest.pc \
+    "
+
+FILES_${PN}-libxenlight = "${libdir}/libxenlight.so.*"
+FILES_${PN}-libxenlight-dev = " \
+    ${libdir}/libxenlight.so \
+    ${libdir}/pkgconfig/xenlight.pc \
+    ${datadir}/pkgconfig/xenlight.pc \
+    "
+
+FILES_${PN}-libxenstat = "${libdir}/libxenstat.so.*"
+FILES_${PN}-libxenstat-dev = " \
+    ${libdir}/libxenstat.so \
+    ${libdir}/pkgconfig/xenstat.pc \
+    ${datadir}/pkgconfig/xenstat.pc \
+    "
+
+FILES_${PN}-libxenstore = "${libdir}/libxenstore.so.*"
+FILES_${PN}-libxenstore-dev = " \
+    ${libdir}/libxenstore.so \
+    ${libdir}/pkgconfig/xenstore.pc \
+    ${datadir}/pkgconfig/xenstore.pc \
+    "
+
+FILES_${PN}-libxentoolcore = "${libdir}/libxentoolcore.so.*"
+FILES_${PN}-libxentoolcore-dev = " \
+    ${libdir}/libxentoolcore.so \
+    ${libdir}/pkgconfig/xentoolcore.pc \
+    ${datadir}/pkgconfig/xentoolcore.pc \
+    "
+
+FILES_${PN}-libxentoollog = "${libdir}/libxentoollog.so.*"
+FILES_${PN}-libxentoollog-dev = " \
+    ${libdir}/libxentoollog.so \
+    ${libdir}/pkgconfig/xentoollog.pc \
+    ${datadir}/pkgconfig/xentoollog.pc \
+    "
+
+FILES_${PN}-libxenvchan = "${libdir}/libxenvchan.so.*"
+FILES_${PN}-libxenvchan-dev = " \
+    ${libdir}/libxenvchan.so \
+    ${libdir}/pkgconfig/xenvchan.pc \
+    ${datadir}/pkgconfig/xenvchan.pc \
+    "
+
+FILES_${PN}-libxlutil = "${libdir}/libxlutil.so.*"
+FILES_${PN}-libxlutil-dev = " \
+    ${libdir}/libxlutil.so \
+    ${libdir}/pkgconfig/xlutil.pc \
+    ${datadir}/pkgconfig/xlutil.pc \
+    "
+FILES_${PN}-libvhd = "${libdir}/libvhd.so.*"
+FILES_${PN}-libvhd-dev = " \
+    ${libdir}/libvhd.so \
+    ${libdir}/pkgconfig/vhd.pc \
+    ${datadir}/pkgconfig/vhd.pc \
+    "
+
+FILES_${PN}-libfsimage = " \
+    ${libdir}/libfsimage.so.* \
+    ${libdir}/libxenfsimage.so.* \
+    "
+
+FILES_${PN}-libfsimage-dev = " \
+    ${libdir}/libfsimage.so \
+    ${libdir}/libxenfsimage.so \
+    ${libdir}/pkgconfig/fsimage.pc \
+    ${datadir}/pkgconfig/fsimage.pc \
+    ${libdir}/pkgconfig/xenfsimage.pc \
+    ${datadir}/pkgconfig/xenfsimage.pc \
+    "
+
+FILES_${PN}-fsimage = " \
+    ${libdir}/fs/*/*fsimage.so \
+    ${libdir}/xenfsimage/*/fsimage.so \
+    "
+
+FILES_${PN}-init-xenstore-dom = "${libdir}/xen/bin/init-xenstore-domain"
+
+FILES_${PN} = "\
+    ${sysconfdir}/xen/auto \
+    ${sysconfdir}/xen/cpupool \
+    ${localstatedir}/xen/dump \
+    "
+
+FILES_${PN}-console = "\
+    ${libdir}/xen/bin/xenconsole \
+    ${sbindir}/xenconsoled \
+    "
+
+FILES_${PN}-cpuid = "\
+    ${bindir}/xen-cpuid \
+    "
+
+FILES_${PN}-devd = "\
+    ${sysconfdir}/init.d/xendriverdomain \
+    ${systemd_unitdir}/system/xendriverdomain.service \
+    "
+
+FILES_${PN}-flask = "\
+    /boot/xenpolicy-* \
+    "
+
+FILES_${PN}-flask-tools = "\
+    ${sbindir}/flask-get-bool \
+    ${sbindir}/flask-getenforce \
+    ${sbindir}/flask-label-pci \
+    ${sbindir}/flask-loadpolicy \
+    ${sbindir}/flask-set-bool \
+    ${sbindir}/flask-setenforce \
+    "
+
+FILES_${PN}-gdbsx = "\
+    ${sbindir}/gdbsx \
+    "
+
+INSANE_SKIP_${PN}-hvmloader = "arch"
+FILES_${PN}-hvmloader = "\
+    ${libdir}/xen/boot/hvmloader \
+    "
+
+FILES_${PN}-kdd = "\
+    ${sbindir}/kdd \
+    ${sbindir}/xen-kdd \
+    "
+
+FILES_${PN}-livepatch += " \
+    ${sbindir}/xen-livepatch \
+    "
+
+FILES_${PN}-misc = "\
+    ${bindir}/xencons \
+    ${bindir}/xencov_split \
+    ${bindir}/xen-detect \
+    ${libdir}/xen/bin/xenpvnetboot \
+    ${libdir}/xen/bin/depriv-fd-checker \
+    ${sbindir}/gtracestat \
+    ${sbindir}/gtraceview \
+    ${sbindir}/xen-bugtool \
+    ${sbindir}/xencov \
+    ${sbindir}/xenperf \
+    ${sbindir}/xenpm \
+    ${sbindir}/xsview \
+    ${sbindir}/xen-diag \
+    ${sbindir}/xen-tmem-list-parse \
+    ${sbindir}/xen-python-path \
+    ${sbindir}/xen-ringwatch \
+    ${sbindir}/xen-hptool \
+    ${sbindir}/xen-hvmcrash \
+    ${sbindir}/xen-hvmctx \
+    ${sbindir}/xenlockprof \
+    ${sbindir}/xen-lowmemd \
+    ${sbindir}/xen-mfndump \
+    ${libdir}/xen/bin/verify-stream-v2 \
+    ${libdir}/xen/bin/convert-legacy-stream \
+    "
+
+FILES_${PN}-pygrub = "\
+    ${bindir}/pygrub \
+    ${libdir}/xen/bin/pygrub \
+    "
+
+FILES_${PN}-python = "\
+    ${libdir}/python2.7 \
+    "
+
+FILES_${PN}-remus = "\
+    ${bindir}/remus \
+    ${sysconfdir}/xen/scripts/remus-netbuf-setup \
+    "
+
+FILES_${PN}-scripts-network = " \
+    ${sysconfdir}/xen/scripts/colo-proxy-setup \
+    ${sysconfdir}/xen/scripts/network-bridge \
+    ${sysconfdir}/xen/scripts/network-nat \
+    ${sysconfdir}/xen/scripts/network-route \
+    ${sysconfdir}/xen/scripts/qemu-ifup \
+    ${sysconfdir}/xen/scripts/vif2 \
+    ${sysconfdir}/xen/scripts/vif-bridge \
+    ${sysconfdir}/xen/scripts/vif-common.sh \
+    ${sysconfdir}/xen/scripts/vif-nat \
+    ${sysconfdir}/xen/scripts/vif-openvswitch \
+    ${sysconfdir}/xen/scripts/vif-route \
+    ${sysconfdir}/xen/scripts/vif-setup \
+    "
+
+FILES_${PN}-scripts-block = " \
+    ${sysconfdir}/xen/scripts/blktap \
+    ${sysconfdir}/xen/scripts/block \
+    ${sysconfdir}/xen/scripts/block-common.sh \
+    ${sysconfdir}/xen/scripts/block-dummy \
+    ${sysconfdir}/xen/scripts/block-enbd \
+    ${sysconfdir}/xen/scripts/block-iscsi \
+    ${sysconfdir}/xen/scripts/block-nbd \
+    ${sysconfdir}/xen/scripts/block-drbd-probe \
+    ${sysconfdir}/xen/scripts/block-tap \
+    ${sysconfdir}/xen/scripts/vscsi \
+    "
+
+FILES_${PN}-scripts-common = " \
+    ${sysconfdir}/xen/scripts/external-device-migrate \
+    ${sysconfdir}/xen/scripts/hotplugpath.sh \
+    ${sysconfdir}/xen/scripts/locking.sh \
+    ${sysconfdir}/xen/scripts/logging.sh \
+    ${sysconfdir}/xen/scripts/xen-hotplug-cleanup \
+    ${sysconfdir}/xen/scripts/xen-hotplug-common.sh \
+    ${sysconfdir}/xen/scripts/xen-network-common.sh \
+    ${sysconfdir}/xen/scripts/xen-script-common.sh \
+    "
+
+INSANE_SKIP_${PN}-shim = "arch"
+FILES_${PN}-shim = " \
+    ${libdir}/xen/boot/xen-shim \
+    "
+
+FILES_${PN}-volatiles = "\
+    ${sysconfdir}/default/volatiles/99_xen \
+    ${sysconfdir}/tmpfiles.d/xen.conf \
+    "
+
+FILES_${PN}-xcutils = "\
+    ${libdir}/xen/bin/lsevtchn \
+    ${libdir}/xen/bin/readnotes \
+    ${libdir}/xen/bin/xc_restore \
+    ${libdir}/xen/bin/xc_save \
+    "
+
+FILES_${PN}-xend-examples = "\
+    ${sysconfdir}/xen/xend-config.sxp \
+    ${sysconfdir}/xen/xend-pci-permissive.sxp \
+    ${sysconfdir}/xen/xend-pci-quirks.sxp \
+    "
+
+FILES_${PN}-xenpaging = "\
+    ${libdir}/xen/bin/xenpaging \
+    ${localstatedir}/lib/xen/xenpaging \
+    "
+
+FILES_${PN}-xenpmd = "\
+    ${sbindir}/xenpmd \
+    "
+
+FILES_${PN}-xenstat = "\
+    ${sbindir}/xentop \
+    "
+
+FILES_${PN}-xenstore = "\
+    ${bindir}/xenstore \
+    ${bindir}/xenstore-chmod \
+    ${bindir}/xenstore-control \
+    ${bindir}/xenstore-exists \
+    ${bindir}/xenstore-list \
+    ${bindir}/xenstore-ls \
+    ${bindir}/xenstore-read \
+    ${bindir}/xenstore-rm \
+    ${bindir}/xenstore-watch \
+    ${bindir}/xenstore-write \
+    "
+
+FILES_${PN}-xenstored = "\
+    ${sbindir}/xenstored \
+    ${localstatedir}/lib/xenstored \
+    "
+
+FILES_${PN}-xentrace = "\
+    ${bindir}/xentrace \
+    ${bindir}/xentrace_format \
+    ${bindir}/xentrace_setsize \
+    ${libdir}/xen/bin/xenctx \
+    ${bindir}/xenalyze \
+    ${sbindir}/xentrace \
+    ${sbindir}/xentrace_setsize \
+    "
+
+FILES_${PN}-xen-watchdog = "\
+    ${sbindir}/xenwatchdogd \
+    ${sysconfdir}/init.d/xen-watchdog \
+    ${systemd_unitdir}/system/xen-watchdog.service \
+    "
+
+FILES_${PN}-xl = "\
+    ${sysconfdir}/bash_completion.d/xl.sh \
+    ${sysconfdir}/xen/xl.conf \
+    ${libdir}/xen/bin/libxl-save-helper \
+    ${sbindir}/xl \
+    ${libdir}/xen/bin/xen-init-dom0 \
+    "
+
+FILES_${PN}-xl-examples = "\
+    ${sysconfdir}/xen/xlexample.hvm \
+    ${sysconfdir}/xen/xlexample.pvlinux \
+    "
+
+FILES_${PN}-xm-examples = "\
+    ${sysconfdir}/xen/xmexample1 \
+    ${sysconfdir}/xen/xmexample2 \
+    ${sysconfdir}/xen/xmexample3 \
+    ${sysconfdir}/xen/xmexample.hvm \
+    ${sysconfdir}/xen/xmexample.hvm-stubdom \
+    ${sysconfdir}/xen/xmexample.nbd \
+    ${sysconfdir}/xen/xmexample.pv-grub \
+    ${sysconfdir}/xen/xmexample.vti \
+    "
+
+FILES_${PN}-xenmon = "\
+    ${sbindir}/xenbaked \
+    ${sbindir}/xentrace_setmask \
+    ${sbindir}/xenmon.py \
+    ${sbindir}/xenmon \
+    "
+
+FILES_${PN}-xm = "\
+    ${sysconfdir}/xen/xm-config.xml \
+    ${datadir}/xen/create.dtd \
+    ${sbindir}/xm \
+    "
+
+FILES_${PN}-xencommons += "\
+    ${sysconfdir}/default/xencommons \
+    ${sysconfdir}/init.d/xencommons \
+    ${sysconfdir}/xen/scripts/launch-xenstore \
+    ${systemd_unitdir}/modules-load.d/xen.conf \
+    ${systemd_unitdir}/system/proc-xen.mount \
+    ${systemd_unitdir}/system/xen-qemu-dom0-disk-backend.service \
+    ${systemd_unitdir}/system/xenconsoled.service \
+    ${systemd_unitdir}/system/xen-init-dom0.service \
+    ${systemd_unitdir}/system/xenstored.service \
+    ${systemd_unitdir}/system/var-lib-xenstored.mount \
+    "
+
+FILES_${PN}-xend += " \
+    ${sysconfdir}/init.d/xend \
+    ${sbindir}/xend \
+    "
+
+FILES_${PN}-xendomains += "\
+    ${libdir}/xen/bin/xendomains \
+    ${sysconfdir}/default/xendomains \
+    ${sysconfdir}/init.d/xendomains \
+    ${sysconfdir}/sysconfig/xendomains \
+    ${systemd_unitdir}/system/xendomains.service \
+    "
+
+INSANE_SKIP_${PN} = "already-stripped"
+
+# configure init.d scripts
+INITSCRIPT_PACKAGES = "${PN}-xend ${PN}-xencommons ${PN}-xen-watchdog ${PN}-xendomains ${PN}-devd"
+INITSCRIPT_NAME_${PN}-xencommons = "xencommons"
+INITSCRIPT_PARAMS_${PN}-xencommons = "defaults 80"
+INITSCRIPT_NAME_${PN}-xen-watchdog = "xen-watchdog"
+INITSCRIPT_PARAMS_${PN}-xen-watchdog = "defaults 81"
+INITSCRIPT_NAME_${PN}-xend = "xend"
+INITSCRIPT_PARAMS_${PN}-xend = "defaults 82"
+INITSCRIPT_NAME_${PN}-xendomains = "xendomains"
+INITSCRIPT_PARAMS_${PN}-xendomains = "defaults 83"
+INITSCRIPT_NAME_${PN}-devd = "xendriverdomain"
+INITSCRIPT_PARAMS_${PN}-devd = "defaults 82"
+
+# systemd packages
+SYSTEMD_PACKAGES = "${PN}-xen-watchdog ${PN}-xencommons ${PN}-xendomains ${PN}-devd"
+SYSTEMD_SERVICE_${PN}-devd = "xendriverdomain.service"
+SYSTEMD_SERVICE_${PN}-xen-watchdog = "xen-watchdog.service"
+SYSTEMD_SERVICE_${PN}-xencommons = " \
+    proc-xen.mount \
+    var-lib-xenstored.mount \
+    xen-qemu-dom0-disk-backend.service \
+    xenconsoled.service \
+    xen-init-dom0.service \
+    xenstored.service \
+    "
+SYSTEMD_SERVICE_${PN}-xendomains = "xendomains.service"
+
+do_configure() {
+    do_configure_common
+}
+
+do_stubs() {
+    # no stubs-32.h in our 64-bit sysroot - hack it into tools/include/gnu
+    if ! test -f ${STAGING_DIR_TARGET}/usr/include/gnu/stubs-32.h ; then
+        if test -f ${STAGING_DIR_TARGET}/usr/include/gnu/stubs-64.h ; then
+            test -d ${S}/tools/include/gnu || mkdir ${S}/tools/include/gnu
+            cat ${STAGING_DIR_TARGET}/usr/include/gnu/stubs-64.h | grep -v stub_bdflush | grep -v stub_getmsg | grep -v stub_putmsg > ${S}/tools/include/gnu/stubs-32.h
+            echo \#define __stub___kernel_cosl >> ${S}/tools/include/gnu/stubs-32.h
+            echo \#define __stub___kernel_sinl >> ${S}/tools/include/gnu/stubs-32.h
+            echo \#define __stub___kernel_tanl >> ${S}/tools/include/gnu/stubs-32.h
+        fi
+    fi
+}
+
+addtask stubs after do_configure before do_compile
+
+do_compile() {
+    oe_runmake tools
+}
+
+do_install() {
+    oe_runmake DESTDIR="${D}" install-tools
+
+    # remove installed volatiles
+    rm -rf ${D}${base_prefix}/run \
+        ${D}${localstatedir}/run \
+        ${D}${localstatedir}/lock \
+        ${D}${localstatedir}/log \
+        ${D}${localstatedir}/volatile \
+        ${D}${localstatedir}/lib/xen
+
+    VOLATILE_DIRS=" \
+        ${base_prefix}/run/xenstored \
+        ${base_prefix}/run/xend \
+        ${base_prefix}/run/xend/boot \
+        ${base_prefix}/run/xen \
+        ${localstatedir}/log/xen \
+        ${localstatedir}/lock/xen \
+        ${localstatedir}/lock/subsys \
+        ${localstatedir}/lib/xen \
+        "
+
+    # install volatiles using populate_volatiles mechanism
+    install -d ${D}${sysconfdir}/default/volatiles
+    for i in $VOLATILE_DIRS; do
+        echo "d root root 0755 $i none"  >> ${D}${sysconfdir}/default/volatiles/99_xen
+    done
+
+    # workaround for xendomains script which searchs sysconfig if directory exists
+    install -d ${D}${sysconfdir}/sysconfig
+    ln -sf ${sysconfdir}/default/xendomains ${D}${sysconfdir}/sysconfig/xendomains
+
+    # systemd
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+        # install volatiles using systemd tmpfiles.d
+        install -d ${D}${sysconfdir}/tmpfiles.d
+        for i in $VOLATILE_DIRS; do
+            echo "d $i 0755 root root - -"  >> ${D}${sysconfdir}/tmpfiles.d/xen.conf
+        done
+    fi
+
+    # fixup default path to qemu-system-i386
+    sed -i 's#\(test -z "$QEMU_XEN" && QEMU_XEN=\).*$#\1"/usr/bin/qemu-system-i386"#' ${D}/etc/init.d/xencommons
+
+    if [ -e ${D}${systemd_unitdir}/system/xen-qemu-dom0-disk-backend.service ]; then
+        sed -i 's#ExecStart=.*qemu-system-i386\(.*\)$#ExecStart=/usr/bin/qemu-system-i386\1#' \
+            ${D}${systemd_unitdir}/system/xen-qemu-dom0-disk-backend.service
+    fi
+}
+
+pkg_postinst_${PN}-volatiles() {
+    if [ -z "$D" ]; then
+        if command -v systemd-tmpfiles >/dev/null; then
+            systemd-tmpfiles --create ${sysconfdir}/tmpfiles.d/xen.conf
+        elif [ -e ${sysconfdir}/init.d/populate-volatile.sh ]; then
+            ${sysconfdir}/init.d/populate-volatile.sh update
+        fi
+    fi
+}
+
+do_deploy() {
+    XEN_FULLVERSION=$(oe_runmake -C ${S}/xen xenversion --no-print-directory)
+    FLASK_POLICY_FILE="xenpolicy-${XEN_FULLVERSION}"
+
+    install -d ${DEPLOYDIR}
+
+    # Install the flask policy in the deploy directory if it exists
+    if [ -f ${D}/boot/${FLASK_POLICY_FILE} ]; then
+        install -m 0644 ${D}/boot/${FLASK_POLICY_FILE} ${DEPLOYDIR}
+        ln -sf ${FLASK_POLICY_FILE} ${DEPLOYDIR}/xenpolicy-${MACHINE}
+    fi
+}
+
+addtask deploy after do_populate_sysroot
diff --git a/recipes-extended/xen/xen-tools_git.bb b/recipes-extended/xen/xen-tools_git.bb
new file mode 100644
index 0000000..636e92a
--- /dev/null
+++ b/recipes-extended/xen/xen-tools_git.bb
@@ -0,0 +1,3 @@
+require xen.inc
+require xen-version.inc
+require xen-tools.inc
diff --git a/recipes-extended/xen/xen-version.inc b/recipes-extended/xen/xen-version.inc
new file mode 100644
index 0000000..77d17ed
--- /dev/null
+++ b/recipes-extended/xen/xen-version.inc
@@ -0,0 +1,15 @@
+SRCREV ?= "a5fcafbfbee55261853fba07149c1c795f2baf58"
+
+XEN_REL ?= "4.12"
+XEN_BRANCH ?= "stable-4.12"
+
+SRC_URI = " \
+    git://xenbits.xen.org/xen.git;branch=${XEN_BRANCH} \
+    file://0001-python-pygrub-pass-DISTUTILS-xen.4.12.patch \
+    "
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=bbb4b1bdc2c3b6743da3c39d03249095"
+
+PV = "${XEN_REL}+git${SRCPV}"
+
+S = "${WORKDIR}/git"
diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index fa0044b..c0636bc 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -1,13 +1,12 @@
-DESCRIPTION = "Xen hypervisor"
 HOMEPAGE = "http://xen.org"
 LICENSE = "GPLv2"
 SECTION = "console/tools"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=bbb4b1bdc2c3b6743da3c39d03249095"
+FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
 
 COMPATIBLE_HOST = '(x86_64.*).*-linux|aarch64.*-linux|arm-.*-linux-gnueabi'
 
-inherit autotools-brokensep setuptools3 update-rc.d systemd deploy
+inherit autotools-brokensep
 
 require xen-arch.inc
 
@@ -17,12 +16,11 @@ PACKAGECONFIG ??= " \
     ${@bb.utils.contains('XEN_TARGET_ARCH', 'x86_64', 'hvm', '', d)} \
     "
 
-FLASK_POLICY_FILE ?= "xenpolicy-${PV}"
-
 PACKAGECONFIG[sdl] = "--enable-sdl,--disable-sdl,virtual/libsdl,"
 PACKAGECONFIG[xsm] = "--enable-xsmpolicy,--disable-xsmpolicy,checkpolicy-native,"
 PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd,systemd,"
 PACKAGECONFIG[hvm] = "--with-system-seabios="/usr/share/firmware/bios.bin",--disable-seabios,seabios ipxe vgabios,"
+PACKAGECONFIG[externalblktap] = ",,,"
 
 DEPENDS = " \
     ${@bb.utils.contains('XEN_TARGET_ARCH', 'x86_64', 'dev86-native', '', d)} \
@@ -57,699 +55,6 @@ DEPENDS = " \
     gnu-efi \
     "
 
-# inherit setuptools adds python to RDEPENDS, override it
-RDEPENDS_${PN} = ""
-
-RDEPENDS_${PN}-base = "\
-    bash perl xz \
-    ${PN}-console \
-    ${PN}-libxenguest \
-    ${PN}-libxenlight \
-    ${PN}-libxenvchan \
-    ${PN}-libxenctrl \
-    ${PN}-libxlutil \
-    ${PN}-libxenstat \
-    ${PN}-libxenstore \
-    ${PN}-libfsimage \
-    ${PN}-fsimage \
-    ${PN}-scripts-block \
-    ${PN}-scripts-network \
-    ${PN}-xen-watchdog \
-    ${PN}-xencommons \
-    ${PN}-xendomains \
-    ${PN}-xenstore \
-    ${PN}-xenstored \
-    ${PN}-xl \
-    "
-
-RDEPENDS_${PN}-dev = ""
-
-RRECOMMENDS_${PN}-base = " \
-    ${PN}-blktap \
-    ${PN}-libblktap \
-    ${PN}-libblktapctl \
-    ${PN}-libvhd \
-    ${PN}-flask \
-    ${PN}-hvmloader \
-    ${PN}-shim \
-    ${PN}-xenpaging \
-    "
-
-RDEPENDS_${PN}-devd = " \
-    ${PN}-xl \
-    "
-
-RDEPENDS_${PN}-fsimage = " \
-    libext2fs \
-    "
-
-RDEPENDS_${PN}-misc = " \
-    perl \
-    python \
-    "
-
-RDEPENDS_${PN}-python = " \
-    python \
-    "
-
-RDEPENDS_${PN}-pygrub = " \
-    ${PN}-python \
-    "
-
-RDEPENDS_${PN}-remus = " \
-    bash \
-    python \
-    "
-
-RDEPENDS_${PN}-scripts-block = "\
-    bash \
-    ${PN}-scripts-common \
-    ${PN}-volatiles \
-    "
-
-RDEPENDS_${PN}-scripts-common = "bash"
-
-RDEPENDS_${PN}-scripts-network = "\
-    bash \
-    bridge-utils \
-    ${PN}-scripts-common \
-    ${PN}-volatiles \
-    "
-
-RDEPENDS_${PN}-xencommons = "\
-    bash \
-    ${PN}-console \
-    ${PN}-xenstore \
-    ${PN}-xenstored \
-    ${PN}-xl \
-    ${PN}-scripts-common \
-    "
-
-RDEPENDS_${PN}-xendomains = "\
-    bash \
-    ${PN}-console \
-    ${PN}-scripts-block \
-    ${PN}-scripts-common \
-    ${PN}-xenstored \
-    "
-
-RDEPENDS_${PN}-xl = "libgcc"
-
-RDEPENDS_${PN}-xentrace = "python"
-
-RDEPENDS_${PN}-xen-watchdog = "bash"
-
-PACKAGES = "\
-    ${PN}-base \
-    ${PN}-blktap \
-    ${PN}-console \
-    ${PN}-cpuid \
-    ${PN}-dbg \
-    ${PN}-dev \
-    ${PN}-devd \
-    ${PN}-doc \
-    ${PN}-efi \
-    ${PN}-flask \
-    ${PN}-flask-tools \
-    ${PN}-fsimage \
-    ${PN}-gdbsx \
-    ${PN}-hvmloader \
-    ${PN}-hypervisor \
-    ${PN}-init-xenstore-dom \
-    ${PN}-kdd \
-    ${PN}-libblktap \
-    ${PN}-libblktapctl \
-    ${PN}-libblktapctl-dev \
-    ${PN}-libblktap-dev \
-    ${PN}-libfsimage \
-    ${PN}-libfsimage-dev \
-    ${PN}-libvhd \
-    ${PN}-libvhd-dev \
-    ${PN}-libxencall \
-    ${PN}-libxencall-dev \
-    ${PN}-libxenctrl \
-    ${PN}-libxenctrl-dev \
-    ${PN}-libxendevicemodel \
-    ${PN}-libxendevicemodel-dev \
-    ${PN}-libxenevtchn \
-    ${PN}-libxenevtchn-dev \
-    ${PN}-libxenforeignmemory \
-    ${PN}-libxenforeignmemory-dev \
-    ${PN}-libxengnttab \
-    ${PN}-libxengnttab-dev \
-    ${PN}-libxenguest \
-    ${PN}-libxenguest-dev \
-    ${PN}-libxenlight \
-    ${PN}-libxenlight-dev \
-    ${PN}-libxenstat \
-    ${PN}-libxenstat-dev \
-    ${PN}-libxenstore \
-    ${PN}-libxenstore-dev \
-    ${PN}-libxentoolcore \
-    ${PN}-libxentoolcore-dev \
-    ${PN}-libxentoollog \
-    ${PN}-libxentoollog-dev \
-    ${PN}-libxenvchan \
-    ${PN}-libxenvchan-dev \
-    ${PN}-libxlutil \
-    ${PN}-libxlutil-dev \
-    ${PN}-livepatch \
-    ${PN}-misc \
-    ${PN}-pygrub \
-    ${PN}-python \
-    ${PN}-remus \
-    ${PN}-scripts-block \
-    ${PN}-scripts-common \
-    ${PN}-scripts-network \
-    ${PN}-shim \
-    ${PN}-staticdev \
-    ${PN}-volatiles \
-    ${PN}-xcutils \
-    ${PN}-xencommons \
-    ${PN}-xend \
-    ${PN}-xend-examples \
-    ${PN}-xendomains \
-    ${PN}-xenmon \
-    ${PN}-xenpaging \
-    ${PN}-xenpmd \
-    ${PN}-xenstat \
-    ${PN}-xenstore \
-    ${PN}-xenstored \
-    ${PN}-xentrace \
-    ${PN}-xen-watchdog \
-    ${PN}-xl \
-    ${PN}-xl-examples \
-    ${PN}-xm \
-    ${PN}-xm-examples \
-    "
-
-FILES_${PN}-dbg += "\
-    ${libdir}/.debug \
-    ${libdir}/debug/* \
-    ${libdir}/xen/bin/.debug \
-    ${libdir}/python2.7/site-packages/.debug \
-    ${libdir}/python2.7/site-packages/xen/lowlevel/.debug \
-    ${libdir}/fs/xfs/.debug \
-    ${libdir}/fs/ufs/.debug \
-    ${libdir}/fs/ext2fs-lib/.debug \
-    ${libdir}/fs/fat/.debug \
-    ${libdir}/fs/zfs/.debug \
-    ${libdir}/fs/reiserfs/.debug \
-    ${libdir}/fs/iso9660/.debug \
-    ${libdir}/fs/*/.debug \
-    ${sbindir}/.debug \
-    ${libdir}exec/.debug \
-    ${libdir}/xen/libexec/.debug \
-    ${bindir}/.debug \
-    ${libdir}/python2.7/dist-packages/.debug \
-    ${libdir}/python2.7/dist-packages/xen/lowlevel/.debug \
-    "
-
-FILES_${PN}-dev = "\
-    ${includedir} \
-    "
-
-FILES_${PN}-doc = "\
-    ${sysconfdir}/xen/README \
-    ${sysconfdir}/xen/README.incompatibilities \
-    ${datadir}/doc \
-    ${datadir}/man \
-    "
-
-FILES_${PN}-staticdev += "\
-    ${libdir}/libblktapctl.a \
-    ${libdir}/libxenguest.a \
-    ${libdir}/libxenlight.a \
-    ${libdir}/libxenvchan.a \
-    ${libdir}/libxenctrl.a \
-    ${libdir}/libxlutil.a \
-    ${libdir}/libvhd.a \
-    ${libdir}/libxenstat.a \
-    ${libdir}/libxenstore.a \
-    ${libdir}/libblktap.a \
-    "
-
-FILES_${PN}-libblktapctl = "${libdir}/libblktapctl.so.*"
-FILES_${PN}-libblktapctl-dev = " \
-    ${libdir}/libblktapctl.so \
-    ${libdir}/pkgconfig/xenblktapctl.pc \
-    ${datadir}/pkgconfig/xenblktapctl.pc \
-    "
-
-FILES_${PN}-libxencall = "${libdir}/libxencall.so.*"
-FILES_${PN}-libxencall-dev = " \
-    ${libdir}/libxencall.so \
-    ${libdir}/pkgconfig/xencall.pc \
-    ${datadir}/pkgconfig/xencall.pc \
-    "
-
-FILES_${PN}-libxenctrl = "${libdir}/libxenctrl.so.*"
-FILES_${PN}-libxenctrl-dev = " \
-    ${libdir}/libxenctrl.so \
-    ${libdir}/pkgconfig/xencontrol.pc \
-    ${datadir}/pkgconfig/xencontrol.pc \
-    "
-
-FILES_${PN}-libxendevicemodel = "${libdir}/libxendevicemodel.so.*"
-FILES_${PN}-libxendevicemodel-dev = " \
-    ${libdir}/libxendevicemodel.so \
-    ${libdir}/pkgconfig/xendevicemodel.pc \
-    ${datadir}/pkgconfig/xendevicemodel.pc \
-    "
-
-FILES_${PN}-libxenevtchn = "${libdir}/libxenevtchn.so.*"
-FILES_${PN}-libxenevtchn-dev = " \
-    ${libdir}/libxenevtchn.so \
-    ${libdir}/pkgconfig/xenevtchn.pc \
-    ${datadir}/pkgconfig/xenevtchn.pc \
-    "
-
-FILES_${PN}-libxenforeignmemory = "${libdir}/libxenforeignmemory.so.*"
-FILES_${PN}-libxenforeignmemory-dev = " \
-    ${libdir}/libxenforeignmemory.so \
-    ${libdir}/pkgconfig/xenforeignmemory.pc \
-    ${datadir}/pkgconfig/xenforeignmemory.pc \
-    "
-
-FILES_${PN}-libxengnttab = "${libdir}/libxengnttab.so.*"
-FILES_${PN}-libxengnttab-dev = " \
-    ${libdir}/libxengnttab.so \
-    ${libdir}/pkgconfig/xengnttab.pc \
-    ${datadir}/pkgconfig/xengnttab.pc \
-    "
-
-FILES_${PN}-libxenguest = "${libdir}/libxenguest.so.*"
-FILES_${PN}-libxenguest-dev = " \
-    ${libdir}/libxenguest.so \
-    ${libdir}/pkgconfig/xenguest.pc \
-    ${datadir}/pkgconfig/xenguest.pc \
-    "
-
-FILES_${PN}-libxenlight = "${libdir}/libxenlight.so.*"
-FILES_${PN}-libxenlight-dev = " \
-    ${libdir}/libxenlight.so \
-    ${libdir}/pkgconfig/xenlight.pc \
-    ${datadir}/pkgconfig/xenlight.pc \
-    "
-
-FILES_${PN}-libxenstat = "${libdir}/libxenstat.so.*"
-FILES_${PN}-libxenstat-dev = " \
-    ${libdir}/libxenstat.so \
-    ${libdir}/pkgconfig/xenstat.pc \
-    ${datadir}/pkgconfig/xenstat.pc \
-    "
-
-FILES_${PN}-libxenstore = "${libdir}/libxenstore.so.*"
-FILES_${PN}-libxenstore-dev = " \
-    ${libdir}/libxenstore.so \
-    ${libdir}/pkgconfig/xenstore.pc \
-    ${datadir}/pkgconfig/xenstore.pc \
-    "
-
-FILES_${PN}-libxentoolcore = "${libdir}/libxentoolcore.so.*"
-FILES_${PN}-libxentoolcore-dev = " \
-    ${libdir}/libxentoolcore.so \
-    ${libdir}/pkgconfig/xentoolcore.pc \
-    ${datadir}/pkgconfig/xentoolcore.pc \
-    "
-
-FILES_${PN}-libxentoollog = "${libdir}/libxentoollog.so.*"
-FILES_${PN}-libxentoollog-dev = " \
-    ${libdir}/libxentoollog.so \
-    ${libdir}/pkgconfig/xentoollog.pc \
-    ${datadir}/pkgconfig/xentoollog.pc \
-    "
-
-FILES_${PN}-libxenvchan = "${libdir}/libxenvchan.so.*"
-FILES_${PN}-libxenvchan-dev = " \
-    ${libdir}/libxenvchan.so \
-    ${libdir}/pkgconfig/xenvchan.pc \
-    ${datadir}/pkgconfig/xenvchan.pc \
-    "
-
-FILES_${PN}-libxlutil = "${libdir}/libxlutil.so.*"
-FILES_${PN}-libxlutil-dev = " \
-    ${libdir}/libxlutil.so \
-    ${libdir}/pkgconfig/xlutil.pc \
-    ${datadir}/pkgconfig/xlutil.pc \
-    "
-FILES_${PN}-libvhd = "${libdir}/libvhd.so.*"
-FILES_${PN}-libvhd-dev = " \
-    ${libdir}/libvhd.so \
-    ${libdir}/pkgconfig/vhd.pc \
-    ${datadir}/pkgconfig/vhd.pc \
-    "
-
-FILES_${PN}-libblktap = "${libdir}/libblktap.so.*"
-FILES_${PN}-libblktap-dev = " \
-    ${libdir}/libblktap.so \
-    ${libdir}/pkgconfig/blktap.pc \
-    ${datadir}/pkgconfig/blktap.pc \
-    "
-
-FILES_${PN}-libfsimage = " \
-    ${libdir}/libfsimage.so.* \
-    ${libdir}/libxenfsimage.so.* \
-    "
-FILES_${PN}-libfsimage-dev = " \
-    ${libdir}/libfsimage.so \
-    ${libdir}/libxenfsimage.so \
-    ${libdir}/pkgconfig/fsimage.pc \
-    ${datadir}/pkgconfig/fsimage.pc \
-    ${libdir}/pkgconfig/xenfsimage.pc \
-    ${datadir}/pkgconfig/xenfsimage.pc \
-    "
-
-FILES_${PN}-fsimage = " \
-    ${libdir}/fs/*/*fsimage.so \
-    ${libdir}/xenfsimage/*/fsimage.so \
-    "
-
-FILES_${PN}-hypervisor = "\
-    /boot/xen-* \
-    /boot/xen \
-    /boot/xen-*.gz \
-    /boot/xen.gz \
-    /boot/xen-syms-* \
-    "
-
-FILES_${PN}-init-xenstore-dom = "${libdir}/xen/bin/init-xenstore-domain"
-
-FILES_${PN}-efi = "\
-    /boot/xen.efi \
-    ${exec_prefix}/lib64/efi/xen* \
-    "
-
-FILES_${PN}-base = "\
-    ${sysconfdir}/xen/auto \
-    ${sysconfdir}/xen/cpupool \
-    ${localstatedir}/xen/dump \
-    "
-
-FILES_${PN}-blktap = "\
-    ${sbindir}/blktapctrl \
-    ${sbindir}/img2qcow \
-    ${sbindir}/lock-util \
-    ${sbindir}/qcow2raw \
-    ${sbindir}/qcow-create \
-    ${sbindir}/tap-ctl \
-    ${sbindir}/tapdisk \
-    ${sbindir}/tapdisk2 \
-    ${sbindir}/tapdisk-client \
-    ${sbindir}/tapdisk-diff \
-    ${sbindir}/tapdisk-stream \
-    ${sbindir}/td-util \
-    ${sbindir}/vhd-update \
-    ${sbindir}/vhd-util \
-    "
-
-FILES_${PN}-console = "\
-    ${libdir}/xen/bin/xenconsole \
-    ${sbindir}/xenconsoled \
-    "
-
-FILES_${PN}-cpuid = "\
-    ${bindir}/xen-cpuid \
-    "
-
-FILES_${PN}-devd = "\
-    ${sysconfdir}/init.d/xendriverdomain \
-    ${systemd_unitdir}/system/xendriverdomain.service \
-    "
-
-FILES_${PN}-flask = "\
-    /boot/${FLASK_POLICY_FILE} \
-    "
-
-FILES_${PN}-flask-tools = "\
-    ${sbindir}/flask-get-bool \
-    ${sbindir}/flask-getenforce \
-    ${sbindir}/flask-label-pci \
-    ${sbindir}/flask-loadpolicy \
-    ${sbindir}/flask-set-bool \
-    ${sbindir}/flask-setenforce \
-    "
-
-FILES_${PN}-gdbsx = "\
-    ${sbindir}/gdbsx \
-    "
-
-INSANE_SKIP_${PN}-hvmloader = "arch"
-FILES_${PN}-hvmloader = "\
-    ${libdir}/xen/boot/hvmloader \
-    "
-
-FILES_${PN}-kdd = "\
-    ${sbindir}/kdd \
-    ${sbindir}/xen-kdd \
-    "
-
-FILES_${PN}-livepatch += " \
-    ${sbindir}/xen-livepatch \
-    "
-
-FILES_${PN}-misc = "\
-    ${bindir}/xencons \
-    ${bindir}/xencov_split \
-    ${bindir}/xen-detect \
-    ${libdir}/xen/bin/xenpvnetboot \
-    ${libdir}/xen/bin/depriv-fd-checker \
-    ${sbindir}/gtracestat \
-    ${sbindir}/gtraceview \
-    ${sbindir}/xen-bugtool \
-    ${sbindir}/xencov \
-    ${sbindir}/xenperf \
-    ${sbindir}/xenpm \
-    ${sbindir}/xsview \
-    ${sbindir}/xen-diag \
-    ${sbindir}/xen-tmem-list-parse \
-    ${sbindir}/xen-python-path \
-    ${sbindir}/xen-ringwatch \
-    ${sbindir}/xen-hptool \
-    ${sbindir}/xen-hvmcrash \
-    ${sbindir}/xen-hvmctx \
-    ${sbindir}/xenlockprof \
-    ${sbindir}/xen-lowmemd \
-    ${sbindir}/xen-mfndump \
-    ${libdir}/xen/bin/verify-stream-v2 \
-    ${libdir}/xen/bin/convert-legacy-stream \
-    "
-
-FILES_${PN}-pygrub = "\
-    ${bindir}/pygrub \
-    ${libdir}/xen/bin/pygrub \
-    "
-
-FILES_${PN}-python = "\
-    ${libdir}/python2.7 \
-    "
-
-INSANE_SKIP_${PN} = "already-stripped"
-
-FILES_${PN}-remus = "\
-    ${bindir}/remus \
-    ${sysconfdir}/xen/scripts/remus-netbuf-setup \
-    "
-
-FILES_${PN}-scripts-network = " \
-    ${sysconfdir}/xen/scripts/colo-proxy-setup \
-    ${sysconfdir}/xen/scripts/network-bridge \
-    ${sysconfdir}/xen/scripts/network-nat \
-    ${sysconfdir}/xen/scripts/network-route \
-    ${sysconfdir}/xen/scripts/qemu-ifup \
-    ${sysconfdir}/xen/scripts/vif2 \
-    ${sysconfdir}/xen/scripts/vif-bridge \
-    ${sysconfdir}/xen/scripts/vif-common.sh \
-    ${sysconfdir}/xen/scripts/vif-nat \
-    ${sysconfdir}/xen/scripts/vif-openvswitch \
-    ${sysconfdir}/xen/scripts/vif-route \
-    ${sysconfdir}/xen/scripts/vif-setup \
-    "
-
-FILES_${PN}-scripts-block = " \
-    ${sysconfdir}/xen/scripts/blktap \
-    ${sysconfdir}/xen/scripts/block \
-    ${sysconfdir}/xen/scripts/block-common.sh \
-    ${sysconfdir}/xen/scripts/block-dummy \
-    ${sysconfdir}/xen/scripts/block-enbd \
-    ${sysconfdir}/xen/scripts/block-iscsi \
-    ${sysconfdir}/xen/scripts/block-nbd \
-    ${sysconfdir}/xen/scripts/block-drbd-probe \
-    ${sysconfdir}/xen/scripts/block-tap \
-    ${sysconfdir}/xen/scripts/vscsi \
-    "
-
-FILES_${PN}-scripts-common = " \
-    ${sysconfdir}/xen/scripts/external-device-migrate \
-    ${sysconfdir}/xen/scripts/hotplugpath.sh \
-    ${sysconfdir}/xen/scripts/locking.sh \
-    ${sysconfdir}/xen/scripts/logging.sh \
-    ${sysconfdir}/xen/scripts/xen-hotplug-cleanup \
-    ${sysconfdir}/xen/scripts/xen-hotplug-common.sh \
-    ${sysconfdir}/xen/scripts/xen-network-common.sh \
-    ${sysconfdir}/xen/scripts/xen-script-common.sh \
-    "
-
-INSANE_SKIP_${PN}-shim = "arch"
-FILES_${PN}-shim = " \
-    ${libdir}/xen/boot/xen-shim \
-    "
-
-FILES_${PN}-volatiles = "\
-    ${sysconfdir}/default/volatiles/99_xen \
-    ${sysconfdir}/tmpfiles.d/xen.conf \
-    "
-
-FILES_${PN}-xcutils = "\
-    ${libdir}/xen/bin/lsevtchn \
-    ${libdir}/xen/bin/readnotes \
-    ${libdir}/xen/bin/xc_restore \
-    ${libdir}/xen/bin/xc_save \
-    "
-
-FILES_${PN}-xend-examples = "\
-    ${sysconfdir}/xen/xend-config.sxp \
-    ${sysconfdir}/xen/xend-pci-permissive.sxp \
-    ${sysconfdir}/xen/xend-pci-quirks.sxp \
-    "
-
-FILES_${PN}-xenpaging = "\
-    ${libdir}/xen/bin/xenpaging \
-    ${localstatedir}/lib/xen/xenpaging \
-    "
-
-FILES_${PN}-xenpmd = "\
-    ${sbindir}/xenpmd \
-    "
-
-FILES_${PN}-xenstat = "\
-    ${sbindir}/xentop \
-    "
-
-FILES_${PN}-xenstore = "\
-    ${bindir}/xenstore \
-    ${bindir}/xenstore-chmod \
-    ${bindir}/xenstore-control \
-    ${bindir}/xenstore-exists \
-    ${bindir}/xenstore-list \
-    ${bindir}/xenstore-ls \
-    ${bindir}/xenstore-read \
-    ${bindir}/xenstore-rm \
-    ${bindir}/xenstore-watch \
-    ${bindir}/xenstore-write \
-    "
-
-FILES_${PN}-xenstored = "\
-    ${sbindir}/xenstored \
-    ${localstatedir}/lib/xenstored \
-    "
-
-FILES_${PN}-xentrace = "\
-    ${bindir}/xentrace \
-    ${bindir}/xentrace_format \
-    ${bindir}/xentrace_setsize \
-    ${libdir}/xen/bin/xenctx \
-    ${bindir}/xenalyze \
-    ${sbindir}/xentrace \
-    ${sbindir}/xentrace_setsize \
-    "
-
-FILES_${PN}-xen-watchdog = "\
-    ${sbindir}/xenwatchdogd \
-    ${sysconfdir}/init.d/xen-watchdog \
-    ${systemd_unitdir}/system/xen-watchdog.service \
-    "
-
-FILES_${PN}-xl = "\
-    ${sysconfdir}/bash_completion.d/xl.sh \
-    ${sysconfdir}/xen/xl.conf \
-    ${libdir}/xen/bin/libxl-save-helper \
-    ${sbindir}/xl \
-    ${libdir}/xen/bin/xen-init-dom0 \
-    "
-
-FILES_${PN}-xl-examples = "\
-    ${sysconfdir}/xen/xlexample.hvm \
-    ${sysconfdir}/xen/xlexample.pvlinux \
-    "
-
-FILES_${PN}-xm-examples = "\
-    ${sysconfdir}/xen/xmexample1 \
-    ${sysconfdir}/xen/xmexample2 \
-    ${sysconfdir}/xen/xmexample3 \
-    ${sysconfdir}/xen/xmexample.hvm \
-    ${sysconfdir}/xen/xmexample.hvm-stubdom \
-    ${sysconfdir}/xen/xmexample.nbd \
-    ${sysconfdir}/xen/xmexample.pv-grub \
-    ${sysconfdir}/xen/xmexample.vti \
-    "
-
-FILES_${PN}-xenmon = "\
-    ${sbindir}/xenbaked \
-    ${sbindir}/xentrace_setmask \
-    ${sbindir}/xenmon.py \
-    ${sbindir}/xenmon \
-    "
-
-FILES_${PN}-xm = "\
-    ${sysconfdir}/xen/xm-config.xml \
-    ${datadir}/xen/create.dtd \
-    ${sbindir}/xm \
-    "
-
-FILES_${PN}-xencommons += "\
-    ${sysconfdir}/default/xencommons \
-    ${sysconfdir}/init.d/xencommons \
-    ${sysconfdir}/xen/scripts/launch-xenstore \
-    ${systemd_unitdir}/modules-load.d/xen.conf \
-    ${systemd_unitdir}/system/proc-xen.mount \
-    ${systemd_unitdir}/system/xen-qemu-dom0-disk-backend.service \
-    ${systemd_unitdir}/system/xenconsoled.service \
-    ${systemd_unitdir}/system/xen-init-dom0.service \
-    ${systemd_unitdir}/system/xenstored.service \
-    ${systemd_unitdir}/system/var-lib-xenstored.mount \
-    "
-
-FILES_${PN}-xend += " \
-    ${sysconfdir}/init.d/xend \
-    ${sbindir}/xend \
-    "
-
-FILES_${PN}-xendomains += "\
-    ${libdir}/xen/bin/xendomains \
-    ${sysconfdir}/default/xendomains \
-    ${sysconfdir}/init.d/xendomains \
-    ${sysconfdir}/sysconfig/xendomains \
-    ${systemd_unitdir}/system/xendomains.service \
-    "
-
-# configure init.d scripts
-INITSCRIPT_PACKAGES = "${PN}-xend ${PN}-xencommons ${PN}-xen-watchdog ${PN}-xendomains ${PN}-devd"
-INITSCRIPT_NAME_${PN}-xencommons = "xencommons"
-INITSCRIPT_PARAMS_${PN}-xencommons = "defaults 80"
-INITSCRIPT_NAME_${PN}-xen-watchdog = "xen-watchdog"
-INITSCRIPT_PARAMS_${PN}-xen-watchdog = "defaults 81"
-INITSCRIPT_NAME_${PN}-xend = "xend"
-INITSCRIPT_PARAMS_${PN}-xend = "defaults 82"
-INITSCRIPT_NAME_${PN}-xendomains = "xendomains"
-INITSCRIPT_PARAMS_${PN}-xendomains = "defaults 83"
-INITSCRIPT_NAME_${PN}-devd = "xendriverdomain"
-INITSCRIPT_PARAMS_${PN}-devd = "defaults 82"
-
-# systemd packages
-SYSTEMD_PACKAGES = "${PN}-xen-watchdog ${PN}-xencommons ${PN}-xendomains ${PN}-devd"
-SYSTEMD_SERVICE_${PN}-devd = "xendriverdomain.service"
-SYSTEMD_SERVICE_${PN}-xen-watchdog = "xen-watchdog.service"
-SYSTEMD_SERVICE_${PN}-xencommons = " \
-    proc-xen.mount \
-    var-lib-xenstored.mount \
-    xen-qemu-dom0-disk-backend.service \
-    xenconsoled.service \
-    xen-init-dom0.service \
-    xenstored.service \
-    "
-SYSTEMD_SERVICE_${PN}-xendomains = "xendomains.service"
-
 #### REQUIRED ENVIRONMENT VARIABLES ####
 export BUILD_SYS
 export HOST_SYS
@@ -894,21 +199,6 @@ do_post_patch_append_arm()  {
 
 addtask post_patch after do_patch before do_configure
 
-do_stubs() {
-    # no stubs-32.h in our 64-bit sysroot - hack it into tools/include/gnu
-    if ! test -f ${STAGING_DIR_TARGET}/usr/include/gnu/stubs-32.h ; then
-        if test -f ${STAGING_DIR_TARGET}/usr/include/gnu/stubs-64.h ; then
-            test -d ${S}/tools/include/gnu || mkdir ${S}/tools/include/gnu
-            cat ${STAGING_DIR_TARGET}/usr/include/gnu/stubs-64.h | grep -v stub_bdflush | grep -v stub_getmsg | grep -v stub_putmsg > ${S}/tools/include/gnu/stubs-32.h
-            echo \#define __stub___kernel_cosl >> ${S}/tools/include/gnu/stubs-32.h
-            echo \#define __stub___kernel_sinl >> ${S}/tools/include/gnu/stubs-32.h
-            echo \#define __stub___kernel_tanl >> ${S}/tools/include/gnu/stubs-32.h
-        fi
-    fi
-}
-
-addtask stubs after do_configure before do_compile
-
 # Allow all hypervisor settings in a defconfig
 EXTRA_OEMAKE += "XEN_CONFIG_EXPERT=y"
 # Build release versions always. Technically since we track release
@@ -916,7 +206,7 @@ EXTRA_OEMAKE += "XEN_CONFIG_EXPERT=y"
 # from staging that reverts this
 EXTRA_OEMAKE += "debug=n"
 
-do_configure() {
+do_configure_common() {
 
     #./configure --enable-xsmpolicy does not set XSM_ENABLE must be done manually
     if [ "${XSM_ENABLED}" = "1" ]; then
@@ -938,134 +228,14 @@ do_configure() {
     fi
 }
 
-do_compile() {
+do_compile_prepend() {
     # workaround for build bug when CFLAGS is exported
     # https://www.mail-archive.com/xen-devel@lists.xen.org/msg67822.html
     unset CFLAGS
-
-    # Workaround for parallel build bug: build xen first.
-    # https://lists.xenproject.org/archives/html/xen-devel/2018-07/msg02551.html
-    oe_runmake xen
-    oe_runmake
 }
 
-do_install() {
+do_install_prepend() {
     # CFLAGS is used to set PY_CFLAGS which affects the pygrub install
     # so also need to unset CFLAGS here:
     unset CFLAGS
-    oe_runmake DESTDIR="${D}" install
-
-    # remove installed volatiles
-    rm -rf ${D}${base_prefix}/run \
-        ${D}${localstatedir}/run \
-        ${D}${localstatedir}/lock \
-        ${D}${localstatedir}/log \
-        ${D}${localstatedir}/volatile \
-        ${D}${localstatedir}/lib/xen
-
-    VOLATILE_DIRS=" \
-        ${base_prefix}/run/xenstored \
-        ${base_prefix}/run/xend \
-        ${base_prefix}/run/xend/boot \
-        ${base_prefix}/run/xen \
-        ${localstatedir}/log/xen \
-        ${localstatedir}/lock/xen \
-        ${localstatedir}/lock/subsys \
-        ${localstatedir}/lib/xen \
-        "
-
-    # install volatiles using populate_volatiles mechanism
-    install -d ${D}${sysconfdir}/default/volatiles
-    for i in $VOLATILE_DIRS; do
-        echo "d root root 0755 $i none"  >> ${D}${sysconfdir}/default/volatiles/99_xen
-    done
-
-    # workaround for xendomains script which searchs sysconfig if directory exists
-    install -d ${D}${sysconfdir}/sysconfig
-    ln -sf ${sysconfdir}/default/xendomains ${D}${sysconfdir}/sysconfig/xendomains
-
-    # systemd
-    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
-        # install volatiles using systemd tmpfiles.d
-        install -d ${D}${sysconfdir}/tmpfiles.d
-        for i in $VOLATILE_DIRS; do
-            echo "d $i 0755 root root - -"  >> ${D}${sysconfdir}/tmpfiles.d/xen.conf
-        done
-    fi
-
-    # fixup default path to qemu-system-i386
-    sed -i 's#\(test -z "$QEMU_XEN" && QEMU_XEN=\).*$#\1"/usr/bin/qemu-system-i386"#' ${D}/etc/init.d/xencommons
-
-    if [ -e ${D}${systemd_unitdir}/system/xen-qemu-dom0-disk-backend.service ]; then
-        sed -i 's#ExecStart=.*qemu-system-i386\(.*\)$#ExecStart=/usr/bin/qemu-system-i386\1#' \
-            ${D}${systemd_unitdir}/system/xen-qemu-dom0-disk-backend.service
-    fi
-}
-
-pkg_postinst_${PN}-volatiles() {
-    if [ -z "$D" ]; then
-        if command -v systemd-tmpfiles >/dev/null; then
-            systemd-tmpfiles --create ${sysconfdir}/tmpfiles.d/xen.conf
-        elif [ -e ${sysconfdir}/init.d/populate-volatile.sh ]; then
-            ${sysconfdir}/init.d/populate-volatile.sh update
-        fi
-    fi
-}
-
-do_deploy() {
-    install -d ${DEPLOYDIR}
-
-    if [ -f ${D}/boot/xen ]; then
-        install -m 0644 ${D}/boot/xen ${DEPLOYDIR}/xen-${MACHINE}
-    fi
-
-    if [ -f ${D}/boot/xen.gz ]; then
-        install -m 0644 ${D}/boot/xen.gz ${DEPLOYDIR}/xen-${MACHINE}.gz
-    fi
-
-    if [ -f ${D}/usr/lib64/efi/xen.efi ]; then
-        install -m 0644 ${D}/usr/lib64/efi/xen.efi ${DEPLOYDIR}/xen-${MACHINE}.efi
-    fi
-
-    # Install the flask policy in the deploy directory if it exists
-    if [ -f ${D}/boot/${FLASK_POLICY_FILE} ]; then
-        install -m 0644 ${D}/boot/${FLASK_POLICY_FILE} ${DEPLOYDIR}
-        ln -sf ${FLASK_POLICY_FILE} ${DEPLOYDIR}/xenpolicy-${MACHINE}
-    fi
-}
-
-addtask deploy after do_populate_sysroot
-
-# Enable use of menuconfig directly from bitbake and also within the devshell
-OE_TERMINAL_EXPORTS += "HOST_EXTRACFLAGS HOSTLDFLAGS TERMINFO"
-HOST_EXTRACFLAGS = "${BUILD_CFLAGS} ${BUILD_LDFLAGS}"
-HOSTLDFLAGS = "${BUILD_LDFLAGS}"
-TERMINFO = "${STAGING_DATADIR_NATIVE}/terminfo"
-do_devshell[depends] += "ncurses-native:do_populate_sysroot"
-
-KCONFIG_CONFIG_COMMAND ??= "menuconfig"
-python do_menuconfig() {
-    import shutil
-
-    try:
-        mtime = os.path.getmtime("xen/.config")
-        shutil.copy("xen/.config", "xen/.config.orig")
-    except OSError:
-        mtime = 0
-
-    oe_terminal("${SHELL} -c \"cd xen; XEN_CONFIG_EXPERT=y make %s; if [ \$? -ne 0 ]; then echo 'Command failed.'; printf 'Press any key to continue... '; read r; fi\"" % d.getVar('KCONFIG_CONFIG_COMMAND'),
-        d.getVar('PN') + ' Configuration', d)
-
-    try:
-        newmtime = os.path.getmtime("xen/.config")
-    except OSError:
-        newmtime = 0
-
-    if newmtime > mtime:
-        bb.note("Configuration changed, recompile will be forced")
-        bb.build.write_taint('do_compile', d)
 }
-do_menuconfig[depends] += "ncurses-native:do_populate_sysroot"
-do_menuconfig[nostamp] = "1"
-do_menuconfig[dirs] = "${B}"
-addtask menuconfig after do_configure
diff --git a/recipes-extended/xen/xen_4.12.2.bb b/recipes-extended/xen/xen_4.12.2.bb
deleted file mode 100644
index affeb4a..0000000
--- a/recipes-extended/xen/xen_4.12.2.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
-require xen.inc
-
-SRC_URI = " \
-    https://downloads.xenproject.org/release/xen/${PV}/xen-${PV}.tar.gz \
-    file://0001-python-pygrub-pass-DISTUTILS-xen.4.12.patch \
-    "
-
-SRC_URI[md5sum] = "57084e3f55bbec063d38b464e1b7e4f2"
-SRC_URI[sha256sum] = "1c75cbe728dfabf02b7f9a17ce96ee7d202d2fd4b4689490018d3a28b63f9fa3"
-
-S = "${WORKDIR}/xen-${PV}"
diff --git a/recipes-extended/xen/xen_git.bb b/recipes-extended/xen/xen_git.bb
index 5f950e6..16cfc39 100644
--- a/recipes-extended/xen/xen_git.bb
+++ b/recipes-extended/xen/xen_git.bb
@@ -1,18 +1,3 @@
 require xen.inc
-
-SRCREV ?= "cb70a26f78848fe45f593f7ebc9cfaac760a791b"
-
-XEN_REL = "4.13"
-XEN_BRANCH = "staging"
-FLASK_POLICY_FILE = "xenpolicy-${XEN_REL}-unstable"
-
-PV = "${XEN_REL}+git${SRCPV}"
-
-S = "${WORKDIR}/git"
-
-SRC_URI = " \
-    git://xenbits.xen.org/xen.git;branch=${XEN_BRANCH} \
-    file://0001-python-pygrub-pass-DISTUTILS-xen.4.12.patch \
-    "
-
-DEFAULT_PREFERENCE = "-1"
+require xen-version.inc
+require xen-hypervisor.inc
-- 
2.17.1

