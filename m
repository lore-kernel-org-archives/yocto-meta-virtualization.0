Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4E345E00D8D; Mon,  2 Sep 2019 05:12:01 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 82A90E00D60
	for <meta-virtualization@yoctoproject.org>;
	Mon,  2 Sep 2019 05:12:00 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.64,459,1559491200"; d="scan'208";a="74701250"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 02 Sep 2019 20:11:59 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 74AAE4CE14E3
	for <meta-virtualization@yoctoproject.org>;
	Mon,  2 Sep 2019 20:11:58 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 2 Sep 2019 20:12:01 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 2 Sep 2019 20:11:18 +0800
Message-ID: <1567426278-119223-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-yoursite-MailScanner-ID: 74AAE4CE14E3.A90BB
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
Subject: [PATCH] python-oslo.utils: Python3 version fix
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
X-List-Received-Date: Mon, 02 Sep 2019 12:12:01 -0000
Content-Type: text/plain

1) Remove 'inherit setuptools' from python-oslo.utils.inc as it was
included in python-oslo.utils_git.bb and python3-oslo.utils_git.bb.

2) Remove RDEPENDS which are not needed for python3.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-oslo.utils.inc          | 4 ----
 .../recipes-devtools/python/python-oslo.utils_git.bb       | 7 +++++++
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta-openstack/recipes-devtools/python/python-oslo.utils.inc b/meta-openstack/recipes-devtools/python/python-oslo.utils.inc
index 04aa24a..8c3022d 100644
--- a/meta-openstack/recipes-devtools/python/python-oslo.utils.inc
+++ b/meta-openstack/recipes-devtools/python/python-oslo.utils.inc
@@ -11,8 +11,6 @@ PV = "3.28.0+git${SRCPV}"
 SRCREV = "8b3965b9bbe1e31a4939f2f69c5239d6d5c7f72c"
 S = "${WORKDIR}/git"
 
-inherit setuptools
-
 # DEPENDS_default: python-pip
 
 DEPENDS += " \
@@ -31,11 +29,9 @@ RDEPENDS_${PN} += " \
         ${PYTHON_PN}-six \
         ${PYTHON_PN}-iso8601 \
         ${PYTHON_PN}-oslo.i18n \
-        ${PYTHON_PN}-monotonic \
         ${PYTHON_PN}-pytz \
         ${PYTHON_PN}-netaddr \
         ${PYTHON_PN}-netifaces \
         ${PYTHON_PN}-debtcollector \
-        ${PYTHON_PN}-funcsigs \
         ${PYTHON_PN}-pyparsing \
         "
diff --git a/meta-openstack/recipes-devtools/python/python-oslo.utils_git.bb b/meta-openstack/recipes-devtools/python/python-oslo.utils_git.bb
index fea3c85..1fe6253 100644
--- a/meta-openstack/recipes-devtools/python/python-oslo.utils_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-oslo.utils_git.bb
@@ -1,2 +1,9 @@
 inherit setuptools
 require python-oslo.utils.inc
+
+# RDEPENDS only for python2
+RDEPENDS_${PN} += " \
+        ${PYTHON_PN}-monotonic \
+        ${PYTHON_PN}-funcsigs \
+        "
+
-- 
2.17.1




