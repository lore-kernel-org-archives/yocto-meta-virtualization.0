Return-Path: <hongl.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 960E6E00B92; Tue, 18 Sep 2018 02:36:43 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B3EEEE00AC5
	for <meta-virtualization@yoctoproject.org>;
	Tue, 18 Sep 2018 02:36:42 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="45056880"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 18 Sep 2018 17:36:39 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 52C544B6EC83
	for <meta-virtualization@yoctoproject.org>;
	Tue, 18 Sep 2018 17:36:37 +0800 (CST)
Received: from localhost.local (10.167.225.78) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.408.0; Tue, 18 Sep 2018 17:36:36 +0800
From: Hong Liu <hongl.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 18 Sep 2018 17:36:29 +0800
Message-ID: <20180918093631.1253-1-hongl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.14.3
MIME-Version: 1.0
X-Originating-IP: [10.167.225.78]
X-yoursite-MailScanner-ID: 52C544B6EC83.AE3D5
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: hongl.fnst@cn.fujitsu.com
Subject: [PATCH] [meta-cloud-services][patch]:python-psycopg2:2.7.4 -> 2.7.5
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
X-List-Received-Date: Tue, 18 Sep 2018 09:36:43 -0000
Content-Type: text/plain

1.Upgrade python-psycopg2 from 2.7.4 to 2.7.5

2.Modify LIC_FILES_CHKSUM.because of delete BSD-like license

Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
---
 .../python/{python-psycopg2_2.7.4.bb => python-psycopg2_2.7.5.bb}   | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-psycopg2_2.7.4.bb => python-psycopg2_2.7.5.bb} (57%)

diff --git a/meta-openstack/recipes-devtools/python/python-psycopg2_2.7.4.bb b/meta-openstack/recipes-devtools/python/python-psycopg2_2.7.5.bb
similarity index 57%
rename from meta-openstack/recipes-devtools/python/python-psycopg2_2.7.4.bb
rename to meta-openstack/recipes-devtools/python/python-psycopg2_2.7.5.bb
index 674322d..740643d 100644
--- a/meta-openstack/recipes-devtools/python/python-psycopg2_2.7.4.bb
+++ b/meta-openstack/recipes-devtools/python/python-psycopg2_2.7.5.bb
@@ -2,15 +2,15 @@ DESCRIPTION = "Python-PostgreSQL Database Adapter"
 HOMEPAGE = "http://initd.org/psycopg/"
 SECTION = "devel/python"
 LICENSE = "GPLv3+"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=2c9872d13fa571e7ba6de95055da1fe2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=72bded22a37845c7d9dc3fd39d699a2d"
 DEPENDS = "postgresql"
 
 SRC_URI += " \
            file://remove-pg-config.patch \
           "
 
-SRC_URI[md5sum] = "70fc57072e084565a42689d416cf2c5c"
-SRC_URI[sha256sum] = "8bf51191d60f6987482ef0cfe8511bbf4877a5aa7f313d7b488b53189cf26209"
+SRC_URI[md5sum] = "9e7d6f695fc7f8d1c42a7905449246c9"
+SRC_URI[sha256sum] = "eccf962d41ca46e6326b97c8fe0a6687b58dfc1a5f6540ed071ff1474cea749e"
 
 inherit distutils pypi
 
-- 
2.7.4




