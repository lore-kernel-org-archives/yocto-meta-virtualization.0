Return-Path: <yuanc.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0674BE00DA7; Wed, 21 Aug 2019 18:15:51 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [183.91.158.132 listed in list.dnswl.org]
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3A169E00D72
	for <meta-virtualization@yoctoproject.org>;
	Wed, 21 Aug 2019 18:15:49 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.64,414,1559491200"; d="scan'208";a="74030228"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 22 Aug 2019 09:15:48 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 55BC04CE03E5
	for <meta-virtualization@yoctoproject.org>;
	Thu, 22 Aug 2019 09:15:41 +0800 (CST)
Received: from localhost.localdomain (10.167.225.21) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 22 Aug 2019 09:15:47 +0800
From: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 22 Aug 2019 10:15:01 +0900
Message-ID: <20190822011501.116509-1-yuanc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
X-Originating-IP: [10.167.225.21]
X-yoursite-MailScanner-ID: 55BC04CE03E5.AE612
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yuanc.fnst@cn.fujitsu.com
Subject: [PATCH] python-keystoneauth1: upgrade 3.16.0 -> 3.17.0
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
X-List-Received-Date: Thu, 22 Aug 2019 01:15:51 -0000
Content-Type: text/plain

Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
---
 ...keystoneauth1_3.16.0.bb => python-keystoneauth1_3.17.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-keystoneauth1_3.16.0.bb => python-keystoneauth1_3.17.0.bb} (79%)

diff --git a/meta-openstack/recipes-devtools/python/python-keystoneauth1_3.16.0.bb b/meta-openstack/recipes-devtools/python/python-keystoneauth1_3.17.0.bb
similarity index 79%
rename from meta-openstack/recipes-devtools/python/python-keystoneauth1_3.16.0.bb
rename to meta-openstack/recipes-devtools/python/python-keystoneauth1_3.17.0.bb
index fd1d848..18115b2 100644
--- a/meta-openstack/recipes-devtools/python/python-keystoneauth1_3.16.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-keystoneauth1_3.17.0.bb
@@ -4,8 +4,8 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=96f840d59b245a1c817fbcb901afc574"
 
-SRC_URI[md5sum] = "4d2b56ac0b3d19eacb7f3a3198cfcc54"
-SRC_URI[sha256sum] = "0465ed3e69ec0a148a5785f59f6fd3cece7808090cbcb90a2d2cb27ab360d9d7"
+SRC_URI[md5sum] = "599340c2b3ccbcf9996870478abb5407"
+SRC_URI[sha256sum] = "59a4488ceae0c1210cba468945013b875b2ce09d99c54c9fcc9c926aea55dfd7"
 
 inherit setuptools pypi
 
-- 
2.17.1




