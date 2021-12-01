Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web08.94491.1638376915732907539
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 01 Dec 2021 08:41:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aWXSn3/i;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id l25so104146610eda.11
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 01 Dec 2021 08:41:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pLzo2qkAEeA13LYifEtfxlo1JGP0yBc+YZ7MpHycEPE=;
        b=aWXSn3/i52/4FFFQ/MpEpW30eX+vcTZNOwcgE0ffVURBD9OtH43uZpwVjok4K+7/dx
         1TJ1HM7L/753migkEfM20dEKWUW8e8f/I9uNqXNEc8G2i38e+IeB20PNT9ZBmndu40cx
         YYni5yd8KhiJpJPs4Fuwf5A4kiSG6x3Xf1cXkWQXMf6Ti70cwyps8nLDxk9pdm0PDZ12
         sNJhRSGsXWa8xJ1MEkw+5HSbHUNe9m17IDX/d9Gj+klY1ZGwbNK1TYeXCvLQaRwY/Mjy
         dg2JVdZuHGDGPXlEkIxgOXq6qZDvUFUFJfCGMbIJGZwyNnoOYOA6SMHjy8i+YHC1J0b2
         0auA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pLzo2qkAEeA13LYifEtfxlo1JGP0yBc+YZ7MpHycEPE=;
        b=S5Ptt7jel8NFpfZQp/jLzgaxeR106/OxVYxAUFAYfP5wqm4OzlQXwxGefhn+GwE+AR
         d5t7E4AaZNdeYsidBRE4RNCBHdLgfHjgD3f4TS16kz+DkwFpUpbNvHdaL8FnziB1Xari
         qOb3qutK06kX8zzSK6X19xAnBXutJQNCOcdAE8WWBE5UsBGPNq9DE8hL7xS4xgyaIn83
         /ePrQeyffexIl9QstxVxrAhGnQd2uD7/ywW3wvLUg5sSOYal3F/oguWjpglJel4dEqPQ
         9gvWu4/h97XKHVhtVkEIM2fBPXyS1N6DbMW+uzjwJjGusRuZRtVkpjswoH3CJgY5VKIJ
         VKqQ==
X-Gm-Message-State: AOAM5326XQ2i6GoaXQpnixncAxoML/lfGJeOL6wKiTZHFoBjrD69/1e0
	9PA9T1Kb+bsydvN9MUlMRXK0GrePDnw=
X-Google-Smtp-Source: ABdhPJyBrkOGHn6DB2lOVed7dZzlZKsTkHn1soDKHTvapIL8Clh1IkvLq0tiruxWiE65U9GunmdTcQ==
X-Received: by 2002:a05:6402:27c7:: with SMTP id c7mr10159289ede.0.1638376912902;
        Wed, 01 Dec 2021 08:41:52 -0800 (PST)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id x15sm151784edq.65.2021.12.01.08.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Dec 2021 08:41:51 -0800 (PST)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-virtualization][hardknott][PATCH 09/13] dev86: depend on dev86-native for ifdefg
Date: Wed,  1 Dec 2021 17:41:32 +0100
Message-Id: <20211201164136.33802-9-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211201164136.33802-1-Martin.Jansa@gmail.com>
References: <20211201164136.33802-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...espect-LDFLAGS-when-building-bcc-cpp.patch | 23 ++++++++++++
 ...efg-from-dev86-native-instead-of-tar.patch | 36 +++++++++++++++++++
 recipes-extended/dev86/dev86_git.bb           | 17 ++++++---
 3 files changed, 71 insertions(+), 5 deletions(-)
 create mode 100644 recipes-extended/dev86/dev86/0001-cpp-Makefile-respect-LDFLAGS-when-building-bcc-cpp.patch
 create mode 100644 recipes-extended/dev86/dev86/0002-Makefile-use-ifdefg-from-dev86-native-instead-of-tar.patch

