Return-Path: <josep.puigdemont@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DEF2FE00C39; Tue,  8 Dec 2015 09:35:04 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [192.36.1.252 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 6D47CE00BD0
	for <meta-virtualization@yoctoproject.org>;
	Tue,  8 Dec 2015 09:34:43 -0800 (PST)
Received: from iapetus.enea.se (172.16.140.26) by smtp.enea.com (172.21.1.208)
	with Microsoft SMTP Server id 14.3.224.2;
	Tue, 8 Dec 2015 18:34:42 +0100
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 8 Dec 2015 18:33:41 +0100
Message-ID: <1449596034-8308-30-git-send-email-josep.puigdemont@enea.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1449596034-8308-1-git-send-email-josep.puigdemont@enea.com>
References: <1449596034-8308-1-git-send-email-josep.puigdemont@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Subject: [meta-cloud-services][fido-kilo][PATCH 29/42] django-pyscss: uprev to version 2.0.2
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
X-List-Received-Date: Tue, 08 Dec 2015 17:35:04 -0000
Content-Type: text/plain

From: Mark Asselstine <mark.asselstine@windriver.com>

This uprev is needed to work around an error when attempting to log in
to the horizon dashboard:

Couldn't find anything to import: bootstrap/variables

The upstream fix bd8b2ae8bf21b9c4f671d9364cdc41fbced9b214 [Retain the
imported file path] forms the basis of the 2.0.2 release and fixes
this error, per bug:
https://github.com/fusionbox/django-pyscss/issues/34.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 .../{python-django-pyscss_1.0.6.bb => python-django-pyscss_2.0.2.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-django-pyscss_1.0.6.bb => python-django-pyscss_2.0.2.bb} (80%)

diff --git a/meta-openstack/recipes-devtools/python/python-django-pyscss_1.0.6.bb b/meta-openstack/recipes-devtools/python/python-django-pyscss_2.0.2.bb
similarity index 80%
rename from meta-openstack/recipes-devtools/python/python-django-pyscss_1.0.6.bb
rename to meta-openstack/recipes-devtools/python/python-django-pyscss_2.0.2.bb
index f05018a..7c5606a 100644
--- a/meta-openstack/recipes-devtools/python/python-django-pyscss_1.0.6.bb
+++ b/meta-openstack/recipes-devtools/python/python-django-pyscss_2.0.2.bb
@@ -4,13 +4,12 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07339dad721a3ae7e420b8b751a15c70"
 
-PR = "r0"
 
 SRCNAME = "django-pyscss"
 SRC_URI = "http://pypi.python.org/packages/source/d/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "dd96a50f663d4e079f4e6ac043ca5022"
-SRC_URI[sha256sum] = "4575e65fa1a28529211ba22d7009e62d4f25a4ab2e7d7de14abea2e5b1c9f8f6"
+SRC_URI[md5sum] = "f8dbcc4d314c8e220aa311ec6561b06d"
+SRC_URI[sha256sum] = "0f4844f8fd3f69f4d428a616fdcf2b650a24862dd81443ae3fba14980c7b0615"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
2.5.0


