Return-Path: <cjp256@gmail.com>
Received: from mail-ie0-f172.google.com (mail-ie0-f172.google.com
	[209.85.223.172])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1AA56E0182F
	for <meta-virtualization@yoctoproject.org>;
	Thu,  7 Nov 2013 20:02:14 -0800 (PST)
Received: by mail-ie0-f172.google.com with SMTP id tp5so2462368ieb.31
	for <meta-virtualization@yoctoproject.org>;
	Thu, 07 Nov 2013 20:02:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=TGmVtWA43rwv6WPWH2s5QOMU5UMNGpRQQTcRJajPIws=;
	b=v7gEyEh5HOy4mawlhvt8dGx2tylU6aX5dYN2pZeYHacjfS84C9aVqEli2OCftWy97m
	QiooP27SmwF9XInpMUEBKCnse114qXndheE1uP+8c3OoIdKL21hFvmmL0mMT4VUsznOQ
	zf6FAYCpnjoQdDYUlYfpVa2ZvdJ34Vkp4m43pKmJeXPj6tl7xKSZ0g+aNfT3xRAh2S74
	SI2goQgGzSg+AiZdQcqkafYAgz8lnkdJ/1TPal3pRo4NauG08n3p2RtNOcpfvh8CrDHG
	Vyf19p6kTYf+9ymP5Y2L04nGmMke8UzdXvpAjZFXo6GRluOld/TQDF3W5U8yg6wk0jdp
	vexw==
X-Received: by 10.43.98.202 with SMTP id cp10mr7628213icc.28.1383883334168;
	Thu, 07 Nov 2013 20:02:14 -0800 (PST)
Received: from hatchery.local (cpe-74-71-215-22.twcny.res.rr.com.
	[74.71.215.22])
	by mx.google.com with ESMTPSA id hv5sm1230089igb.9.2013.11.07.20.02.12
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Nov 2013 20:02:13 -0800 (PST)
From: Chris Patterson <cjp256@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Thu,  7 Nov 2013 23:00:59 -0500
Message-Id: <1383883267-31992-3-git-send-email-cjp256@gmail.com>
X-Mailer: git-send-email 1.8.4.rc3
In-Reply-To: <1383883267-31992-1-git-send-email-cjp256@gmail.com>
References: <1383883267-31992-1-git-send-email-cjp256@gmail.com>
Subject: [PATCH v2 02/10] xen: remove 4.1.2 recipe and patches
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
X-List-Received-Date: Fri, 08 Nov 2013 04:02:16 -0000

Signed-off-by: Chris Patterson <cjp256@gmail.com>
---
 .../xen/xen-4.1.2/allow_disable_xend.patch         | 75 ----------------------
 recipes-extended/xen/xen_4.1.2.bb                  | 24 -------
 2 files changed, 99 deletions(-)
 delete mode 100644 recipes-extended/xen/xen-4.1.2/allow_disable_xend.patch
 delete mode 100644 recipes-extended/xen/xen_4.1.2.bb

