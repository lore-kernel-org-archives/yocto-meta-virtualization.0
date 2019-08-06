Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 68506E00D5C; Mon,  5 Aug 2019 19:14:07 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00, DATE_IN_FUTURE_06_12,
	RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [183.91.158.132 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 1.9 DATE_IN_FUTURE_06_12 Date: is 6 to 12 hours after Received: date
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 577CDE00D47
	for <meta-virtualization@yoctoproject.org>;
	Mon,  5 Aug 2019 19:14:05 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.64,352,1559491200"; d="scan'208";a="73032246"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 06 Aug 2019 10:14:04 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 20EE14CDFCC5
	for <meta-virtualization@yoctoproject.org>;
	Tue,  6 Aug 2019 10:14:06 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Tue, 6 Aug 2019 10:14:11 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 6 Aug 2019 19:13:54 +0800
Message-ID: <1565090034-14946-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-yoursite-MailScanner-ID: 20EE14CDFCC5.A8D58
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
Subject: [PATCH] python-keystoneauth1:upgrade 3.14.0 -> 3.15.0
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
X-List-Received-Date: Tue, 06 Aug 2019 02:14:07 -0000
Content-Type: text/plain

Upgrade from python-keystoneauth1 from 3.14.0 to 3.15.0.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 ...keystoneauth1_3.14.0.bb => python-keystoneauth1_3.15.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-keystoneauth1_3.14.0.bb => python-keystoneauth1_3.15.0.bb} (79%)

diff --git a/meta-openstack/recipes-devtools/python/python-keystoneauth1_3.14.0.bb b/meta-openstack/recipes-devtools/python/python-keystoneauth1_3.15.0.bb
similarity index 79%
rename from meta-openstack/recipes-devtools/python/python-keystoneauth1_3.14.0.bb
rename to meta-openstack/recipes-devtools/python/python-keystoneauth1_3.15.0.bb
index e53f922..a584951 100644
--- a/meta-openstack/recipes-devtools/python/python-keystoneauth1_3.14.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-keystoneauth1_3.15.0.bb
@@ -4,8 +4,8 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=96f840d59b245a1c817fbcb901afc574"
 
-SRC_URI[md5sum] = "ada9836933f5aa6bd35faf01c314e81d"
-SRC_URI[sha256sum] = "b14f363d02142177c968cfffeb9eb37113682c03ac3c65d483424e203dd602c3"
+SRC_URI[md5sum] = "0f3e21362a74d1fb8959fc2bf7d28882"
+SRC_URI[sha256sum] = "439f7dcf6edde5ea5a16ef90603d198e118a03f529aba0f8a6d19d5f6433de95"
 
 inherit setuptools pypi
 
-- 
2.17.1




