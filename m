Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.6574.1593482138958568887
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 29 Jun 2020 18:55:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Y839qX+p;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: christopher.w.clark@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CDA12E01DBE; Mon, 29 Jun 2020 18:55:38 -0700 (PDT)
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
	*      [209.85.160.196 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com [209.85.160.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2BB0DE01D76
	for <meta-virtualization@yoctoproject.org>; Mon, 29 Jun 2020 18:55:38 -0700 (PDT)
Received: by mail-qt1-f196.google.com with SMTP id j10so14441670qtq.11
        for <meta-virtualization@yoctoproject.org>; Mon, 29 Jun 2020 18:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=gYUPqfpU4XU+PG7OjGTUyji73fwHBevnhipV3d3helM=;
        b=Y839qX+puuC3XU93ItWXlnsZ8sMMNP4Pd0WlIy6IpBHSaNJsIir/I7XR2Hu7E/oJzc
         8eSasCSaZWoHqrdf40GswfNDwCCcIKOjko5yje4zRn0oU7W6PIEhXRqrSpKiCMLJwaNS
         7KCR15uB9Nf+N6DPiybdQdEyfBX3dGgWmCuksIbG+AvRvKSuDp13a44v2AEB4ElUHfxd
         6WqbyHXmO0ud8I3B+9nhgQ4Vq1r/b+PpK0jFC90niDEvty5ahJbNHu8EoNLkY+IEX3Rg
         UitFGAi/I6+5SGduz2Z2xKe1lSIdMVNqRKB0He1HsGkfYIKNCQwGLaLMlQABXtkHRYNG
         LsIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=gYUPqfpU4XU+PG7OjGTUyji73fwHBevnhipV3d3helM=;
        b=XAzs+xZGOaq7kwXCA62b3AD/cP1kmjuvooYXy63ynuohSXbWtJTlMgfz3CdZeGwZS3
         fuFTfC+iAei6NB5pvLaBdaP6S9pG81lNIA+h2WO2KZV7LnO13mhMXN+betQqDunvT5lb
         6cyE1IGwXYadBL5AVCRIhGtsmwd9Y8NBPVsw2N89ubpf9rx+EWk85T439jisY7uoZERg
         WdW47fx+MNqH5ptuzzF735OFlUB+KzULsVuynoQ/WJom5SdjDnekiPvk/HnXY2IalR+M
         G4b4j9N+VECHYB0z5xGBrkpwf8xe3fywrSGTHHbgcnewr3gl64jDh1UcPT3QQ3JS/r/H
         Kf5Q==
X-Gm-Message-State: AOAM530URodMVD9DkNTArlrMQCP7TUDiAG0hTPEg4mHYah/wK6FwjHgy
	ywY89b2Y6saINaQ9aUDn4BkA0/K4ZBM=
X-Google-Smtp-Source: ABdhPJwvz6pT0ZFwHF1lIbpJDOX8kjZk+j54tZ246YjuYSjraRc+i2tLjSFDi17VbBcWvPnFs2nlQQ==
X-Received: by 2002:aed:2462:: with SMTP id s31mr19517888qtc.188.1593482137390;
        Mon, 29 Jun 2020 18:55:37 -0700 (PDT)
Received: from localhost.localdomain (mobile-166-176-186-179.mycingular.net. [166.176.186.179])
        by smtp.gmail.com with ESMTPSA id t48sm1841794qtb.50.2020.06.29.18.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 18:55:37 -0700 (PDT)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@yoctoproject.org
Cc: cardoe@gentoo.org,
	bruce.ashfield@gmail.com,
	Bertrand.Marquis@arm.com,
	cminyard@mvista.com,
	Stewart.Hildebrand@dornerworks.com
Subject: [meta-virtualization][PATCH v2 01/11] xen: apply layer settings when xen DISTRO_FEATURE is enabled
Date: Mon, 29 Jun 2020 18:54:44 -0700
Message-Id: <20200630015454.10151-2-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200630015454.10151-1-christopher.w.clark@gmail.com>
References: <20200630015454.10151-1-christopher.w.clark@gmail.com>

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

