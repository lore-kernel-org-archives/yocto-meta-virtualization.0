Return-Path: <hongl.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D9396E0163F; Mon, 16 Jul 2018 02:37:16 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3317BE00D5F
	for <meta-virtualization@yoctoproject.org>;
	Mon, 16 Jul 2018 02:37:12 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="42282885"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 16 Jul 2018 17:37:04 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 5EBAC4B66C17
	for <meta-virtualization@yoctoproject.org>;
	Mon, 16 Jul 2018 17:37:05 +0800 (CST)
Received: from localhost.local (10.167.225.78) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.399.0; Mon, 16 Jul 2018 17:37:06 +0800
From: Hong Liu <hongl.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 16 Jul 2018 17:36:29 +0800
Message-ID: <20180716093631.27024-2-hongl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180716093631.27024-1-hongl.fnst@cn.fujitsu.com>
References: <20180716093631.27024-1-hongl.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.78]
X-yoursite-MailScanner-ID: 5EBAC4B66C17.A0672
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: hongl.fnst@cn.fujitsu.com
Subject: [PATCH] [meta-cloud-services][patch]:python-httplib2 : 0.10.3 -> 0.11.3
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
X-List-Received-Date: Mon, 16 Jul 2018 09:37:16 -0000
Content-Type: text/plain

1.Upgrade python-httplib2 from 0.10.3 to 0.11.3.

Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
---
 .../python/{python-httplib2_0.10.3.bb => python-httplib2_0.11.3.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-httplib2_0.10.3.bb => python-httplib2_0.11.3.bb} (59%)

diff --git a/meta-openstack/recipes-devtools/python/python-httplib2_0.10.3.bb b/meta-openstack/recipes-devtools/python/python-httplib2_0.11.3.bb
similarity index 59%
rename from meta-openstack/recipes-devtools/python/python-httplib2_0.10.3.bb
rename to meta-openstack/recipes-devtools/python/python-httplib2_0.11.3.bb
index c5ced3f..f59aa5b 100644
--- a/meta-openstack/recipes-devtools/python/python-httplib2_0.10.3.bb
+++ b/meta-openstack/recipes-devtools/python/python-httplib2_0.11.3.bb
@@ -2,10 +2,10 @@ DESCRIPTION = "A comprehensive HTTP client library"
 HOMEPAGE = "https://code.google.com/p/httplib2/"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=41a98bc55b04b2a38acdb5c8ab0ae6b2"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=4d159ceca4925adea3407818d4a87968"
 
-SRC_URI[md5sum] = "709c305e1b00e9c0af49ee816429569c"
-SRC_URI[sha256sum] = "e404d3b7bd86c1bc931906098e7c1305d6a3a6dcef141b8bb1059903abb3ceeb"
+SRC_URI[md5sum] = "9aa3e074da9a235cd675dd65e1fbcf39"
+SRC_URI[sha256sum] = "e71daed9a0e6373642db61166fa70beecc9bf04383477f84671348c02a04cbdf"
 
 inherit setuptools pypi
 
-- 
2.7.4




