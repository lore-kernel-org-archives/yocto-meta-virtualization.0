Return-Path: <Jackie.Huang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 148D7E009F0; Tue, 28 Apr 2015 20:10:06 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7B222E009E3
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Apr 2015 20:09:35 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t3T39ZI3009412
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Apr 2015 20:09:35 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Tue, 28 Apr 2015 20:09:34 -0700
From: <jackie.huang@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 29 Apr 2015 11:08:45 +0800
Message-ID: <2277e5d7aef4a73ae33fe97c7344f4ed924783f5.1430275945.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1430275944.git.jackie.huang@windriver.com>
References: <cover.1430275944.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 35/55] python-rfc3986: upgrade to 0.2.1
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
X-List-Received-Date: Wed, 29 Apr 2015 03:10:06 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../python/{python-rfc3986_0.2.0.bb => python-rfc3986_0.2.1.bb}      | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-rfc3986_0.2.0.bb => python-rfc3986_0.2.1.bb} (77%)

diff --git a/meta-openstack/recipes-devtools/python/python-rfc3986_0.2.0.bb b/meta-openstack/recipes-devtools/python/python-rfc3986_0.2.1.bb
similarity index 77%
rename from meta-openstack/recipes-devtools/python/python-rfc3986_0.2.0.bb
rename to meta-openstack/recipes-devtools/python/python-rfc3986_0.2.1.bb
index 88f6c01..66952d8 100644
--- a/meta-openstack/recipes-devtools/python/python-rfc3986_0.2.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-rfc3986_0.2.1.bb
@@ -4,13 +4,12 @@ SECTION = "devel/python"
 LICENSE = "Apache-2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=03731a0e7dbcb30cecdcec77cc93ec29"
 
-PR = "r0"
 
 SRCNAME = "rfc3986"
 SRC_URI = "http://pypi.python.org/packages/source/r/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "a80b964a92c3a40e57ec95f7c0d68fa9"
-SRC_URI[sha256sum] = "8a7b3f6cfdfb969c2e876513e87c30ebe1e4bdc9fae4a63c701eee88bbec9b22"
+SRC_URI[md5sum] = "84151eec209c99e71edc760745510da4"
+SRC_URI[sha256sum] = "85aec4beb1edc4fa7cb7466cca1410237cb3e344968d07126e428bc62adb8f3c"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
1.9.1


