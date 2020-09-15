Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.7541.1600152542025141971
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 14 Sep 2020 23:49:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: hongxu.jia@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 08F6mFpA021231
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Mon, 14 Sep 2020 23:48:41 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.40) with Microsoft SMTP Server id 14.3.487.0; Mon, 14 Sep 2020
 23:48:31 -0700
From: "hongxu" <hongxu.jia@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>, <bruce.ashfield@gmail.com>
Subject: [meta-virtualization][PATCH 2/2] sloci-image: set CLEANBROKEN = 1
Date: Tue, 15 Sep 2020 14:48:03 +0800
Message-ID: <20200915064803.14962-2-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.18.2
In-Reply-To: <20200915064803.14962-1-hongxu.jia@windriver.com>
References: <20200915064803.14962-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain

Workaround rebuild failure

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 recipes-containers/sloci-image/sloci-image_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-containers/sloci-image/sloci-image_git.bb b/recipes-containers/sloci-image/sloci-image_git.bb
index 30fa4c1..fc3c329 100644
--- a/recipes-containers/sloci-image/sloci-image_git.bb
+++ b/recipes-containers/sloci-image/sloci-image_git.bb
@@ -22,4 +22,6 @@ do_install() {
         make PREFIX="${exec_prefix}" DESTDIR=${D} install
 }
 
+CLEANBROKEN = "1"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.18.2

