Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-ea0-f176.google.com (mail-ea0-f176.google.com
	[209.85.215.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 75187E0127A
	for <meta-virtualization@yoctoproject.org>;
	Thu,  6 Dec 2012 09:06:49 -0800 (PST)
Received: by mail-ea0-f176.google.com with SMTP id d13so2862174eaa.35
	for <meta-virtualization@yoctoproject.org>;
	Thu, 06 Dec 2012 09:06:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=j/3yLcRR7EU89cMC8rMHS9fa2t/4i/1z7UXQud077Vk=;
	b=US425BSOaxvmzu5E+85baVj0Kxi8o8Gn/doVW7Q4TgQndTL+4/GHKEwB/Hu+2iWWKA
	ee59poUfBQHd0mRtf3Bsr8FlCz5hKQ6lm4lVGQ7D/SqulykMcafnb+OWq1WM0Rg/F+xx
	xG2W06sf56elrGgBhA6P3rt5t+H2R+C2y1VzuRohERg1AUkDb/EobHYOB7NSVW41NNqM
	nzDuYR8LpAG/5JGSLvlbmdFDSKjCw4HsP696oeJOO/vwLQaUPiSNuUmLpZ08iMGzkqkz
	cRZxzXAvUpYQMTsEkhS0QPQwJie2ZQyM1ek8epu0tHAf7/0c7xc6O4wnBaV23/Pna4cM
	k/lQ==
Received: by 10.14.221.9 with SMTP id q9mr7817411eep.3.1354813609173;
	Thu, 06 Dec 2012 09:06:49 -0800 (PST)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPS id b2sm16975018eep.9.2012.12.06.09.06.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 06 Dec 2012 09:06:47 -0800 (PST)
Received: by nysan (Postfix, from userid 1000)
	id 523C14011BB; Thu,  6 Dec 2012 18:06:40 +0100 (CET)
From: david.c.nystrom@gmail.com
To: meta-virtualization@yoctoproject.org
Date: Thu,  6 Dec 2012 18:06:33 +0100
Message-Id: <1354813596-8233-13-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1354813596-8233-1-git-send-email-david.nystrom@enea.com>
References: <1354813596-8233-1-git-send-email-david.nystrom@enea.com>
MIME-Version: 1.0
Subject: [PATCHv4 12/15] Added kernel configuration for LxC and in kernel OpenvSwitch
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
X-List-Received-Date: Thu, 06 Dec 2012 17:06:49 -0000
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


