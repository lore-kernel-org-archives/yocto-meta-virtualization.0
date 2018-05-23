Return-Path: <joe.slater@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 58FF1E00A38; Wed, 23 May 2018 10:51:16 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [192.103.53.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A4843E009C8
	for <meta-virtualization@yoctoproject.org>;
	Wed, 23 May 2018 10:51:15 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w4NHoiMZ009717
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 23 May 2018 10:51:04 -0700
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 23 May 2018 10:50:44 -0700
From: Joe Slater <joe.slater@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 23 May 2018 10:50:44 -0700
Message-ID: <20180523175044.130575-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
Subject: [meta-virt][m-c-s][PATCH 1/1] glusterfs: build with libtirpc
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 23 May 2018 17:51:16 -0000
Content-Type: text/plain

rpc is not part of glibc 2.27.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 recipes-extended/glusterfs/glusterfs.inc | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/recipes-extended/glusterfs/glusterfs.inc b/recipes-extended/glusterfs/glusterfs.inc
index 0556e2a..02c8a6a 100644
--- a/recipes-extended/glusterfs/glusterfs.inc
+++ b/recipes-extended/glusterfs/glusterfs.inc
@@ -29,9 +29,14 @@ LIC_FILES_CHKSUM = "file://COPYING-GPLV2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 inherit autotools pkgconfig distutils-base update-rc.d systemd
 
-DEPENDS += "bison-native flex-native python-native fuse libaio libxml2 ncurses \
+DEPENDS += "bison-native flex-native python-native fuse libaio libtirpc libxml2 ncurses \
             openssl python readline zlib liburcu util-linux glib-2.0 acl"
 
+# rpc now comes from libtirpc instead of glibc
+#
+CFLAGS += "-I${STAGING_INCDIR}/tirpc"
+LDFLAGS += " -ltirpc"
+
 EXTRA_OECONF = "ac_cv_file__etc_debian_version=no \
                 ac_cv_file__etc_SuSE_release=no \
                 ac_cv_file__etc_redhat_release=no \
-- 
2.7.4


