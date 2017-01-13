Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7B764E0034A; Fri, 13 Jan 2017 00:39:27 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
X-Greylist: delayed 63 seconds by postgrey-1.32 at yocto-www;
	Fri, 13 Jan 2017 00:39:24 PST
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id ED541E0030B
	for <meta-virtualization@yoctoproject.org>;
	Fri, 13 Jan 2017 00:39:24 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="14745380"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 13 Jan 2017 16:38:20 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 279DF47B1500
	for <meta-virtualization@yoctoproject.org>;
	Fri, 13 Jan 2017 16:38:18 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Fri, 13 Jan 2017 16:38:19 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Fri, 13 Jan 2017 16:38:01 +0800
Message-ID: <1484296681-949-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: 279DF47B1500.A8073
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
Subject: [PATCH] python-sphinx: 1.3.1 -> 1.4.1
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
X-List-Received-Date: Fri, 13 Jan 2017 08:39:27 -0000
Content-Type: text/plain

1) Upgrade python-sphinx from 1.3.1 to 1.4.1
2) License checksum changed,since the copyright years were updated.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../python/{python-sphinx_1.3.1.bb => python-sphinx_1.4.1.bb}       | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename recipes-devtools/python/{python-sphinx_1.3.1.bb => python-sphinx_1.4.1.bb} (62%)

diff --git a/recipes-devtools/python/python-sphinx_1.3.1.bb b/recipes-devtools/python/python-sphinx_1.4.1.bb
similarity index 62%
rename from recipes-devtools/python/python-sphinx_1.3.1.bb
rename to recipes-devtools/python/python-sphinx_1.4.1.bb
index fe8ad94..835b369 100644
--- a/recipes-devtools/python/python-sphinx_1.3.1.bb
+++ b/recipes-devtools/python/python-sphinx_1.4.1.bb
@@ -2,15 +2,15 @@ DESCRIPTION = "Python documentation generator"
 HOMEPAGE = "http://sphinx-doc.org/"
 SECTION = "devel/python"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=6dd095eaa1e7a662b279daf80ecad7e6"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=72f034adc6f7b05b09bc00d1a05bb065"
 
 PR = "r0"
 SRCNAME = "Sphinx"
 
 SRC_URI = "http://pypi.python.org/packages/source/S/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "8786a194acf9673464c5455b11fd4332"
-SRC_URI[sha256sum] = "1a6e5130c2b42d2de301693c299f78cc4bd3501e78b610c08e45efc70e2b5114"
+SRC_URI[md5sum] = "4c4988e0306a04cef8dccc384281e585"
+SRC_URI[sha256sum] = "c6871a784d24aba9270b6b28541537a57e2fcf4d7c799410eba18236bc76d6bc"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
2.7.4




