Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3E898E00BD2; Wed,  9 Dec 2015 08:44:26 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6BF77E0033E
	for <meta-virtualization@yoctoproject.org>;
	Wed,  9 Dec 2015 08:44:23 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tB9GiMUv025834
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 9 Dec 2015 08:44:22 -0800
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 9 Dec 2015 08:44:21 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Wed, 9 Dec 2015 11:44:21 -0500
Message-ID: <1449679461-4787-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [meta-cloud-services][PATCH] python-django: uprev to 1.8.6
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
X-List-Received-Date: Wed, 09 Dec 2015 16:44:26 -0000
Content-Type: text/plain

Move to use git to ease future uprevs. Note that a recipe for django
exists in meta-python and since it is a versioned recipe instead of a
"_git" recipe it seems to be picked up instead of our recipe, so we
need to add a PREFERRED_VERSION to ensure our recipe is used.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 meta-openstack/conf/layer.conf                                |  1 +
 .../python/{python-django_1.7.5.bb => python-django_git.bb}   | 11 ++++++-----
 2 files changed, 7 insertions(+), 5 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-django_1.7.5.bb => python-django_git.bb} (51%)

diff --git a/meta-openstack/conf/layer.conf b/meta-openstack/conf/layer.conf
index 2b3a00d..f0d42b8 100644
--- a/meta-openstack/conf/layer.conf
+++ b/meta-openstack/conf/layer.conf
@@ -14,3 +14,4 @@ BB_DANGLINGAPPENDS_WARNONLY ?= "true"
 PREFERRED_VERSION_python-greenlet = "0.4.1"
 PREFERRED_VERSION_python-sqlalchemy = "0.9.7"
 PREFERRED_VERSION_python-pexpect = "3.3"
+PREFERRED_VERSION_python-django = "1.8.6"
diff --git a/meta-openstack/recipes-devtools/python/python-django_1.7.5.bb b/meta-openstack/recipes-devtools/python/python-django_git.bb
similarity index 51%
rename from meta-openstack/recipes-devtools/python/python-django_1.7.5.bb
rename to meta-openstack/recipes-devtools/python/python-django_git.bb
index b462e4d..f11f8e6 100644
--- a/meta-openstack/recipes-devtools/python/python-django_1.7.5.bb
+++ b/meta-openstack/recipes-devtools/python/python-django_git.bb
@@ -6,13 +6,14 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=f09eb47206614a4954c51db8a94840fa"
 
 SRCNAME = "Django"
 
-SRC_URI = "https://pypi.python.org/packages/source/D/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
-"
+PV = "1.8.6"
+SRCREV = "80b7e9d09f2d23209b591288f9b2cf3eb3d927c8"
 
-SRC_URI[md5sum] = "e76c70a5dd7d56a511974b28ab38df20"
-SRC_URI[sha256sum] = "1c391f9349c97df503dac3461599f24235e4d04393498e6060e74dd2721460bc"
+SRC_URI = " \
+    git://github.com/django/django.git;branch=stable/1.8.x \
+    "
 
-S = "${WORKDIR}/${SRCNAME}-${PV}"
+S = "${WORKDIR}/git"
 
 inherit setuptools
 
-- 
2.1.4


