Return-Path: <Dengke.Du@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A8AFFE00BAF; Wed, 13 Feb 2019 19:18:03 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [192.103.53.11 listed in list.dnswl.org]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 865E2E00B81
	for <meta-virtualization@yoctoproject.org>;
	Wed, 13 Feb 2019 19:18:02 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x1E3HfXO031790
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 13 Feb 2019 19:17:52 -0800
Received: from pek-lpg-core1-vm1.wrs.com (128.224.156.106) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.435.0; Wed, 13 Feb 2019 19:17:30 -0800
From: Dengke Du <dengke.du@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 14 Feb 2019 11:36:20 +0800
Message-ID: <1550115380-20107-1-git-send-email-dengke.du@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] ceph: disable ccache
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
X-List-Received-Date: Thu, 14 Feb 2019 03:18:03 -0000
Content-Type: text/plain

When enable ccache for ceph, error occurs:
-----------------------------------------------------
    ccache: invalid option -- 'E'
    ...
    Unable to determine C++ standard library, got .
-----------------------------------------------------
This is because variable "CXX_STDLIB" was null in CMakeLists.txt line: 637,
The "CXX_STDLIB" come from:
-----------------------------------------------------
    execute_process(
      COMMAND ./librarytest.sh ${CMAKE_CXX_COMPILER} ${CMAKE_CXX_FLAGS}
      WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
      OUTPUT_VARIABLE CXX_STDLIB
      )
-----------------------------------------------------
The script librarytest.sh in ceph accept argument: compile and flags, but when
enable ccache, the compile replace by ccache, so that script failed.

So we disable ccache for ceph now.

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 recipes-extended/ceph/ceph_13.2.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-extended/ceph/ceph_13.2.2.bb b/recipes-extended/ceph/ceph_13.2.2.bb
index 08021cf..0cba08a 100644
--- a/recipes-extended/ceph/ceph_13.2.2.bb
+++ b/recipes-extended/ceph/ceph_13.2.2.bb
@@ -101,3 +101,4 @@ PACKAGES += " \
 "
 INSANE_SKIP_${PN}-python += "ldflags"
 INSANE_SKIP_${PN} += "dev-so"
+CCACHE_DISABLE = "1"
-- 
2.7.4


