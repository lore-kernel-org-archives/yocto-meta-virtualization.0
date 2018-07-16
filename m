Return-Path: <hongl.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0FE9EE01652; Mon, 16 Jul 2018 02:37:19 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 34954E01454
	for <meta-virtualization@yoctoproject.org>;
	Mon, 16 Jul 2018 02:37:13 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="42282886"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 16 Jul 2018 17:37:04 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id EDC744B66C21
	for <meta-virtualization@yoctoproject.org>;
	Mon, 16 Jul 2018 17:37:05 +0800 (CST)
Received: from localhost.local (10.167.225.78) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.399.0; Mon, 16 Jul 2018 17:37:06 +0800
From: Hong Liu <hongl.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 16 Jul 2018 17:36:30 +0800
Message-ID: <20180716093631.27024-3-hongl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180716093631.27024-1-hongl.fnst@cn.fujitsu.com>
References: <20180716093631.27024-1-hongl.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.78]
X-yoursite-MailScanner-ID: EDC744B66C21.AF9AE
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: hongl.fnst@cn.fujitsu.com
Subject: [PATCH] [meta-cloud-services][patch]:python-httpretty:0.8.14 -> 0.9.5
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
X-List-Received-Date: Mon, 16 Jul 2018 09:37:19 -0000
Content-Type: text/plain

1.Upgrade python-httpretty from 0.8.14 to 0.9.5.

Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
---
 .../{python-httpretty_0.8.14.bb => python-httpretty_0.9.5.bb}       | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-httpretty_0.8.14.bb => python-httpretty_0.9.5.bb} (54%)

diff --git a/meta-openstack/recipes-devtools/python/python-httpretty_0.8.14.bb b/meta-openstack/recipes-devtools/python/python-httpretty_0.9.5.bb
similarity index 54%
rename from meta-openstack/recipes-devtools/python/python-httpretty_0.8.14.bb
rename to meta-openstack/recipes-devtools/python/python-httpretty_0.9.5.bb
index a315fff..e39ad05 100644
--- a/meta-openstack/recipes-devtools/python/python-httpretty_0.8.14.bb
+++ b/meta-openstack/recipes-devtools/python/python-httpretty_0.9.5.bb
@@ -5,10 +5,10 @@ DESCRIPTION = "HTTP client mock for Python"
 HOMEPAGE = "https://pypi.python.org/pypi/httpretty"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=88d874c445b42d9bcea5d211bbc6b8bd"
+LIC_FILES_CHKSUM = "file://COPYING;md5=113a91608a1d89039af9393c39bcaa2c"
 
-SRC_URI[md5sum] = "2a6bbf270fafc77647b0479d95d0544c"
-SRC_URI[sha256sum] = "83c176bbac9d68a45a5cca54f2d5be7e6b16a063adf6f334e7fd0eee272e976e"
+SRC_URI[md5sum] = "e0e4294987c02181b1141c9ceb81783f"
+SRC_URI[sha256sum] = "543fa2bd9c319bfa1e1de9e37d7c9c08fa926a692b65b0be5df4b2f069fd0ad7"
 
 inherit setuptools pypi
 
-- 
2.7.4




