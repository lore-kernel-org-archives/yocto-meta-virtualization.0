Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web08.60.1627430871451646013
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 27 Jul 2021 17:07:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qvvzQd80;
 spf=pass (domain: gmail.com, ip: 209.85.222.174, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id k7so533108qki.11
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 27 Jul 2021 17:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wwkmf/vLLohbzVJt+9itjtwVwC6SMu81puZF0pQE39Q=;
        b=qvvzQd80dJP3HTXrWlhpeQKks9z7kMA6vaMS1XCRz7su8MYUVnDM9Fng4goDG5vlqV
         OIAVh3A5B4nuuGp5mAd/trnI9cxqu/eiIurxzZSnB/WNNBakWBWt7JZ6xvW5PTfMk32W
         2K6bu6mtvv8/2B34snh8YwJjmlY4j8XDj9/GKNFCSUy2P++9xntwz0JrCbhQhGpPT8h5
         Li/Y+IGY2Gsk2JL6KPoof6BHVxgXnCFNH0Z7Lh4q+xe6qNfSUCSTo0/gyR1oxz/ti63e
         T/icISs11da6KvM3TayC+0yVyi4q08u8XLCamKnUHmDaAhY5uI3e9vVs+7akJy3jUSGi
         htPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wwkmf/vLLohbzVJt+9itjtwVwC6SMu81puZF0pQE39Q=;
        b=KRgccA1ncyCnpUwkb3efvFCwS8tnxJymj/mOCs3APyYdOT6KNh5ds+hg9xfdlLZm7P
         SlnfzCz/rukS5j8c+jkloYdahtKfCRe2GoF9RzJ+Xcb6HyaqXRGsYTj75LbcZOdfLgGJ
         BAblONl3WZuEPqDNVun9Bw/7I3Ag3LzNT/c4a062EZBEIWVwdWwQ3GPFg5IoJBfznIGq
         JqNKs9wr5xA306EX2z2re4mTntlj9gO2vR4XRsvHpLqb0/8FXWNHcIsn1SPZ8vyzJh9N
         wLcu01EYPLSAlRm8rmqVus+isodX7a45rm4mvIUHj+rTRHUyjKtFqM5MGLMKtjZKxZiH
         rJQQ==
X-Gm-Message-State: AOAM532vSzRirgJdU6+7gfTezgDZsKqPDdfUTYdUBPmF065M8Y6zHzwb
	edIbZMloRcWutgUG1OX9tRNzxVgUBlSFYDLe
X-Google-Smtp-Source: ABdhPJx5/pdpZvt6oAxs2Fcc5hVKR/wFqy2jbgCyMrh8wUE0pJNpRsjHCu6MgmDo1/1YDoLDv8MNBQ==
X-Received: by 2002:a05:620a:101a:: with SMTP id z26mr25100447qkj.261.1627430870488;
        Tue, 27 Jul 2021 17:07:50 -0700 (PDT)
Return-Path: <christopher.w.clark@gmail.com>
Received: from walnut.ice.pyrology.org (mobile-166-171-249-110.mycingular.net. [166.171.249.110])
        by smtp.gmail.com with ESMTPSA id j3sm2409559qka.96.2021.07.27.17.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jul 2021 17:07:50 -0700 (PDT)
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
Subject: [meta-virtualization][PATCH v2 1/2] lopper, python-dtc: add new recipes for device tree tools
Date: Tue, 27 Jul 2021 17:07:39 -0700
Message-Id: <20210728000740.11070-2-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210728000740.11070-1-christopher.w.clark@gmail.com>
References: <20210728000740.11070-1-christopher.w.clark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Christopher Clark <christopher.clark@starlab.io>

This device tree tooling is being added as a prequisite for enabling
qemuboot with the Arm 64-bit version of the Xen hypervisor.

lopper: a tool for performing operations on device tree files.
A new recipe inspired by the original from meta-xilinx-bsp.

python-dtc: a python library for the Device Tree compiler.
This is a prerequisite for lopper. Updated import of recipe from
meta-xilinx-bsp for the latest release, version 1.6.1.

Signed-off-by: Christopher Clark <christopher.clark@starlab.io>
---

Changes since v1:
* set the S variable to the top of the unpacked software
  and use the DISTUTILS_SETUP_PATH variable to direct the build
* use oe_runmake instead of make

 recipes-kernel/dtc/python3-dtc_1.6.1.bb | 28 +++++++++++++++
 recipes-kernel/lopper/lopper.bb         | 45 +++++++++++++++++++++++++
 2 files changed, 73 insertions(+)
 create mode 100644 recipes-kernel/dtc/python3-dtc_1.6.1.bb
 create mode 100644 recipes-kernel/lopper/lopper.bb

diff --git a/recipes-kernel/dtc/python3-dtc_1.6.1.bb b/recipes-kernel/dtc/python3-dtc_1.6.1.bb
new file mode 100644
index 0000000..9088931
--- /dev/null
+++ b/recipes-kernel/dtc/python3-dtc_1.6.1.bb
@@ -0,0 +1,28 @@
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
+LIC_FILES_CHKSUM = "file://pylibfdt/libfdt.i;beginline=1;endline=6;md5=afda088c974174a29108c8d80b5dce90"
+
+SRCREV = "ecaeb97fec013973360e94888a7de645f084345c"
+
+S = "${WORKDIR}/git"
+
+inherit distutils3
+
+DISTUTILS_SETUP_PATH = "${S}/pylibfdt"
+
+do_configure_prepend() {
+    oe_runmake -C "${S}" version_gen.h
+    mv "${S}/version_gen.h" "${DISTUTILS_SETUP_PATH}/"
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

