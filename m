Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AF1BAE00D19; Fri,  1 Dec 2017 12:19:50 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3B111E00CEF
	for <meta-virtualization@yoctoproject.org>;
	Fri,  1 Dec 2017 12:19:49 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vB1KJn6I025862
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Fri, 1 Dec 2017 12:19:49 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Fri, 1 Dec 2017 12:19:48 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@windriver.com>
Date: Fri, 1 Dec 2017 15:19:37 -0500
Message-ID: <1512159582-6858-3-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1512159582-6858-1-git-send-email-mark.asselstine@windriver.com>
References: <1512159582-6858-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Subject: [m-c-s][PATCH 2/7] python-barbicanclient: uprev to latest stable/pike
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
X-List-Received-Date: Fri, 01 Dec 2017 20:19:50 -0000
Content-Type: text/plain

Needed for the uprev of python-castellan.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../python/python-barbicanclient_git.bb                 | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/meta-openstack/recipes-devtools/python/python-barbicanclient_git.bb b/meta-openstack/recipes-devtools/python/python-barbicanclient_git.bb
index 4361e34..8b1b8e9 100644
--- a/meta-openstack/recipes-devtools/python/python-barbicanclient_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-barbicanclient_git.bb
@@ -4,14 +4,12 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e031cff4528978748f9cc064c6e6fa73"
 
-PR = "r0"
-
 SRC_URI = "\
-	git://github.com/openstack/python-barbicanclient.git;branch=master \
+	git://github.com/openstack/python-barbicanclient.git;branch=stable/pike \
 	"
 
-PV = "3.0.3+git${SRCPV}"
-SRCREV = "2919366867af335d59913764a55ca8e95569947d"
+PV = "4.5.2+git${SRCPV}"
+SRCREV = "775de93a612db866bb39ba6828f3e7bd1aa3c9f5"
 S = "${WORKDIR}/git"
 
 inherit setuptools
@@ -22,7 +20,12 @@ DEPENDS += " \
         "
 
 RDEPENDS_${PN} += " \
+        python-pbr \
         python-requests \
         python-six \
-        python-keystoneclient \
-	"
+        python-cliff \
+        python-keystoneauth1 \
+        python-oslo.i18n \
+        python-oslo.serialization \
+        python-oslo.utils \
+        "
-- 
2.7.4


