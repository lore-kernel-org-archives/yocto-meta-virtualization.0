Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8C908E00924; Sat, 21 Jan 2017 19:49:11 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 33D44E0043F
	for <meta-virtualization@yoctoproject.org>;
	Sat, 21 Jan 2017 19:49:10 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v0M3n97l025144
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Sat, 21 Jan 2017 19:49:09 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Sat, 21 Jan 2017 19:49:09 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Sat, 21 Jan 2017 22:48:47 -0500
Message-ID: <1485056928-21697-3-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1485056928-21697-1-git-send-email-mark.asselstine@windriver.com>
References: <1485056928-21697-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [m-c-s][PATCH 3/4] python-pika-pool: initial recipe
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
X-List-Received-Date: Sun, 22 Jan 2017 03:49:11 -0000
Content-Type: text/plain

This is required by the stable/newton version of
python-oslo.messaging.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../python/python-pika-pool_0.1.3.bb                | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta-openstack/recipes-devtools/python/python-pika-pool_0.1.3.bb

diff --git a/meta-openstack/recipes-devtools/python/python-pika-pool_0.1.3.bb b/meta-openstack/recipes-devtools/python/python-pika-pool_0.1.3.bb
new file mode 100644
index 0000000..2cac89e
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-pika-pool_0.1.3.bb
@@ -0,0 +1,21 @@
+SUMMARY = "pools for your pikas"
+HOMEPAGE = "https://github.com/bninja/pika-pool"
+SECTION = "devel/python"
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=550794465ba0ec5312d6919e203a55f9"
+
+SRCNAME = "pika-pool"
+
+SRC_URI = "https://pypi.io/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+SRC_URI[md5sum] = "0a3897e991aa3da948e03660313c1980"
+SRC_URI[sha256sum] = "f3985888cc2788cdbd293a68a8b5702a9c955db6f7b8b551aeac91e7f32da397"
+
+inherit setuptools
+
+RDEPENDS_${PN} += " \
+    python-pika \
+    "
-- 
2.7.4


