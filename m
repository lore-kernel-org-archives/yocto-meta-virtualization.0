Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.166.1582676192040513247
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 25 Feb 2020 16:16:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NIr0/dzu;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: christopher.w.clark@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E0EFEE016E9; Tue, 25 Feb 2020 16:16:31 -0800 (PST)
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
	*      [209.85.210.171 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BEBFBE016B5
	for <meta-virtualization@yoctoproject.org>; Tue, 25 Feb 2020 16:16:30 -0800 (PST)
Received: by mail-pf1-f171.google.com with SMTP id k29so435792pfp.13
        for <meta-virtualization@yoctoproject.org>; Tue, 25 Feb 2020 16:16:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Iw/lo1QBdVWrKnq/tw32zCJNz87ZLZejPwWPtGpMyQk=;
        b=NIr0/dzu892aFqi2WwY0Ag1GydmZuWlCaJXCAw/78Yv32g8r9MCU3aF9slei39Cr+q
         PMS9SYbSUYcS05k9Uu0I7qGfJ+tsaFSDylLaSbNaCqo5ZwqqLzYQICGCRNPRZytO156S
         vscpGXUskA5ZYNLVByKV2PlfL6uCOmo6zxZjpfsvP9KJdhm3UQuwnfdi5LnBAFtOdliJ
         lNYvXX55gDxmKcQXPOGoJSLKhHyWV47mvoBWzQw4V9J4w9zHuLKkui/MRdMNoPNsS8YP
         FR6ChPb5TmAeKq07nompnC4UEkc/wxa7BFvdHLFqyJNZrFYQvUdbZpFDwB4dcATB3Zx0
         6GDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Iw/lo1QBdVWrKnq/tw32zCJNz87ZLZejPwWPtGpMyQk=;
        b=jxdGVXE6S3wG18VfBocGGi0qgOY/1QV26Hr/RfTArgxd8NA1F9ImrUoGjbQgrLYawr
         Ss3019lg49Q9QzG2g9Y1NcCqIWijm5foa8vD4DTWhoJuYxs9FOe+l/EbJ0OopcJBN84t
         m5NDB5lU9l4ZnWW04GJNu678Desx+UKisgUVwXukQILvtaEgVIltf5yAR01SnmNVaJoL
         +JN1+SUtrJOfRwZB3IfE9JihfbmbhUzCjvlGhHih2RNljHCtdtFR7Jrk8zW29hmfhSfC
         y7tQ9z5RgXFyR7bjZ+bY+QruoIVJVARcpMVoR3enMuKcMgcqcqRQjRshUS4Ey9MKocDA
         9jSw==
X-Gm-Message-State: APjAAAU/j/vNZUkCQUBsqLWsizdv3tTrLV6Yh9p2vlL1oG+omfOpmlDq
	UAaSx0ovZOQZSvvL6Qjj0B7dmL4k
X-Google-Smtp-Source: APXvYqxoYZlxe1Krr8EQwjiGHpV+ytGQvP727jXJuRd2QB1i1W47Ar5djEKyxxrtoCEfdgwxfwUrfA==
X-Received: by 2002:a63:3689:: with SMTP id d131mr1044544pga.250.1582676189694;
        Tue, 25 Feb 2020 16:16:29 -0800 (PST)
Received: from desktop.ice.pyrology.org (static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
        by smtp.gmail.com with ESMTPSA id x11sm235177pfn.53.2020.02.25.16.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2020 16:16:28 -0800 (PST)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	cardoe@gentoo.org
Subject: [meta-virtualization][PATCH v3 01/22] seabios: upgrade to version 1.13.0 at official URI and switch to python3
Date: Tue, 25 Feb 2020 16:15:45 -0800
Message-Id: <20200226001606.14750-2-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200226001606.14750-1-christopher.w.clark@gmail.com>
References: <20200226001606.14750-1-christopher.w.clark@gmail.com>

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

