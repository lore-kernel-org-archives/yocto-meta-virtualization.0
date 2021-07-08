Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web08.7721.1625719404967857919
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 07 Jul 2021 21:43:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ihkDEaiw;
 spf=pass (domain: gmail.com, ip: 209.85.222.174, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id t19so4459099qkg.7
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 07 Jul 2021 21:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0ub33BV6h4j9eDRyv1bk40t+BrW0x64WJW4NcEkT+TA=;
        b=ihkDEaiwb5BIIb/noJeH9dLRXy2alxvFRDJ4Y58KHUV5axXIpPlUdp+tlAtLDLk8U7
         UBGCvkzdFC8BoR2IJgN/l+6qkyNan+jzlBmIbdw1pt7dKy7XS69cN/OkJFlPoWyoxBzP
         L1DWveKb8hJIyLs7ZR5Tvyq5clZ+45wGkZMaf4u1HLVnP5nPJKHB0NvM2ArwmBog1fEq
         zT7U6KZgVqV51WoUG58ArCPFqgwVHEcfiVEsM0JRoTOuAUqoQ9br63QZeqAqK6OLPiG2
         cXLyuZaoR4KTj0TiCLyFcQNwtLga7O9j30g0HBvXnUAlTqgHWONW1oHH27tTl1KzaD2E
         EJzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0ub33BV6h4j9eDRyv1bk40t+BrW0x64WJW4NcEkT+TA=;
        b=oNNa7pwF8mUQg2US2YdG5JUFvJU/9mjPJJvhJstvCab6tbsSUnBhDMVUFUVrQhjDN8
         RC7WZjDBIxJw2M3qIoGXMB8yr0CRKygABQzCO3XV1ZcMVmYsH3TS8hEW5Yum01NjWU/k
         T+jTA8nBW+p6wFSsHgNEERyk70EQGCrAHQBc8/WjS0I/JiLWTVqTw5r2MjmA7BgnkgDB
         iaWBdt445I58+DluwzGo5z2gunb+7AAwKthrPNQ0+R+50mwPVh2YMXm7uJtBnl89e4qs
         BpifSW36Idx+eXX3i7OswWkBPDzTcY/xE5dPtHdnfdlZSxqRqMKoSsF7UGNUPRUdI+8o
         ttIw==
X-Gm-Message-State: AOAM532STM5VL41k8R7OFJLxiKFqAvSF991hgpGtlCutBOPN2cJcUMwL
	aH2ECwftXKIGtpSSF9zxnnaXErjzTDI5V9ie
X-Google-Smtp-Source: ABdhPJzV9tnlWDHMzJXXNPZfIS1QvT67Br/pFoLZTh0jCLdxDwY8f9mxAugOXJrJ0Tfr5kN1BMCORw==
X-Received: by 2002:a37:8e44:: with SMTP id q65mr29625274qkd.372.1625719404025;
        Wed, 07 Jul 2021 21:43:24 -0700 (PDT)
Return-Path: <christopher.w.clark@gmail.com>
Received: from walnut.ice.pyrology.org (mobile-166-177-250-205.mycingular.net. [166.177.250.205])
        by smtp.gmail.com with ESMTPSA id n81sm211614qkn.118.2021.07.07.21.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jul 2021 21:43:23 -0700 (PDT)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Christopher Clark <christopher.clark@starlab.io>,
	bruce.ashfield@gmail.com,
	cardoe@gentoo.org,
	diego.sueiro@arm.com,
	Bertrand.Marquis@arm.com,
	andrew.cooper3@citrix.com,
	dpsmith@apertussolutions.com,
	persaur@gmail.com,
	scott.davis@starlab.io,
	adam.schwalm@starlab.io
Subject: [meta-virtualization][PATCH 1/2] lopper, python-dtc: add new recipes for device tree tools
Date: Wed,  7 Jul 2021 21:42:59 -0700
Message-Id: <20210708044300.127016-2-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210708044300.127016-1-christopher.w.clark@gmail.com>
References: <20210708044300.127016-1-christopher.w.clark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Christopher Clark <christopher.clark@starlab.io>

This device tree tooling is being added as a prequisite for enabling
qemuboot to run Xen system images with device trees generated for Qemu.

lopper: a tool for performing operations on device tree files.
A new recipe inspired by the original from meta-xilinx-bsp.

python-dtc: a python library for the Device Tree compiler.
This is a prerequisite for lopper. Imported from meta-xilinx-bsp with an
updated SRCREV and DESCRIPTION for the latest release, version 1.6.1.

Signed-off-by: Christopher Clark <christopher.clark@starlab.io>
---
 recipes-kernel/dtc/python3-dtc_1.6.1.bb | 26 ++++++++++++++
 recipes-kernel/lopper/lopper.bb         | 45 +++++++++++++++++++++++++
 2 files changed, 71 insertions(+)
 create mode 100644 recipes-kernel/dtc/python3-dtc_1.6.1.bb
 create mode 100644 recipes-kernel/lopper/lopper.bb

diff --git a/recipes-kernel/dtc/python3-dtc_1.6.1.bb b/recipes-kernel/dtc/python3-dtc_1.6.1.bb
new file mode 100644
index 0000000..5374029
--- /dev/null
+++ b/recipes-kernel/dtc/python3-dtc_1.6.1.bb
@@ -0,0 +1,26 @@
+SUMMARY = "Python Library for the Device Tree Compiler"
+HOMEPAGE = "https://devicetree.org/"
+DESCRIPTION = "A python library for the Device Tree Compiler, a tool used to manipulate Device Tree files which contain a data structure for describing hardware."
+SECTION = "bootloader"
+LICENSE = "GPLv2 | BSD"
+
+DEPENDS = "flex-native bison-native swig-native libyaml dtc"
+
+SRC_URI = "git://git.kernel.org/pub/scm/utils/dtc/dtc.git"
+
+UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
+
+LIC_FILES_CHKSUM = "file://libfdt.i;beginline=1;endline=6;md5=afda088c974174a29108c8d80b5dce90"
+
+SRCREV = "ecaeb97fec013973360e94888a7de645f084345c"
+
+S = "${WORKDIR}/git/pylibfdt"
+
+inherit distutils3
+
+do_configure_prepend() {
+    make -C "${S}/.." version_gen.h
+    mv "${S}/../version_gen.h" "${S}/"
+}
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/recipes-kernel/lopper/lopper.bb b/recipes-kernel/lopper/lopper.bb
new file mode 100644
index 0000000..274d5b9
--- /dev/null
+++ b/recipes-kernel/lopper/lopper.bb
@@ -0,0 +1,45 @@
+SUMMARY = "Device Tree Lopper"
+DESCRIPTION = "Tool for manipulation of system device tree files"
+LICENSE = "BSD-3-Clause"
+SECTION = "bootloader"
+
+SRC_URI = "git://github.com/devicetree-org/lopper.git"
+SRCREV = "0c23e51d585608ab04009ccf3499f168e2f4d478"
+S = "${WORKDIR}/git"
+
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=8e5f5f691f01c9fdfa7a7f2d535be619"
+
+RDEPENDS_${PN} = " \
+    python3-core \
+    python3-dtc \
+    python3-humanfriendly \
+    "
+
+do_install() {
+    install -d "${D}/${bindir}"
+    install -d "${D}/${datadir}/${BPN}"
+
+    install -m 0644 "${S}/README" "${D}/${datadir}/${BPN}"
+    install -m 0644 "${S}/README-architecture.txt" "${D}/${datadir}/${BPN}"
+    install -m 0644 "${S}/README.pydoc" "${D}/${datadir}/${BPN}"
+    install -m 0644 "${S}/LICENSE.md" "${D}/${datadir}/${BPN}"
+
+    install -d "${D}/${datadir}/${BPN}/assists"
+    install -m 0644 "${S}/assists/"* "${D}/${datadir}/${BPN}/assists/"
+
+    install -d "${D}/${datadir}/${BPN}/lops"
+    install -m 0644 "${S}/lops/"* "${D}/${datadir}/${BPN}/lops/"
+
+    install -d "${D}/${datadir}/${BPN}/device-trees"
+    install -m 0644 "${S}/device-trees/"* "${D}/${datadir}/${BPN}/device-trees/"
+
+    install -m 0755 "${S}/"lopper*.py "${D}/${datadir}/${BPN}/"
+
+    datadir_relpath=${@os.path.relpath(d.getVar('datadir'), d.getVar('bindir'))}
+    ln -s "${datadir_relpath}/${BPN}/lopper.py" "${D}/${bindir}/"
+}
+
+do_configure[noexec] = "1"
+do_compile[noexec] = "1"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1

