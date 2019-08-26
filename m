Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 59058E00CD7; Sun, 25 Aug 2019 22:46:01 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D5CCBE00CD7
	for <meta-virtualization@yoctoproject.org>;
	Sun, 25 Aug 2019 22:45:59 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.64,431,1559491200"; d="scan'208";a="74278136"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 26 Aug 2019 13:45:57 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 611574CE0435
	for <meta-virtualization@yoctoproject.org>;
	Mon, 26 Aug 2019 13:45:51 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 26 Aug 2019 13:46:02 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 26 Aug 2019 13:45:50 +0800
Message-ID: <1566798350-114744-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-yoursite-MailScanner-ID: 611574CE0435.A6A4C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
Subject: [PATCH] python-kombu: Python3 version fix
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
X-List-Received-Date: Mon, 26 Aug 2019 05:46:01 -0000
Content-Type: text/plain

Specifies the major Python version being built using PYTHON_PN

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 meta-openstack/recipes-devtools/python/python-kombu.inc       | 4 +++-
 meta-openstack/recipes-devtools/python/python-kombu_4.6.4.bb  | 2 +-
 meta-openstack/recipes-devtools/python/python3-kombu_4.6.4.bb | 2 +-
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta-openstack/recipes-devtools/python/python-kombu.inc b/meta-openstack/recipes-devtools/python/python-kombu.inc
index 3053f71..9918281 100644
--- a/meta-openstack/recipes-devtools/python/python-kombu.inc
+++ b/meta-openstack/recipes-devtools/python/python-kombu.inc
@@ -7,8 +7,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=daea7c168428449fbee05e644df929f4"
 SRC_URI[md5sum] = "4eb5f1e6f669e04f5bd0c627c7467156"
 SRC_URI[sha256sum] = "e5f0312dfb9011bebbf528ccaf118a6c2b5c3b8244451f08381fb23e7715809b"
 
+inherit pypi
+
 FILES_${PN}-doc += "${datadir}/${SRCNAME}"
 
 RDEPENDS_${PN} = " \
-        python-amqp \
+        ${PYTHON_PN}-amqp \
         "
diff --git a/meta-openstack/recipes-devtools/python/python-kombu_4.6.4.bb b/meta-openstack/recipes-devtools/python/python-kombu_4.6.4.bb
index 28b6258..8c5c4d6 100644
--- a/meta-openstack/recipes-devtools/python/python-kombu_4.6.4.bb
+++ b/meta-openstack/recipes-devtools/python/python-kombu_4.6.4.bb
@@ -1,3 +1,3 @@
-inherit setuptools pypi
+inherit setuptools
 require python-kombu.inc
 
diff --git a/meta-openstack/recipes-devtools/python/python3-kombu_4.6.4.bb b/meta-openstack/recipes-devtools/python/python3-kombu_4.6.4.bb
index fc752d9..11b0826 100644
--- a/meta-openstack/recipes-devtools/python/python3-kombu_4.6.4.bb
+++ b/meta-openstack/recipes-devtools/python/python3-kombu_4.6.4.bb
@@ -1,2 +1,2 @@
-inherit setuptools3 pypi
+inherit setuptools3
 require python-kombu.inc
-- 
2.17.1




