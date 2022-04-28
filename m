Return-Path: <christopher.w.clark@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F0F3C433EF
	for <webhook@archiver.kernel.org>; Thu, 28 Apr 2022 00:06:31 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web08.4067.1651104381483235255
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 27 Apr 2022 17:06:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ChRYLy5R;
 spf=pass (domain: gmail.com, ip: 209.85.214.172,
 mailfrom: christopher.w.clark.io@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id q8so2924555plx.3
        for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 27 Apr 2022 17:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WW2UXpDBq3Fyja9306R/5mURvzPYymaIIXfq3+Bk0F4=;
        b=ChRYLy5RcA2gukNZwXnOU0kba2sfgTK7GX+oesEDDjiVKQzLdC3gsY1U7JPpqFeLWd
         VQGc8RuYa8Xl2BhDofvd8yN1ZADW3gAs9UsTUIMWu8o/4Np/D44sNtq8Se8WuR75klql
         SC9I/hF0e/GNXU0udJ8Whtc5AOIZ35cWvfP89YA5b6cBbYGx8m2c/loM9b695xfAqz/R
         cnGMqr1DcFD/CWWlLd6hg+lOiWRuyYf7+c1iRLkruRKYzt5Nv29b8wxPkfYou/pshVUw
         Ocdf49s8joPJwJ5BKTmb5Pz78V+zqY37o6Ix4Z3EF5OXkCGz20g1yJdZOgbKkXgl+T+Y
         29cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=WW2UXpDBq3Fyja9306R/5mURvzPYymaIIXfq3+Bk0F4=;
        b=ZdrhdvXnzPzpWVUD1RO4r2LHdHjpOVG+F1+oyD3KSL6g0agGcQTTz6X9VsidCx30EU
         aaWS7hziVI9Moq9O+VD4AjfJWSMvX0IAvMVVRejbuJR41veV0bM2NT+kZZmEhRJZGN5q
         81ZzHZBf4Ei7WcS/QFA8jFJFBvp80pXrbAbMOOPrfssmA7xKyuKJ6KlWdS1KB6yVD3uX
         AvqQ+oubZuujv+Nozuy6gm13a91q/sCyPN9fmDqLeAfz26h42N1RCCnRmY96//crkFXj
         DAqP741z/ZQVK3oHpIbX5SXTyTRGCMVW5CyJxhCihfwbmaCBla6O4Sl/t6hbwIHcz67O
         13xA==
X-Gm-Message-State: AOAM530WNRIaXoW3yHQu7bU5ThqNdU5H1VFCjS/STr/KTzZOPjP/zJey
	bYt3uA9+VzKR/4l49IBNkPtHuVjB/tzSNg==
X-Google-Smtp-Source: 
 ABdhPJx5RYgfZfEYqiJ1Ep+iUivCukErhQP4wdya29QRFKI76b+CqiLJXXjZPfVkMgnwvGjVSMMPZg==
X-Received: by 2002:a17:903:124a:b0:154:c7a4:9374 with SMTP id
 u10-20020a170903124a00b00154c7a49374mr31193336plh.68.1651104380928;
        Wed, 27 Apr 2022 17:06:20 -0700 (PDT)
Received: from cog-dev.home ([70.103.208.83])
        by smtp.gmail.com with ESMTPSA id
 h8-20020a17090a3d0800b001cd4989ff4asm4268239pjc.17.2022.04.27.17.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Apr 2022 17:06:20 -0700 (PDT)
Sender: Christopher Clark <christopher.w.clark.io@gmail.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	cardoe@cardoe.com,
	dpsmith@apertussolutions.com,
	scott.davis@starlab.io,
	Diego.Sueiro@arm.com,
	jdmason@kudzu.us
Subject: [meta-virtualization][PATCH v2 3/3] xen images,
 qemuboot: configure xenbr0 bridge for runqemu, testimage
Date: Wed, 27 Apr 2022 17:06:09 -0700
Message-Id: <20220428000609.26814-4-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220428000609.26814-1-christopher.w.clark@gmail.com>
References: <20220428000609.26814-1-christopher.w.clark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 28 Apr 2022 00:06:31 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7228

Networking for Xen guest virtual machines is commonly configured via
bridging in the host system between a physical interface and the
guest virtual interfaces.

To make it easier to test networking and use testimage with Xen guest
virtual machines, extend the bbclass that provides network configuration
for qemu machines for the Xen images to configure a Xen bridge and put
eth0 onto it when QB_XEN_HOST_BRIDGE is set.

Signed-off-by: Christopher Clark <christopher.clark@starlab.io>
---
- Changes since v1: revised Signed-off-by

 classes/qemuboot-testimage-network.bbclass   | 36 +++++++++++++++++++-
 recipes-extended/images/xen-image-minimal.bb |  2 ++
 2 files changed, 37 insertions(+), 1 deletion(-)

diff --git a/classes/qemuboot-testimage-network.bbclass b/classes/qemuboot-testimage-network.bbclass
index 18af1ee..57e0355 100644
--- a/classes/qemuboot-testimage-network.bbclass
+++ b/classes/qemuboot-testimage-network.bbclass
@@ -1,17 +1,51 @@
 # The recipe for init-ifupdown in core has a special-case for all
 # the Qemu MACHINES: it removes all external network interfaces
 # by default. However, eth0 is needed for testimage, so enable it here.
+
+# If QB_NETWORK_XEN_BRIDGE is set, configure bridging for the network.
+QB_NETWORK_XEN_BRIDGE ??= ""
+
 enable_runqemu_network() {
     : # no-op for non-qemu MACHINES
 }
+
 enable_runqemu_network:qemuall() {
+    # Do not override a network configuration for eth0 if one is present
     if ! grep -q eth0 "${IMAGE_ROOTFS}${sysconfdir}/network/interfaces" ; then
-        cat <<EOF >>${IMAGE_ROOTFS}${sysconfdir}/network/interfaces
+
+        # Xen host networking: use bridging to support guest networks
+        if [ -n "${QB_NETWORK_XEN_BRIDGE}" ] ; then
+            # Configure a Xen host network bridge and put eth0 on it
+            cat <<EOF >>${IMAGE_ROOTFS}${sysconfdir}/network/interfaces
+
+# Bridged host network for Xen testimage
+iface eth0 inet manual
+
+auto xenbr0
+iface xenbr0 inet dhcp
+	bridge_ports eth0
+EOF
+
+# Add a script to create the bridge and add eth0 if necessary
+            cat <<EOF >>${IMAGE_ROOTFS}${sysconfdir}/network/if-pre-up.d/xenbr0
+#!/bin/sh
+
+if [ "\$IFACE" = xenbr0 ]; then
+    brctl addbr xenbr0 || /bin/true
+    brctl addif xenbr0 eth0 || /bin/true
+    ifconfig eth0 up
+fi
+EOF
+            chmod 755 ${IMAGE_ROOTFS}${sysconfdir}/network/if-pre-up.d/xenbr0
+        else
+            # Just configure eth0
+            cat <<EOF >>${IMAGE_ROOTFS}${sysconfdir}/network/interfaces
 
 # Network for testimage
 auto eth0
 iface eth0 inet dhcp
 EOF
+        fi
     fi
 }
 ROOTFS_POSTPROCESS_COMMAND += 'enable_runqemu_network;'
diff --git a/recipes-extended/images/xen-image-minimal.bb b/recipes-extended/images/xen-image-minimal.bb
index c17c153..6609f81 100644
--- a/recipes-extended/images/xen-image-minimal.bb
+++ b/recipes-extended/images/xen-image-minimal.bb
@@ -34,6 +34,8 @@ XEN_ACPI_PROCESSOR_MODULE:x86-64 = "kernel-module-xen-acpi-processor"
 
 LICENSE = "MIT"
 
+QB_NETWORK_XEN_BRIDGE = "1"
+
 inherit core-image
 # Only inherit the qemuboot classes when building for a qemu machine
 QB_QEMU_CLASSES = ""
-- 
2.25.1


