Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web12.372.1582613223619444937
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 24 Feb 2020 22:47:03 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.20, mailfrom: chee.yang.lee@intel.com)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 Feb 2020 22:47:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,483,1574150400"; 
   d="scan'208";a="226246768"
Received: from andromeda02.png.intel.com ([10.221.183.11])
  by orsmga007.jf.intel.com with ESMTP; 24 Feb 2020 22:47:02 -0800
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [PATCH] linux: add bbappend for generic cases
Date: Tue, 25 Feb 2020 14:47:01 +0800
Message-Id: <1582613221-56653-1-git-send-email-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.7.4

From: Chee Yang Lee <chee.yang.lee@intel.com>

add generic .bbappend for linux kernel recipe to allow
all linux kernel recipe with name "linux-%" to enjoy the
kernel config from virtualization layer.

[YOCTO #13727]

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
---
 recipes-kernel/linux/linux-%.bbappend | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 recipes-kernel/linux/linux-%.bbappend

diff --git a/recipes-kernel/linux/linux-%.bbappend b/recipes-kernel/linux/linux-%.bbappend
new file mode 100644
index 0000000..20eeba9
--- /dev/null
+++ b/recipes-kernel/linux/linux-%.bbappend
@@ -0,0 +1 @@
+require ${@bb.utils.contains('DISTRO_FEATURES', 'virtualization', 'linux-yocto_virtualization.inc', '', d)}
-- 
2.7.4

