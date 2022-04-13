Return-Path: <richard.neill@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6036DC38A2C
	for <webhook@archiver.kernel.org>; Wed, 13 Apr 2022 15:48:07 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.4140.1649841381659746178
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 13 Apr 2022 02:16:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: richard.neill@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4EFC113D5;
	Wed, 13 Apr 2022 02:16:20 -0700 (PDT)
Received: from e125927.arm.com (unknown [10.57.8.121])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9C2993F5A1;
	Wed, 13 Apr 2022 02:16:19 -0700 (PDT)
From: Richard Neill <richard.neill@arm.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [meta-virtualization] [PATCH] k3s: Add missing IP Virtual Server
 (ip_vs) feature to the kernel config
Date: Wed, 13 Apr 2022 10:16:47 +0100
Message-Id: <20220413091647.3749-1-richard.neill@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 13 Apr 2022 15:48:07 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7165

K3s (and Kubernetes) supports load balancing via IPVS, and by default rep=
orts
errors when IPVS kernel modules cannot be loaded.

This patch adds the missing reported kernel modules to the k3s recipe, an=
d
orders the kernel module list alphabetically:

    * ip-vs
    * ip-vs-rr
    * ip-vs-wrr
    * ip-vs-sh

The modules are configured by including the ip_vs kernel feature.

Signed-off-by: Richard Neill <richard.neill@arm.com>
---
 recipes-containers/k3s/k3s_git.bb             | 22 +++++++++++--------
 .../linux/linux-yocto/kubernetes.scc          |  1 +
 2 files changed, 14 insertions(+), 9 deletions(-)

diff --git a/recipes-containers/k3s/k3s_git.bb b/recipes-containers/k3s/k=
3s_git.bb
index e2a3ffc..0b56e3c 100644
--- a/recipes-containers/k3s/k3s_git.bb
+++ b/recipes-containers/k3s/k3s_git.bb
@@ -2690,20 +2690,24 @@ RDEPENDS:${PN}-server =3D "${PN}"
 RDEPENDS:${PN}-agent =3D "${PN}"

 RRECOMMENDS:${PN} =3D "\
+                     kernel-module-ip-vs \
+                     kernel-module-ip-vs-rr \
+                     kernel-module-ip-vs-sh \
+                     kernel-module-ip-vs-wrr \
+                     kernel-module-nfnetlink-log \
+                     kernel-module-vxlan \
                      kernel-module-xt-addrtype \
-                     kernel-module-xt-nat \
-                     kernel-module-xt-multiport \
-                     kernel-module-xt-conntrack \
                      kernel-module-xt-comment \
-                     kernel-module-xt-mark \
                      kernel-module-xt-connmark \
-                     kernel-module-vxlan \
+                     kernel-module-xt-conntrack \
+                     kernel-module-xt-limit \
+                     kernel-module-xt-mark \
                      kernel-module-xt-masquerade \
-                     kernel-module-xt-statistic \
-                     kernel-module-xt-physdev \
+                     kernel-module-xt-multiport \
+                     kernel-module-xt-nat \
                      kernel-module-xt-nflog \
-                     kernel-module-xt-limit \
-                     kernel-module-nfnetlink-log \
+                     kernel-module-xt-physdev \
+                     kernel-module-xt-statistic \
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


