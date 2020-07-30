Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.1550.1596129667891520771
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 30 Jul 2020 10:21:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=t1YdHn5r;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: christopher.w.clark@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BCBC1E01F52; Thu, 30 Jul 2020 10:21:07 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: 
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.222.195 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      (christopher.w.clark[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 20C8EE01F50
	for <meta-virtualization@yoctoproject.org>; Thu, 30 Jul 2020 10:21:07 -0700 (PDT)
Received: by mail-qk1-f195.google.com with SMTP id 11so26355748qkn.2
        for <meta-virtualization@yoctoproject.org>; Thu, 30 Jul 2020 10:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=nSLsdCmEak6f2cNrtSiInCnXVTEzvTubIozIXq9PMHo=;
        b=t1YdHn5r4IjVoF/nXJzWhyofwb5GRx/ZBCgTkLFb/WcCGylFmkxBSpFUWEMYXxTzIj
         QauPOhMV/ThqnukjmNFkB2lFFTuOXiF9SFu7n++0R/SKAZyipmt0Ms8dLGM5gAxsPxLo
         vgEsoQoFvXyX2/uVEzrasWi8IdPcNiEI9l7in16RpSZ7zGYP6RVD+4hmQSfMwN4iPlxv
         kflj1IgbAOzP/uVAI1JiuTT9DYLtpQWfe5aBfmQG3kfxgivWDP+kBbmB2J4zc3P6C1yF
         Ufs/ac5Z/nuJQSDGXoSh08Jx4fk0xsCf3lom0GyH734Ad89VSxRLvDydqbRh6aUpnssU
         f+BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=nSLsdCmEak6f2cNrtSiInCnXVTEzvTubIozIXq9PMHo=;
        b=WOieU3zsyJHOowiGa4igEwk/W38VqeUXhJWCGjL12Zf8xI84uENzauvmp1PC7m5zHI
         MOVh63b9D+Yo6GA2wt7GmFi40Kj2fe5CcT+E1/cucUQ6UvJf8CmbKJ9iDW1qm6+sDH1X
         CP15FRjMuxmWz9px40HF7SXrtd4EcpQiqqTIQ7M1VldKyHlsP9XBHN+PqUECQM30ObW5
         5sQNtNY5IK5OWniAAZXL//YU2lQBo7EJQgPrDvRxkFGFwItmMNkxEyiZpXkvnkbP0uEw
         CSowdMNYuUXwndLZR8P9T9TaBEqDZUBTeLbnaADsHOCS+hLdXEBeMZvKT8M8qzai4idX
         cxCw==
X-Gm-Message-State: AOAM533PO85kQHyVEB6pACU8J82Wd6NkYtYQafACwreGcCRitX+69UA5
	qZp27SS6Xi4mNgQpEk3aMC8aVkzZ
X-Google-Smtp-Source: ABdhPJzZPUH5AH8R9zSqacdRkYg/YSNi7+8OnXyWwg1QHLbOO14Z8L9TP5eBeKsaEfwzqiL5WmaNxQ==
X-Received: by 2002:a37:4981:: with SMTP id w123mr219066qka.57.1596129666444;
        Thu, 30 Jul 2020 10:21:06 -0700 (PDT)
Received: from localhost.localdomain (mobile-166-176-187-239.mycingular.net. [166.176.187.239])
        by smtp.gmail.com with ESMTPSA id g3sm1279073qtq.70.2020.07.30.10.21.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2020 10:21:05 -0700 (PDT)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	cardoe@gentoo.org
Subject: [meta-virtualization][PATCH 3/3] xen, xen-tools: move tools-specific EXTRA_OECONF to xen-tools.inc
Date: Thu, 30 Jul 2020 10:20:41 -0700
Message-Id: <20200730172041.32126-3-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200730172041.32126-1-christopher.w.clark@gmail.com>
References: <20200730172041.32126-1-christopher.w.clark@gmail.com>

From: Christopher Clark <christopher.w.clark@gmail.com>

Since the hypervisor recipe does not install init scripts, it does not
include update-rc.d.bbclass, which defines INIT_D_DIR; so move the use
of that and systemd and qemu tools-specific configure settings over into
the tools include file. Fix a hardcoded bindir while at it.

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
---
 recipes-extended/xen/xen-tools.inc | 8 ++++++++
 recipes-extended/xen/xen.inc       | 5 -----
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/recipes-extended/xen/xen-tools.inc b/recipes-extended/xen/xen-tools.inc
index 99e7e0b..ace1a01 100644
--- a/recipes-extended/xen/xen-tools.inc
+++ b/recipes-extended/xen/xen-tools.inc
@@ -730,6 +730,14 @@ ADD_SYSROOT32_CFLAGS_x86-64 = \
 # This x86-64 override is never intended for native use, so clear that.
 ADD_SYSROOT32_CFLAGS_class-native = ""
 
+EXTRA_OECONF += " \
+    --with-systemd=${systemd_unitdir}/system \
+    --with-systemd-modules-load=${systemd_unitdir}/modules-load.d \
+    --with-initddir=${INIT_D_DIR} \
+    --with-sysconfig-leaf-dir=default \
+    --with-system-qemu=${bindir}/qemu-system-i386 \
+    "
+
 do_configure() {
     do_configure_common
 
diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index 3c1e3b9..9e8fcad 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -118,17 +118,12 @@ EXTRA_OECONF += " \
     --exec-prefix=${prefix} \
     --prefix=${prefix} \
     --host=${HOST_SYS} \
-    --with-systemd=${systemd_unitdir}/system \
-    --with-systemd-modules-load=${systemd_unitdir}/modules-load.d \
     --disable-stubdom \
     --disable-ioemu-stubdom \
     --disable-pv-grub \
     --disable-xenstore-stubdom \
     --disable-rombios \
     --disable-ocamltools \
-    --with-initddir=${INIT_D_DIR} \
-    --with-sysconfig-leaf-dir=default \
-    --with-system-qemu=/usr/bin/qemu-system-i386 \
     --disable-qemu-traditional \
     "
 
-- 
2.17.1

