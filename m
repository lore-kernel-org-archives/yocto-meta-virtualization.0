Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.507.1574664971619016774
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 24 Nov 2019 22:56:11 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: windriver.com, ip: 140.211.169.56, mailfrom: hongxu.jia@windriver.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 203DEE00E38; Sun, 24 Nov 2019 22:56:11 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [192.103.53.11 listed in list.dnswl.org]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D820CE00E22
	for <meta-virtualization@yoctoproject.org>; Sun, 24 Nov 2019 22:56:09 -0800 (PST)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id xAP6u7Un001901
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Sun, 24 Nov 2019 22:56:07 -0800
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.468.0; Sun, 24 Nov 2019 22:55:59 -0800
From: "hongxu" <hongxu.jia@windriver.com>
To: <bruce.ashfield@gmail.com>, <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization][PATCH] cri-o: Disable for all mips machines
Date: Mon, 25 Nov 2019 14:55:58 +0800
Message-ID: <1574664958-32698-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain

Since commit [a092153 containerd: Disable for all mips machines] applied,
and the cri-o runtime depends `virtual/containerd', it should do the same
thing to disable for all mips machines

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 recipes-containers/cri-o/cri-o_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-containers/cri-o/cri-o_git.bb b/recipes-containers/cri-o/cri-o_git.bb
index 34276f4..8d754ec 100644
--- a/recipes-containers/cri-o/cri-o_git.bb
+++ b/recipes-containers/cri-o/cri-o_git.bb
@@ -164,3 +164,4 @@ INSANE_SKIP_${PN} += "ldflags already-stripped"
 
 deltask compile_ptest_base
 
+COMPATIBLE_HOST = "^(?!(qemu)?mips).*"
-- 
2.7.4

