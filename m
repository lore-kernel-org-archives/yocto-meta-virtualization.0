Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BED9CE00C43; Sun, 26 May 2019 21:03:02 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 97EA9E0043B
	for <meta-virtualization@yoctoproject.org>;
	Sun, 26 May 2019 21:03:00 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.60,517,1549900800"; d="scan'208";a="64749232"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 27 May 2019 12:02:58 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 90F474CDD0B2
	for <meta-virtualization@yoctoproject.org>;
	Mon, 27 May 2019 11:44:01 +0800 (CST)
Received: from localhost.local (10.167.225.84) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 27 May 2019 11:44:05 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 27 May 2019 11:45:01 +0800
Message-ID: <20190527034501.2413-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.84]
X-yoursite-MailScanner-ID: 90F474CDD0B2.AA4A5
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Subject: [PATCH] python-netifaces:upgrade 0.10.4 -> 0.10.9
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
X-List-Received-Date: Mon, 27 May 2019 04:03:02 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from python-netifaces_0.10.4.bb to python-netifaces_0.10.9.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 ...{python-netifaces_0.10.4.bb => python-netifaces_0.10.9.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-netifaces_0.10.4.bb => python-netifaces_0.10.9.bb} (65%)

diff --git a/meta-openstack/recipes-devtools/python/python-netifaces_0.10.4.bb b/meta-openstack/recipes-devtools/python/python-netifaces_0.10.9.bb
similarity index 65%
rename from meta-openstack/recipes-devtools/python/python-netifaces_0.10.4.bb
rename to meta-openstack/recipes-devtools/python/python-netifaces_0.10.9.bb
index 9e0e1fe..05f5f4a 100644
--- a/meta-openstack/recipes-devtools/python/python-netifaces_0.10.4.bb
+++ b/meta-openstack/recipes-devtools/python/python-netifaces_0.10.9.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
-SRC_URI[md5sum] = "36da76e2cfadd24cc7510c2c0012eb1e"
-SRC_URI[sha256sum] = "9656a169cb83da34d732b0eb72b39373d48774aee009a3d1272b7ea2ce109cde"
+SRC_URI[md5sum] = "de92cc322b4f56047c073f802ad77860"
+SRC_URI[sha256sum] = "2dee9ffdd16292878336a58d04a20f0ffe95555465fee7c9bd23b3490ef2abf3"
 
 inherit setuptools pypi
-- 
2.20.1




