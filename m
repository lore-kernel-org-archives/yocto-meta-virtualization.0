Return-Path: <Jackie.Huang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E08C7E009AF; Tue, 28 Apr 2015 20:06:09 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 86F80E009D7
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Apr 2015 20:06:00 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t3T360Rl009364
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Apr 2015 20:06:00 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Tue, 28 Apr 2015 20:05:59 -0700
From: <jackie.huang@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 29 Apr 2015 11:05:49 +0800
Message-ID: <a7bdc9b46542f9dcdcbeb1087afd72102ecef39a.1430275945.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1430275944.git.jackie.huang@windriver.com>
References: <cover.1430275944.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 08/55] python-django-openstack-auth: upgrade to 1.3.0
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
X-List-Received-Date: Wed, 29 Apr 2015 03:06:09 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 ...openstack-auth_1.1.9.bb => python-django-openstack-auth_1.3.0.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-django-openstack-auth_1.1.9.bb => python-django-openstack-auth_1.3.0.bb} (79%)

diff --git a/meta-openstack/recipes-devtools/python/python-django-openstack-auth_1.1.9.bb b/meta-openstack/recipes-devtools/python/python-django-openstack-auth_1.3.0.bb
similarity index 79%
rename from meta-openstack/recipes-devtools/python/python-django-openstack-auth_1.1.9.bb
rename to meta-openstack/recipes-devtools/python/python-django-openstack-auth_1.3.0.bb
index a4f08ae..47bc610 100644
--- a/meta-openstack/recipes-devtools/python/python-django-openstack-auth_1.1.9.bb
+++ b/meta-openstack/recipes-devtools/python/python-django-openstack-auth_1.3.0.bb
@@ -4,14 +4,13 @@ SECTION = "devel/python"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
 
-PR = "r0"
 SRCNAME = "django_openstack_auth"
 
 SRC_URI = "https://pypi.python.org/packages/source/d/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
 "
 
-SRC_URI[md5sum] = "a201c7efbf552042f0bae64814454162"
-SRC_URI[sha256sum] = "650b3fd528d179a36cf629aa7dad53e03aed6cf9300ea4a337260887e71e9b53"
+SRC_URI[md5sum] = "a80e3b9660016336c5a2e4d4dd8a81a2"
+SRC_URI[sha256sum] = "d7cb1e15c8582d6ac217619a891371e6dbb6bd4e15959214198490ea68e45e26"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
1.9.1


