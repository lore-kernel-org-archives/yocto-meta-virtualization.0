Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D7F5AE00D06; Tue, 22 Aug 2017 10:03:53 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3D75BE00C97
	for <meta-virtualization@yoctoproject.org>;
	Tue, 22 Aug 2017 10:03:53 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v7MH3qGY022653
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 22 Aug 2017 10:03:52 -0700
Received: from yow-cube2.wrs.com (128.224.56.99) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 22 Aug 2017 10:03:52 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@windriver.com>
Date: Tue, 22 Aug 2017 13:03:51 -0400
Message-ID: <1503421431-23274-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [m-c-s][PATCH v2] python-positional: use archived tarball
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
X-List-Received-Date: Tue, 22 Aug 2017 17:03:53 -0000
Content-Type: text/plain

The upstream project has been discontinued as you can see from the
comment from the developer in response to another pkg which used
positional:
https://github.com/conda-forge/positional-feedstock/issues/7

In addition to discontinuing the project the developer removed the
repository, so we need to use the version archived via pypi. We can't
simply drop the package as it is used by python-nova and other
openstack components.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---

v2: sending with -M to allow this to be reviewed more
    easily


 .../{python-positional_git.bb => python-positional_1.1.1.bb}      | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-positional_git.bb => python-positional_1.1.1.bb} (57%)

diff --git a/meta-openstack/recipes-devtools/python/python-positional_git.bb b/meta-openstack/recipes-devtools/python/python-positional_1.1.1.bb
similarity index 57%
rename from meta-openstack/recipes-devtools/python/python-positional_git.bb
rename to meta-openstack/recipes-devtools/python/python-positional_1.1.1.bb
index 821d704..c2dc44c 100644
--- a/meta-openstack/recipes-devtools/python/python-positional_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-positional_1.1.1.bb
@@ -5,13 +5,13 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5335066555b14d832335aa4660d6c376"
 
 SRCNAME = "positional"
-SRC_URI = "git://github.com/morganfainberg/positional \
+SRC_URI = "https://pypi.io/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
 "
 
-PV = "1.1.1+git${SRCPV}"
-SRCREV = "1f5e9fc0f50e9e774fc4db27f97f9acae5f0c29f"
+SRC_URI[md5sum] = "c82903c32c1aec1ac0f0f6e166ef4e2e"
+SRC_URI[sha256sum] = "ef845fa46ee5a11564750aaa09dd7db059aaf39c44c901b37181e5ffa67034b0"
 
-S = "${WORKDIR}/git"
+S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 inherit setuptools
 
-- 
2.7.4


