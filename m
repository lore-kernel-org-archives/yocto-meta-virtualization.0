Return-Path: <Jackie.Huang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 33A57E00A9C; Tue, 28 Apr 2015 20:10:20 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AD7DBE009AF
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Apr 2015 20:09:45 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t3T39jqH000079
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Apr 2015 20:09:45 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Tue, 28 Apr 2015 20:09:44 -0700
From: <jackie.huang@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 29 Apr 2015 11:08:54 +0800
Message-ID: <634d165ef268b7cec363013f3114af5fa1a68229.1430275945.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1430275944.git.jackie.huang@windriver.com>
References: <cover.1430275944.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 44/55] python-thrift: upgrade to 0.9.2
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
X-List-Received-Date: Wed, 29 Apr 2015 03:10:20 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../python/{python-thrift_0.9.1.bb => python-thrift_0.9.2.bb}      | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-thrift_0.9.1.bb => python-thrift_0.9.2.bb} (59%)

diff --git a/meta-openstack/recipes-devtools/python/python-thrift_0.9.1.bb b/meta-openstack/recipes-devtools/python/python-thrift_0.9.2.bb
similarity index 59%
rename from meta-openstack/recipes-devtools/python/python-thrift_0.9.1.bb
rename to meta-openstack/recipes-devtools/python/python-thrift_0.9.2.bb
index ca22472..ec2ea0c 100644
--- a/meta-openstack/recipes-devtools/python/python-thrift_0.9.1.bb
+++ b/meta-openstack/recipes-devtools/python/python-thrift_0.9.2.bb
@@ -2,15 +2,14 @@ DESCRIPTION = "Python bindings for the Apache Thrift RPC system"
 HOMEPAGE = "https://pypi.python.org/pypi/amqp/"
 SECTION = "devel/python"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://README;md5=1bd6aa02231f9e3aa626d8c13c20e1c8"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=df17a59cc9e1327ec49c2285e13ac477"
 
-PR = "r0"
 SRCNAME = "thrift"
 
 SRC_URI = "https://pypi.python.org/packages/source/t/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "8989a8a96b0e3a3380cfb89c44e172a6"
-SRC_URI[sha256sum] = "7d1a75c9bd73b02662483fc68b3e60bc24d75f6e55492d379f3053d68c937770"
+SRC_URI[md5sum] = "91f1c224c46a257bb428431943387dfd"
+SRC_URI[sha256sum] = "08f665e4b033c9d2d0b6174d869273104362c80e77ee4c01054a74141e378afa"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
1.9.1


