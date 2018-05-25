Return-Path: <pascal.bach@siemens.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 78785E009CA; Fri, 25 May 2018 07:05:39 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DC8FAE009B9
	for <meta-virtualization@yoctoproject.org>;
	Fri, 25 May 2018 07:05:37 -0700 (PDT)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id w4PDweXB005900
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Fri, 25 May 2018 15:58:40 +0200
Received: from dev.vm6.ccp.siemens.com (MD1FZU9C.ad001.siemens.net
	[139.16.79.187])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id w4PDweuC007790;
	Fri, 25 May 2018 15:58:40 +0200
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id 55D8B10D4969;
	Fri, 25 May 2018 15:58:40 +0200 (CEST)
From: Pascal Bach <pascal.bach@siemens.com>
To: meta-virtualization@yoctoproject.org
Date: Fri, 25 May 2018 15:58:20 +0200
Message-Id: <20180525135820.9279-2-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180525135820.9279-1-pascal.bach@siemens.com>
References: <20180525135820.9279-1-pascal.bach@siemens.com>
Subject: [PATCH 2/2] docker: allow enabling seccomp
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
X-List-Received-Date: Fri, 25 May 2018 14:05:39 -0000

This requires libseccomp from meta-security so it is not enabled by default.

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 recipes-containers/docker/docker_git.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/recipes-containers/docker/docker_git.bb b/recipes-containers/docker/docker_git.bb
index e055a4f..790170e 100644
--- a/recipes-containers/docker/docker_git.bb
+++ b/recipes-containers/docker/docker_git.bb
@@ -62,6 +62,9 @@ DEPENDS = " \
     libtool \
     "
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[seccomp] = "seccomp,,libseccomp"
+
 PACKAGES =+ "${PN}-contrib"
 
 DEPENDS_append_class-target = " lvm2"
@@ -105,7 +108,7 @@ do_compile() {
 	export CGO_CFLAGS="${CFLAGS} --sysroot=${STAGING_DIR_TARGET}"
 	export CGO_LDFLAGS="${LDFLAGS} --sysroot=${STAGING_DIR_TARGET}"
 	# in order to exclude devicemapper and btrfs - https://github.com/docker/docker/issues/14056
-	export DOCKER_BUILDTAGS='exclude_graphdriver_btrfs exclude_graphdriver_devicemapper'
+	export DOCKER_BUILDTAGS='exclude_graphdriver_btrfs exclude_graphdriver_devicemapper ${PACKAGECONFIG_CONFARGS}'
 
 	export DISABLE_WARN_OUTSIDE_CONTAINER=1
 
-- 
2.11.0


