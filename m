Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7A303E00D0B; Wed,  3 Feb 2016 17:43:17 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4D2DDE00CDC
	for <meta-virtualization@yoctoproject.org>;
	Wed,  3 Feb 2016 17:42:36 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u141gZmG019763
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 3 Feb 2016 17:42:36 -0800
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 3 Feb 2016 17:42:35 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Wed, 3 Feb 2016 20:41:39 -0500
Message-ID: <1454550104-7065-45-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1454550104-7065-1-git-send-email-mark.asselstine@windriver.com>
References: <1454550104-7065-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [m-c-s][PATCH 44/49] django-openstack-auth: uprev and switch to git
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
X-List-Received-Date: Thu, 04 Feb 2016 01:43:17 -0000
Content-Type: text/plain

From: Mark Asselstine <asselsm@gmail.com>

The uprev is needed for the uprev of horizon.
Switching to get will facilitate future uprevs.

Signed-off-by: Mark Asselstine <asselsm@gmail.com>
---
 ...ack-auth_1.3.0.bb => python-django-openstack-auth_git.bb} | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-django-openstack-auth_1.3.0.bb => python-django-openstack-auth_git.bb} (62%)

diff --git a/meta-openstack/recipes-devtools/python/python-django-openstack-auth_1.3.0.bb b/meta-openstack/recipes-devtools/python/python-django-openstack-auth_git.bb
similarity index 62%
rename from meta-openstack/recipes-devtools/python/python-django-openstack-auth_1.3.0.bb
rename to meta-openstack/recipes-devtools/python/python-django-openstack-auth_git.bb
index 47bc610..d287a4b 100644
--- a/meta-openstack/recipes-devtools/python/python-django-openstack-auth_1.3.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-django-openstack-auth_git.bb
@@ -1,18 +1,18 @@
 DESCRIPTION = "A Django authentication backend for use with the OpenStack Keystone backend."
 HOMEPAGE = "http://django_openstack_auth.readthedocs.org/"
 SECTION = "devel/python"
-LICENSE = "BSD"
+LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
 
 SRCNAME = "django_openstack_auth"
 
-SRC_URI = "https://pypi.python.org/packages/source/d/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
-"
+PV = "2.0.0+git${SRCPV}"
+SRCREV = "6e2cd8deffbd60074bf036c1cecdb280f281ccd4"
 
-SRC_URI[md5sum] = "a80e3b9660016336c5a2e4d4dd8a81a2"
-SRC_URI[sha256sum] = "d7cb1e15c8582d6ac217619a891371e6dbb6bd4e15959214198490ea68e45e26"
+SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=master \
+"
 
-S = "${WORKDIR}/${SRCNAME}-${PV}"
+S = "${WORKDIR}/git"
 
 inherit setuptools 
 
-- 
2.1.4


