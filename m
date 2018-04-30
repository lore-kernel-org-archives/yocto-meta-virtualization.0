Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0CB53E00C40; Mon, 30 Apr 2018 11:51:55 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D4C92E00A1C
	for <meta-virtualization@yoctoproject.org>;
	Mon, 30 Apr 2018 11:51:53 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w3UIppH0028091
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 30 Apr 2018 11:51:52 -0700 (PDT)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 30 Apr 2018 11:51:51 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>, <meta-virtualization@yoctoproject.org>
Date: Mon, 30 Apr 2018 14:51:38 -0400
Message-ID: <1525114301-2864-2-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1525114301-2864-1-git-send-email-mark.asselstine@windriver.com>
References: <1525114301-2864-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Subject: [m-c-s][PATCH 2/5] python-google-api-python-client: initial version (v1.6.6)
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
X-List-Received-Date: Mon, 30 Apr 2018 18:51:55 -0000
Content-Type: text/plain

Needed by the stable/pike uprev of python-cinder.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../python/python-google-api-python-client_1.6.6.bb      | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-openstack/recipes-devtools/python/python-google-api-python-client_1.6.6.bb

diff --git a/meta-openstack/recipes-devtools/python/python-google-api-python-client_1.6.6.bb b/meta-openstack/recipes-devtools/python/python-google-api-python-client_1.6.6.bb
new file mode 100644
index 0000000..0abf1b9
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-google-api-python-client_1.6.6.bb
@@ -0,0 +1,16 @@
+SUMMARY = "Client library for accessing the Plus, Moderator, and many other Google APIs."
+AUTHOR = "Google Inc."
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=94023d14f6b58272fd885e4e3f2f08b3"
+
+inherit setuptools pypi
+
+SRC_URI[md5sum] = "3059dce9c0308852e177c7d99d3f9ac2"
+SRC_URI[sha256sum] = "ec72991f95201996a4edcea44a079cae0292798086beaadb054d91921632fe1b"
+
+RDEPENDS_${PN} += " \
+        python-httplib2 \
+        python-oauth2client \
+        python-six \
+        python-uritemplate \
+        "
-- 
2.7.4


