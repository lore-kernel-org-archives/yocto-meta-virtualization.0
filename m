Return-Path: <hongl.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D1046E0163F; Mon, 16 Jul 2018 02:37:15 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [183.91.158.132 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0AF12E00D3D
	for <meta-virtualization@yoctoproject.org>;
	Mon, 16 Jul 2018 02:37:11 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="42282883"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 16 Jul 2018 17:37:04 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id C89934B66C12
	for <meta-virtualization@yoctoproject.org>;
	Mon, 16 Jul 2018 17:37:04 +0800 (CST)
Received: from localhost.local (10.167.225.78) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.399.0; Mon, 16 Jul 2018 17:37:05 +0800
From: Hong Liu <hongl.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 16 Jul 2018 17:36:28 +0800
Message-ID: <20180716093631.27024-1-hongl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.14.3
MIME-Version: 1.0
X-Originating-IP: [10.167.225.78]
X-yoursite-MailScanner-ID: C89934B66C12.ABB89
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: hongl.fnst@cn.fujitsu.com
Subject: [PATCH] [meta-cloud-services][patch] python-amqp : 2.2.2 -> 2.3.2
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
X-List-Received-Date: Mon, 16 Jul 2018 09:37:15 -0000
Content-Type: text/plain

Upgrade python-amqp from 2.2.2 to 2.3.2.

Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
---
 .../python/{python-amqp_2.2.2.bb => python-amqp_2.3.2.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-amqp_2.2.2.bb => python-amqp_2.3.2.bb} (68%)

diff --git a/meta-openstack/recipes-devtools/python/python-amqp_2.2.2.bb b/meta-openstack/recipes-devtools/python/python-amqp_2.3.2.bb
similarity index 68%
rename from meta-openstack/recipes-devtools/python/python-amqp_2.2.2.bb
rename to meta-openstack/recipes-devtools/python/python-amqp_2.3.2.bb
index 94979d3..395c81e 100644
--- a/meta-openstack/recipes-devtools/python/python-amqp_2.2.2.bb
+++ b/meta-openstack/recipes-devtools/python/python-amqp_2.3.2.bb
@@ -4,8 +4,8 @@ SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=9d6ba772ac59c08a25a12ce15bd5f27b"
 
-SRC_URI[md5sum] = "0971a3fd2d635ded45c349cfc17106bd"
-SRC_URI[sha256sum] = "cba1ace9d4ff6049b190d8b7991f9c1006b443a5238021aca96dd6ad2ac9da22"
+SRC_URI[md5sum] = "11fce0d01f4ee6886a02415c20cece80"
+SRC_URI[sha256sum] = "073dd02fdd73041bffc913b767866015147b61f2a9bc104daef172fc1a0066eb"
 
 inherit setuptools pypi
 
-- 
2.7.4




