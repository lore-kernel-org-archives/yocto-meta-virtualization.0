Return-Path: <Kai.Kang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C584CE00D3A; Wed, 17 Apr 2019 00:51:40 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5EE87E00942
	for <meta-virtualization@yoctoproject.org>;
	Wed, 17 Apr 2019 00:51:40 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x3H7pc2l005690
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 17 Apr 2019 00:51:39 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Wed, 17 Apr 2019 00:51:38 -0700
From: <kai.kang@windriver.com>
To: <bruce.ashfield@gmail.com>
Date: Wed, 17 Apr 2019 03:51:33 -0400
Message-ID: <20190417075133.84331-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [m-c-s][PATCH] glusterfs/librdmacm: fix dependency issue with libibverbs
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
X-List-Received-Date: Wed, 17 Apr 2019 07:51:40 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

glusterfs and librdmacm depend on libibverbs. But libibverbs has been
set imcompatible with mipsarch and arm. Update glusterfs and librdmacm
accordingly.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 recipes-extended/glusterfs/glusterfs.inc      | 3 +++
 recipes-extended/librdmacm/librdmacm_1.1.0.bb | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/recipes-extended/glusterfs/glusterfs.inc b/recipes-extended/glusterfs/glusterfs.inc
index 5843d7c6..3fc04ffb 100644
--- a/recipes-extended/glusterfs/glusterfs.inc
+++ b/recipes-extended/glusterfs/glusterfs.inc
@@ -51,6 +51,9 @@ EXTRA_OECONF = "ac_cv_file__etc_debian_version=no \
                "
 
 PACKAGECONFIG ??= "georeplication libibverbs"
+PACKAGECONFIG_remove_mipsarch = "libibverbs"
+PACKAGECONFIG_remove_arm = "libibverbs"
+
 PACKAGECONFIG[bd-xlator] = "--enable-bd-xlator,--disable-bd-xlator,lvm2,"
 PACKAGECONFIG[debug] = "--enable-debug,--disable-debug,,"
 PACKAGECONFIG[georeplication] = "--enable-georeplication,--disable-georeplication,,rsync"
diff --git a/recipes-extended/librdmacm/librdmacm_1.1.0.bb b/recipes-extended/librdmacm/librdmacm_1.1.0.bb
index 30a0c943..edf92f01 100644
--- a/recipes-extended/librdmacm/librdmacm_1.1.0.bb
+++ b/recipes-extended/librdmacm/librdmacm_1.1.0.bb
@@ -39,3 +39,6 @@ do_install_append() {
         rm -f ${D}${libdir}/librdmacm.la
         rm -f ${D}${libdir}/rsocket/librspreload.la
 }
+
+COMPATIBLE_HOST_mipsarch = "none"
+COMPATIBLE_HOST_arm = "none"
-- 
2.20.0


