Return-Path: <Yunguo.Wei@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C0108E00C39; Mon, 30 May 2016 00:35:08 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7B492E00B04
	for <meta-virtualization@yoctoproject.org>;
	Mon, 30 May 2016 00:35:02 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u4U7Z0Z3018770
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 30 May 2016 00:35:00 -0700
Received: from pek-bsp-build5.wrs.com (128.224.179.117) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.248.2; Mon, 30 May 2016 00:35:00 -0700
From: Yunguo Wei <yunguo.wei@windriver.com>
To: <bruce.ashfield@gmail.com>
Date: Mon, 30 May 2016 15:34:26 +0800
Message-ID: <1464593666-14304-1-git-send-email-yunguo.wei@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [PATCH] docker: override GOROOT at build time
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
X-List-Received-Date: Mon, 30 May 2016 07:35:09 -0000
Content-Type: text/plain

Usually $GOROOT is set by go tool, but if sstate is specified, $GOROOT
is set to the path in the first project. If docker is built in the
another project(with same SSTATE_DIR) later, and the first project is removed,
the following error will be seen:

| go: cannot find GOROOT directory:
/path/to/previous/project/bitbake_build/tmp/sysroots/x86_64-linux/usr/lib/x86_64-wrs-linux/go

This commit is overriding $GOROOT stored in the go tool in sstate cache,
making sure it is set to the correct path in current project.

See more information here: https://golang.org/doc/install#install

Signed-off-by: Yunguo Wei <yunguo.wei@windriver.com>
---
 recipes-containers/docker/docker_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-containers/docker/docker_git.bb b/recipes-containers/docker/docker_git.bb
index 597ff4f..4eea3f4 100644
--- a/recipes-containers/docker/docker_git.bb
+++ b/recipes-containers/docker/docker_git.bb
@@ -82,6 +82,7 @@ do_compile() {
 	mkdir -p .gopath/src/"$(dirname "${DOCKER_PKG}")"
 	ln -sf ../../../.. .gopath/src/"${DOCKER_PKG}"
 	export GOPATH="${S}/.gopath:${S}/vendor:${STAGING_DIR_TARGET}/${prefix}/local/go"
+	export GOROOT="${STAGING_DIR_NATIVE}/${nonarch_libdir}/${HOST_SYS}/go"
 	cd -
 
 	# Pass the needed cflags/ldflags so that cgo
-- 
1.9.1


