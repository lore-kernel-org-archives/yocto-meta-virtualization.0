Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.61880.1600093948458738845
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 14 Sep 2020 07:32:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: hongxu.jia@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 08EEVcgI021262
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Mon, 14 Sep 2020 07:31:59 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.40) with Microsoft SMTP Server id 14.3.487.0; Mon, 14 Sep 2020
 07:31:49 -0700
From: "hongxu" <hongxu.jia@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>, <bruce.ashfield@gmail.com>
Subject: [meta-virtualization][PATCH] sloci-image: add nativesdk support
Date: Mon, 14 Sep 2020 22:31:48 +0800
Message-ID: <20200914143148.12881-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.18.2
MIME-Version: 1.0
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../{sloci-image-native_git.bb => sloci-image_git.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename recipes-containers/sloci-image/{sloci-image-native_git.bb => sloci-image_git.bb} (93%)

diff --git a/recipes-containers/sloci-image/sloci-image-native_git.bb b/recipes-containers/sloci-image/sloci-image_git.bb
similarity index 93%
rename from recipes-containers/sloci-image/sloci-image-native_git.bb
rename to recipes-containers/sloci-image/sloci-image_git.bb
index b3b11bd..30fa4c1 100644
--- a/recipes-containers/sloci-image/sloci-image-native_git.bb
+++ b/recipes-containers/sloci-image/sloci-image_git.bb
@@ -11,8 +11,6 @@ DEPENDS = ""
 SRCREV = "4015e49763e5a738026a5bbfcf32b38b5a4fa650"
 PV = "v0.1.0+git${SRCPV}"
 
-inherit native
-
 S = "${WORKDIR}/git"
 
 do_compile() { 
@@ -23,3 +21,5 @@ do_install() {
 	cd ${S}
         make PREFIX="${exec_prefix}" DESTDIR=${D} install
 }
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.18.2

