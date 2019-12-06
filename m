Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web09.7049.1575594908331771272
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 05 Dec 2019 17:15:08 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: windriver.com, ip: 140.211.169.56, mailfrom: qi.chen@windriver.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E44DFE010D9; Thu,  5 Dec 2019 17:15:07 -0800 (PST)
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
	*      [147.11.1.11 listed in list.dnswl.org]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 927F3E00E0F
	for <meta-virtualization@yoctoproject.org>; Thu,  5 Dec 2019 17:15:07 -0800 (PST)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id xB61F75s017607
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>; Thu, 5 Dec 2019 17:15:07 -0800 (PST)
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.468.0; Thu, 5 Dec 2019 17:15:05 -0800
From: "Chen Qi" <Qi.Chen@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization][PATCH 2/2] layer.conf: use go 1.12 version
Date: Fri, 6 Dec 2019 09:14:54 +0800
Message-ID: <20191206011454.37368-2-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191206011454.37368-1-Qi.Chen@windriver.com>
References: <20191206011454.37368-1-Qi.Chen@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain

kubernetes could not be built correctly with go 1.13.
Use 1.12 version in layer.conf.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 conf/layer.conf | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/conf/layer.conf b/conf/layer.conf
index dfca6da..2d008bb 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -41,3 +41,7 @@ PREFERRED_PROVIDER_virtual/docker ?= "docker-ce"
 INHERIT += "sanity-meta-virt"
 
 require ${@bb.utils.contains('DISTRO_FEATURES', 'virtualization', 'meta-virt-default-versions.inc', '', d)}
+
+# Use go 1.12 to avoid k8s build failure.
+# Remove this after https://github.com/kubernetes/kubernetes/issues/82531 is resolved and k8s is updated to a working version.
+GOVERSION = "1.12%"
-- 
2.17.1

