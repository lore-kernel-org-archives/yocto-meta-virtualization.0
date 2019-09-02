Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 70010E00D8A; Mon,  2 Sep 2019 04:53:51 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B86E3E00C5C
	for <meta-virtualization@yoctoproject.org>;
	Mon,  2 Sep 2019 04:53:50 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.64,459,1559491200"; d="scan'208";a="74700868"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 02 Sep 2019 19:53:49 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 948634CDFCE9
	for <meta-virtualization@yoctoproject.org>;
	Mon,  2 Sep 2019 19:53:49 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 2 Sep 2019 19:53:52 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 2 Sep 2019 19:53:09 +0800
Message-ID: <1567425189-118862-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-yoursite-MailScanner-ID: 948634CDFCE9.A84E7
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
Subject: [PATCH] python-glanceclient: upgrade 2.8.0 -> 2.16.0
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
X-List-Received-Date: Mon, 02 Sep 2019 11:53:51 -0000
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../python/python-glanceclient_git.bb          | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/meta-openstack/recipes-devtools/python/python-glanceclient_git.bb b/meta-openstack/recipes-devtools/python/python-glanceclient_git.bb
index 00ea2ab..e828cba 100644
--- a/meta-openstack/recipes-devtools/python/python-glanceclient_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-glanceclient_git.bb
@@ -3,22 +3,20 @@ HOMEPAGE = "https://github.com/openstack/python-glanceclient"
 SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
+SRC_URI = "git://github.com/openstack/python-glanceclient.git \
+           file://glance-api-check.sh \
+        "
+
+PV = "2.16.0+git${SRCPV}"
+SRCREV = "44a4dbd6ce2642daeaca9f45ac99e2d1b39e805a"
+S = "${WORKDIR}/git"
+
 DEPENDS += " \
         gmp \
         python-pip \
         python-pbr \
         "
 
-SRCREV = "13b25ff1fed908cfe7b4e719a97efd7121e3be96"
-PV = "2.8.0+git${SRCPV}"
-
-SRC_URI = "\
-	git://github.com/openstack/${BPN}.git;branch=stable/pike \
-	file://glance-api-check.sh \
-	"
-
-S = "${WORKDIR}/git"
-
 inherit setuptools monitor rmargparse
 
 FILES_${PN} += "${datadir}/${SRCNAME}"
-- 
2.17.1




