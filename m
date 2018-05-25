Return-Path: <pascal.bach@siemens.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 67DA0E009CA; Fri, 25 May 2018 07:05:38 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.35.17.28 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
X-Greylist: delayed 418 seconds by postgrey-1.32 at yocto-www;
	Fri, 25 May 2018 07:05:36 PDT
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F36EBE00942
	for <meta-virtualization@yoctoproject.org>;
	Fri, 25 May 2018 07:05:36 -0700 (PDT)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id w4PDwbdU005685
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Fri, 25 May 2018 15:58:37 +0200
Received: from dev.vm6.ccp.siemens.com (MD1FZU9C.ad001.siemens.net
	[139.16.79.187])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id w4PDwbko007632;
	Fri, 25 May 2018 15:58:37 +0200
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id ED80B10D4969;
	Fri, 25 May 2018 15:58:36 +0200 (CEST)
From: Pascal Bach <pascal.bach@siemens.com>
To: meta-virtualization@yoctoproject.org
Date: Fri, 25 May 2018 15:58:19 +0200
Message-Id: <20180525135820.9279-1-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/2] runc: allow enabling seccomp
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
X-List-Received-Date: Fri, 25 May 2018 14:05:38 -0000

This requires libseccomp from meta-security so it is not enabled by default.

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 recipes-containers/runc/runc.inc | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/recipes-containers/runc/runc.inc b/recipes-containers/runc/runc.inc
index 9199cef..6d11a6e 100644
--- a/recipes-containers/runc/runc.inc
+++ b/recipes-containers/runc/runc.inc
@@ -12,6 +12,10 @@ PV = "${RUNC_VERSION}+git${SRCPV}"
 
 inherit go
 inherit goarch
+inherit pkgconfig
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[seccomp] = "seccomp,,libseccomp"
 
 RRECOMMENDS_${PN} = "lxc docker"
 PROVIDES += "virtual/runc"
@@ -22,7 +26,7 @@ GO_IMPORT = "import"
 LIBCONTAINER_PACKAGE="github.com/opencontainers/runc/libcontainer"
 
 do_configure[noexec] = "1"
-EXTRA_OEMAKE="BUILDTAGS='' GO=${GO}"
+EXTRA_OEMAKE="BUILDTAGS='${PACKAGECONFIG_CONFARGS}' GO=${GO}"
 
 do_compile() {
 	# Set GOPATH. See 'PACKAGERS.md'. Don't rely on
-- 
2.11.0


