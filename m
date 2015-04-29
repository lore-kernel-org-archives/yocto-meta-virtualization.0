Return-Path: <Jackie.Huang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C07EFE00AA9; Tue, 28 Apr 2015 20:10:40 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A28C9E009C1
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Apr 2015 20:09:53 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t3T39rZt009436
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Apr 2015 20:09:53 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Tue, 28 Apr 2015 20:09:53 -0700
From: <jackie.huang@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 29 Apr 2015 11:09:01 +0800
Message-ID: <f1ca3d2fdf2ea5680b4e09a0f2ac7f1157a1b9a7.1430275945.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1430275944.git.jackie.huang@windriver.com>
References: <cover.1430275944.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 51/55] python-xstatic-font-awesome: upgrade to 4.3.0.0
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
X-List-Received-Date: Wed, 29 Apr 2015 03:10:40 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 ...t-awesome_4.1.0.0.bb => python-xstatic-font-awesome_4.3.0.0.bb} | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-xstatic-font-awesome_4.1.0.0.bb => python-xstatic-font-awesome_4.3.0.0.bb} (69%)

diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-font-awesome_4.1.0.0.bb b/meta-openstack/recipes-devtools/python/python-xstatic-font-awesome_4.3.0.0.bb
similarity index 69%
rename from meta-openstack/recipes-devtools/python/python-xstatic-font-awesome_4.1.0.0.bb
rename to meta-openstack/recipes-devtools/python/python-xstatic-font-awesome_4.3.0.0.bb
index 62d49e3..4f90fbb 100644
--- a/meta-openstack/recipes-devtools/python/python-xstatic-font-awesome_4.1.0.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-xstatic-font-awesome_4.3.0.0.bb
@@ -2,15 +2,14 @@ DESCRIPTION = "Font Awesome icons packaged for setuptools (easy_install) / pip."
 HOMEPAGE = "https://pypi.python.org/pypi/XStatic-Font-Awesome"
 SECTION = "devel/python"
 LICENSE = "Apache-2"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=faab18144d8e4d0230ad3fd6f3764d22"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=821ae461252f11e98fefe8bdfaa130ca"
 
-PR = "r0"
 
 SRCNAME = "XStatic-Font-Awesome"
 SRC_URI = "http://pypi.python.org/packages/source/X/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "84965a23e6f98e2e50df5386b85e0f6e"
-SRC_URI[sha256sum] = "620cc5224358b8bdb214ecf3c4e8aa9ea3b538ff38624d54e609b52e77f8caea"
+SRC_URI[md5sum] = "56e637fe7b3dcdd2ebd683996ad60759"
+SRC_URI[sha256sum] = "d2c0548990a22744ad20013e1d095de8ba1ea56b1878d8393a721205b03885c3"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
1.9.1


