Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AEE5CE0085A; Thu, 14 Jan 2016 13:01:36 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E3D03E007EA
	for <meta-virtualization@yoctoproject.org>;
	Thu, 14 Jan 2016 13:01:31 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u0EL1VZw016439
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Thu, 14 Jan 2016 13:01:31 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 14 Jan 2016 13:01:30 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>, <meta-virtualization@yoctoproject.org>
Date: Thu, 14 Jan 2016 16:01:28 -0500
Message-ID: <1452805288-19550-2-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1452805288-19550-1-git-send-email-mark.asselstine@windriver.com>
References: <1452805288-19550-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Subject: [m-c-s][PATCH 2/2] python-wrapt: switch to using git
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
X-List-Received-Date: Thu, 14 Jan 2016 21:01:36 -0000
Content-Type: text/plain

In an effort to make things easier to uprev whenever possible we
should use git in our recipes. This has some negative implications if
there is a versioned recipe in another layer (without using
PREFERRED_VERSION the versioned recipe is used) but overall is the
best solution.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../python/{python-wrapt_1.10.5.bb => python-wrapt_git.bb}   | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-wrapt_1.10.5.bb => python-wrapt_git.bb} (46%)

diff --git a/meta-openstack/recipes-devtools/python/python-wrapt_1.10.5.bb b/meta-openstack/recipes-devtools/python/python-wrapt_git.bb
similarity index 46%
rename from meta-openstack/recipes-devtools/python/python-wrapt_1.10.5.bb
rename to meta-openstack/recipes-devtools/python/python-wrapt_git.bb
index 5a8d0e7..a2def9a 100644
--- a/meta-openstack/recipes-devtools/python/python-wrapt_1.10.5.bb
+++ b/meta-openstack/recipes-devtools/python/python-wrapt_git.bb
@@ -1,11 +1,15 @@
 DESCRIPTION = "A Python module for decorators, wrappers and monkey patching."
-HOMEPAGE = "https://pypi.python.org/pypi/wrapt/"
+HOMEPAGE = "https://github.com/GrahamDumpleton/wrapt"
 SECTION = "devel/python"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=848d45ec255e411c0ff82b034a49d8a0"
 
-SRC_URI[md5sum] = "79732bbc096235704e7523d3bacd202c"
-SRC_URI[sha256sum] = "99cbb4e3a3ea964df0cb1437261fc1198616ec872e7b501622f3f7f92fcd0833"
+PV = "1.10.5"
+SRCREV = "42af0563bf88e84d215dea9ea6f989cb867e930e"
 
-inherit pypi
+SRCNAME = "wrapt"
+SRC_URI = "git://github.com/GrahamDumpleton/${SRCNAME}.git"
 
+S = "${WORKDIR}/git"
+
+inherit setuptools
-- 
2.1.4


