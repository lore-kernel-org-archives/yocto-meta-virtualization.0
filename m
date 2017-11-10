Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5205BE00D2D; Fri, 10 Nov 2017 13:31:10 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 40C39E00CEF
	for <meta-virtualization@yoctoproject.org>;
	Fri, 10 Nov 2017 13:31:08 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vAALV8RN023690
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Fri, 10 Nov 2017 13:31:08 -0800
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Fri, 10 Nov 2017 13:31:07 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@windriver.com>
Date: Fri, 10 Nov 2017 16:30:56 -0500
Message-ID: <1510349460-18777-2-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1510349460-18777-1-git-send-email-mark.asselstine@windriver.com>
References: <1510349460-18777-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Subject: [m-c-s][PATCH 1/5] python-django-openstack-auth: uprev to latest stable/pike
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
X-List-Received-Date: Fri, 10 Nov 2017 21:31:10 -0000
Content-Type: text/plain

This uprev is required to support the uprev of python-horizon to the
latest stable/pike. Requires the uprevs to python-keystoneclient and
python-keystoneauth1.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../python/python-django-openstack-auth_git.bb        | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/meta-openstack/recipes-devtools/python/python-django-openstack-auth_git.bb b/meta-openstack/recipes-devtools/python/python-django-openstack-auth_git.bb
index d287a4b..0df4efb 100644
--- a/meta-openstack/recipes-devtools/python/python-django-openstack-auth_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-django-openstack-auth_git.bb
@@ -6,10 +6,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
 
 SRCNAME = "django_openstack_auth"
 
-PV = "2.0.0+git${SRCPV}"
-SRCREV = "6e2cd8deffbd60074bf036c1cecdb280f281ccd4"
+PV = "3.5.0+git${SRCPV}"
+SRCREV = "9e108ed426a5a1e5c9dd394b197c27d046754d0c"
 
-SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=master \
+SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/pike \
 "
 
 S = "${WORKDIR}/git"
@@ -21,7 +21,12 @@ DEPENDS += " \
         python-pbr \
         "
 
-RDEPENDS_${PN} += "python-django  \
-	python-keystoneclient  \
-	python-pbr \
-	"
+RDEPENDS_${PN} += " \
+        python-pbr \
+        python-django \
+        python-oslo.config \
+        python-oslo.policy \
+        python-keystoneclient \
+        python-keystoneauth1 \
+        python-six \
+        "
-- 
2.7.4


