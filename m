Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
 by mx.groups.io with SMTP id smtpd.web10.91.1600803949558858961
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 22 Sep 2020 12:45:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HIPabKJv;
 spf=pass (domain: gmail.com, ip: 209.85.160.194, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f194.google.com with SMTP id v54so16598718qtj.7
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 22 Sep 2020 12:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Pi5ZzHn5AozVNezpchaUR4xRsunxwJulYSvzmaxzv+M=;
        b=HIPabKJvOxlmxh358l16cA6le/U7iJ/d4UhNB584lIUhkcLgUD++f9PHldVLoKe4NP
         wLxE/kOChQ8OYRZK62PiY+UAXJ2V6ke3vIAG+CiyIoRxwfdsnDpKN5CfqphirjktpsQ6
         fS+veRTV7rDnC1mpdd8GS9hJ0SUysYR0MJWPCz2MkRr0noheFXc8dwa+UTXU31EpUppD
         XfWM1OvStXDqfRpwPstRtJTrt8KzWzXVJVJjHj8Smq+FFteosV0aZhn36L6WbrvBRFk4
         avh/wA1Lxvwkq8tJmBRjUMfO1Z1mdyceL/roKGXOvXOD1unrNeUYVGGjbhXT78l+Pc6X
         /QnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Pi5ZzHn5AozVNezpchaUR4xRsunxwJulYSvzmaxzv+M=;
        b=I6uoSkQof/xj01eThFp9rAZO1fvGIbDWKXt38nWT+8vkRGj8diDhVSaonTgHk863Fw
         7LU3FfylIPCOptg/YFj9LAW9oPdam04/aj1Gvq7JVOFDo+zyoFmB88mPf1VqcTImafm5
         wjKkU4sC+jXzdKgFMO7pYg5vgyZK4ShuvgvKhAbBS0UswOFXoJs3OGnByssYxy4ucytx
         5+5aWpKAnKQBkpGfz/gdfWpztQMokLqV2Rs7JEKXnj2BwOo50gHJ52qYLniJg17B4JCt
         glxamTKkOgg5tDCgMdkZnWnsaq3S9jb+3ssbIa+QerWfoRYX73ya0ieIc0uK1g+PdE+Z
         gh5g==
X-Gm-Message-State: AOAM531p1je8ZxWsYUbpe4h8crIy+PCcpmLFpuqlf9aJ9UUlcrQCuvZp
	wyV00coOYJOEtWArTMdDn0Zzc4i7CCJ16Gac
X-Google-Smtp-Source: ABdhPJxHr3hLYbxkahEJ0CYmoGQAVDrQq3jHQVBkoZbXkwQIUpHUFx4zzE+Qu7F4sVdj+l9ABK6/eg==
X-Received: by 2002:ac8:53d1:: with SMTP id c17mr6289540qtq.135.1600803948379;
        Tue, 22 Sep 2020 12:45:48 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id t43sm13538513qtc.54.2020.09.22.12.45.47
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2020 12:45:47 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [PATCH 3/7] busybox: add initrd variant
Date: Tue, 22 Sep 2020 15:45:35 -0400
Message-Id: <20200922194539.51933-3-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20200922194539.51933-1-bruce.ashfield@gmail.com>
References: <20200922194539.51933-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@xilinx.com>

Add a busybox variant that inherits almost all of its support from
the core busybox recipe, but adds configuration values that are
appropriate to be used in an initrd.

In particular:

  - we build busybox statically
  - we enable runlevel and init functionality
  - mdev is always enabled
  - applet install support is enabled

Signed-off-by: Bruce Ashfield <bruce.ashfield@xilinx.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../busybox/busybox-initrd/initrd.cfg         | 14 +++++++++++++
 recipes-core/busybox/busybox-initrd/runx.cfg  |  1 +
 recipes-core/busybox/busybox-initrd_1.32.0.bb | 20 +++++++++++++++++++
 3 files changed, 35 insertions(+)
 create mode 100644 recipes-core/busybox/busybox-initrd/initrd.cfg
 create mode 100644 recipes-core/busybox/busybox-initrd/runx.cfg
 create mode 100644 recipes-core/busybox/busybox-initrd_1.32.0.bb

diff --git a/recipes-core/busybox/busybox-initrd/initrd.cfg b/recipes-core/busybox/busybox-initrd/initrd.cfg
new file mode 100644
index 0000000..9f64c4c
--- /dev/null
+++ b/recipes-core/busybox/busybox-initrd/initrd.cfg
@@ -0,0 +1,14 @@
+CONFIG_INIT=y
+CNOFIG_FEATURE_UTMP=y
+CONFIG_RUNLEVEL=y
+CONFIG_FEATURE_USE_INITTAB=y
+CONFIG_HALT=y
+CONFIG_POWEROFF=y
+CONFIG_FEATURE_KILL_DELAY=0
+CONFIG_TELINIT_PATH=""
+CONFIG_INIT_TERMINAL_TYPE=""
+
+# CONFIG_FEATURE_SHADOWPASSWDS is not set
+CONFIG_USE_BB_PWD_GRP=y
+
+CONFIG_STATIC=y
diff --git a/recipes-core/busybox/busybox-initrd/runx.cfg b/recipes-core/busybox/busybox-initrd/runx.cfg
new file mode 100644
index 0000000..1f1ac6a
--- /dev/null
+++ b/recipes-core/busybox/busybox-initrd/runx.cfg
@@ -0,0 +1 @@
+CONFIG_FEATURE_INSTALLER=y
diff --git a/recipes-core/busybox/busybox-initrd_1.32.0.bb b/recipes-core/busybox/busybox-initrd_1.32.0.bb
new file mode 100644
index 0000000..82edb57
--- /dev/null
+++ b/recipes-core/busybox/busybox-initrd_1.32.0.bb
@@ -0,0 +1,20 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/busybox-initrd:${COREBASE}/meta/recipes-core/busybox/busybox:${COREBASE}/meta/recipes-core/busybox/files:"
+
+require recipes-core/busybox/busybox_${PV}.bb
+
+SRC_URI += "file://init.cfg \
+            file://mdev.cfg \
+            file://runx.cfg \
+            file://initrd.cfg"
+
+S = "${WORKDIR}/busybox-${PV}"
+
+# override security-flags settings, we have some warnings to ignore
+SECURITY_STRINGFORMAT = ""
+
+# we do this to get the target binary available to recipes that
+# depend on busybox
+SYSROOT_DIRS += "/bin"
+BUSYBOX_SPLIT_SUID = "0"
+
+FILES_${PN} += "${sysconfdir}/init.d/*"
-- 
2.19.1

