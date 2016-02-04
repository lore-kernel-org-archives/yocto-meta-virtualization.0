Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5A9EEE00C7D; Wed,  3 Feb 2016 17:41:54 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A3342E00C6D
	for <meta-virtualization@yoctoproject.org>;
	Wed,  3 Feb 2016 17:41:49 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u141fmSF000281
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 3 Feb 2016 17:41:49 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 3 Feb 2016 17:41:48 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Wed, 3 Feb 2016 20:40:58 -0500
Message-ID: <1454550104-7065-4-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1454550104-7065-1-git-send-email-mark.asselstine@windriver.com>
References: <1454550104-7065-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [m-c-s][PATCH 03/49] python-cachetools: initial version
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
X-List-Received-Date: Thu, 04 Feb 2016 01:41:54 -0000
Content-Type: text/plain

From: Mark Asselstine <asselsm@gmail.com>

This package provides extensible memoizing collections and
decorators. This package is required by the uprev of oslo.messaging
and taskflow.

Signed-off-by: Mark Asselstine <asselsm@gmail.com>
---
 .../recipes-devtools/python/python-cachetools_git.bb     | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-openstack/recipes-devtools/python/python-cachetools_git.bb

diff --git a/meta-openstack/recipes-devtools/python/python-cachetools_git.bb b/meta-openstack/recipes-devtools/python/python-cachetools_git.bb
new file mode 100644
index 0000000..f3d89b3
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-cachetools_git.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "Extensible memoizing collections and decorators"
+HOMEPAGE = "https://github.com/tkem/cachetools"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=96c958336b659af4dad628356c5e43b6"
+
+SRCNAME = "cachetools"
+
+PV = "1.1.5+git${SRCPV}"
+SRCREV = "42853733d0caf68ef5bf5933a377572b05437e2c"
+
+SRC_URI = "git://github.com/tkem/${SRCNAME}.git"
+
+S = "${WORKDIR}/git"
+
+inherit setuptools
-- 
2.1.4


