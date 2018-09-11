Return-Path: <hongl.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 286AAE00A85; Tue, 11 Sep 2018 02:29:43 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8ECE3E00A85
	for <meta-virtualization@yoctoproject.org>;
	Tue, 11 Sep 2018 02:29:39 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="44773842"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 11 Sep 2018 17:29:37 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 460D34B6EC9B
	for <meta-virtualization@yoctoproject.org>;
	Tue, 11 Sep 2018 17:29:38 +0800 (CST)
Received: from localhost.local (10.167.225.78) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.408.0; Tue, 11 Sep 2018 17:29:37 +0800
From: Hong Liu <hongl.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 11 Sep 2018 17:29:17 +0800
Message-ID: <20180911092917.25868-4-hongl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180911092917.25868-1-hongl.fnst@cn.fujitsu.com>
References: <20180911092917.25868-1-hongl.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.78]
X-yoursite-MailScanner-ID: 460D34B6EC9B.AFCC3
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: hongl.fnst@cn.fujitsu.com
Subject: [PATCH] [meta-cloud-services][patch]:python-pecan:1.2.1->1.3.2
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
X-List-Received-Date: Tue, 11 Sep 2018 09:29:43 -0000
Content-Type: text/plain

1.Upgrade python-pecan from 1.2.1 to 1.3.2

2.Remove python-webob from rdepends.

Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
---
 .../python/{python-pecan_1.2.1.bb => python-pecan_1.3.2.bb}        | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-pecan_1.2.1.bb => python-pecan_1.3.2.bb} (62%)

diff --git a/meta-openstack/recipes-devtools/python/python-pecan_1.2.1.bb b/meta-openstack/recipes-devtools/python/python-pecan_1.3.2.bb
similarity index 62%
rename from meta-openstack/recipes-devtools/python/python-pecan_1.2.1.bb
rename to meta-openstack/recipes-devtools/python/python-pecan_1.3.2.bb
index 656bb02..0e2a863 100644
--- a/meta-openstack/recipes-devtools/python/python-pecan_1.2.1.bb
+++ b/meta-openstack/recipes-devtools/python/python-pecan_1.3.2.bb
@@ -4,13 +4,12 @@ SECTION = "devel/python"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d846877d24bbb3d7a00a985c90378e8c"
 
-SRC_URI[md5sum] = "d0ad387dbc77d1803ad3573fe38a4e0a"
-SRC_URI[sha256sum] = "8d95457b9cedcfda9b467f5cc7dde8cdf72ddba6b402d6a5902843d1b2186c46"
+SRC_URI[md5sum] = "42bff04c3a90c32d78560fe7921658d4"
+SRC_URI[sha256sum] = "24f06cf88a488b75f433e62b33c1c97e4575d0cd91eec9eec841a81cecfd6de3"
 
 inherit setuptools pypi
 
-RDEPENDS_${PN} = "python-webob \
-                  python-mako \
+RDEPENDS_${PN} = "python-mako \
                   python-webtest \
                   python-six \
                   python-logutils \
-- 
2.7.4




