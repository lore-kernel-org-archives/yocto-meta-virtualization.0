Return-Path: <ueba.takuma@jp.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C86EAE01139; Thu,  5 Jul 2018 23:05:55 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [211.128.242.42 listed in list.dnswl.org]
X-Greylist: delayed 676 seconds by postgrey-1.32 at yocto-www;
	Thu, 05 Jul 2018 23:05:54 PDT
Received: from mgwym03.jp.fujitsu.com (mgwym03.jp.fujitsu.com [211.128.242.42])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0DEC0E01132
	for <meta-virtualization@yoctoproject.org>;
	Thu,  5 Jul 2018 23:05:54 -0700 (PDT)
Received: from yt-mxoi1.gw.nic.fujitsu.com (unknown [192.168.229.67]) by
	mgwym03.jp.fujitsu.com with smtp
	id 60da_8991_a1a19c1a_9e7f_4d5c_a4d8_62bea2d02ce2;
	Fri, 06 Jul 2018 14:54:30 +0900
Received: from m3050.s.css.fujitsu.com (msm.b.css.fujitsu.com [10.134.21.208])
	by yt-mxoi1.gw.nic.fujitsu.com (Postfix) with ESMTP id AF191AC0144
	for <meta-virtualization@yoctoproject.org>;
	Fri,  6 Jul 2018 14:54:29 +0900 (JST)
Received: from ueba-FMVA09006.utsfd.cs.fujitsu.co.jp
	(ubi186.utsfd.cs.fujitsu.co.jp [10.24.19.186])
	by m3050.s.css.fujitsu.com (Postfix) with ESMTP id 94072317;
	Fri,  6 Jul 2018 14:54:29 +0900 (JST)
From: Takuma Ueba <ueba.takuma@jp.fujitsu.com>
To: meta-virtualization@yoctoproject.org
Date: Fri,  6 Jul 2018 14:54:18 +0900
Message-Id: <20180706055418.6952-1-ueba.takuma@jp.fujitsu.com>
X-Mailer: git-send-email 2.17.1
X-TM-AS-MML: disable
Subject: [PATCH] fix license from Apache-2.0 to MIT
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
X-List-Received-Date: Fri, 06 Jul 2018 06:05:55 -0000

Signed-off-by: Takuma Ueba <ueba.takuma@jp.fujitsu.com>
---
 meta-openstack/recipes-devtools/python/python-wsme_0.9.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-openstack/recipes-devtools/python/python-wsme_0.9.2.bb b/meta-openstack/recipes-devtools/python/python-wsme_0.9.2.bb
index 59e1ddb..15f46d4 100644
--- a/meta-openstack/recipes-devtools/python/python-wsme_0.9.2.bb
+++ b/meta-openstack/recipes-devtools/python/python-wsme_0.9.2.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Simplify the writing of REST APIs, and extend them with additional protocols"
 HOMEPAGE = "https://pypi.python.org/pypi/WSME/"
 SECTION = "devel/python"
-LICENSE = "Apache-2.0"
+LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5a9126e7f56a0cf3247050de7f10d0f4"
 
 PYPI_PACKAGE = "WSME"
-- 
2.17.1



