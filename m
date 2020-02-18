Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.1119.1582011878955732841
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 17 Feb 2020 23:44:39 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: changqing.li@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 01I7iHPf024980
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 17 Feb 2020 23:44:27 -0800
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.468.0; Mon, 17 Feb 2020 23:43:55 -0800
From: "Changqing Li" <changqing.li@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][PATCH] hook_support.py: convert to python3
Date: Tue, 18 Feb 2020 15:43:54 +0800
Message-ID: <1582011834-136295-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

python2 has been removed from oe-core, convert the scripts
to python3 to avoid runtime error like:
/usr/bin/env: 'python': No such file or directory'

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 recipes-extended/libvirt/libvirt/hook_support.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/libvirt/libvirt/hook_support.py b/recipes-extended/libvirt/libvirt/hook_support.py
index c3eb8b3..7c5e2a9 100755
--- a/recipes-extended/libvirt/libvirt/hook_support.py
+++ b/recipes-extended/libvirt/libvirt/hook_support.py
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python3
 #
 # Copyright (C) 2014 Wind River Systems, Inc. 
 # 
-- 
2.7.4

