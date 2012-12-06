Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-ee0-f68.google.com (mail-ee0-f68.google.com [74.125.83.68])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8C899E0145B
	for <meta-virtualization@yoctoproject.org>;
	Thu,  6 Dec 2012 06:03:55 -0800 (PST)
Received: by mail-ee0-f68.google.com with SMTP id b45so1267195eek.11
	for <meta-virtualization@yoctoproject.org>;
	Thu, 06 Dec 2012 06:03:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=j/3yLcRR7EU89cMC8rMHS9fa2t/4i/1z7UXQud077Vk=;
	b=S6q2D24GMKDOQkhyne5hkEreSSg+s8TvsNMhKAu68ECICm0qDQFoWtk6oZQyyQf6kV
	cARBCaAMwtexqX4yuOoAm4dLRV0kldKNcTy1u55RMspbdjFYHwbsS2iJYI7s9B3y1p3P
	G7KXPcj6Bk1HySnpsMBLyQGPLsPx5YP3C4EOb0QiXt5e/c5TMZpEH0HUoV6uOyrSUHNO
	PBW6/J1NAULRXhqKmVkNSjUevNHdh4CCbYybuBkGpxpTdnNb4hlG79+ysm95S3UJCYwY
	BXG7rUazhKjh5NfH8a0SQB6I09aw1C3MSFnn/4KpBNi3Cs0YTGV6L+nh9RVyU54QpByY
	Uo8w==
Received: by 10.14.205.198 with SMTP id j46mr6056853eeo.27.1354802634765;
	Thu, 06 Dec 2012 06:03:54 -0800 (PST)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPS id i49sm16096340eem.6.2012.12.06.06.03.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 06 Dec 2012 06:03:54 -0800 (PST)
Received: by nysan (Postfix, from userid 1000)
	id C9DCE4011BC; Thu,  6 Dec 2012 15:03:48 +0100 (CET)
From: david.c.nystrom@gmail.com
To: meta-virtualization@yoctoproject.org
Date: Thu,  6 Dec 2012 15:03:21 +0100
Message-Id: <1354802601-10840-15-git-send-email-david.c.nystrom@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1354802601-10840-1-git-send-email-david.c.nystrom@gmail.com>
References: <1354802601-10840-1-git-send-email-david.c.nystrom@gmail.com>
MIME-Version: 1.0
Subject: [PATCHv3 14/14] Added kernel configuration for LxC and in kernel OpenvSwitch
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Dec 2012 14:03:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: David Nyström <david.nystrom@enea.com>

---
 recipes-kernel/linux/linux-yocto/lxc.cfg      |   22 ++++++++++++++++++++++
 recipes-kernel/linux/linux-yocto/lxc.scc      |    4 ++++
 recipes-kernel/linux/linux-yocto/vswitch.cfg  |    2 ++
 recipes-kernel/linux/linux-yocto/vswitch.scc  |    4 ++++
 recipes-kernel/linux/linux-yocto_3.4.bbappend |    5 ++++-
 5 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 recipes-kernel/linux/linux-yocto/lxc.cfg
 create mode 100644 recipes-kernel/linux/linux-yocto/lxc.scc
 create mode 100644 recipes-kernel/linux/linux-yocto/vswitch.cfg
 create mode 100644 recipes-kernel/linux/linux-yocto/vswitch.scc

diff --git a/recipes-kernel/linux/linux-yocto/lxc.cfg b/recipes-kernel/linux/linux-yocto/lxc.cfg
new file mode 100644
index 0000000..f720ca6
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto/lxc.cfg
@@ -0,0 +1,22 @@
+CONFIG_CGROUP_DEVICE=y
+CONFIG_CPUSETS=y
+CONFIG_PROC_PID_CPUSET=y
+CONFIG_RESOURCE_COUNTERS=y
+CONFIG_CGROUP_MEM_RES_CTLR=y
+CONFIG_CGROUP_SCHED=y
+CONFIG_FAIR_GROUP_SCHED=y
+CONFIG_RT_GROUP_SCHED=y
+CONFIG_CHECKPOINT_RESTORE=y
+CONFIG_NAMESPACES=y
+CONFIG_UTS_NS=y
+CONFIG_IPC_NS=y
+CONFIG_USER_NS=y
+CONFIG_PID_NS=y
+CONFIG_NET_NS=y
+CONFIG_SECCOMP=y
+CONFIG_SECURITY_APPARMOR=y
+
+CONFIG_CLS_CGROUP=m
+CONFIG_BLK_CGROUP=m
+CONFIG_NETPRIO_CGROUP=m
+
diff --git a/recipes-kernel/linux/linux-yocto/lxc.scc b/recipes-kernel/linux/linux-yocto/lxc.scc
new file mode 100644
index 0000000..ee51883
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto/lxc.scc
@@ -0,0 +1,4 @@
+define KFEATURE_DESCRIPTION "Enable Features needed by LxC, namespaces, cgroups et.c."
+define KFEATURE_COMPATIBILITY board
+
+kconf non-hardware lxc.cfg
diff --git a/recipes-kernel/linux/linux-yocto/vswitch.cfg b/recipes-kernel/linux/linux-yocto/vswitch.cfg
new file mode 100644
index 0000000..fcc0ca6
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto/vswitch.cfg
@@ -0,0 +1,2 @@
+CONFIG_OPENVSWITCH=m
+
diff --git a/recipes-kernel/linux/linux-yocto/vswitch.scc b/recipes-kernel/linux/linux-yocto/vswitch.scc
new file mode 100644
index 0000000..2790b4f
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto/vswitch.scc
@@ -0,0 +1,4 @@
+define KFEATURE_DESCRIPTION "Enable in kernel OpenvSwitch module"
+define KFEATURE_COMPATIBILITY board
+
+kconf non-hardware vswitch.cfg
diff --git a/recipes-kernel/linux/linux-yocto_3.4.bbappend b/recipes-kernel/linux/linux-yocto_3.4.bbappend
index dc97c1b..5b163ff 100644
--- a/recipes-kernel/linux/linux-yocto_3.4.bbappend
+++ b/recipes-kernel/linux/linux-yocto_3.4.bbappend
@@ -1,5 +1,8 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
 SRC_URI += "file://xt-checksum.scc \
-            file://ebtables.scc "
+            file://ebtables.scc \
+	    file://vswitch.scc \
+	    file://lxc.scc \
+	    "
 
-- 
1.7.9.5


