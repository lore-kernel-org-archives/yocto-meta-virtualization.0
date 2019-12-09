Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web09.8177.1575879065094175968
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 09 Dec 2019 00:11:05 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: windriver.com, ip: 140.211.169.56, mailfrom: qi.chen@windriver.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A4260E010AD; Mon,  9 Dec 2019 00:11:04 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 267CDE00ED2
	for <meta-virtualization@yoctoproject.org>; Mon,  9 Dec 2019 00:11:03 -0800 (PST)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id xB98B33m015607
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>; Mon, 9 Dec 2019 00:11:03 -0800 (PST)
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.468.0; Mon, 9 Dec 2019 00:11:03 -0800
From: "Chen Qi" <Qi.Chen@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization][PATCH V2 2/2] meta-virt-default-versions.inc: use go 1.12 version
Date: Mon, 9 Dec 2019 16:11:00 +0800
Message-ID: <20191209081100.17430-2-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191209081100.17430-1-Qi.Chen@windriver.com>
References: <20191209081100.17430-1-Qi.Chen@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain

kubernetes could not be built correctly with go 1.13.
Use 1.12 version in layer.conf.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 conf/distro/include/meta-virt-default-versions.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/conf/distro/include/meta-virt-default-versions.inc b/conf/distro/include/meta-virt-default-versions.inc
index 06ff9e8..00b96d2 100644
--- a/conf/distro/include/meta-virt-default-versions.inc
+++ b/conf/distro/include/meta-virt-default-versions.inc
@@ -7,3 +7,7 @@ PREFERRED_VERSION_python-pyyaml = "5.1.2"
 PREFERRED_VERSION_python-redis = "2.10.3"
 PREFERRED_VERSION_python-sqlalchemy = "1.1.5"
 PREFERRED_VERSION_python-werkzeug = "0.10.4"
+
+# Use go 1.12 to avoid k8s build failure.
+# Remove this after https://github.com/kubernetes/kubernetes/issues/82531 is resolved and k8s is updated to a working version.
+GOVERSION = "1.12%"
-- 
2.17.1

