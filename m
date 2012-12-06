Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-ea0-f176.google.com (mail-ea0-f176.google.com
	[209.85.215.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 67242E006C9
	for <meta-virtualization@yoctoproject.org>;
	Thu,  6 Dec 2012 09:06:51 -0800 (PST)
Received: by mail-ea0-f176.google.com with SMTP id d13so2862177eaa.35
	for <meta-virtualization@yoctoproject.org>;
	Thu, 06 Dec 2012 09:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=QfOQ+mfGnBhHmXz42WSyFZ0J9x/Ork4kf2CGHQ25ab0=;
	b=VYTHAJKai3/HUZLiMOiJpvl/1TrOqzTS+pf0tKy7FEyhCJJrDpF81bAETqKFWOQjmf
	YNDPMxj5WAvled6bqOmnGO2QxzqbGnbcJaIj9y9s7LDifJKzND8kbxe2l5ezyupiJ7+4
	7K5bLtW80i2ixaQnA2TInqXadiAuBcuoAejyKYX3ZDL+xT46LzzjOmWW/CFbTfjEnVnz
	uoigvopwJjcpmNl+QQIT2UQ9N8UpnCUgRbdDauR27VidM0rG3to4Qmb5JCnjfmYgD2Nn
	qLNgGeckj/AdsqQNbEDqjXjw800yLLjLs+viXx1kwayTZ1eS+m9B64NqAIYIPqIMYFpe
	gTiQ==
Received: by 10.14.0.133 with SMTP id 5mr7448435eeb.29.1354813611095;
	Thu, 06 Dec 2012 09:06:51 -0800 (PST)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPS id 6sm4977180eea.3.2012.12.06.09.06.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 06 Dec 2012 09:06:50 -0800 (PST)
Received: by nysan (Postfix, from userid 1000)
	id 616604011C8; Thu,  6 Dec 2012 18:06:40 +0100 (CET)
From: david.c.nystrom@gmail.com
To: meta-virtualization@yoctoproject.org
Date: Thu,  6 Dec 2012 18:06:36 +0100
Message-Id: <1354813596-8233-16-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1354813596-8233-1-git-send-email-david.nystrom@enea.com>
References: <1354813596-8233-1-git-send-email-david.nystrom@enea.com>
MIME-Version: 1.0
Subject: [PATCHv4 15/15] Added LxC recipe from meta-fsl-ppc, curtesy of Matthew McClintock, Stuart Yoder
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
X-List-Received-Date: Thu, 06 Dec 2012 17:06:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: David Nyström <david.nystrom@enea.com>

---
 recipes-containers/lxc/files/noldconfig.patch |   29 ++++++++++++++++++
 recipes-containers/lxc/lxc_0.8.0.bb           |   39 +++++++++++++++++++++++++
 2 files changed, 68 insertions(+)
 create mode 100644 recipes-containers/lxc/files/noldconfig.patch
 create mode 100644 recipes-containers/lxc/lxc_0.8.0.bb

diff --git a/recipes-containers/lxc/files/noldconfig.patch b/recipes-containers/lxc/files/noldconfig.patch
new file mode 100644
index 0000000..5edff46
--- /dev/null
+++ b/recipes-containers/lxc/files/noldconfig.patch
@@ -0,0 +1,29 @@
+From a8aa8d131a7140d5625c24c9f4c28c605213552c Mon Sep 17 00:00:00 2001
+From: Andrey Mazo <ahippo@yandex.ru>
+Date: Fri, 18 May 2012 21:11:22 +0400
+Subject: [PATCH] Avoid ldconfig due to cross-compilation problems.
+
+Make required symlinks manually.
+Otherwise, it cases problems on cbuild endianness != ctarget endianness
+setups because /sbin/ldconfig expects elf header in the wrong endianness.
+---
+ src/lxc/Makefile.am |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/src/lxc/Makefile.am b/src/lxc/Makefile.am
+index 1c26952..3b84c1a 100644
+--- a/src/lxc/Makefile.am
++++ b/src/lxc/Makefile.am
+@@ -125,8 +125,8 @@ lxc_kill_SOURCES = lxc_kill.c
+ 
+ install-exec-local: install-soPROGRAMS
+ 	mv $(DESTDIR)$(libdir)/liblxc.so $(DESTDIR)$(libdir)/liblxc.so.$(VERSION)
+-	/sbin/ldconfig -l $(DESTDIR)$(libdir)/liblxc.so.$(VERSION)
+ 	cd $(DESTDIR)$(libdir); \
++	ln -sf liblxc.so.$(VERSION) liblxc.so.$(firstword $(subst ., ,$(VERSION))); \
+ 	ln -sf liblxc.so.$(firstword $(subst ., ,$(VERSION))) liblxc.so
+ 
+ uninstall-local:
+-- 
+1.7.3.4
+
diff --git a/recipes-containers/lxc/lxc_0.8.0.bb b/recipes-containers/lxc/lxc_0.8.0.bb
new file mode 100644
index 0000000..c662cb1
--- /dev/null
+++ b/recipes-containers/lxc/lxc_0.8.0.bb
@@ -0,0 +1,39 @@
+DESCRIPTION = "lxc aims to use these new functionnalities to provide an userspace container object"
+SECTION = "console/utils"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
+PRIORITY = "optional"
+PR = "r2"
+DEPENDS = "libxml2 libcap"
+RDEPENDS_${PN} = " \
+		rsync \
+		gzip \
+		libcap-bin \
+		bridge-utils \
+		dnsmasq \
+		perl-module-strict \
+		perl-module-getopt-long \
+		perl-module-vars \
+		perl-module-warnings-register \
+		perl-module-exporter \
+		perl-module-constant \
+		perl-module-overload \
+		perl-module-exporter-heavy \
+"
+
+SRC_URI = "http://lxc.sourceforge.net/download/lxc/${PN}-${PV}.tar.gz \
+	file://noldconfig.patch \
+	"
+SRC_URI[md5sum] = "7304fa57146ce687f749b5df876bb20d"
+SRC_URI[sha256sum] = "eac833730b94e423d4bef6834bc4a716437d2abd6ab8b24334c506aaaa08692c"
+
+S = "${WORKDIR}/${PN}-${PV}"
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[doc] = "--enable-doc,--disable-doc"
+PACKAGECONFIG[rpath] = "--enable-rpath,--disable-rpath"
+PACKAGECONFIG[apparmour] = "--enable-apparmor,--disable-apparmor,apparmor,apparmor"
+
+inherit autotools
+
+FILES_${PN}-dbg += "${libexecdir}/lxc/.debug"
-- 
1.7.9.5


