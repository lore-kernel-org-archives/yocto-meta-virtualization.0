Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0953DE00D30; Thu, 25 Jul 2019 18:23:23 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [183.91.158.132 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3A95EE00C22
	for <meta-virtualization@yoctoproject.org>;
	Thu, 25 Jul 2019 18:23:21 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.64,308,1559491200"; d="scan'208";a="72223116"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 26 Jul 2019 09:23:20 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 705104CDE81D
	for <meta-virtualization@yoctoproject.org>;
	Fri, 26 Jul 2019 09:23:18 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 26 Jul 2019 09:23:19 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Fri, 26 Jul 2019 09:22:33 +0800
Message-ID: <20190726012233.13424-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 705104CDE81D.A6946
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Subject: [PATCH] python-osprofiler: upgrade 2.8.0 -> 2.8.1
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
X-List-Received-Date: Fri, 26 Jul 2019 01:23:23 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/{python-osprofiler_2.8.0.bb => python-osprofiler_2.8.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-osprofiler_2.8.0.bb => python-osprofiler_2.8.1.bb} (83%)

diff --git a/meta-openstack/recipes-devtools/python/python-osprofiler_2.8.0.bb b/meta-openstack/recipes-devtools/python/python-osprofiler_2.8.1.bb
similarity index 83%
rename from meta-openstack/recipes-devtools/python/python-osprofiler_2.8.0.bb
rename to meta-openstack/recipes-devtools/python/python-osprofiler_2.8.1.bb
index c33c52b..b299709 100644
--- a/meta-openstack/recipes-devtools/python/python-osprofiler_2.8.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-osprofiler_2.8.1.bb
@@ -4,8 +4,8 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=19cbd64715b51267a47bf3750cc6a8a5"
 
-SRC_URI[md5sum] = "c48561c6c6d2112d5b06d5c4af581790"
-SRC_URI[sha256sum] = "56f8717c1c30193706ea6f9959f5f289edee910f90ebd763db38cfbd9c1c90d4"
+SRC_URI[md5sum] = "ec8ef752caf49591941fba063ca40fb4"
+SRC_URI[sha256sum] = "ee6d8a40daa3909b7c594378986b8c93ec2561dd8c329bad0aa54d4795c8fa57"
 
 inherit setuptools pypi
 
-- 
2.7.4




