Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.4796.1593065097761064681
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 24 Jun 2020 23:04:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WhsNcuk+;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: christopher.w.clark@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9E594E01D78; Wed, 24 Jun 2020 23:04:57 -0700 (PDT)
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
	*      [209.85.222.196 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E73CDE01D75
	for <meta-virtualization@yoctoproject.org>; Wed, 24 Jun 2020 23:04:56 -0700 (PDT)
Received: by mail-qk1-f196.google.com with SMTP id z63so4312691qkb.8
        for <meta-virtualization@yoctoproject.org>; Wed, 24 Jun 2020 23:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=gYUPqfpU4XU+PG7OjGTUyji73fwHBevnhipV3d3helM=;
        b=WhsNcuk+hrQwahMW9veX5WIoJY7iSRZU2oPJvAP9NowkFiFN1DiUj3JiN1BoscR6ND
         A8Ff5/kLR6NcY5Ouzl9msK4WmROxD2kpzb5k7Zpko5jn571vHI6H3OSpo2q/fqEkfBh2
         ZgHvL7fLEX2Jq6uZ1VAYNr1WGhZ1LsS1LrdaDb+QRtpXUz38wCcfredxdsoCM7A2x5HX
         4gKIq4s4yesXg2bIJBBbe/BYQTdaTSZM8T+OjE7yd13XypNX1Hy7OUglP09CXLgvyLmh
         JWNNMvNG2PsyY1k+ackn/Rd3hYEnm+5nLkrq+qcnnUNQQBRJXflyDNpZZERC+EwhK/hr
         Lmyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=gYUPqfpU4XU+PG7OjGTUyji73fwHBevnhipV3d3helM=;
        b=JUna87xg0R+HudyMcxc4izCrLI++iVPyujnIuJsZ9JQGuxNE9+bTEEaGAcCpXWBjxO
         +l+CfqwpO5qpRvSP8G7fV4rp9XGzlj7kGzZIQI2KguBZ/OhXExdkEvJJiD6Yrrg7AP4X
         E+lxQ9SyQWKxjzPsRNpB93TGoUEfjsH/FPNhupMXcXpo+0pQEUggKgKqOA09GKMHp08l
         IlyVuwBsmDGCpKfYUb+0p6D9jD5uBOPT4jY8vdyTQD1ewMnkhqdK4Zotgpb/fET4a1Vo
         JxxF+ixGoYT2YUT9bdxDYv7vH2Al5Idh/ryjiBDGgxD86SgMlua2qqKiA9h/pCeHAZyj
         Ikwg==
X-Gm-Message-State: AOAM531uQZo8/x0YBFdI9iIfL6/tf7f/43aKW9L/5jYDwsQkOT/HBU7O
	iSb+UKZ8F20Y3ZhXH3prMxsug8pOHGM=
X-Google-Smtp-Source: ABdhPJwXL/36ewIl49rZHwdk7j0eOEZIOkI3oVwFDlC7GXURLDM9l6ig1XcOCwtzx7QDVQiwAAgpuQ==
X-Received: by 2002:a37:9dd6:: with SMTP id g205mr19969683qke.352.1593065096053;
        Wed, 24 Jun 2020 23:04:56 -0700 (PDT)
Received: from localhost.localdomain (mobile-166-176-184-6.mycingular.net. [166.176.184.6])
        by smtp.gmail.com with ESMTPSA id g5sm6059161qta.46.2020.06.24.23.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2020 23:04:55 -0700 (PDT)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@yoctoproject.org
Cc: cardoe@gentoo.org,
	bruce.ashfield@gmail.com,
	Bertrand.Marquis@arm.com,
	cminyard@mvista.com,
	Stewart.Hildebrand@dornerworks.com
Subject: [meta-virtualization][PATCH 01/10] xen: apply layer settings when xen DISTRO_FEATURE is enabled
Date: Wed, 24 Jun 2020 23:04:22 -0700
Message-Id: <20200625060431.31826-2-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200625060431.31826-1-christopher.w.clark@gmail.com>
References: <20200625060431.31826-1-christopher.w.clark@gmail.com>

These settings are necessary for Xen and enabling them here, using the
same mechanism that is used by k8s in this layer, simplifies building
images for Xen.

- Ensure that Xen mode is enabled in QEMU.
- On ARM platforms: enable Flattened Device Tree (FDT) support.

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
---
 classes/meta-virt-xen-cfg.bbclass     | 6 ++++++
 conf/distro/include/meta-virt-xen.inc | 6 ++++++
 conf/layer.conf                       | 4 +++-
 3 files changed, 15 insertions(+), 1 deletion(-)
 create mode 100644 classes/meta-virt-xen-cfg.bbclass
 create mode 100644 conf/distro/include/meta-virt-xen.inc

diff --git a/classes/meta-virt-xen-cfg.bbclass b/classes/meta-virt-xen-cfg.bbclass
new file mode 100644
index 0000000..61b32aa
--- /dev/null
+++ b/classes/meta-virt-xen-cfg.bbclass
@@ -0,0 +1,6 @@
+# We need to load the Xen meta-virt config components, only if "xen"
+# is in the distro features.  Since we don't know the distro flags during
+# layer.conf load time, we delay using a special bbclass that simply includes
+# the META_VIRT_XEN_CONFIG_PATH file.
+
+include ${@bb.utils.contains('DISTRO_FEATURES', 'xen', '${META_VIRT_XEN_CONFIG_PATH}', '', d)}
diff --git a/conf/distro/include/meta-virt-xen.inc b/conf/distro/include/meta-virt-xen.inc
new file mode 100644
index 0000000..a92b08b
--- /dev/null
+++ b/conf/distro/include/meta-virt-xen.inc
@@ -0,0 +1,6 @@
+# Make sure Xen mode is enabled in qemu
+PACKAGECONFIG_append_pn-qemu = " xen"
+
+# For builds for ARM platforms, enable fdt
+PACKAGECONFIG_append_pn-qemu_arm = " fdt"
+PACKAGECONFIG_append_pn-qemu_aarch64 = " fdt"
diff --git a/conf/layer.conf b/conf/layer.conf
index 697fb62..142621c 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -43,8 +43,10 @@ INHERIT += "sanity-meta-virt"
 # We need to load the meta-virt config components, only if "virtualization"
 # is in the distro features.  Since we don't know the distro flags during
 # layer.conf load time, we delay using a special bbclass that simply includes
-# the META_VIRT_CONFIG_PATH file, and likewise for the k8s configs
+# the META_VIRT_CONFIG_PATH file, and likewise for the Xen and k8s configs
 META_VIRT_CONFIG_PATH = "${LAYERDIR}/conf/distro/include/meta-virt-default-versions.inc"
+META_VIRT_XEN_CONFIG_PATH = "${LAYERDIR}/conf/distro/include/meta-virt-xen.inc"
 K8S_CONFIG_PATH = "${LAYERDIR}/conf/distro/include/k8s-versions.inc"
 USER_CLASSES_append = " meta-virt-cfg"
 USER_CLASSES_append = " meta-virt-k8s-cfg"
+USER_CLASSES_append = " meta-virt-xen-cfg"
-- 
2.17.1

