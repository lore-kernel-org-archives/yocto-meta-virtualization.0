Return-Path: <timothy.t.orling@linux.intel.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3AF83E00F67; Sat, 17 Feb 2018 08:57:53 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 84DF7E00EF0
	for <meta-virtualization@yoctoproject.org>;
	Sat, 17 Feb 2018 08:57:52 -0800 (PST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Feb 2018 08:57:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,525,1511856000"; d="scan'208";a="32239603"
Received: from chiron.jf.intel.com ([10.7.159.61])
	by orsmga001.jf.intel.com with ESMTP; 17 Feb 2018 08:57:49 -0800
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: meta-virtualization@yoctoproject.org
Date: Sat, 17 Feb 2018 08:57:32 -0800
Message-Id: <20180217165732.37799-1-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.14.3
Subject: [PATCH] Drop linux-yocto bbappends for 4.4, 4.9, 4.10
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
X-List-Received-Date: Sat, 17 Feb 2018 16:57:53 -0000

These kernels have been dropped from oe-core, so there
is nothing to bbappend

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 recipes-kernel/linux/linux-yocto_4.10.bbappend | 1 -
 recipes-kernel/linux/linux-yocto_4.4.bbappend  | 1 -
 recipes-kernel/linux/linux-yocto_4.9.bbappend  | 1 -
 3 files changed, 3 deletions(-)
 delete mode 100644 recipes-kernel/linux/linux-yocto_4.10.bbappend
 delete mode 100644 recipes-kernel/linux/linux-yocto_4.4.bbappend
 delete mode 100644 recipes-kernel/linux/linux-yocto_4.9.bbappend

diff --git a/recipes-kernel/linux/linux-yocto_4.10.bbappend b/recipes-kernel/linux/linux-yocto_4.10.bbappend
deleted file mode 100644
index 617cacc..0000000
--- a/recipes-kernel/linux/linux-yocto_4.10.bbappend
+++ /dev/null
@@ -1 +0,0 @@
-require ${@bb.utils.contains('DISTRO_FEATURES', 'virtualization', '${BPN}_virtualization.inc', '', d)}
diff --git a/recipes-kernel/linux/linux-yocto_4.4.bbappend b/recipes-kernel/linux/linux-yocto_4.4.bbappend
deleted file mode 100644
index 617cacc..0000000
--- a/recipes-kernel/linux/linux-yocto_4.4.bbappend
+++ /dev/null
@@ -1 +0,0 @@
-require ${@bb.utils.contains('DISTRO_FEATURES', 'virtualization', '${BPN}_virtualization.inc', '', d)}
diff --git a/recipes-kernel/linux/linux-yocto_4.9.bbappend b/recipes-kernel/linux/linux-yocto_4.9.bbappend
deleted file mode 100644
index 617cacc..0000000
--- a/recipes-kernel/linux/linux-yocto_4.9.bbappend
+++ /dev/null
@@ -1 +0,0 @@
-require ${@bb.utils.contains('DISTRO_FEATURES', 'virtualization', '${BPN}_virtualization.inc', '', d)}
-- 
2.14.3


