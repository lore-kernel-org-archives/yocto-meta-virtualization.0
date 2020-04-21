Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.5273.1587460918191943975
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 21 Apr 2020 02:21:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: mingli.yu@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 03L9LQua029541
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 21 Apr 2020 02:21:47 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Tue, 21 Apr 2020 02:21:17 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [PATCH v2] lxc: Upgrade to 4.0.2
Date: Tue, 21 Apr 2020 17:21:15 +0800
Message-ID: <1587460875-189890-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 recipes-containers/lxc/{lxc_4.0.1.bb => lxc_4.0.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename recipes-containers/lxc/{lxc_4.0.1.bb => lxc_4.0.2.bb} (97%)

diff --git a/recipes-containers/lxc/lxc_4.0.1.bb b/recipes-containers/lxc/lxc_4.0.2.bb
similarity index 97%
rename from recipes-containers/lxc/lxc_4.0.1.bb
rename to recipes-containers/lxc/lxc_4.0.2.bb
index bfe003c..bc7f88b 100644
--- a/recipes-containers/lxc/lxc_4.0.1.bb
+++ b/recipes-containers/lxc/lxc_4.0.2.bb
@@ -51,8 +51,8 @@ SRC_URI = "http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
 	file://lxc-net \
 	"
 
-SRC_URI[md5sum] = "5f19f13eafdde24c75ba459fc6c28156"
-SRC_URI[sha256sum] = "70bbaac1df097f32ee5493a5e67a52365f7cdda28529f40197d6160bbec4139d"
+SRC_URI[md5sum] = "cc62e734c900f39d770f0de51c868aac"
+SRC_URI[sha256sum] = "ca336dcdf303fea5ff231d89a9b6278b061c4cffb14f0db0a71a15bdd95a5cb0"
 
 S = "${WORKDIR}/${BPN}-${PV}"
 
-- 
2.7.4

