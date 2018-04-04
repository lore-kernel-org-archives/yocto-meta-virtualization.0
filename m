Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F4201E00932; Wed,  4 Apr 2018 13:03:13 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6785AE009C8
	for <meta-virtualization@yoctoproject.org>;
	Wed,  4 Apr 2018 13:03:11 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w34K3Ban019043
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 4 Apr 2018 13:03:11 -0700 (PDT)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 4 Apr 2018 13:03:10 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 4 Apr 2018 16:02:47 -0400
Message-ID: <1522872176-22946-3-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1522872176-22946-1-git-send-email-mark.asselstine@windriver.com>
References: <1522872176-22946-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Cc: bruce.ashfield@windriver.com
Subject: [m-c-s][PATCH 03/12] python-os-vif: initial version (v1.7.0)
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
X-List-Received-Date: Wed, 04 Apr 2018 20:03:14 -0000
Content-Type: text/plain

Required by python-nova.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../recipes-devtools/python/python-os-vif_git.bb   | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 meta-openstack/recipes-devtools/python/python-os-vif_git.bb

diff --git a/meta-openstack/recipes-devtools/python/python-os-vif_git.bb b/meta-openstack/recipes-devtools/python/python-os-vif_git.bb
new file mode 100644
index 0000000..52fa05e
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-os-vif_git.bb
@@ -0,0 +1,33 @@
+DESCRIPTION = "OpenStack integration library between network and compute providers."
+HOMEPAGE = "https://github.com/openstack/os-vif"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
+
+SRC_URI = "\
+	git://github.com/openstack/os-vif.git;branch=stable/pike \
+	"
+
+PV = "1.7.0+git${SRCPV}"
+SRCREV = "5184b7fc3b8d1689823eacb859087c8a943f9a09"
+S = "${WORKDIR}/git"
+
+inherit setuptools
+
+DEPENDS += " \
+        python-pbr \
+        "
+
+RDEPENDS_${PN} += " \
+        python-pbr \
+        python-netaddr \
+        python-oslo.concurrency \
+        python-oslo.config \
+        python-oslo.log \
+        python-oslo.i18n \
+        python-oslo.privsep \
+        python-oslo.versionedobjects \
+        python-six \
+        python-stevedore \
+        "
+	
\ No newline at end of file
-- 
2.7.4


