Return-Path: <christopher.w.clark@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDEACC43217
	for <webhook@archiver.kernel.org>; Mon, 25 Apr 2022 19:26:10 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web08.1199.1650669791271286800
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 22 Apr 2022 16:23:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gV2lZVYY;
 spf=pass (domain: gmail.com, ip: 209.85.214.171,
 mailfrom: christopher.w.clark.io@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id s17so13993244plg.9
        for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 22 Apr 2022 16:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O9TXHtF8cr9Cuhrzy+6c/Kez3lx7xynXmQ+ToEqokI0=;
        b=gV2lZVYYKQP7m3K0Oqrf4ZvY4aBzito0UvVvbo4GjRTMaBv0XmtrJvK4FN8joqtwZM
         4kdFCcphQp2h+tKk/65Ma7dmDYB8n5DaRHh3at+QnOw6nHM8pAVghkhCTEEfTufiNNIt
         j+p0YdeR/yEDTdQR+/LrA46dmxtNrgi3ZI51s8ckRbq8Ol+WzsWJcvlNAnMpb5hMoZ0e
         0a4mBfDRadqrrgaGSDTSjKFMyHTwTsdRuTS49Fg4GW1BawWCZzFKZy25v0i1dmw8lHex
         aUV1xSpBBI+wf08HJK+T7lobd+bDdid0WVeKP2b6iDfj4LufFDZK958Fp6f2TLzs1BDi
         B3Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=O9TXHtF8cr9Cuhrzy+6c/Kez3lx7xynXmQ+ToEqokI0=;
        b=XMM8xvsrCa4rFbHncKkLz/I6X8XvbocI2tCew7ekkPaRdcBuaHziZFdfvH7ZUV2HaD
         k9OfUs30YsUv7wvTLONkFzYGD8t7vSwKv/a7oUE1LPMV17IxKZiZJu6LLEXC4Z/eu3hC
         SEf/CbIWb+JAQJY4V1XVW08cTtLCWV4pXoQlgf2yFklSwT6OiXyhLCfLK7L+9l9ssQFj
         XVwgI/FLN+j7/7sCLBu9kwcZzGemGN7bnGWsf/6A73Fp8Xw53CWd2WZQvbiwAZNTmd/a
         iyve1Z70XBs4FHb8/B31bx04XxY5yOJYbmZko8poeIeUdZ+CsN+BXeGIFivXC9yG4kz8
         gmpQ==
X-Gm-Message-State: AOAM530vw1qwdsYYdWmk0EWH/OWHeTiMvZOOQssPphgmaBpmbttntTK2
	33y4WvOjS1QqrdmAeaPou0ir0kunhE1J+w==
X-Google-Smtp-Source: 
 ABdhPJwMIxvpTNMl3IjPPgUKbHURI7q9OqVkrDSmZRZkNBH5M55Qhq3NPctSeFl4QHcg7hrWhP1DSQ==
X-Received: by 2002:a17:90b:3e82:b0:1d9:3195:f259 with SMTP id
 rj2-20020a17090b3e8200b001d93195f259mr94678pjb.150.1650669790489;
        Fri, 22 Apr 2022 16:23:10 -0700 (PDT)
Received: from cog-dev.ice.pyrology.org ([70.103.208.83])
        by smtp.gmail.com with ESMTPSA id
 c18-20020a056a000ad200b004cdccd3da08sm3827448pfl.44.2022.04.22.16.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Apr 2022 16:23:09 -0700 (PDT)
Sender: Christopher Clark <christopher.w.clark.io@gmail.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	cardoe@cardoe.com,
	dpsmith@apertussolutions.com,
	scott.davis@starlab.io
Subject: [meta-virtualization][PATCH] xen images,
 qemuboot: configure xenbr0 bridge for runqemu, testimage
Date: Fri, 22 Apr 2022 16:22:30 -0700
Message-Id: <20220422232230.61484-1-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 25 Apr 2022 19:26:10 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7215

Networking for Xen guest virtual machines is commonly configured via
bridging in the host system between a physical interface and the
guest virtual interfaces.

To make it easier to test networking and use testimage with Xen guest
virtual machines, extend the bbclass that provides network configuration
for qemu machines for the Xen images to configure a Xen bridge and put
eth0 onto it when QB_XEN_HOST_BRIDGE is set.

Signed-off-by: Christopher Clark <christopher.clark@starlab.io>
---
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
index f6fa5ed..ae6d913 100644
--- a/recipes-extended/images/xen-image-minimal.bb
+++ b/recipes-extended/images/xen-image-minimal.bb
@@ -34,6 +34,8 @@ XEN_ACPI_PROCESSOR_MODULE:x86-64 = "kernel-module-xen-acpi-processor"
 
 LICENSE = "MIT"
 
+QB_NETWORK_XEN_BRIDGE = "1"
+
 inherit core-image qemuboot-xen-defaults qemuboot-xen-dtb qemuboot-testimage-network
 
 do_check_xen_state() {
-- 
2.25.1


