Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 35B52E00C54; Mon, 30 Apr 2018 11:52:36 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [192.103.53.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 084DCE00A1C
	for <meta-virtualization@yoctoproject.org>;
	Mon, 30 Apr 2018 11:52:34 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w3UIq3f8029144
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 30 Apr 2018 11:52:23 -0700
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 30 Apr 2018 11:52:18 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>, <meta-virtualization@yoctoproject.org>
Date: Mon, 30 Apr 2018 14:51:40 -0400
Message-ID: <1525114301-2864-4-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1525114301-2864-1-git-send-email-mark.asselstine@windriver.com>
References: <1525114301-2864-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Subject: [m-c-s][PATCH 4/5] python-oauth2client: initial version (v4.1.2)
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
X-List-Received-Date: Mon, 30 Apr 2018 18:52:36 -0000
Content-Type: text/plain

Needed by the uprev to stable/pike of python-cinder.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../python/python-oauth2client_4.1.2.bb                | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-openstack/recipes-devtools/python/python-oauth2client_4.1.2.bb

diff --git a/meta-openstack/recipes-devtools/python/python-oauth2client_4.1.2.bb b/meta-openstack/recipes-devtools/python/python-oauth2client_4.1.2.bb
new file mode 100644
index 0000000..db0452f
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-oauth2client_4.1.2.bb
@@ -0,0 +1,18 @@
+DESCRIPTION = "OAuth 2.0 client library"
+AUTHOR = "Google Inc."
+HOMEPAGE = "http://github.com/google/oauth2client/"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=038e1390e94fe637991fa5569daa62bc"
+
+inherit setuptools pypi
+
+SRC_URI[md5sum] = "bc30976cd1e859cd6199264a50c5ba72"
+SRC_URI[sha256sum] = "bd3062c06f8b10c6ef7a890b22c2740e5f87d61b6e1f4b1c90d069cdfc9dadb5"
+
+RDEPENDS_${PN} += " \
+        python-httplib2 \
+        python-pyasn1 \
+        python-pyasn1-modules \
+        python-rsa \
+        python-six \
+        "
-- 
2.7.4


