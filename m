Return-Path: <Jackie.Huang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1C980E00A7B; Tue, 28 Apr 2015 20:09:59 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0A1B0E009C5
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Apr 2015 20:09:32 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t3T39ViM009406
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Apr 2015 20:09:31 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Tue, 28 Apr 2015 20:09:31 -0700
From: <jackie.huang@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 29 Apr 2015 11:08:42 +0800
Message-ID: <c7a3578c33fec75337ff157473e522b75e1cd5ce.1430275945.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1430275944.git.jackie.huang@windriver.com>
References: <cover.1430275944.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 32/55] python-pysaml2: upgrade to 2.4.0
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
X-List-Received-Date: Wed, 29 Apr 2015 03:09:59 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../python/{python-pysaml2_2.3.0.bb => python-pysaml2_2.4.0.bb}    | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-pysaml2_2.3.0.bb => python-pysaml2_2.4.0.bb} (65%)

diff --git a/meta-openstack/recipes-devtools/python/python-pysaml2_2.3.0.bb b/meta-openstack/recipes-devtools/python/python-pysaml2_2.4.0.bb
similarity index 65%
rename from meta-openstack/recipes-devtools/python/python-pysaml2_2.3.0.bb
rename to meta-openstack/recipes-devtools/python/python-pysaml2_2.4.0.bb
index 8cb208b..d4cb7fa 100644
--- a/meta-openstack/recipes-devtools/python/python-pysaml2_2.3.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-pysaml2_2.4.0.bb
@@ -2,15 +2,14 @@ DESCRIPTION = "Python implementation of SAML Version 2 to be used in a WSGI envi
 HOMEPAGE = "https://github.com/rohe/pysaml2"
 SECTION = "devel/python"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=dc49f1893f8da88300900a4467475286"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=64573b44c7c80d328f0c1a830b44df84"
 
-PR = "r0"
 
 SRCNAME = "pysaml2"
 SRC_URI = "http://pypi.python.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "9c029de8e94a2cb7b97d7d6eb28126a5"
-SRC_URI[sha256sum] = "84e95dac65914d5f506d9c5d5b3a182ed7bc1a4c4181b55597fed0f87d6558fa"
+SRC_URI[md5sum] = "9045eb4bd58f6f647de3dd33fe6dfa29"
+SRC_URI[sha256sum] = "a26804150ddc5da803d0df4b7026b613a3571c387fd6d107f6263aabf2c84ec6"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
1.9.1


