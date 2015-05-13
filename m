Return-Path: <Jackie.Huang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8A488E008DC; Wed, 13 May 2015 00:25:01 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 694EFE009F0
	for <meta-virtualization@yoctoproject.org>;
	Wed, 13 May 2015 00:24:43 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t4D7Ogo3008913
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 13 May 2015 00:24:42 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Wed, 13 May 2015 00:24:42 -0700
From: <jackie.huang@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 13 May 2015 15:24:29 +0800
Message-ID: <728b5cb4dcff221dbc249b12f2da260a5e213289.1431501591.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1431501591.git.jackie.huang@windriver.com>
References: <cover.1431501591.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 06/11] python-xstatic-angular-irdragndrop: add new recipe
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
X-List-Received-Date: Wed, 13 May 2015 07:25:01 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

It's required by python-horizon

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../python-xstatic-angular-irdragndrop_1.0.2.2.bb  | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-openstack/recipes-devtools/python/python-xstatic-angular-irdragndrop_1.0.2.2.bb

diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-angular-irdragndrop_1.0.2.2.bb b/meta-openstack/recipes-devtools/python/python-xstatic-angular-irdragndrop_1.0.2.2.bb
new file mode 100644
index 0000000..2ad3e55
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-xstatic-angular-irdragndrop_1.0.2.2.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "IrDragNDrop javascript library packaged for setuptools"
+HOMEPAGE = "https://pypi.python.org/pypi/XStatic-Angular-IrDragNDrop"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=9acc2dfc3a0345c175df08104bd22298"
+
+SRCNAME = "XStatic-Angular-IrDragNDrop"
+SRC_URI = "http://pypi.python.org/packages/source/X/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "6ea8809bae94014aef699d58836dba84"
+SRC_URI[sha256sum] = "5595f4a98ac8f8468f7e56dc916e10c0fc5f0197567899a75755f99fe8b5bd6d"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit setuptools
+
+DEPENDS += " \
+        python-pip \
+        "
+
+RDEPENDS_${PN} += " \
+        "
-- 
1.9.1


