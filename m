Return-Path: <brian.avery@intel.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5442EE00BE8; Fri,  7 Jul 2017 16:35:28 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [134.134.136.31 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 55C99E00BDF
	for <meta-virtualization@yoctoproject.org>;
	Fri,  7 Jul 2017 16:35:26 -0700 (PDT)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga104.jf.intel.com with ESMTP; 07 Jul 2017 16:35:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,325,1496127600"; d="scan'208";a="284374221"
Received: from bavery-ws-desk.jf.intel.com ([10.54.74.28])
	by fmsmga004.fm.intel.com with ESMTP; 07 Jul 2017 16:35:26 -0700
From: brian avery <brian.avery@intel.com>
To: meta-virtualization@yoctoproject.org
Date: Fri,  7 Jul 2017 16:38:51 -0700
Message-Id: <1499470731-26466-1-git-send-email-brian.avery@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] docker: add NETFILTER_XT_MATCH_ADDRTYPE=m
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
X-List-Received-Date: Fri, 07 Jul 2017 23:35:28 -0000

Docker needs ths _NETFILTER_XT_MATCH_ADDRTYPE module in order to start
up successfully. This patch adds it to the supported kernels.

Signed-off-by: brian avery <brian.avery@intel.com>
---
 recipes-kernel/linux/linux-yocto/docker.cfg    | 1 +
 recipes-kernel/linux/linux-yocto/docker.scc    | 4 ++++
 recipes-kernel/linux/linux-yocto_4.1.bbappend  | 1 +
 recipes-kernel/linux/linux-yocto_4.10.bbappend | 1 +
 recipes-kernel/linux/linux-yocto_4.4.bbappend  | 1 +
 recipes-kernel/linux/linux-yocto_4.9.bbappend  | 1 +
 6 files changed, 9 insertions(+)
 create mode 100644 recipes-kernel/linux/linux-yocto/docker.cfg
 create mode 100644 recipes-kernel/linux/linux-yocto/docker.scc

diff --git a/recipes-kernel/linux/linux-yocto/docker.cfg b/recipes-kernel/linux/linux-yocto/docker.cfg
new file mode 100644
index 0000000..d0ebb66
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto/docker.cfg
@@ -0,0 +1 @@
+CONFIG_NETFILTER_XT_MATCH_ADDRTYPE=m
diff --git a/recipes-kernel/linux/linux-yocto/docker.scc b/recipes-kernel/linux/linux-yocto/docker.scc
new file mode 100644
index 0000000..e317456
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto/docker.scc
@@ -0,0 +1,4 @@
+define KFEATURE_DESCRIPTION "Enable Features needed by docker in addition to LXC features"
+define KFEATURE_COMPATIBILITY board
+
+kconf non-hardware docker.cfg
diff --git a/recipes-kernel/linux/linux-yocto_4.1.bbappend b/recipes-kernel/linux/linux-yocto_4.1.bbappend
index f3be89e..f163fdf 100644
--- a/recipes-kernel/linux/linux-yocto_4.1.bbappend
+++ b/recipes-kernel/linux/linux-yocto_4.1.bbappend
@@ -4,6 +4,7 @@ SRC_URI += "file://xt-checksum.scc \
             file://ebtables.scc \
 	    file://vswitch.scc \
 	    file://lxc.scc \
+            file://docker.scc \
 	    "
 KERNEL_FEATURES_append = " features/kvm/qemu-kvm-enable.scc"
 
diff --git a/recipes-kernel/linux/linux-yocto_4.10.bbappend b/recipes-kernel/linux/linux-yocto_4.10.bbappend
index f3be89e..f163fdf 100644
--- a/recipes-kernel/linux/linux-yocto_4.10.bbappend
+++ b/recipes-kernel/linux/linux-yocto_4.10.bbappend
@@ -4,6 +4,7 @@ SRC_URI += "file://xt-checksum.scc \
             file://ebtables.scc \
 	    file://vswitch.scc \
 	    file://lxc.scc \
+            file://docker.scc \
 	    "
 KERNEL_FEATURES_append = " features/kvm/qemu-kvm-enable.scc"
 
diff --git a/recipes-kernel/linux/linux-yocto_4.4.bbappend b/recipes-kernel/linux/linux-yocto_4.4.bbappend
index f3be89e..f163fdf 100644
--- a/recipes-kernel/linux/linux-yocto_4.4.bbappend
+++ b/recipes-kernel/linux/linux-yocto_4.4.bbappend
@@ -4,6 +4,7 @@ SRC_URI += "file://xt-checksum.scc \
             file://ebtables.scc \
 	    file://vswitch.scc \
 	    file://lxc.scc \
+            file://docker.scc \
 	    "
 KERNEL_FEATURES_append = " features/kvm/qemu-kvm-enable.scc"
 
diff --git a/recipes-kernel/linux/linux-yocto_4.9.bbappend b/recipes-kernel/linux/linux-yocto_4.9.bbappend
index f3be89e..f163fdf 100644
--- a/recipes-kernel/linux/linux-yocto_4.9.bbappend
+++ b/recipes-kernel/linux/linux-yocto_4.9.bbappend
@@ -4,6 +4,7 @@ SRC_URI += "file://xt-checksum.scc \
             file://ebtables.scc \
 	    file://vswitch.scc \
 	    file://lxc.scc \
+            file://docker.scc \
 	    "
 KERNEL_FEATURES_append = " features/kvm/qemu-kvm-enable.scc"
 
-- 
1.9.1


