Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CD7BBE00CC4; Fri, 10 Nov 2017 13:31:19 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 68AC7E00D68
	for <meta-virtualization@yoctoproject.org>;
	Fri, 10 Nov 2017 13:31:12 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vAALVCBr023248
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Fri, 10 Nov 2017 13:31:12 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Fri, 10 Nov 2017 13:31:11 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@windriver.com>
Date: Fri, 10 Nov 2017 16:30:59 -0500
Message-ID: <1510349460-18777-5-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1510349460-18777-1-git-send-email-mark.asselstine@windriver.com>
References: <1510349460-18777-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Subject: [m-c-s][PATCH 4/5] python-keystonemiddleware: uprev to latest stable/pike
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
X-List-Received-Date: Fri, 10 Nov 2017 21:31:19 -0000
Content-Type: text/plain

Updated runtime dependencies based on requirements.txt.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../python/python-keystonemiddleware_git.bb        | 23 +++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/meta-openstack/recipes-devtools/python/python-keystonemiddleware_git.bb b/meta-openstack/recipes-devtools/python/python-keystonemiddleware_git.bb
index 50d3d95..7b7cb91 100644
--- a/meta-openstack/recipes-devtools/python/python-keystonemiddleware_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-keystonemiddleware_git.bb
@@ -7,11 +7,11 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=4a4d0e932ffae1c0131528d30d419c55"
 SRCNAME = "keystonemiddleware"
 
 SRC_URI = "\
-	git://git.openstack.org/openstack/keystonemiddleware;branch=master \
+	git://git.openstack.org/openstack/keystonemiddleware;branch=stable/pike \
 	"
 
-PV = "2.3.0+git${SRCPV}"
-SRCREV = "62805857ea39710ba14ab9a4e6c606dc336c6b56"
+PV = "4.17.0+git${SRCPV}"
+SRCREV = "69aed2693475797c8d0dda2725a790eea05a9419"
 S = "${WORKDIR}/git"
 
 inherit setuptools
@@ -22,5 +22,18 @@ DEPENDS += " \
         "
 
 RDEPENDS_${PN} += " \
-	python-pbr \
-	"
+        python-keystoneauth1 \
+        python-oslo.config \
+        python-oslo.context \
+        python-oslo.i18n \
+        python-oslo.log \
+        python-oslo.serialization \
+        python-oslo.utils \
+        python-pbr \
+        python-positional \
+        python-pycadf \
+        python-keystoneclient \
+        python-requests \
+        python-six \
+        python-webob \
+        "
-- 
2.7.4


