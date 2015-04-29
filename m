Return-Path: <Jackie.Huang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DB351E00A81; Tue, 28 Apr 2015 20:10:12 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D0C40E009EA
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Apr 2015 20:09:38 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t3T39cpT000067
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Apr 2015 20:09:38 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Tue, 28 Apr 2015 20:09:38 -0700
From: <jackie.huang@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 29 Apr 2015 11:08:48 +0800
Message-ID: <4db0571113c24413dde87c97cfd7a6b13c86ef03.1430275945.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1430275944.git.jackie.huang@windriver.com>
References: <cover.1430275944.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 38/55] python-singledispatch: upgrade to 3.4.0.3
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
X-List-Received-Date: Wed, 29 Apr 2015 03:10:12 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 ...-singledispatch_3.4.0.2.bb => python-singledispatch_3.4.0.3.bb} | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-singledispatch_3.4.0.2.bb => python-singledispatch_3.4.0.3.bb} (60%)

diff --git a/meta-openstack/recipes-devtools/python/python-singledispatch_3.4.0.2.bb b/meta-openstack/recipes-devtools/python/python-singledispatch_3.4.0.3.bb
similarity index 60%
rename from meta-openstack/recipes-devtools/python/python-singledispatch_3.4.0.2.bb
rename to meta-openstack/recipes-devtools/python/python-singledispatch_3.4.0.3.bb
index fb3c980..4ae7b56 100644
--- a/meta-openstack/recipes-devtools/python/python-singledispatch_3.4.0.2.bb
+++ b/meta-openstack/recipes-devtools/python/python-singledispatch_3.4.0.3.bb
@@ -2,15 +2,14 @@ DESCRIPTION = "functools.singledispatch from Python 3.4 to Python 2.6"
 HOMEPAGE = "https://pypi.python.org/pypi/singledistpatch"
 SECTION = "devel/python"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://README.rst;md5=8d7cca7c6cfbcc204a6e5ab2b8e8f049"
+LIC_FILES_CHKSUM = "file://README.rst;md5=ee3cd67264adc7eb07981f3644dc17dc"
 
-PR = "r0"
 SRCNAME = "singledispatch"
 
 SRC_URI = "https://pypi.python.org/packages/source/s/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "a8e91e6953767614fabb6b6e974fea0e"
-SRC_URI[sha256sum] = "4bdd0307cae0d13abb0546df1ab85201b9067090d191e33387e27e1463a7bfd5"
+SRC_URI[md5sum] = "af2fc6a3d6cc5a02d0bf54d909785fcb"
+SRC_URI[sha256sum] = "5b06af87df13818d14f08a028e42f566640aef80805c3b50c5056b086e3c2b9c"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
1.9.1


