Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web09.17549.1581311292314802723
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 09 Feb 2020 21:08:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FSdBIQbk;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: christopher.w.clark@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CCF8CE01711; Sun,  9 Feb 2020 21:08:11 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      (christopher.w.clark[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.214.171 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AFAD2E016B8
	for <meta-virtualization@yoctoproject.org>; Sun,  9 Feb 2020 21:08:09 -0800 (PST)
Received: by mail-pl1-f171.google.com with SMTP id ay11so2346138plb.0
        for <meta-virtualization@yoctoproject.org>; Sun, 09 Feb 2020 21:08:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=Iw/lo1QBdVWrKnq/tw32zCJNz87ZLZejPwWPtGpMyQk=;
        b=FSdBIQbkxFC6BmOHdM5yETutGGvUnULXftOHO8XhmQpiK1LUbCPODW7I6Popp2OwYB
         DUBNkPFk+VDK33vBceCtU4OrMwQrethPALVff6o5Ta6z5vWL3wgijy9ECXETuEqqUNyt
         +vkkNQJ2aFFt/6tn63PwG9fz3MjCt88Lx4H4tRKiL6Ba7idudaYizecbJLWV/s2xl6Ag
         RM0onuLqswG6GCgIwwSzIOn2cQgsMh191GFmXlzFSOHN4ejAvkCAC9SbFzTJa8IdekLB
         8Gk3t9BuOau+1l0OqHAw+zzE84xIyyrUUFN90Hq2GLYqZbX9tXTlNsc4svEsxq6nG8gA
         asyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Iw/lo1QBdVWrKnq/tw32zCJNz87ZLZejPwWPtGpMyQk=;
        b=T4Aa4N+mDwdX39ZkfKs5ECpW9pUmt1sQdDF5KQIckb7qDLD45KXBlKleLVL23TGwvs
         so2nTeMEN1I59hyUr6pBGc8W22GfeWJjMSE1zs559obs33dEVH0Sn5xG6mA5MmVfOrh7
         qOSwbjfkWtAr8P2cQUCcIuvd6/Nj6bhndEUJRxOR5mwYqVNfGpiAjsZ0wls3XEX+PuTS
         CxghcM0Uza+0SvwPZBgiNPPPYqUKpBRt2VcC0bmTnWk09SWZFWTh9gpyZe0eB6WfP5zn
         7ur3lYgqRUCofj3uIK/Nvft7oTe41H0vR9VxseC+ZplOZERFfdUI0VBgtrN/Ah/2aBYY
         Ri4Q==
X-Gm-Message-State: APjAAAUhrmZjGVmSI8dOt0orZcwTP/2hmHBR4KyYDOIT8IXd2gN8fKUc
	q/Iv0RvmP5kf39DosJ4dvhlepjA0
X-Google-Smtp-Source: APXvYqzE/Br4O2LACqxi+i5jTJDcv/7go2T/qbTgeFnFmM3OdqAnRe+pHXBasXYOWWSNXoFGG2fQQw==
X-Received: by 2002:a17:902:407:: with SMTP id 7mr10778835ple.226.1581311288659;
        Sun, 09 Feb 2020 21:08:08 -0800 (PST)
Received: from desktop.ice.pyrology.org (static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
        by smtp.gmail.com with ESMTPSA id 70sm10921120pgd.28.2020.02.09.21.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2020 21:08:07 -0800 (PST)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	Christopher Clark <christopher.w.clark@gmail.com>
Subject: [meta-virtualization][PATCH] seabios: upgrade to version 1.13.0 at official URI and switch to python3
Date: Sun,  9 Feb 2020 21:07:35 -0800
Message-Id: <20200210050754.3534-1-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.17.1

From: Christopher Clark <christopher.w.clark@gmail.com>

Use native python3 for the build as python2 no longer available.
Official seabios release SRC_URI fixes QA warning about using GitHub archives.

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
---
 recipes-extended/seabios/seabios/python3.patch      | 13 +++++++++++++
 .../{seabios_1.11.2.bb => seabios_1.13.0.bb}        | 13 ++++++++-----
 2 files changed, 21 insertions(+), 5 deletions(-)
 create mode 100644 recipes-extended/seabios/seabios/python3.patch
 rename recipes-extended/seabios/{seabios_1.11.2.bb => seabios_1.13.0.bb} (67%)

diff --git a/recipes-extended/seabios/seabios/python3.patch b/recipes-extended/seabios/seabios/python3.patch
new file mode 100644
index 0000000..a2786fd
--- /dev/null
+++ b/recipes-extended/seabios/seabios/python3.patch
@@ -0,0 +1,13 @@
+diff --git a/Makefile b/Makefile
+index 516cb38..7f6acaa 100644
+--- a/Makefile
++++ b/Makefile
+@@ -22,7 +22,7 @@ LD=$(CROSS_PREFIX)ld
+ OBJCOPY=$(CROSS_PREFIX)objcopy
+ OBJDUMP=$(CROSS_PREFIX)objdump
+ STRIP=$(CROSS_PREFIX)strip
+-PYTHON=python
++PYTHON=python3
+ CPP=$(CROSS_PREFIX)cpp
+ IASL:=iasl
+ LD32BIT_FLAG:=-melf_i386
diff --git a/recipes-extended/seabios/seabios_1.11.2.bb b/recipes-extended/seabios/seabios_1.13.0.bb
similarity index 67%
rename from recipes-extended/seabios/seabios_1.11.2.bb
rename to recipes-extended/seabios/seabios_1.13.0.bb
index 81eaec9..4cf4420 100644
--- a/recipes-extended/seabios/seabios_1.11.2.bb
+++ b/recipes-extended/seabios/seabios_1.13.0.bb
@@ -3,22 +3,25 @@ HOMEPAGE = "http://www.coreboot.org/SeaBIOS"
 LICENSE = "LGPLv3"
 SECTION = "firmware"
 
+inherit python3native
+
 SRC_URI = " \
-    https://github.com/qemu/seabios/archive/rel-${PV}.tar.gz \
+    https://www.seabios.org/downloads/seabios-${PV}.tar.gz \
     file://hostcc.patch \
+    file://python3.patch \
     "
-S = "${WORKDIR}/${PN}-rel-${PV}"
+S = "${WORKDIR}/${PN}-${PV}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504         \
                     file://COPYING.LESSER;md5=6a6a8e020838b23406c81b19c1d46df6  \
                     "
 
-SRC_URI[md5sum] = "3f78065837dbd8873513a1b7d5276e78"
-SRC_URI[sha256sum] = "73e73c8e406d97265782f6c942b3c1d178ed4f4afc9f381b22336c3968291693"
+SRC_URI[md5sum] = "1dc1725bac1d230bfd6b3204eed4f2f7"
+SRC_URI[sha256sum] = "37673dc2d6308591b15bdb94e5bcc3e99bdb40198d2247733c43f50b55dbe703"
 
 FILES_${PN} = "/usr/share/firmware"
 
-DEPENDS = "util-linux-native file-native bison-native flex-native gettext-native acpica-native python-native"
+DEPENDS += "util-linux-native file-native bison-native flex-native gettext-native acpica-native"
 
 TUNE_CCARGS = ""
 EXTRA_OEMAKE += "HOSTCC='${BUILD_CC}'"
-- 
2.17.1

