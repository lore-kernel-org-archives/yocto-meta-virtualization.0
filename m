Return-Path: <pascal.bach@siemens.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4F386E00C1B; Wed, 20 Feb 2019 05:12:18 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [192.35.17.14 listed in list.dnswl.org]
X-Greylist: delayed 322 seconds by postgrey-1.32 at yocto-www;
	Wed, 20 Feb 2019 05:12:16 PST
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F073BE00BCC
	for <meta-virtualization@yoctoproject.org>;
	Wed, 20 Feb 2019 05:12:16 -0800 (PST)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id x1KD6r7g021773
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Wed, 20 Feb 2019 14:06:53 +0100
Received: from dev.vm6.ccp.siemens.com ([139.22.114.246])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id x1KD6qd1007165;
	Wed, 20 Feb 2019 14:06:52 +0100
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id 8462A10D47AA;
	Wed, 20 Feb 2019 14:06:51 +0100 (CET)
From: Pascal Bach <pascal.bach@siemens.com>
To: meta-virtualization@yoctoproject.org
Date: Wed, 20 Feb 2019 14:05:27 +0100
Message-Id: <20190220130527.5770-1-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] docker: update 18.09.0 -> 18.09.2
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
X-List-Received-Date: Wed, 20 Feb 2019 13:12:18 -0000

Docker revision is taken from https://github.com/docker/engine/releases/tag/v18.09.2
and libnetwork is extracted from there.
I also switched the repo from moby/moby to docker/engine as it makes it easier to find the tags.

What is odd is that the Copyright year in LICENSE went backwards in this release.

I didn't touch runc and containerd as they are already updated.

Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 recipes-containers/docker/docker-ce_git.bb |  6 +++---
 recipes-containers/docker/docker_git.bb    | 12 ++++++------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/recipes-containers/docker/docker-ce_git.bb b/recipes-containers/docker/docker-ce_git.bb
index 05eac21..5e9f060 100644
--- a/recipes-containers/docker/docker-ce_git.bb
+++ b/recipes-containers/docker/docker-ce_git.bb
@@ -18,8 +18,8 @@ DESCRIPTION = "Linux container runtime \
  subtle and/or glaring issues. \
  "
 
-SRCREV_docker = "6e632f7fc395d15bce46f426086e91c01598cf59"
-SRCREV_libnetwork = "6da50d1978302f04c3e2089e29112ea24812f05b"
+SRCREV_docker = "62479626f213818ba5b4565105a05277308587d5"
+SRCREV_libnetwork = "2cfbf9b1f98162a55829a21cc603c76072a75382"
 SRC_URI = "\
 	git://github.com/docker/docker-ce.git;branch=18.09;name=docker \
 	git://github.com/docker/libnetwork.git;branch=bump_18.09;name=libnetwork;destsuffix=git/libnetwork \
@@ -34,7 +34,7 @@ GO_IMPORT = "import"
 
 S = "${WORKDIR}/git"
 
-DOCKER_VERSION = "18.09.0-ce"
+DOCKER_VERSION = "18.09.2-ce"
 PV = "${DOCKER_VERSION}+git${SRCREV_docker}"
 
 DEPENDS = " \
diff --git a/recipes-containers/docker/docker_git.bb b/recipes-containers/docker/docker_git.bb
index 19e773b..5a0e483 100644
--- a/recipes-containers/docker/docker_git.bb
+++ b/recipes-containers/docker/docker_git.bb
@@ -18,11 +18,11 @@ DESCRIPTION = "Linux container runtime \
  subtle and/or glaring issues. \
  "
 
-SRCREV_docker = "489b8eda6674523df8b82a210399b7d2954427d0"
-SRCREV_libnetwork = "6da50d1978302f04c3e2089e29112ea24812f05b"
-SRCREV_cli = "51668a30f26250ccfce31bcc13d9334eaafabe36"
+SRCREV_docker = "eb137ff1765faeb29c2d99025bfd8ed41836dd06"
+SRCREV_libnetwork = "2cfbf9b1f98162a55829a21cc603c76072a75382"
+SRCREV_cli = "af2647d55b1dff69f5684f5991b9690fddd75c69"
 SRC_URI = "\
-	git://github.com/moby/moby.git;nobranch=1;name=docker \
+	git://github.com/docker/engine.git;nobranch=1;name=docker \
 	git://github.com/docker/libnetwork.git;branch=bump_18.09;name=libnetwork;destsuffix=git/libnetwork \
 	git://github.com/docker/cli;branch=18.09;name=cli;destsuffix=git/cli \
 	file://docker.init \
@@ -31,13 +31,13 @@ SRC_URI = "\
 
 # Apache-2.0 for docker
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=4859e97a9c7780e77972d989f0823f28"
+LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=9740d093a080530b5c5c6573df9af45a"
 
 GO_IMPORT = "import"
 
 S = "${WORKDIR}/git"
 
-DOCKER_VERSION = "18.09.0"
+DOCKER_VERSION = "18.09.2"
 PV = "${DOCKER_VERSION}+git${SRCREV_docker}"
 
 DEPENDS = " \
-- 
2.11.0


