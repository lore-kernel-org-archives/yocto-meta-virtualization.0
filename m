Return-Path: <richard.neill@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC2B4C636FC
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:56 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.9941.1649931389749917169
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 14 Apr 2022 03:16:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: richard.neill@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 779C5139F;
	Thu, 14 Apr 2022 03:16:28 -0700 (PDT)
Received: from e125927.arm.com (unknown [10.57.12.94])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A9A1B3F5A1;
	Thu, 14 Apr 2022 03:16:27 -0700 (PDT)
From: Richard Neill <richard.neill@arm.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [meta-virtualization] [PATCH] k3s: Add missing IP Virtual Server
 (ip_vs) feature to the kernel config
Date: Thu, 14 Apr 2022 11:17:12 +0100
Message-Id: <20220414101712.19354-1-richard.neill@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 14 Apr 2022 16:03:56 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7174

K3s (and Kubernetes) supports load balancing via IPVS, and by default rep=
orts
errors when IPVS kernel modules cannot be loaded.

This patch adds the missing reported kernel modules to the k3s recipe:

    * ip-vs
    * ip-vs-rr
    * ip-vs-wrr
    * ip-vs-sh

The modules are configured by including the ip_vs kernel feature.

Signed-off-by: Richard Neill <richard.neill@arm.com>
---
 recipes-containers/k3s/k3s_git.bb               | 4 ++++
 recipes-kernel/linux/linux-yocto/kubernetes.scc | 1 +
 2 files changed, 5 insertions(+)

diff --git a/recipes-containers/k3s/k3s_git.bb b/recipes-containers/k3s/k=
3s_git.bb
index 53a8677..a20092c 100644
--- a/recipes-containers/k3s/k3s_git.bb
+++ b/recipes-containers/k3s/k3s_git.bb
@@ -2704,6 +2704,10 @@ RRECOMMENDS:${PN} =3D "\
                      kernel-module-xt-nflog \
                      kernel-module-xt-limit \
                      kernel-module-nfnetlink-log \
+                     kernel-module-ip-vs \
+                     kernel-module-ip-vs-rr \
+                     kernel-module-ip-vs-sh \
+                     kernel-module-ip-vs-wrr \
                      "

 RCONFLICTS:${PN} =3D "kubectl"
diff --git a/recipes-kernel/linux/linux-yocto/kubernetes.scc b/recipes-ke=
rnel/linux/linux-yocto/kubernetes.scc
index 1e93b70..a94ae84 100644
--- a/recipes-kernel/linux/linux-yocto/kubernetes.scc
+++ b/recipes-kernel/linux/linux-yocto/kubernetes.scc
@@ -1,2 +1,3 @@
 include docker.scc
+include cgl/cfg/net/ip_vs.scc
 kconf non-hardware kubernetes.cfg
--
2.25.1


