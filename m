Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 71CD7E00BC3; Wed,  4 Apr 2018 13:03:19 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A80A1E008F2
	for <meta-virtualization@yoctoproject.org>;
	Wed,  4 Apr 2018 13:03:14 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w34K3EXd019048
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 4 Apr 2018 13:03:14 -0700 (PDT)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 4 Apr 2018 13:03:13 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 4 Apr 2018 16:02:50 -0400
Message-ID: <1522872176-22946-6-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1522872176-22946-1-git-send-email-mark.asselstine@windriver.com>
References: <1522872176-22946-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Cc: bruce.ashfield@windriver.com
Subject: [m-c-s][PATCH 06/12] python-networkx: uprev to v1.11
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
X-List-Received-Date: Wed, 04 Apr 2018 20:03:19 -0000
Content-Type: text/plain

We are unable to use the v2.0 found in meta-python (v2.0 is excluded
in the python-pypowervm requirements.txt). So uprev our
python-networkx to an acceptable version for all related packages and
force its use via PREFERRED_VERSION.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 meta-openstack/conf/layer.conf                                    | 1 +
 .../python/{python-networkx_1.9.1.bb => python-networkx_1.11.bb}  | 8 ++++----
 2 files changed, 5 insertions(+), 4 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-networkx_1.9.1.bb => python-networkx_1.11.bb} (54%)

diff --git a/meta-openstack/conf/layer.conf b/meta-openstack/conf/layer.conf
index 838e7b0..c5884c5 100644
--- a/meta-openstack/conf/layer.conf
+++ b/meta-openstack/conf/layer.conf
@@ -22,4 +22,5 @@ PREFERRED_VERSION_python-requests = "2.13.0"
 PREFERRED_VERSION_python-eventlet = "0.20.0"
 PREFERRED_VERSION_python-warlock = "1.2.0"
 PREFERRED_VERSION_python-jsonschema = "2.6.0"
+PREFERRED_VERSION_python-networkx = "1.11"
 LICENSE_PATH += "${LAYERDIR}/licenses"
diff --git a/meta-openstack/recipes-devtools/python/python-networkx_1.9.1.bb b/meta-openstack/recipes-devtools/python/python-networkx_1.11.bb
similarity index 54%
rename from meta-openstack/recipes-devtools/python/python-networkx_1.9.1.bb
rename to meta-openstack/recipes-devtools/python/python-networkx_1.11.bb
index e1828b7..f187663 100644
--- a/meta-openstack/recipes-devtools/python/python-networkx_1.9.1.bb
+++ b/meta-openstack/recipes-devtools/python/python-networkx_1.11.bb
@@ -2,10 +2,10 @@ DESCRIPTION = "Python package for creating and manipulating graphs and networks"
 HOMEPAGE = "http://networkx.lanl.gov/"
 SECTION = "devel/python"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=6bd2e3b81103dff983b4b2d7d3217cf5"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=925586ea588eb990de840dc71ea3752f"
 
-SRC_URI[md5sum] = "a2d9ee8427c5636426f319968e0af9f2"
-SRC_URI[sha256sum] = "6380eb38d0b5770d7e50813c8a48ff7c373b2187b4220339c1adce803df01c59"
+SRC_URI[md5sum] = "6ef584a879e9163013e9a762e1cf7cd1"
+SRC_URI[sha256sum] = "0d0e70e10dfb47601cbb3425a00e03e2a2e97477be6f80638fef91d54dd1e4b8"
 
 inherit setuptools pypi
 
@@ -15,6 +15,6 @@ DEPENDS += " \
         python-pip \
         "
 
-# RDEPENDS_default: 
 RDEPENDS_${PN} += " \
+        python-decorator \
         "
-- 
2.7.4


