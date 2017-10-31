Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 81D47E00CA6; Mon, 30 Oct 2017 22:19:21 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
X-Greylist: delayed 63 seconds by postgrey-1.32 at yocto-www;
	Mon, 30 Oct 2017 22:19:20 PDT
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A0714E00C62
	for <meta-virtualization@yoctoproject.org>;
	Mon, 30 Oct 2017 22:19:20 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="29761252"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 31 Oct 2017 13:18:15 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 3E3D6481847F
	for <meta-virtualization@yoctoproject.org>;
	Tue, 31 Oct 2017 13:18:16 +0800 (CST)
Received: from localhost.localdomain (10.167.225.125) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Tue, 31 Oct 2017 13:18:13 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 31 Oct 2017 13:18:13 +0800
Message-ID: <1509427093-808-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.225.125]
X-yoursite-MailScanner-ID: 3E3D6481847F.A51EB
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
Subject: [meta-cloud-services][PATCH] python-eventlet:upgrade to 0.21.0
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
X-List-Received-Date: Tue, 31 Oct 2017 05:19:21 -0000
Content-Type: text/plain

Upgrade python-eventlet from 0.18.4 to 0.21.0.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../python/{python-eventlet_0.18.4.bb => python-eventlet_0.21.0.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-eventlet_0.18.4.bb => python-eventlet_0.21.0.bb} (51%)

diff --git a/meta-openstack/recipes-devtools/python/python-eventlet_0.18.4.bb b/meta-openstack/recipes-devtools/python/python-eventlet_0.21.0.bb
similarity index 51%
rename from meta-openstack/recipes-devtools/python/python-eventlet_0.18.4.bb
rename to meta-openstack/recipes-devtools/python/python-eventlet_0.21.0.bb
index 8c5e904..768759c 100644
--- a/meta-openstack/recipes-devtools/python/python-eventlet_0.18.4.bb
+++ b/meta-openstack/recipes-devtools/python/python-eventlet_0.21.0.bb
@@ -6,10 +6,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=56472ad6de4caf50e05332a34b66e778"
 
 SRCNAME = "eventlet"
 
-SRC_URI = "http://pypi.python.org/packages/source/e/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+SRC_URI = "https://pypi.python.org/packages/cb/ec/eae487c106a7e38f86ac4cadafb3eec77d29996f64ca0c7015067538069b/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "8d1c646d8cc10a4958c92fe8a30f3676"
-SRC_URI[sha256sum] = "74ef11d67ee5e85e009b0fced733c907620bca1ab8e6b0489d9f247405ab2685"
+SRC_URI[md5sum] = "92aaac4c0abaddff9329f55d8f5bcd76"
+SRC_URI[sha256sum] = "08faffab88c1b08bd53ea28bf084a572c89f7e7648bd9d71e6116ac17a51a15d"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
2.7.4




