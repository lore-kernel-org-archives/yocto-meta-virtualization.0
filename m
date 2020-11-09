Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.12554.1604933376839960548
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 09 Nov 2020 06:49:36 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: bertrand.marquis@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2D67F101E
	for <meta-virtualization@lists.yoctoproject.org>; Mon,  9 Nov 2020 06:49:36 -0800 (PST)
Received: from e109506-lin.cambridge.arm.com (e109506-lin.cambridge.arm.com [10.1.199.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CCB133F719
	for <meta-virtualization@lists.yoctoproject.org>; Mon,  9 Nov 2020 06:49:35 -0800 (PST)
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [PATCH 1/2] xen: Fix python libraries installation on multilib
Date: Mon,  9 Nov 2020 14:49:26 +0000
Message-Id: <df132acec4c899d81d6a1b52746f0dc782c08e39.1604933003.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1604933003.git.bertrand.marquis@arm.com>
References: <cover.1604933003.git.bertrand.marquis@arm.com>

Fix install path for xen python libraries when multilib configuration is
activated (which is mandatory to compile xen for x86_64).
Depending on the version of Xen, the libraries are installed on lib or
on the nonarch lib directory so add both.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
Change-Id: I1f7f81a4e9e1420bce55d1e4bfe03d98ac2c93a3
---
 recipes-extended/xen/xen-tools.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-extended/xen/xen-tools.inc b/recipes-extended/xen/xen-tools.inc
index 736a766..0c69fec 100644
--- a/recipes-extended/xen/xen-tools.inc
+++ b/recipes-extended/xen/xen-tools.inc
@@ -496,7 +496,9 @@ FILES_${PN}-pygrub = "\
     ${libdir}/xen/bin/pygrub \
     "
 
+# Depending on the version of Xen libdir or nonarch libdir is used
 FILES_${PN}-python = "\
+    ${libdir}/${PYTHON_DIR} \
     ${nonarch_libdir}/${PYTHON_DIR} \
     "
 
-- 
2.17.1

