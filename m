Return-Path: <Jackie.Huang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EF240E009D8; Tue, 28 Apr 2015 20:06:22 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AD8ABE009AD
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Apr 2015 20:06:01 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t3T361dn029722
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Apr 2015 20:06:01 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Tue, 28 Apr 2015 20:06:00 -0700
From: <jackie.huang@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 29 Apr 2015 11:05:50 +0800
Message-ID: <7a87af5f1442f324f9a8eac8c97f5a6996b84571.1430275945.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1430275944.git.jackie.huang@windriver.com>
References: <cover.1430275944.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 09/55] python-django-pyscss: upgrade to 2.0.1
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
X-List-Received-Date: Wed, 29 Apr 2015 03:06:23 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../{python-django-pyscss_1.0.6.bb => python-django-pyscss_2.0.1.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-django-pyscss_1.0.6.bb => python-django-pyscss_2.0.1.bb} (79%)

diff --git a/meta-openstack/recipes-devtools/python/python-django-pyscss_1.0.6.bb b/meta-openstack/recipes-devtools/python/python-django-pyscss_2.0.1.bb
similarity index 79%
rename from meta-openstack/recipes-devtools/python/python-django-pyscss_1.0.6.bb
rename to meta-openstack/recipes-devtools/python/python-django-pyscss_2.0.1.bb
index 4261f71..f665d00 100644
--- a/meta-openstack/recipes-devtools/python/python-django-pyscss_1.0.6.bb
+++ b/meta-openstack/recipes-devtools/python/python-django-pyscss_2.0.1.bb
@@ -4,13 +4,12 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07339dad721a3ae7e420b8b751a15c70"
 
-PR = "r0"
 
 SRCNAME = "django-pyscss"
 SRC_URI = "http://pypi.python.org/packages/source/d/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "dd96a50f663d4e079f4e6ac043ca5022"
-SRC_URI[sha256sum] = "4575e65fa1a28529211ba22d7009e62d4f25a4ab2e7d7de14abea2e5b1c9f8f6"
+SRC_URI[md5sum] = "4df1b89942f41b8e8bde8704efcfe6c2"
+SRC_URI[sha256sum] = "03fa4d7e483d87eaa4df0e91b337d078a39fcca897952e8d65ebdca7f759a822"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
1.9.1


