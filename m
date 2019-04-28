Return-Path: <Kai.Kang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 81F8EE00CDD; Sat, 27 Apr 2019 18:33:46 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 623F1E00B1E
	for <meta-virtualization@yoctoproject.org>;
	Sat, 27 Apr 2019 18:33:45 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x3S1XirW024343
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Sat, 27 Apr 2019 18:33:44 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Sat, 27 Apr 2019 18:33:43 -0700
From: <kai.kang@windriver.com>
To: <mark.hatle@windriver.com>
Date: Sat, 27 Apr 2019 21:33:37 -0400
Message-ID: <20190428013339.91413-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [m-c-s][PATCH v2 1/3] glusterfs: remove PACKAGECONFIG libibverbs for arm 32 and mips
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
X-List-Received-Date: Sun, 28 Apr 2019 01:33:46 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Package libibverbs has been set imcompatible with arm 32 and mips arches
by commit 215b975. So disable libibverbs support of glusterfs for arm 32
and mips arches too.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 recipes-extended/glusterfs/glusterfs.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/recipes-extended/glusterfs/glusterfs.inc b/recipes-extended/glusterfs/glusterfs.inc
index ab5f4e0..692d74a 100644
--- a/recipes-extended/glusterfs/glusterfs.inc
+++ b/recipes-extended/glusterfs/glusterfs.inc
@@ -50,6 +50,9 @@ EXTRA_OECONF = "ac_cv_file__etc_debian_version=no \
                "
 
 PACKAGECONFIG ??= "georeplication libibverbs"
+PACKAGECONFIG_remove_mipsarch = "libibverbs"
+PACKAGECONFIG_remove_arm = "libibverbs"
+
 PACKAGECONFIG[debug] = "--enable-debug,--disable-debug,,"
 PACKAGECONFIG[georeplication] = "--enable-georeplication,--disable-georeplication,,rsync"
 PACKAGECONFIG[libibverbs] = "--enable-ibverbs,--disable-ibverbs,virtual/libibverbs librdmacm,"
-- 
2.20.0


