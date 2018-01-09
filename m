Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9E430E00E47; Tue,  9 Jan 2018 12:15:33 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 03727E00E35
	for <meta-virtualization@yoctoproject.org>;
	Tue,  9 Jan 2018 12:15:25 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w09KFPsW016410
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 9 Jan 2018 12:15:25 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 9 Jan 2018 12:15:25 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@windriver.com>
Date: Tue, 9 Jan 2018 15:15:02 -0500
Message-ID: <1515528906-6892-8-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1515528906-6892-1-git-send-email-mark.asselstine@windriver.com>
References: <1515528906-6892-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Subject: [m-c-s][PATCH 08/12] python-jsonext: initial version
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
X-List-Received-Date: Tue, 09 Jan 2018 20:15:33 -0000
Content-Type: text/plain

This is needed by python-tinyrpc. This requires a new recipe for
python-arrow.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../recipes-devtools/python/python-jsonext_0.4.2.bb      | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-openstack/recipes-devtools/python/python-jsonext_0.4.2.bb

diff --git a/meta-openstack/recipes-devtools/python/python-jsonext_0.4.2.bb b/meta-openstack/recipes-devtools/python/python-jsonext_0.4.2.bb
new file mode 100644
index 0000000..90575c6
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-jsonext_0.4.2.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "Well-structured helpers to help serializing commonly \
+encountered structures to JSON (like datetime, to_dict(), etc."
+HOMEPAGE = "http://github.com/mbr/jsonext"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+
+SRC_URI[md5sum] = "59207a244eba23bf628ed24935e4eee7"
+SRC_URI[sha256sum] = "e7634e0b8d1a668bd2c92db5498f6162573feb72ac050c4415384e773b1ea091"
+
+inherit setuptools pypi
+
+RDEPENDS_${PN} += " \
+        python-six \
+        python-arrow \
+        "
-- 
2.7.4


