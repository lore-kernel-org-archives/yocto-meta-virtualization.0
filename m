Return-Path: <Mingli.Yu@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C8E19E00C87; Fri, 26 Jul 2019 02:11:47 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [192.103.53.11 listed in list.dnswl.org]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7DD1BE00B33
	for <meta-virtualization@yoctoproject.org>;
	Fri, 26 Jul 2019 02:11:46 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x6Q9B939000408
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 26 Jul 2019 02:11:19 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Fri, 26 Jul 2019 02:10:52 -0700
From: <mingli.yu@windriver.com>
To: <bruce.ashfield@gmail.com>
Date: Fri, 26 Jul 2019 17:10:51 +0800
Message-ID: <1564132251-408200-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <5D3AC37B.2090709@windriver.com>
References: <5D3AC37B.2090709@windriver.com>
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [PATCH] cri-o: skip it when depends not found
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
X-List-Received-Date: Fri, 26 Jul 2019 09:11:47 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

cri-o depends on ostree, libselinux and libseccomp
and we should check if the layer which provides these
recipes exist or not before go on.

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 recipes-containers/cri-o/cri-o_git.bb | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/recipes-containers/cri-o/cri-o_git.bb b/recipes-containers/cri-o/cri-o_git.bb
index c27aef7..b0c0ce4 100644
--- a/recipes-containers/cri-o/cri-o_git.bb
+++ b/recipes-containers/cri-o/cri-o_git.bb
@@ -42,6 +42,28 @@ RDEPENDS_${PN} = " \
     cni \
     "
 
+python __anonymous() {
+    msg = ""
+    # ERROR: Nothing PROVIDES 'libseccomp' (but /buildarea/layers/meta-virtualization/recipes-containers/cri-o/cri-o_git.bb DEPENDS on or otherwise requires it).
+    # ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
+    # Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'cri-o', 'libseccomp']
+    if 'security' not in d.getVar('BBFILE_COLLECTIONS').split():
+        msg += "Make sure meta-security should be present as it provides 'libseccomp'"
+        raise bb.parse.SkipRecipe(msg)
+    # ERROR: Nothing PROVIDES 'ostree' (but /buildarea/layers/meta-virtualization/recipes-containers/cri-o/cri-o_git.bb DEPENDS on or otherwise requires it).
+    # ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
+    # Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'cri-o', 'ostree']
+    elif 'cube' not in d.getVar('BBFILE_COLLECTIONS').split():
+        msg += "Make sure meta-cube should be present as it provides 'ostree'"
+        raise bb.parse.SkipRecipe(msg)
+    # ERROR: Nothing PROVIDES 'libselinux' (but /buildarea/layers/meta-virtualization/recipes-containers/cri-o/cri-o_git.bb DEPENDS on or otherwise requires it).
+    # ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
+    # Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'cri-o', 'libselinux']
+    elif 'selinux' not in d.getVar('BBFILE_COLLECTIONS').split():
+        msg += "Make sure meta-selinux should be present as it provides 'libselinux'"
+        raise bb.parse.SkipRecipe(msg)
+}
+
 PACKAGES =+ "${PN}-config"
 
 RDEPENDS_${PN} += " virtual/containerd virtual/runc"
-- 
2.7.4


