Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
 by mx.groups.io with SMTP id smtpd.web11.35488.1629781841712218687
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 23 Aug 2021 22:10:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OAs0l3+b;
 spf=pass (domain: gmail.com, ip: 209.85.210.41, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-ot1-f41.google.com with SMTP id i8-20020a056830402800b0051afc3e373aso31495723ots.5
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 23 Aug 2021 22:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1BfOayBb/Z1kZG055JQcxqPryctD1oqWmr4PeZsEQZw=;
        b=OAs0l3+bGrr8cqYauUGCu725zStIy0iMzCLr0EgDrmt3faRRzFtpIl0Gmc9Y9tN1pM
         im2zaGaQPSfZ+osOCduWEA41DlOS2/n4LpSHAemX7y5bNZHTVm0V/emd6X4aw0mTSJbi
         YVgHAU/HxeOYnzYdYsCQHVGRa+EDpFlVS1Pz+V3pt61WY43lALp7AZFa9UoZdKowhX5o
         eYgb1OjiEq4ywWu1mZB12QWzGWhKXYAMdpgajr2YWAGFteoSeRqtr2nLbhpig3Mf02ML
         MfqtNzhNvZ1B9BLFKK9ObSH/rp/Niio7nJGdpKK+LAU07xkoZE0P8EdLATQxfGVZGBVJ
         32Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1BfOayBb/Z1kZG055JQcxqPryctD1oqWmr4PeZsEQZw=;
        b=CEh7Wjy8EKLYC6JLnyRfnFJXC2/BCsIQT6G1H9XdP/GWnj2TZ4Iqx8bwUj+xKFKlWr
         zJSdmBQOamNGzN+BYbTxEg0O41DMbn3VdnksmRP38Ec5oqPIDs2IojQibXYqTvDFfd3g
         7YvnPk/7o0OZW8Z0aKB2xpajEUM3/viX3WT1+YqbZ+LT7kOXY7uuYaJO3fVHq4XeFs6h
         4k4VI3Q1KiYEjf9psd/fIU/o4pPoNkpKPKY4wSlLe/Nt8uGb/CTmEgB5scJmECWjbsqT
         i1BgRIE7/D/5rUwp+fW8kqzwNf5J/0JwpgQf/5upcaZl5/FyNPb8aIpJHeaX4/ePB1XL
         nsHg==
X-Gm-Message-State: AOAM532jF9skAmgng7dHcog9zuyB13clZBNeGcujZZ5HuwynBQ9/HLPQ
	ZfDuvUI5JKUlPsHwWLeXOWS1+b5J2Pxudg==
X-Google-Smtp-Source: ABdhPJzO6ub6434xdEa/LfOcLmZAvsIjxds5y2XLB68wrB0qbVqtcMH+z+DjlgX1t5Jup8YvrX1DYQ==
X-Received: by 2002:a05:6830:118a:: with SMTP id u10mr30199397otq.32.1629781840853;
        Mon, 23 Aug 2021 22:10:40 -0700 (PDT)
Return-Path: <christopher.w.clark@gmail.com>
Received: from walnut.ice.pyrology.org (mobile-166-137-176-019.mycingular.net. [166.137.176.19])
        by smtp.gmail.com with ESMTPSA id j4sm757806oom.10.2021.08.23.22.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Aug 2021 22:10:40 -0700 (PDT)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	cardoe@gentoo.org
Subject: [meta-virtualization][PATCH] xen, xen-tools: apply workaround for gnu linker error to fix x86 build
Date: Mon, 23 Aug 2021 22:10:27 -0700
Message-Id: <20210824051027.200287-1-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Upstream patch applied to each Xen and Xen tools recipe to fix the build
of the hypervisor and shim with GNU linker 2.37.

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
---
 ...-around-build-issue-with-GNU-ld-2.37.patch | 36 +++++++++++++++++++
 recipes-extended/xen/xen-tools_4.14.bb        |  1 +
 recipes-extended/xen/xen-tools_4.15.bb        |  1 +
 recipes-extended/xen/xen-tools_git.bb         |  1 +
 recipes-extended/xen/xen_4.14.bb              |  1 +
 recipes-extended/xen/xen_4.15.bb              |  1 +
 recipes-extended/xen/xen_git.bb               |  1 +
 7 files changed, 42 insertions(+)
 create mode 100644 recipes-extended/xen/files/0001-x86-work-around-build-issue-with-GNU-ld-2.37.patch

diff --git a/recipes-extended/xen/files/0001-x86-work-around-build-issue-with-GNU-ld-2.37.patch b/recipes-extended/xen/files/0001-x86-work-around-build-issue-with-GNU-ld-2.37.patch
new file mode 100644
index 0000000..f5108be
--- /dev/null
+++ b/recipes-extended/xen/files/0001-x86-work-around-build-issue-with-GNU-ld-2.37.patch
@@ -0,0 +1,36 @@
+From 58ad654ebce7ccb272a3f4f3482c03aaad850d31 Mon Sep 17 00:00:00 2001
+From: Jan Beulich <jbeulich@suse.com>
+Date: Thu, 22 Jul 2021 11:20:38 +0200
+Subject: [PATCH] x86: work around build issue with GNU ld 2.37
+
+I suspect it is commit 40726f16a8d7 ("ld script expression parsing")
+which broke the hypervisor build, by no longer accepting section names
+with a dash in them inside ADDR() (and perhaps other script directives
+expecting just a section name, not an expression): .note.gnu.build-id
+is such a section.
+
+Quoting all section names passed to ADDR() via DECL_SECTION() works
+around the regression.
+
+Signed-off-by: Jan Beulich <jbeulich@suse.com>
+Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
+---
+ xen/arch/x86/xen.lds.S | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
+index 9c6c1c8005..955d5cf4a0 100644
+--- a/xen/arch/x86/xen.lds.S
++++ b/xen/arch/x86/xen.lds.S
+@@ -18,7 +18,7 @@ ENTRY(efi_start)
+ #else /* !EFI */
+ 
+ #define FORMAT "elf64-x86-64"
+-#define DECL_SECTION(x) x : AT(ADDR(x) - __XEN_VIRT_START)
++#define DECL_SECTION(x) x : AT(ADDR(#x) - __XEN_VIRT_START)
+ 
+ ENTRY(start_pa)
+ 
+-- 
+2.25.1
+
diff --git a/recipes-extended/xen/xen-tools_4.14.bb b/recipes-extended/xen/xen-tools_4.14.bb
index 6fd6f7f..ce5dc2e 100644
--- a/recipes-extended/xen/xen-tools_4.14.bb
+++ b/recipes-extended/xen/xen-tools_4.14.bb
@@ -9,6 +9,7 @@ SRC_URI = " \
     file://0001-firmware-provide-a-stand-alone-set-of-headers-Xen-4.14.patch \
     file://0001-tools-firmware-Build-firmware-as-ffreestanding-Xen-4.14.patch \
     file://0001-libs-foreignmemory-Fix-osdep_xenforeignmemory_map-pr.patch \
+    file://0001-x86-work-around-build-issue-with-GNU-ld-2.37.patch \
     "
 
 LIC_FILES_CHKSUM ?= "file://COPYING;md5=419739e325a50f3d7b4501338e44a4e5"
diff --git a/recipes-extended/xen/xen-tools_4.15.bb b/recipes-extended/xen/xen-tools_4.15.bb
index f3f9cd3..e9c3bd6 100644
--- a/recipes-extended/xen/xen-tools_4.15.bb
+++ b/recipes-extended/xen/xen-tools_4.15.bb
@@ -7,6 +7,7 @@ SRC_URI = " \
     git://xenbits.xen.org/xen.git;branch=${XEN_BRANCH} \
     file://0001-python-pygrub-pass-DISTUTILS-xen-4.15.patch \
     file://0001-libs-foreignmemory-Fix-osdep_xenforeignmemory_map-pr.patch \
+    file://0001-x86-work-around-build-issue-with-GNU-ld-2.37.patch \
     "
 
 LIC_FILES_CHKSUM ?= "file://COPYING;md5=419739e325a50f3d7b4501338e44a4e5"
diff --git a/recipes-extended/xen/xen-tools_git.bb b/recipes-extended/xen/xen-tools_git.bb
index 0b2dce9..6926bd9 100644
--- a/recipes-extended/xen/xen-tools_git.bb
+++ b/recipes-extended/xen/xen-tools_git.bb
@@ -7,6 +7,7 @@ SRC_URI = " \
     git://xenbits.xen.org/xen.git;branch=${XEN_BRANCH} \
     file://0001-python-pygrub-pass-DISTUTILS-xen-4.15.patch \
     file://0001-libs-foreignmemory-Fix-osdep_xenforeignmemory_map-pr.patch \
+    file://0001-x86-work-around-build-issue-with-GNU-ld-2.37.patch \
     "
 
 LIC_FILES_CHKSUM ?= "file://COPYING;md5=419739e325a50f3d7b4501338e44a4e5"
diff --git a/recipes-extended/xen/xen_4.14.bb b/recipes-extended/xen/xen_4.14.bb
index 0dd9d3c..291ba16 100644
--- a/recipes-extended/xen/xen_4.14.bb
+++ b/recipes-extended/xen/xen_4.14.bb
@@ -7,6 +7,7 @@ SRC_URI = " \
     git://xenbits.xen.org/xen.git;branch=${XEN_BRANCH} \
     file://xen-arm64-implement-atomic-fetch-add.patch \
     file://0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-location.patch \
+    file://0001-x86-work-around-build-issue-with-GNU-ld-2.37.patch \
     "
 
 LIC_FILES_CHKSUM ?= "file://COPYING;md5=419739e325a50f3d7b4501338e44a4e5"
diff --git a/recipes-extended/xen/xen_4.15.bb b/recipes-extended/xen/xen_4.15.bb
index d0aa176..0605441 100644
--- a/recipes-extended/xen/xen_4.15.bb
+++ b/recipes-extended/xen/xen_4.15.bb
@@ -8,6 +8,7 @@ SRC_URI = " \
     file://xen-arm64-implement-atomic-fetch-add.patch \
     file://0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-location.patch \
     file://0001-x86-make-hypervisor-build-with-gcc11.patch \
+    file://0001-x86-work-around-build-issue-with-GNU-ld-2.37.patch \
     "
 
 LIC_FILES_CHKSUM ?= "file://COPYING;md5=419739e325a50f3d7b4501338e44a4e5"
diff --git a/recipes-extended/xen/xen_git.bb b/recipes-extended/xen/xen_git.bb
index 7ce7228..12c9403 100644
--- a/recipes-extended/xen/xen_git.bb
+++ b/recipes-extended/xen/xen_git.bb
@@ -8,6 +8,7 @@ SRC_URI = " \
     file://xen-arm64-implement-atomic-fetch-add.patch \
     file://0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-location.patch \
     file://0001-x86-make-hypervisor-build-with-gcc11.patch \
+    file://0001-x86-work-around-build-issue-with-GNU-ld-2.37.patch \
     "
 
 LIC_FILES_CHKSUM ?= "file://COPYING;md5=419739e325a50f3d7b4501338e44a4e5"
-- 
2.25.1

