Return-Path: <ueba.takuma@jp.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 285BAE00D57; Fri,  6 Jul 2018 03:51:37 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [202.219.69.168 listed in list.dnswl.org]
Received: from mgwkm01.jp.fujitsu.com (mgwkm01.jp.fujitsu.com [202.219.69.168])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C23F9E00A48
	for <meta-virtualization@yoctoproject.org>;
	Fri,  6 Jul 2018 03:51:35 -0700 (PDT)
Received: from kw-mxoi1.gw.nic.fujitsu.com (unknown [192.168.231.131]) by
	mgwkm01.jp.fujitsu.com with smtp
	id 2c23_afae_b3f048cb_0927_48e3_bc66_1163338a2606;
	Fri, 06 Jul 2018 19:51:28 +0900
Received: from m3051.s.css.fujitsu.com (m3051.s.css.fujitsu.com
	[10.134.21.209])
	by kw-mxoi1.gw.nic.fujitsu.com (Postfix) with ESMTP id 758EBAC0078
	for <meta-virtualization@yoctoproject.org>;
	Fri,  6 Jul 2018 19:51:28 +0900 (JST)
Received: from ueba-FMVA09006.utsfd.cs.fujitsu.co.jp
	(ubi186.utsfd.cs.fujitsu.co.jp [10.24.19.186])
	by m3051.s.css.fujitsu.com (Postfix) with ESMTP id 4E264322;
	Fri,  6 Jul 2018 19:51:28 +0900 (JST)
From: Takuma Ueba <ueba.takuma@jp.fujitsu.com>
To: meta-virtualization@yoctoproject.org
Date: Fri,  6 Jul 2018 19:51:24 +0900
Message-Id: <20180706105124.3171-1-ueba.takuma@jp.fujitsu.com>
X-Mailer: git-send-email 2.17.1
X-TM-AS-MML: disable
Subject: [PATCH] python-waitress: fix license from Apache-2.0 to ZPL-2.1
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
X-List-Received-Date: Fri, 06 Jul 2018 10:51:37 -0000

Signed-off-by: Takuma Ueba <ueba.takuma@jp.fujitsu.com>
---
 meta-openstack/recipes-devtools/python/python-waitress_1.1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-openstack/recipes-devtools/python/python-waitress_1.1.0.bb b/meta-openstack/recipes-devtools/python/python-waitress_1.1.0.bb
index f85f3a4..5636420 100644
--- a/meta-openstack/recipes-devtools/python/python-waitress_1.1.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-waitress_1.1.0.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Waitress WSGI server"
 HOMEPAGE = "https://pypi.python.org/pypi/waitress/"
 SECTION = "devel/python"
-LICENSE = "Apache-2.0"
+LICENSE = "ZPL-2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=78ccb3640dc841e1baecb3e27a6966b2"
 
 SRC_URI[md5sum] = "0f1eb7fdfdbf2e6d18decbda1733045c"
-- 
2.17.1



