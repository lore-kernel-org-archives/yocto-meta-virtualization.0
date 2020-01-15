Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
 by mx.groups.io with SMTP id smtpd.web12.2386.1579125264079224590
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 15 Jan 2020 13:54:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agner.ch header.s=dkim header.b=dNDLvOg+;
 spf=pass (domain: agner.ch, ip: 178.209.48.109, mailfrom: stefan@agner.ch)
Received: from localhost.localdomain (31-10-206-124.static.upc.ch [31.10.206.124])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 0BD255C686C;
	Wed, 15 Jan 2020 22:54:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1579125259;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:content-type:content-transfer-encoding:
	 in-reply-to:references; bh=eBtxXTwOYXjo+zGccRGwECt5WlXbP61uwtDQJ+ylRBc=;
	b=dNDLvOg+tTeXOcD+3BJz6Dle0fo3DxMaCNz1JruESwSZu0aY6u9ck5ECgXy2pVBEizwLKG
	ZQiJAjx6pfwd//pFtkitKXu81U3/tg6ufyOCdLjYnNvxPOY+i2kPM7xamqJTrUqewNIzCQ
	Z5XKeLS/iDZ9xxF7A/H34jn5AweCeZQ=
From: "Stefan Agner" <stefan@agner.ch>
To: meta-virtualization@lists.yoctoproject.org
Cc: stefan@agner.ch,
	timothy.t.orling@linux.intel.com,
	Stefan Agner <stefan.agner@toradex.com>
Subject: [meta-virtualization][zeus][PATCH 1/2] conmon: bump to version 2.0.2
Date: Wed, 15 Jan 2020 21:54:13 +0000
Message-Id: <20200115215414.16007-1-stefan@agner.ch>
X-Mailer: git-send-email 2.17.1

From: Stefan Agner <stefan.agner@toradex.com>

Bump to latest version 2.0.2. This also makes our Makefile fix obsolete
as the fix has been aplied upstream.

Already Podman 1.6.0 actually recommended 2.0.1 and higher, with 1.6.3
this has been made mandatory. Use conmon 2.0.2 which is also used in
podmans build Dockerfile of the 1.6.4 release.

Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
---
 .../{conmon_2.0.0.bb => conmon_2.0.2.bb}      |  3 +-
 ...ail-if-clean-is-called-without-a-bui.patch | 31 -------------------
 2 files changed, 1 insertion(+), 33 deletions(-)
 rename recipes-containers/conmon/{conmon_2.0.0.bb => conmon_2.0.2.bb} (83%)
 delete mode 100644 recipes-containers/conmon/files/0001-Makefile-don-t-fail-if-clean-is-called-without-a-bui.patch

diff --git a/recipes-containers/conmon/conmon_2.0.0.bb b/recipes-containers/conmon/conmon_2.0.2.bb
similarity index 83%
rename from recipes-containers/conmon/conmon_2.0.0.bb
rename to recipes-containers/conmon/conmon_2.0.2.bb
index f4e2cd6..378c309 100644
--- a/recipes-containers/conmon/conmon_2.0.0.bb
+++ b/recipes-containers/conmon/conmon_2.0.2.bb
@@ -6,10 +6,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=61af0b6932ea7b12fb9142721043bc77"
 
 DEPENDS = "glib-2.0"
 
-SRCREV = "e217fdff82e0b1a6184a28c43043a4065083407f"
+SRCREV = "65fe0226d85b69fc9e527e376795c9791199153d"
 SRC_URI = "\
     git://github.com/containers/conmon.git \
-    file://0001-Makefile-don-t-fail-if-clean-is-called-without-a-bui.patch \
 "
 
 SRC_URI[md5sum] = "5c711911d766d76813333c3812277574"
diff --git a/recipes-containers/conmon/files/0001-Makefile-don-t-fail-if-clean-is-called-without-a-bui.patch b/recipes-containers/conmon/files/0001-Makefile-don-t-fail-if-clean-is-called-without-a-bui.patch
deleted file mode 100644
index 8d2b473..0000000
--- a/recipes-containers/conmon/files/0001-Makefile-don-t-fail-if-clean-is-called-without-a-bui.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 6ef63dfcc65d5401bc7cc7170d569cefcdadcb38 Mon Sep 17 00:00:00 2001
-From: Stefan Agner <stefan@agner.ch>
-Date: Fri, 30 Aug 2019 17:49:22 +0200
-Subject: [PATCH] Makefile: don't fail if clean is called without a build
-
-Do not fail when calling the clean target without building first.
-
-Upstream-Status: Backport
-
-Signed-off-by: Stefan Agner <stefan@agner.ch>
----
- Makefile | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index fb0e4fb..b525595 100644
---- a/Makefile
-+++ b/Makefile
-@@ -66,8 +66,7 @@ bin:
- 
- .PHONY: clean
- clean:
--	rm -f bin/conmon src/*.o
--	rmdir bin
-+	rm -rf bin/ src/*.o
- 
- .PHONY: install install.bin install.crio install.podman podman crio
- install: install.bin
--- 
-2.23.0
-
-- 
2.17.1

