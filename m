Return-Path: <joe.slater@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9E0D9E00CE7; Tue,  5 Feb 2019 11:14:50 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C2BFDE0053F
	for <meta-virtualization@yoctoproject.org>;
	Tue,  5 Feb 2019 11:14:48 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x15JEm9D003917
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 5 Feb 2019 11:14:48 -0800 (PST)
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.435.0;
	Tue, 5 Feb 2019 11:14:47 -0800
From: Joe Slater <joe.slater@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 5 Feb 2019 11:14:47 -0800
Message-ID: <20190205191447.29387-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
Subject: [meta-virt][PATCH 1/1] riddler: do not try to build for mips
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
X-List-Received-Date: Tue, 05 Feb 2019 19:14:50 -0000
Content-Type: text/plain

This recipe does not build for mips, so set COMPATIBLE_HOST to avoid that.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 recipes-containers/riddler/riddler_git.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/recipes-containers/riddler/riddler_git.bb b/recipes-containers/riddler/riddler_git.bb
index 9f7fe6b..0897606 100644
--- a/recipes-containers/riddler/riddler_git.bb
+++ b/recipes-containers/riddler/riddler_git.bb
@@ -13,6 +13,10 @@ S = "${WORKDIR}/git"
 inherit goarch
 inherit go
 
+# In addition to hosts go does not like, we do not build for mips.
+#
+COMPATIBLE_HOST_mipsarch = "null"
+
 # This disables seccomp and apparmor, which are on by default in the
 # go package. 
 EXTRA_OEMAKE="BUILDTAGS=''"
-- 
2.7.4


