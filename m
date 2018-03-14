Return-Path: <pascal.bach@siemens.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5EAABE00E41; Wed, 14 Mar 2018 01:40:00 -0700 (PDT)
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
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 81B89E00823
	for <meta-virtualization@yoctoproject.org>;
	Wed, 14 Mar 2018 01:39:59 -0700 (PDT)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id w2E8dw7j008371
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 14 Mar 2018 09:39:58 +0100
Received: from dev.vm6.ccp.siemens.com ([167.87.15.61])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id w2E8dvMF020652;
	Wed, 14 Mar 2018 09:39:58 +0100
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id B0B7C10D3F8A;
	Wed, 14 Mar 2018 09:39:57 +0100 (CET)
From: Pascal Bach <pascal.bach@siemens.com>
To: meta-virtualization@yoctoproject.org
Date: Wed, 14 Mar 2018 09:39:47 +0100
Message-Id: <20180314083947.22458-1-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] containerd: remove redundant systemd detection
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
X-List-Received-Date: Wed, 14 Mar 2018 08:40:00 -0000

The variables only take effect if systemd is enabled so the check can be removed.

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 recipes-containers/containerd/containerd.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-containers/containerd/containerd.inc b/recipes-containers/containerd/containerd.inc
index f91e018..801ace1 100644
--- a/recipes-containers/containerd/containerd.inc
+++ b/recipes-containers/containerd/containerd.inc
@@ -53,8 +53,8 @@ do_compile() {
 
 # Note: disabled for now, since docker is launching containerd
 # inherit systemd
-# SYSTEMD_PACKAGES = "${@bb.utils.contains('DISTRO_FEATURES','systemd','${PN}','',d)}"
-# SYSTEMD_SERVICE_${PN} = "${@bb.utils.contains('DISTRO_FEATURES','systemd','containerd.service','',d)}"
+# SYSTEMD_PACKAGES = "${PN}"
+# SYSTEMD_SERVICE_${PN} = "containerd.service"
 
 do_install() {
     mkdir -p ${D}/${bindir}
-- 
2.11.0


