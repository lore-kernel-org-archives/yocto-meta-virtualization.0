Return-Path: <yuanc.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 30D42E00D60; Mon, 26 Aug 2019 00:19:16 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D8C87E00D59
	for <meta-virtualization@yoctoproject.org>;
	Mon, 26 Aug 2019 00:19:14 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.64,431,1559491200"; d="scan'208";a="74282229"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 26 Aug 2019 15:19:13 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 3C4754CE0435
	for <meta-virtualization@yoctoproject.org>;
	Mon, 26 Aug 2019 15:19:03 +0800 (CST)
Received: from localhost.localdomain (10.167.225.21) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 26 Aug 2019 15:19:13 +0800
From: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 26 Aug 2019 16:18:58 +0900
Message-ID: <20190826071858.1543-1-yuanc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
X-Originating-IP: [10.167.225.21]
X-yoursite-MailScanner-ID: 3C4754CE0435.ADEEE
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yuanc.fnst@cn.fujitsu.com
Subject: [PATCH] python-eventlet: upgrade 0.25.0 -> 0.25.1
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
X-List-Received-Date: Mon, 26 Aug 2019 07:19:16 -0000
Content-Type: text/plain

Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
---
 .../{python-eventlet_0.25.0.bb => python-eventlet_0.25.1.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-eventlet_0.25.0.bb => python-eventlet_0.25.1.bb} (63%)

diff --git a/meta-openstack/recipes-devtools/python/python-eventlet_0.25.0.bb b/meta-openstack/recipes-devtools/python/python-eventlet_0.25.1.bb
similarity index 63%
rename from meta-openstack/recipes-devtools/python/python-eventlet_0.25.0.bb
rename to meta-openstack/recipes-devtools/python/python-eventlet_0.25.1.bb
index c3eabb2..d2878b6 100644
--- a/meta-openstack/recipes-devtools/python/python-eventlet_0.25.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-eventlet_0.25.1.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=56472ad6de4caf50e05332a34b66e778"
 
-SRC_URI[md5sum] = "a7e8759e6684352ea81a157b6f93fb9b"
-SRC_URI[sha256sum] = "f0610bd0d3bb3d51d69f74caa4ad04fc7bce424cdb72e54d08ccda90d8c69800"
+SRC_URI[md5sum] = "8d7145af6506d5418c5a6bee7bf0b7e7"
+SRC_URI[sha256sum] = "6c9c625af48424c4680d89314dbe45a76cc990cf002489f9469ff214b044ffc1"
 
 inherit setuptools pypi
-- 
2.17.1




