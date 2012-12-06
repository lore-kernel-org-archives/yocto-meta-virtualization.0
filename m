Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-ea0-f176.google.com (mail-ea0-f176.google.com
	[209.85.215.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1E661E01465
	for <meta-virtualization@yoctoproject.org>;
	Thu,  6 Dec 2012 05:13:55 -0800 (PST)
Received: by mail-ea0-f176.google.com with SMTP id d13so2757041eaa.35
	for <meta-virtualization@yoctoproject.org>;
	Thu, 06 Dec 2012 05:13:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=kEk/5JUHM3zei4IlzQg9RirsfyzeP2HoTbpC/13AmkY=;
	b=od/aP8+89v+YCR2iylL4qP2FM+rEJvlXt3ZSnVsaJySb5PvamZQiUd01EGdlZIWGDz
	LLkA2Q/gLnjrr/KliQDjE4DetlQDkRxoV4nklmKYH30WR3V9Fdrth3f5uaLNJ/PVaa5x
	UBH4gq3PKJS0Q58OANGtNR4mJz78DJ8zR5fGbnmRVAyijvRSKXyzYARsnOO46bwGR7Gx
	LF+VXaSgji6UY+oXNlVf1mLRBGknFWICYrd9lgQP9+VmfoA0N9qXto3MQjbrkstLzFo2
	FabT3koGXFG/3jtgS8NdBx8pQ5Uje/0bvzrTzhGBshVrVUz8YpXwiWKlyY38Enj0TJru
	uJUA==
Received: by 10.14.219.3 with SMTP id l3mr5805481eep.5.1354799635825;
	Thu, 06 Dec 2012 05:13:55 -0800 (PST)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPS id 43sm15847110eed.10.2012.12.06.05.13.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 06 Dec 2012 05:13:55 -0800 (PST)
Received: by nysan (Postfix, from userid 1000)
	id 7E6D74011BC; Thu,  6 Dec 2012 14:13:49 +0100 (CET)
From: "=?UTF-8?q?David=20Nystr=C3=B6m?=" <david.c.nystrom@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Thu,  6 Dec 2012 14:13:45 +0100
Message-Id: <1354799626-6911-15-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1354799626-6911-1-git-send-email-david.nystrom@enea.com>
References: <1354799626-6911-1-git-send-email-david.nystrom@enea.com>
Subject: [PATCH 14/14] Added kernel configuration for LxC and in kernel OpenvSwitch
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
X-List-Received-Date: Thu, 06 Dec 2012 13:13:56 -0000

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


