Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 78A9FE00AE9; Thu, 29 Oct 2015 19:55:01 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EC210E00AD1
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Oct 2015 19:54:58 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t9U2svIL023154
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Oct 2015 19:54:57 -0700 (PDT)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 29 Oct 2015 19:54:57 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>, <meta-virtualization@yoctoproject.org>
Date: Thu, 29 Oct 2015 22:54:54 -0400
Message-ID: <1446173696-15191-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [meta-cloud-services][PATCH 1/2] django-pyscss: uprev to version 2.0.2
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
X-List-Received-Date: Fri, 30 Oct 2015 02:55:01 -0000
Content-Type: text/plain

This uprev is needed to work around an error when attempting to log in
to the horizon dashboard:

Couldn't find anything to import: bootstrap/variables

The upstream fix bd8b2ae8bf21b9c4f671d9364cdc41fbced9b214 [Retain the
imported file path] forms the basis of the 2.0.2 release and fixes
this error, per bug:
https://github.com/fusionbox/django-pyscss/issues/34.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../{python-django-pyscss_2.0.1.bb => python-django-pyscss_2.0.2.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-django-pyscss_2.0.1.bb => python-django-pyscss_2.0.2.bb} (81%)

diff --git a/meta-openstack/recipes-devtools/python/python-django-pyscss_2.0.1.bb b/meta-openstack/recipes-devtools/python/python-django-pyscss_2.0.2.bb
similarity index 81%
rename from meta-openstack/recipes-devtools/python/python-django-pyscss_2.0.1.bb
rename to meta-openstack/recipes-devtools/python/python-django-pyscss_2.0.2.bb
index 43dbc9f..7c5606a 100644
--- a/meta-openstack/recipes-devtools/python/python-django-pyscss_2.0.1.bb
+++ b/meta-openstack/recipes-devtools/python/python-django-pyscss_2.0.2.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=07339dad721a3ae7e420b8b751a15c70"
 SRCNAME = "django-pyscss"
 SRC_URI = "http://pypi.python.org/packages/source/d/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "4df1b89942f41b8e8bde8704efcfe6c2"
-SRC_URI[sha256sum] = "03fa4d7e483d87eaa4df0e91b337d078a39fcca897952e8d65ebdca7f759a822"
+SRC_URI[md5sum] = "f8dbcc4d314c8e220aa311ec6561b06d"
+SRC_URI[sha256sum] = "0f4844f8fd3f69f4d428a616fdcf2b650a24862dd81443ae3fba14980c7b0615"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
2.1.4


