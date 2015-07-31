Return-Path: <leimaohui@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9CE66E00B56; Fri, 31 Jul 2015 00:27:03 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 06FD2E00B43
	for <meta-virtualization@yoctoproject.org>;
	Fri, 31 Jul 2015 00:27:00 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="99112742"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 31 Jul 2015 15:30:32 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t6V7P7xR030859
	for <meta-virtualization@yoctoproject.org>;
	Fri, 31 Jul 2015 15:25:07 +0800
Received: from localhost.localdomain (10.167.226.26) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 31 Jul 2015 15:26:58 +0800
From: Lei Maohui <leimaohui@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Fri, 31 Jul 2015 15:26:57 +0800
Message-ID: <1438327617-18539-1-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.26]
Subject: [PATCH] python-psycopg2: upgrade 2.5->2.6.1
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
X-List-Received-Date: Fri, 31 Jul 2015 07:27:03 -0000
Content-Type: text/plain

Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
---
 .../python/{python-psycopg2_2.5.bb => python-psycopg2_2.6.1.bb}     | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-psycopg2_2.5.bb => python-psycopg2_2.6.1.bb} (69%)

diff --git a/meta-openstack/recipes-devtools/python/python-psycopg2_2.5.bb b/meta-openstack/recipes-devtools/python/python-psycopg2_2.6.1.bb
similarity index 69%
rename from meta-openstack/recipes-devtools/python/python-psycopg2_2.5.bb
rename to meta-openstack/recipes-devtools/python/python-psycopg2_2.6.1.bb
index c92842e..8882903 100644
--- a/meta-openstack/recipes-devtools/python/python-psycopg2_2.5.bb
+++ b/meta-openstack/recipes-devtools/python/python-psycopg2_2.6.1.bb
@@ -9,10 +9,10 @@ PR = "r0"
 SRCNAME = "psycopg2"
 
 SRC_URI = "https://pypi.python.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
-           file://remove-pg-config.patch"
+          "
 
-SRC_URI[md5sum] = "facd82faa067e99b80146a0ee2f842f6"
-SRC_URI[sha256sum] = "6b2f0cc9199de9eaa53ba10ff69b2741e73484b24657e69bdae259561c23bde4"
+SRC_URI[md5sum] = "842b44f8c95517ed5b792081a2370da1"
+SRC_URI[sha256sum] = "6acf9abbbe757ef75dc2ecd9d91ba749547941abaffbe69ff2086a9e37d4904c"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
1.8.4.2


