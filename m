Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id ADCA8E00E42; Tue,  9 Jan 2018 12:15:29 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 15909E00DE1
	for <meta-virtualization@yoctoproject.org>;
	Tue,  9 Jan 2018 12:15:24 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w09KFNTB010263
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 9 Jan 2018 12:15:23 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 9 Jan 2018 12:15:23 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@windriver.com>
Date: Tue, 9 Jan 2018 15:15:00 -0500
Message-ID: <1515528906-6892-6-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1515528906-6892-1-git-send-email-mark.asselstine@windriver.com>
References: <1515528906-6892-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Subject: [m-c-s][PATCH 06/12] python-neutron-lib: initial version
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
X-List-Received-Date: Tue, 09 Jan 2018 20:15:29 -0000
Content-Type: text/plain

Needed by the stable/pike version of python-neutron.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../python/python-neutron-lib_git.bb               | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 meta-openstack/recipes-devtools/python/python-neutron-lib_git.bb

diff --git a/meta-openstack/recipes-devtools/python/python-neutron-lib_git.bb b/meta-openstack/recipes-devtools/python/python-neutron-lib_git.bb
new file mode 100644
index 0000000..1ac7dca
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-neutron-lib_git.bb
@@ -0,0 +1,36 @@
+DESCRIPTION = "Neutron shared routines and utilities."
+HOMEPAGE = "https://github.com/openstack/neutron-lib"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
+
+SRC_URI = "\
+	git://git.openstack.org/openstack/neutron-lib.git;branch=stable/pike \
+	"
+
+PV="1.9.1+git${SRCPV}"
+SRCREV="f0d7e470c2ef1702b2715ceb2fd8a00fce2a23be"
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
+        python-sqlalchemy \
+        python-debtcollector \
+        python-stevedore \
+        python-oslo.concurrency \
+        python-oslo.config \
+        python-oslo.context \
+        python-oslo.db \
+        python-oslo.i18n \
+        python-oslo.log \
+        python-oslo.messaging \
+        python-oslo.policy \
+        python-oslo.service \
+        python-oslo.utils \
+        "
-- 
2.7.4


