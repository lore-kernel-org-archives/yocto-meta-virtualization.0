Return-Path: <Jackie.Huang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A0DD5E00A07; Tue, 28 Apr 2015 20:10:47 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C47D6E009D9
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Apr 2015 20:09:55 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t3T39tme009439
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Apr 2015 20:09:55 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Tue, 28 Apr 2015 20:09:55 -0700
From: <jackie.huang@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 29 Apr 2015 11:09:03 +0800
Message-ID: <8b21893b62cf6c638eeb34741056cef91d183ad5.1430275945.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1430275944.git.jackie.huang@windriver.com>
References: <cover.1430275944.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 53/55] python-zake: upgrade to 0.2.1
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
X-List-Received-Date: Wed, 29 Apr 2015 03:10:47 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../python/{python-zake_0.1.6.bb => python-zake_0.2.1.bb}          | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-zake_0.1.6.bb => python-zake_0.2.1.bb} (69%)

diff --git a/meta-openstack/recipes-devtools/python/python-zake_0.1.6.bb b/meta-openstack/recipes-devtools/python/python-zake_0.2.1.bb
similarity index 69%
rename from meta-openstack/recipes-devtools/python/python-zake_0.1.6.bb
rename to meta-openstack/recipes-devtools/python/python-zake_0.2.1.bb
index 5d219df..ce027e0 100644
--- a/meta-openstack/recipes-devtools/python/python-zake_0.1.6.bb
+++ b/meta-openstack/recipes-devtools/python/python-zake_0.2.1.bb
@@ -2,15 +2,14 @@ DESCRIPTION = "A python package that works to provide a nice set of testing util
 HOMEPAGE = "https://github.com/yahoo/Zake"
 SECTION = "devel/python"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=7143f0ea4f9516655b2b2a360e8e71f7"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=33573af7505a94ff3d122a7920b2c735"
 
-PR = "r0"
 
 SRCNAME = "zake"
 SRC_URI = "http://pypi.python.org/packages/source/z/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "51a9570a1e93d7eee602a240b0f5ba21"
-SRC_URI[sha256sum] = "b6ed2f9c957225bf371a76dccf25a4300f33f61aa2fd560ab89673200e52abfc"
+SRC_URI[md5sum] = "bd8db293a78c22171ecfdd54f4d65c63"
+SRC_URI[sha256sum] = "2e5bcb215e366e682fd05dd1df4f2e6affceefa5d3781c2987a21fd597659a21"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
1.9.1


