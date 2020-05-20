Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.4641.1589938349951582657
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 19 May 2020 18:32:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: hongxu.jia@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 04K1W8CC015060
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 19 May 2020 18:32:18 -0700
Received: from ala-lpggp7.wrs.com (147.11.105.171) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.40) with Microsoft SMTP Server id 14.3.487.0; Tue, 19 May 2020
 18:31:57 -0700
From: "hongxu" <hongxu.jia@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][m-c-s][PATCH] glusterfs: fix failure on gcc10
Date: Tue, 19 May 2020 18:31:57 -0700
Message-ID: <20200520013157.118150-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Since oe-core upgraded gcc to 10.1, there is a failure
...
|../../../../../glusterfs-6.1/rpc/rpc-transport/socket/src/socket.c:4302:24:
error: implicit declaration of function 'EC_KEY_new_by_curve_name'
[-Werror=implicit-function-declaration]
| 4302 |                 ecdh = EC_KEY_new_by_curve_name(nid);
...
Add option -Wno-error=implicit-function-declaration  to workaround

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 recipes-extended/glusterfs/glusterfs.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/glusterfs/glusterfs.inc b/recipes-extended/glusterfs/glusterfs.inc
index a5677840..c209baa6 100644
--- a/recipes-extended/glusterfs/glusterfs.inc
+++ b/recipes-extended/glusterfs/glusterfs.inc
@@ -34,7 +34,7 @@ DEPENDS += "bison-native flex-native python3-native fuse libaio libtirpc libxml2
 
 # rpc now comes from libtirpc instead of glibc
 #
-CFLAGS += "-I${STAGING_INCDIR}/tirpc"
+CFLAGS += "-I${STAGING_INCDIR}/tirpc -Wno-error=implicit-function-declaration"
 LDFLAGS += " -ltirpc"
 
 EXTRA_OECONF = "ac_cv_file__etc_debian_version=no \
-- 
2.21.0

