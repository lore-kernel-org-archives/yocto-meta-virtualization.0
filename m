Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web08.94494.1638376924804020047
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 01 Dec 2021 08:42:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gue1Z8QG;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id r25so38776071edq.7
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 01 Dec 2021 08:42:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=n5WwEaYM9NtWLxebbuc31fqLb4rLcbrpPZwGsxim1/Y=;
        b=gue1Z8QG+qxxvMqe5fMuGyVSyPdhlnxLYef2RroEdvPiLcLnYFj9XRA4C4NthWzQO+
         a0AKau539TiU0AvkI/yJtjea2R7M3rJMyQ0TtItwsigfIgUR6ItGqg5wmNWMUHkK8fda
         +Hpgq2JeFZrEiE0YmW8PvAZgPe0rFAI0d1je/FPhzvhq0WwrzGCtznOKhqn0LHRvT63r
         O4czJ8H3s31Bi2nMugdG6qu82Hm5qWDpMU3BCpbeY0K5MaVP4z68y5a/jW1iJxqrnrIb
         3Ytpi6huTeE+cMpxxn6fU64k7ZgpiDzzg2pTm3yVe6Q8qsxqjAq/6QIqw+2GrvYCzbx7
         4vJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=n5WwEaYM9NtWLxebbuc31fqLb4rLcbrpPZwGsxim1/Y=;
        b=WPzCFzcCTYoxACwGu1usMr5RmxtNgK5QLE0hVHZWgCXGHX4+AJVYJgdIR+5RqiduL7
         r/4hGJtvRYyvSZOfN9U1yadrHqRePkoI7bsMMDLWUIjdXdsvhL2+tHMevF09cmZfwo8W
         eL2TfL2i2jTPkdKnddEhaOgwQro4hp9DujX0Uf4l/YQZgsZioE9UMnsQ/QQpq3bRfo+m
         CaO1adQTFg7c7hallqHUQN0T/1s9lbRNNcgR/s1PZ8c8ukMIGPYUOZvJogLxIidM6duN
         47O+qX1E6AV865x2mMRim14/tC60eTYqSJVhOJoVjM1tSdm+QWscu5+6bQx8P0boAnto
         8jlA==
X-Gm-Message-State: AOAM5309Rl6NkG9cOk8r3xk+8qu67ZHjV8+m5UpDr7cgiWH1a6Ij+8I1
	ZFuE4AY65F/7QEaJUl1Esbk/LYvzQZo=
X-Google-Smtp-Source: ABdhPJzhcqSQ5+IlMGA55oh/dz/Jd0XlL+QYvTFXRX0LGVLFNELoYF1VMn/J+vB7O9M16ZuU/QYcHg==
X-Received: by 2002:a17:907:a411:: with SMTP id sg17mr8343470ejc.84.1638376920094;
        Wed, 01 Dec 2021 08:42:00 -0800 (PST)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id s18sm181300edd.15.2021.12.01.08.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Dec 2021 08:41:59 -0800 (PST)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Ross Burton <ross@burtonini.com>,
	Ross Burton <ross.burton@arm.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [meta-virtualization][hardknott][PATCH 13/13] dev86: don't require dev86-native to build dev86
Date: Wed,  1 Dec 2021 17:41:36 +0100
Message-Id: <20211201164136.33802-13-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211201164136.33802-1-Martin.Jansa@gmail.com>
References: <20211201164136.33802-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross@burtonini.com>

Instead of installing binaries and patching the makefiles to run external commands, simply
build ifdef using BUILD_CC instead of CC.

This patch is now upstreamable, the recipe is less complicated, and nativesdk works.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 ...efg-from-dev86-native-instead-of-tar.patch | 36 -------------------
 recipes-extended/dev86/dev86/cross.patch      | 29 +++++++++++++++
 recipes-extended/dev86/dev86_git.bb           | 12 ++-----
 3 files changed, 32 insertions(+), 45 deletions(-)
 delete mode 100644 recipes-extended/dev86/dev86/0002-Makefile-use-ifdefg-from-dev86-native-instead-of-tar.patch
 create mode 100644 recipes-extended/dev86/dev86/cross.patch

