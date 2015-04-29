Return-Path: <Jackie.Huang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7A28CE00A08; Tue, 28 Apr 2015 20:10:47 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 25426E00A61
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Apr 2015 20:09:57 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t3T39ujq000097
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Apr 2015 20:09:56 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Tue, 28 Apr 2015 20:09:56 -0700
From: <jackie.huang@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 29 Apr 2015 11:09:04 +0800
Message-ID: <d1a586a678697382b3f20e837409f7343519c1fe.1430275945.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1430275944.git.jackie.huang@windriver.com>
References: <cover.1430275944.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 54/55] python-mimeparse: upgrade to 0.1.4
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
X-List-Received-Date: Wed, 29 Apr 2015 03:10:47 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../{python-mimeparse_0.1.3.bb => python-mimeparse_0.1.4.bb}  | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-mimeparse_0.1.3.bb => python-mimeparse_0.1.4.bb} (55%)

diff --git a/meta-openstack/recipes-devtools/python/python-mimeparse_0.1.3.bb b/meta-openstack/recipes-devtools/python/python-mimeparse_0.1.4.bb
similarity index 55%
rename from meta-openstack/recipes-devtools/python/python-mimeparse_0.1.3.bb
rename to meta-openstack/recipes-devtools/python/python-mimeparse_0.1.4.bb
index ca152c9..c3e6780 100644
--- a/meta-openstack/recipes-devtools/python/python-mimeparse_0.1.3.bb
+++ b/meta-openstack/recipes-devtools/python/python-mimeparse_0.1.4.bb
@@ -1,16 +1,15 @@
 DESCRIPTION = "basic functions for parsing mime-type names and matching "
-HOMEPAGE = "https://pypi.python.org/pypi/mimeparse/"
+HOMEPAGE = "https://pypi.python.org/pypi/python-mimeparse/"
 SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://README;md5=07e6feb820fbca7eb99538badb3cd8e2"
 
-PR = "r0"
-SRCNAME = "mimeparse"
+SRCNAME = "python-mimeparse"
 
-SRC_URI = "https://pypi.python.org/packages/source/m/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+SRC_URI = "https://pypi.python.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz "
 
-SRC_URI[md5sum] = "03ce207391454db37279e78ce2112365"
-SRC_URI[sha256sum] = "534ff6feefe1cd03984f444e6415aacc79c0a85f3b868ec41a2fd5003004c31e"
+SRC_URI[md5sum] = "1d2816a16f17dcfe0c613da611fe7e13"
+SRC_URI[sha256sum] = "3c69a21e37e77f754e6fc09ebda70acd92c90d8a58f29a41cc0248351378ddc3"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
1.9.1


