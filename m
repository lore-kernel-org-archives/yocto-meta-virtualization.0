Return-Path: <yuanc.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D44FDE00DD1; Tue, 27 Aug 2019 18:56:55 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 196E7E009D8
	for <meta-virtualization@yoctoproject.org>;
	Tue, 27 Aug 2019 18:56:54 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.64,439,1559491200"; d="scan'208";a="74410249"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 28 Aug 2019 09:56:53 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 2956B4CE20F6
	for <meta-virtualization@yoctoproject.org>;
	Wed, 28 Aug 2019 09:56:51 +0800 (CST)
Received: from localhost.localdomain (10.167.225.21) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 28 Aug 2019 09:56:55 +0800
From: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 28 Aug 2019 10:56:38 +0900
Message-ID: <20190828015638.7929-1-yuanc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
X-Originating-IP: [10.167.225.21]
X-yoursite-MailScanner-ID: 2956B4CE20F6.AEE43
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yuanc.fnst@cn.fujitsu.com
Subject: [PATCH] python-tenacity: upgrade 5.0.4 -> 5.1.1
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
X-List-Received-Date: Wed, 28 Aug 2019 01:56:55 -0000
Content-Type: text/plain

Add dependency on setuptools-scm-native

Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
---
 .../{python-tenacity_5.0.4.bb => python-tenacity_5.1.1.bb}   | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-tenacity_5.0.4.bb => python-tenacity_5.1.1.bb} (71%)

diff --git a/meta-openstack/recipes-devtools/python/python-tenacity_5.0.4.bb b/meta-openstack/recipes-devtools/python/python-tenacity_5.1.1.bb
similarity index 71%
rename from meta-openstack/recipes-devtools/python/python-tenacity_5.0.4.bb
rename to meta-openstack/recipes-devtools/python/python-tenacity_5.1.1.bb
index db435cb..5c43a47 100644
--- a/meta-openstack/recipes-devtools/python/python-tenacity_5.0.4.bb
+++ b/meta-openstack/recipes-devtools/python/python-tenacity_5.1.1.bb
@@ -6,14 +6,15 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=175792518e4ac015ab6696d16c4f607e"
 
 inherit pypi
 
-SRC_URI[md5sum] = "2c8333b9f06d5889ea70955a004ae525"
-SRC_URI[sha256sum] = "a0c3c5f7ae0c33f5556c775ca059c12d6fd8ab7121613a713e8b7d649908571b"
+SRC_URI[md5sum] = "c960e3f0c66207c85bbae72a8232278b"
+SRC_URI[sha256sum] = "a4eb168dbf55ed2cae27e7c6b2bd48ab54dabaf294177d998330cf59f294c112"
 
 inherit setuptools
 
 # Satisfy setup.py 'setup_requires'
 DEPENDS += " \
         python-pbr-native \
+ 	 python-setuptools-scm-native \
         "
 
 RDEPENDS_${PN} += " \
-- 
2.17.1




