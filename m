Return-Path: <pascal.bach@siemens.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CA6CBE00823; Wed, 14 Mar 2018 01:39:23 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.35.17.14 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E7CDAE00823
	for <meta-virtualization@yoctoproject.org>;
	Wed, 14 Mar 2018 01:39:22 -0700 (PDT)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id w2E8dLKu010122
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 14 Mar 2018 09:39:22 +0100
Received: from dev.vm6.ccp.siemens.com ([167.87.15.61])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id w2E8dLpJ017886;
	Wed, 14 Mar 2018 09:39:21 +0100
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id 70DB610D3F8A;
	Wed, 14 Mar 2018 09:39:21 +0100 (CET)
From: Pascal Bach <pascal.bach@siemens.com>
To: meta-virtualization@yoctoproject.org
Date: Wed, 14 Mar 2018 09:39:12 +0100
Message-Id: <20180314083912.16564-1-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] docker: make aufs dependency depend on distro feature
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
X-List-Received-Date: Wed, 14 Mar 2018 08:39:23 -0000

Only include aufs-utils if the corresponding distro feature is enabled.
Without that the aufs kernel driver is not included too.

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 recipes-containers/docker/docker_git.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/recipes-containers/docker/docker_git.bb b/recipes-containers/docker/docker_git.bb
index 5c21138..206c884 100644
--- a/recipes-containers/docker/docker_git.bb
+++ b/recipes-containers/docker/docker_git.bb
@@ -64,8 +64,9 @@ DEPENDS = " \
 PACKAGES =+ "${PN}-contrib"
 
 DEPENDS_append_class-target = " lvm2"
-RDEPENDS_${PN} = "curl aufs-util git util-linux iptables \
-                  ${@bb.utils.contains('DISTRO_FEATURES','systemd','','cgroup-lite',d)} \
+RDEPENDS_${PN} = "util-linux iptables \
+                  ${@bb.utils.contains('DISTRO_FEATURES', 'aufs', 'aufs-util', '', d)} \
+                  ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '', 'cgroup-lite', d)} \
                  "
 RDEPENDS_${PN} += "virtual/containerd virtual/runc"
 
-- 
2.11.0