diff --git a/recipes-extended/dev86/dev86/0002-Makefile-use-ifdefg-from-dev86-native-instead-of-tar.patch b/recipes-extended/dev86/dev86/0002-Makefile-use-ifdefg-from-dev86-native-instead-of-tar.patch
deleted file mode 100644
index 52d5d59..0000000
--- a/recipes-extended/dev86/dev86/0002-Makefile-use-ifdefg-from-dev86-native-instead-of-tar.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 9b347a5ee9604d4ec972506328ee44a0d8eb1bf0 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Fri, 14 May 2021 06:32:02 -0700
-Subject: [PATCH] Makefile: use ifdefg from dev86-native instead of target
-
-* recipe is restricted to:
-  COMPATIBLE_HOST = "(i.86|x86_64).*-linux"
-  so it's less likely to reproduce invalid combination of
-  host and target, but I guess if you have aarch64 build
-  machine and build for x86 then it might fail as for Bruce:
-
-| ./ifdefg -MU  makefile.in >tmp.mak
-| /bin/sh: 1: ./ifdefg: not found
-| make[1]: *** [Makefile:46: make.fil] Error 127
-
-  use ifdefg from native build to increase chances that it
-  will be compatible with your host system
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index 8a61b65..7fdf861 100644
---- a/Makefile
-+++ b/Makefile
-@@ -43,7 +43,7 @@ realclean:
- 	-for X in */; do cd $$X && make clean; cd $(WD); done
- 
- make.fil: $(IFDEFNAME) makefile.in
--	./$(IFDEFNAME) -MU $(IFDEFOPTS) makefile.in >tmp.mak
-+	$(IFDEFNAME) -MU $(IFDEFOPTS) makefile.in >tmp.mak
- 	echo > tmp.sed
- 	[ "$(BINDIR)" != "//bin" ] || echo >> tmp.sed "s:%BINDIR%:/bin:"
- 	[ "$(LIBDIR)" != "//lib/bcc" ] || echo >> tmp.sed "s:%LIBDIR%:/lib/bcc:"
diff --git a/recipes-extended/dev86/dev86/cross.patch b/recipes-extended/dev86/dev86/cross.patch
new file mode 100644
index 0000000..041a8d3
--- /dev/null
+++ b/recipes-extended/dev86/dev86/cross.patch
@@ -0,0 +1,29 @@
+Build ifdef using BUILD_CC, not CC.
+
+Upstream-Status: Pending
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+diff --git a/Makefile b/Makefile
+index 8a61b65..99f41de 100644
+--- a/Makefile
++++ b/Makefile
+@@ -22,6 +22,10 @@ CFLAGS=  -O
+ IFDEFNAME= ifdef
+ WD=$(shell pwd)
+ 
++BUILD_CC ?= $(CC)
++BUILD_CFLAGS ?= $(CFLAGS)
++BUILD_LDFLAGS ?= $(LDFLAGS)
++
+ # Some makes take the last of a list as the default ...
+ all: make.fil
+ 	PATH="`pwd`/bin:$$PATH" $(MAKE) -f make.fil VERSION=$(VERSION) TOPDIR=`pwd` $@
+@@ -65,7 +69,7 @@ make.fil: $(IFDEFNAME) makefile.in
+ 	@rm -f tmp.mak tmp.sed
+ 
+ $(IFDEFNAME): ifdef.c
+-	$(CC) $(IFDEFARCH) $(CFLAGS) $(IFDEFFLAGS) $(LDFLAGS) -o $(IFDEFNAME) ifdef.c
++	$(BUILD_CC) $(IFDEFARCH) $(BUILD_CFLAGS) $(IFDEFFLAGS) $(BUILD_LDFLAGS) -o $(IFDEFNAME) ifdef.c
+ 
+ uninstall:
+ 	@echo 'Sorry, no go; it was just wrong.'
diff --git a/recipes-extended/dev86/dev86_git.bb b/recipes-extended/dev86/dev86_git.bb
index ad7a0df..838918a 100644
--- a/recipes-extended/dev86/dev86_git.bb
+++ b/recipes-extended/dev86/dev86_git.bb
@@ -11,16 +11,14 @@ SRC_URI = "git://github.com/jbruchon/${BPN}.git;protocol=https \
     file://0001-cpp-Makefile-respect-LDFLAGS-when-building-bcc-cpp.patch \
     file://0003-cpp-update-token1.tok-to-make-new-gperf-happy-regen..patch \
     file://0004-regen-token2.h-token1.h-with-gperf-3.1.patch \
-"
-SRC_URI_append_class-target = " \
-    file://0002-Makefile-use-ifdefg-from-dev86-native-instead-of-tar.patch \
+	file://cross.patch \
 "
 
 S = "${WORKDIR}/git"
 
-DEPENDS = "gperf-native dev86-native"
+DEPENDS = "gperf-native"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
 EXTRA_OEMAKE = "VERSION=${BASE_PV} PREFIX=${prefix} DIST=${D} LDFLAGS='${LDFLAGS}' INEXE=''"
 
 do_compile() {
@@ -41,8 +39,4 @@ do_install() {
 	ln -s ../lib/bcc/bcc-cc1 ${D}${prefix}/bin/bcc-cc1
 }
 
-do_install_append_class-native() {
-        install -v -m 755 ${B}/ifdefg ${D}${bindir}
-}
-
 FILES_${PN} += "${libdir}/bcc"
-- 
2.32.0