diff --git a/recipes-extended/dev86/dev86/0001-cpp-Makefile-respect-LDFLAGS-when-building-bcc-cpp.patch b/recipes-extended/dev86/dev86/0001-cpp-Makefile-respect-LDFLAGS-when-building-bcc-cpp.patch
new file mode 100644
index 0000000..fc7fdd5
--- /dev/null
+++ b/recipes-extended/dev86/dev86/0001-cpp-Makefile-respect-LDFLAGS-when-building-bcc-cpp.patch
@@ -0,0 +1,23 @@
+From 12f3a54801e15f3bdd5222ca1487f2fe36141c5d Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Fri, 14 May 2021 06:30:18 -0700
+Subject: [PATCH] cpp/Makefile: respect LDFLAGS when building bcc-cpp
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ cpp/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/cpp/Makefile b/cpp/Makefile
+index 0ea43cc..303b43c 100644
+--- a/cpp/Makefile
++++ b/cpp/Makefile
+@@ -3,7 +3,7 @@ CFLAGS=-Wall -Wstrict-prototypes
+ all: bcc-cpp
+ 
+ bcc-cpp: main.o cpp.o hash.o token1.o token2.o
+-	$(CC) $(CFLAGS) -o bcc-cpp main.o cpp.o hash.o token1.o token2.o
++	$(CC) $(CFLAGS) $(LDFLAGS) -o bcc-cpp main.o cpp.o hash.o token1.o token2.o
+ 
+ clean realclean:
+ 	rm -f bcc-cpp main.o cpp.o hash.o token1.o token2.o tmp.h
diff --git a/recipes-extended/dev86/dev86/0002-Makefile-use-ifdefg-from-dev86-native-instead-of-tar.patch b/recipes-extended/dev86/dev86/0002-Makefile-use-ifdefg-from-dev86-native-instead-of-tar.patch
new file mode 100644
index 0000000..52d5d59
--- /dev/null
+++ b/recipes-extended/dev86/dev86/0002-Makefile-use-ifdefg-from-dev86-native-instead-of-tar.patch
@@ -0,0 +1,36 @@
+From 9b347a5ee9604d4ec972506328ee44a0d8eb1bf0 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Fri, 14 May 2021 06:32:02 -0700
+Subject: [PATCH] Makefile: use ifdefg from dev86-native instead of target
+
+* recipe is restricted to:
+  COMPATIBLE_HOST = "(i.86|x86_64).*-linux"
+  so it's less likely to reproduce invalid combination of
+  host and target, but I guess if you have aarch64 build
+  machine and build for x86 then it might fail as for Bruce:
+
+| ./ifdefg -MU  makefile.in >tmp.mak
+| /bin/sh: 1: ./ifdefg: not found
+| make[1]: *** [Makefile:46: make.fil] Error 127
+
+  use ifdefg from native build to increase chances that it
+  will be compatible with your host system
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 8a61b65..7fdf861 100644
+--- a/Makefile
++++ b/Makefile
+@@ -43,7 +43,7 @@ realclean:
+ 	-for X in */; do cd $$X && make clean; cd $(WD); done
+ 
+ make.fil: $(IFDEFNAME) makefile.in
+-	./$(IFDEFNAME) -MU $(IFDEFOPTS) makefile.in >tmp.mak
++	$(IFDEFNAME) -MU $(IFDEFOPTS) makefile.in >tmp.mak
+ 	echo > tmp.sed
+ 	[ "$(BINDIR)" != "//bin" ] || echo >> tmp.sed "s:%BINDIR%:/bin:"
+ 	[ "$(LIBDIR)" != "//lib/bcc" ] || echo >> tmp.sed "s:%LIBDIR%:/lib/bcc:"
diff --git a/recipes-extended/dev86/dev86_git.bb b/recipes-extended/dev86/dev86_git.bb
index 476bf38..c987342 100644
--- a/recipes-extended/dev86/dev86_git.bb
+++ b/recipes-extended/dev86/dev86_git.bb
@@ -7,21 +7,23 @@ SECTION = "console/tools"
 BASE_PV="0.16.21"
 PV = "${BASE_PV}+git${SRCPV}"
 SRCREV = "e254e0b19651d3b8a20225b40281c9974a95dec4"
-SRC_URI = "git://github.com/jbruchon/${BPN}.git;protocol=https"
+SRC_URI = "git://github.com/jbruchon/${BPN}.git;protocol=https \
+    file://0001-cpp-Makefile-respect-LDFLAGS-when-building-bcc-cpp.patch \
+"
+SRC_URI_append_class-target = " \
+    file://0002-Makefile-use-ifdefg-from-dev86-native-instead-of-tar.patch \
+"
 
 S = "${WORKDIR}/git"
 
-DEPENDS = "gperf-native"
+DEPENDS = "gperf-native dev86-native"
 
 BBCLASSEXTEND = "native"
 EXTRA_OEMAKE = "VERSION=${BASE_PV} PREFIX=${prefix} DIST=${D} LDFLAGS='${LDFLAGS}'"
 
 do_compile() {
-	# ${S}/Makefile does respect LDFLAGS, but ${S}/cpp/Makefile doesn't when building bcc-cpp
-	sed -i 's#$(CC) $(CFLAGS) -o bcc-cpp#$(CC) $(CFLAGS) $(LDFLAGS) -o bcc-cpp#g' ${S}/cpp/Makefile
 	oe_runmake make.fil
 	oe_runmake -f make.fil bcc86 as86 ld86
-
 }
 
 do_install() {
@@ -33,8 +35,13 @@ do_install() {
 	oe_runmake install-bcc
 	ln -s ../lib/bcc/bcc-cpp ${D}${prefix}/bin/bcc-cpp
 	ln -s ../lib/bcc/bcc-cc1 ${D}${prefix}/bin/bcc-cc1
+}
 
+do_install_append_class-native() {
+        install -v -m 755 ${B}/ifdefg ${D}${bindir}
 }
+
 COMPATIBLE_HOST = "(i.86|x86_64).*-linux"
 FILES_${PN} += "${libdir}/bcc"
+
 INSANE_SKIP_${PN} = "already-stripped"
-- 
2.32.0

