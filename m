Return-Path: <mihai.prica@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 83449E002AB
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 Jan 2013 05:01:02 -0800 (PST)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 29 Jan 2013 05:01:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,559,1355126400"; d="scan'208";a="279764542"
Received: from mihai-vostro-460 (HELO localhost.localdomain) ([10.237.105.31])
	by fmsmga001.fm.intel.com with ESMTP; 29 Jan 2013 05:01:01 -0800
From: Mihai Prica <mihai.prica@intel.com>
To: meta-virtualization@yoctoproject.org
Date: Tue, 29 Jan 2013 15:01:40 +0200
Message-Id: <1359464500-16993-2-git-send-email-mihai.prica@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1359464500-16993-1-git-send-email-mihai.prica@intel.com>
References: <1359464500-16993-1-git-send-email-mihai.prica@intel.com>
Subject: [PATCH 2/2] qemu: Enabled VGA output
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
X-List-Received-Date: Tue, 29 Jan 2013 13:01:02 -0000

Signed-off-by: Mihai Prica <mihai.prica@intel.com>
---
 recipes-devtools/qemu/qemu_1.3.0.bbappend |    3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 recipes-devtools/qemu/qemu_1.3.0.bbappend

diff --git a/recipes-devtools/qemu/qemu_1.3.0.bbappend b/recipes-devtools/qemu/qemu_1.3.0.bbappend
new file mode 100644
index 0000000..2106825
--- /dev/null
+++ b/recipes-devtools/qemu/qemu_1.3.0.bbappend
@@ -0,0 +1,3 @@
+# Enables QEMU to display the VGA output
+DEPENDS_append = " libsdl"
+SDL = "--enable-sdl"
-- 
1.7.9.5


