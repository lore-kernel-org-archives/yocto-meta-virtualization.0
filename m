Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.7053.1635944498233492962
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 03 Nov 2021 06:01:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: richard.neill@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B7254D6E;
	Wed,  3 Nov 2021 06:01:36 -0700 (PDT)
Received: from e125927.arm.com (unknown [10.57.26.74])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 04C0D3F7B4;
	Wed,  3 Nov 2021 06:01:35 -0700 (PDT)
From: "Richard Neill" <richard.neill@arm.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [meta-virtualization] [PATCH] k3s: Add additional required kernel modules
Date: Wed,  3 Nov 2021 13:01:11 +0000
Message-Id: <20211103130111.24625-1-richard.neill@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Adds the following kernel modules for k3s:

* xt-physdev
* xt-nflog
* xt-limit
* nfnetlink-log

Without them, the k3s network-policy-controller reports failures in the l=
og
related to iptables-restore.

Signed-off-by: Richard Neill <richard.neill@arm.com>
---
 recipes-containers/k3s/k3s_git.bb               | 4 ++++
 recipes-kernel/linux/linux-yocto/kubernetes.cfg | 8 ++++++--
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/recipes-containers/k3s/k3s_git.bb b/recipes-containers/k3s/k=
3s_git.bb
index e341ad7..4e1cf64 100644
--- a/recipes-containers/k3s/k3s_git.bb
+++ b/recipes-containers/k3s/k3s_git.bb
@@ -96,6 +96,10 @@ RRECOMMENDS:${PN} =3D "\
                      kernel-module-vxlan \
                      kernel-module-xt-masquerade \
                      kernel-module-xt-statistic \
+                     kernel-module-xt-physdev \
+                     kernel-module-xt-nflog \
+                     kernel-module-xt-limit \
+                     kernel-module-nfnetlink-log \
                      "

 RCONFLICTS:${PN} =3D "kubectl"
diff --git a/recipes-kernel/linux/linux-yocto/kubernetes.cfg b/recipes-ke=
rnel/linux/linux-yocto/kubernetes.cfg
index 2d4e1f5..84fa8c5 100644
--- a/recipes-kernel/linux/linux-yocto/kubernetes.cfg
+++ b/recipes-kernel/linux/linux-yocto/kubernetes.cfg
@@ -13,9 +13,14 @@ CONFIG_IP_VS_NFCT=3Dy
 CONFIG_IP_VS_PROTO_TCP=3Dy
 CONFIG_IP_VS_PROTO_UDP=3Dy
 CONFIG_IP_VS_RR=3Dm
+CONFIG_NETFILTER_NETLINK_LOG=3Dm
+CONFIG_NETFILTER_XT_CONNMARK=3Dm
 CONFIG_NETFILTER_XT_MATCH_COMMENT=3Dm
+CONFIG_NETFILTER_XT_MATCH_LIMIT=3Dm
 CONFIG_NETFILTER_XT_MATCH_MARK=3Dm
-CONFIG_NETFILTER_XT_CONNMARK=3Dm
+CONFIG_NETFILTER_XT_MATCH_PHYSDEV=3Dm
+CONFIG_NETFILTER_XT_TARGET_NFLOG=3Dm
+CONFIG_NETFILTER_XT_TARGET_REDIRECT=3Dm
 CONFIG_NAMESPACES=3Dy
 CONFIG_NET_NS=3Dy
 CONFIG_PID_NS=3Dy
@@ -32,4 +37,3 @@ CONFIG_MEMCG=3Dy
 CONFIG_INET=3Dy
 CONFIG_EXT4_FS=3Dy
 CONFIG_PROC_FS=3Dy
-CONFIG_NETFILTER_XT_TARGET_REDIRECT=3Dm
--
2.25.1

