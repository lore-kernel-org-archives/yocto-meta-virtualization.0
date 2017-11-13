Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B2DF2E00D72; Mon, 13 Nov 2017 11:32:57 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 20CB6E00D72
	for <meta-virtualization@yoctoproject.org>;
	Mon, 13 Nov 2017 11:32:50 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vADJWnQp017681
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 13 Nov 2017 11:32:49 -0800
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 13 Nov 2017 11:32:49 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@windriver.com>
Date: Mon, 13 Nov 2017 14:32:29 -0500
Message-ID: <1510601551-32245-10-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1510601551-32245-1-git-send-email-mark.asselstine@windriver.com>
References: <1510601551-32245-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Subject: [m-c-s][PATCH 09/11] python-novaclient: uprev to latest stable/pike
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
X-List-Received-Date: Mon, 13 Nov 2017 19:32:57 -0000
Content-Type: text/plain

Updated runtime dependencies based on requirements.txt.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../python/python-novaclient_git.bb                | 24 ++++++++++++++--------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/meta-openstack/recipes-devtools/python/python-novaclient_git.bb b/meta-openstack/recipes-devtools/python/python-novaclient_git.bb
index 1456bbc..dd89458 100644
--- a/meta-openstack/recipes-devtools/python/python-novaclient_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-novaclient_git.bb
@@ -5,12 +5,12 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7cdb54622cacc9bc9b2883091e6dd669"
 
 SRC_URI = "\
-	git://github.com/openstack/python-novaclient.git;branch=master \
+	git://github.com/openstack/python-novaclient.git;branch=stable/pike \
 	file://nova-api-check.sh \
 	"
 
-PV = "2.33.0+git${SRCPV}"
-SRCREV = "a5363ae0d60d41feff23f6cca44fcd7aa9fc5b8b"
+PV = "9.1.1+git${SRCPV}"
+SRCREV = "204eff6dc7b234d2807a6caa24a2fc58ebee520b"
 S = "${WORKDIR}/git"
 
 inherit setuptools monitor rmargparse
@@ -20,12 +20,18 @@ DEPENDS += " \
         python-pbr \
         "
 
-RDEPENDS_${PN} += "python-iso8601 \
-	python-prettytable \
-	python-requests \
-	python-simplejson \
-	python-pbr \
-	"
+RDEPENDS_${PN} += " \
+        python-pbr \
+        python-keystoneauth1 \
+        python-iso8601 \
+        python-oslo.i18n \
+        python-oslo.serialization \
+        python-oslo.utils \
+        python-prettytable \
+        python-simplejson \
+        python-six \
+        python-babel \
+        "
 
 PACKAGECONFIG ?= "bash-completion"
 PACKAGECONFIG[bash-completion] = ",,bash-completion,bash-completion ${BPN}-bash-completion"
-- 
2.7.4