diff --git a/recipes-extended/xen/xen-4.1.2/allow_disable_xend.patch b/recipes-extended/xen/xen-4.1.2/allow_disable_xend.patch
deleted file mode 100644
index 3318704..0000000
--- a/recipes-extended/xen/xen-4.1.2/allow_disable_xend.patch
+++ /dev/null
@@ -1,75 +0,0 @@
---- xen-4.1.2/config/StdGNU.mk.sav	2012-03-08 12:30:26.047303578 -0700
-+++ xen-4.1.2/config/StdGNU.mk	2012-03-08 12:31:48.826696508 -0700
-@@ -56,6 +56,9 @@
- XEN_CONFIG_DIR = $(CONFIG_DIR)/xen
- XEN_SCRIPT_DIR = $(XEN_CONFIG_DIR)/scripts
- 
-+# Allow xend to be disabled in lieu of only libxl
-+CONFIG_ENABLE_XEND ?= y
-+
- SOCKET_LIBS =
- CURSES_LIBS = -lncurses
- PTHREAD_LIBS = -lpthread
---- xen-4.1.2/tools/Makefile.sav	2012-03-08 11:25:10.177301492 -0700
-+++ xen-4.1.2/tools/Makefile	2012-03-08 12:33:48.807302767 -0700
-@@ -15,7 +15,7 @@
- SUBDIRS-$(CONFIG_X86) += firmware
- SUBDIRS-$(ACM_SECURITY) += security
- SUBDIRS-y += console
--SUBDIRS-y += xenmon
-+SUBDIRS-$(CONFIG_ENABLE_XEND) += xenmon
- SUBDIRS-$(VTPM_TOOLS) += vtpm_manager
- SUBDIRS-$(VTPM_TOOLS) += vtpm
- SUBDIRS-y += xenstat
-@@ -36,17 +36,19 @@
- 
- SUBDIRS-y += xenpmd
- SUBDIRS-y += libxl
--SUBDIRS-y += remus
-+SUBDIRS-$(CONFIG_ENABLE_XEND) += remus
- SUBDIRS-$(CONFIG_X86) += xenpaging
- SUBDIRS-$(CONFIG_X86) += debugger/gdbsx
- SUBDIRS-$(CONFIG_X86) += debugger/kdd
- 
- # These don't cross-compile
- ifeq ($(XEN_COMPILE_ARCH),$(XEN_TARGET_ARCH))
-+ifneq ($(XEN_ENABLE_XEND),y)
- SUBDIRS-$(PYTHON_TOOLS) += python
- SUBDIRS-$(PYTHON_TOOLS) += pygrub
- SUBDIRS-$(OCAML_TOOLS) += ocaml
- endif
-+endif
- 
- # For the sake of linking, set the sys-root
- ifneq ($(CROSS_COMPILE),)
---- xen-4.1.2/tools/misc/Makefile.sav	2012-03-08 12:23:10.107321955 -0700
-+++ xen-4.1.2/tools/misc/Makefile	2012-03-08 12:34:54.466721729 -0700
-@@ -19,11 +19,13 @@
- SUBDIRS-$(CONFIG_MINITERM) += miniterm
- SUBDIRS := $(SUBDIRS-y)
- 
--INSTALL_BIN-y := xencons
-+INSTALL_BIN-y :=
-+INSTALL_BIN-$(CONFIG_ENABLE_XEND) += xencons
- INSTALL_BIN-$(CONFIG_X86) += xen-detect
- INSTALL_BIN := $(INSTALL_BIN-y)
- 
--INSTALL_SBIN-y := xm xen-bugtool xen-python-path xend xenperf xsview xenpm xen-tmem-list-parse gtraceview gtracestat xenlockprof xenwatchdogd
-+INSTALL_SBIN-y := xenperf xsview xenpm xen-tmem-list-parse gtraceview gtracestat xenlockprof xenwatchdogd
-+INSTALL_SBIN-$(CONFIG_ENABLE_XEND) += xm xend xsview xen-python-path xen-bugtool
- INSTALL_SBIN-$(CONFIG_X86) += xen-hvmctx xen-hvmcrash
- INSTALL_SBIN-$(CONFIG_MIGRATE) += xen-hptool
- INSTALL_SBIN := $(INSTALL_SBIN-y)
---- xen-4.1.2/tools/hotplug/NetBSD/Makefile.sav	2012-03-08 12:54:56.247306596 -0700
-+++ xen-4.1.2/tools/hotplug/NetBSD/Makefile	2012-03-08 12:57:50.337339410 -0700
-@@ -8,7 +8,9 @@
- XEN_SCRIPTS += vif-ip
- 
- XEN_SCRIPT_DATA =
--XEN_RCD_PROG = rc.d/xencommons rc.d/xend rc.d/xendomains rc.d/xen-watchdog
-+XEN_RCD_PROG-y := rc.d/xencommons rc.d/xendomains rc.d/xen-watchdog
-+XEN_RCD_PROG-$(CONFIG_ENABLE_XEND) += rc.d/xend 
-+XEN_RCD_PROG := $(XEN_RCD_PROG-y)
- 
- .PHONY: all
- all:
diff --git a/recipes-extended/xen/xen_4.1.2.bb b/recipes-extended/xen/xen_4.1.2.bb
deleted file mode 100644
index 5a87bc4..0000000
--- a/recipes-extended/xen/xen_4.1.2.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-# Xen official download
-
-require xen.inc
-
-PR="r1"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=f46a39d9fa181e4933b1acdfdcd72017"
-
-SRCREV = "3cf61880403b4e484539596a95937cc066243388"
-
-SRC_URI = "http://bits.xensource.com/oss-xen/release/${PV}/xen-${PV}.tar.gz \
-        git://xenbits.xensource.com/qemu-xen-4.1-testing.git \
-        file://ioemu-cross-gl-check.patch \
-        file://allow_disable_xend.patch \
-        file://xend-config.sxp \
-        file://xenminiinit.sh"
-
-SRC_URI[md5sum] = "73561faf3c1b5e36ec5c089b5db848ad"
-SRC_URI[sha256sum] = "7d9c93057cf480d3f1efa792b19285a84fa3c06060ea5c5c453be00887389b0d"
-
-S = "${WORKDIR}/xen-${PV}"
-
-# Include python and xend support
-require xen-python.inc
-- 
1.8.4.rc3


