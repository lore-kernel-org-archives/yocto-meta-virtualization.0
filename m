Return-Path: <pascal.bach@siemens.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2AE55E00A75; Fri,  6 Apr 2018 06:42:30 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A9ED1E005A9
	for <meta-virtualization@yoctoproject.org>;
	Fri,  6 Apr 2018 06:42:27 -0700 (PDT)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id w36DgQ0S022363
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Fri, 6 Apr 2018 15:42:26 +0200
Received: from dev.vm6.ccp.siemens.com (MD1FZU9C.ad001.siemens.net
	[139.16.79.111])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id w36DgQuv023615;
	Fri, 6 Apr 2018 15:42:26 +0200
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id CF49710D5951;
	Fri,  6 Apr 2018 15:42:25 +0200 (CEST)
From: Pascal Bach <pascal.bach@siemens.com>
To: meta-virtualization@yoctoproject.org
Date: Fri,  6 Apr 2018 15:41:56 +0200
Message-Id: <20180406134156.21533-2-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180406134156.21533-1-pascal.bach@siemens.com>
References: <20180406134156.21533-1-pascal.bach@siemens.com>
Subject: [PATCH 2/2] docker: use docker-proxy instead of building it
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
X-List-Received-Date: Fri, 06 Apr 2018 13:42:30 -0000

Use the dedicated docker-proxy as RDEPENDS instead of squeezing it into
the docker build.

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 recipes-containers/docker/docker_git.bb | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/recipes-containers/docker/docker_git.bb b/recipes-containers/docker/docker_git.bb
index 13c2731..ed7643b 100644
--- a/recipes-containers/docker/docker_git.bb
+++ b/recipes-containers/docker/docker_git.bb
@@ -19,11 +19,9 @@ DESCRIPTION = "Linux container runtime \
  "
 
 SRCREV_docker = "708b068d3095c6a6be939eb2da78c921d2e945e2"
-SRCREV_libnetwork = "4cb38c2987c236dce03c868d99b57b1e28a4b81c"
 SRCREV_cli = "0f1bb353423e45e02315e985bd9ddebe6da18457"
 SRC_URI = "\
 	git://github.com/moby/moby.git;nobranch=1;name=docker \
-	git://github.com/docker/libnetwork.git;branch=master;name=libnetwork;destsuffix=libnetwork \
 	git://github.com/docker/cli;branch=master;name=cli;destsuffix=cli \
 	file://docker.init \
 	file://hi.Dockerfile \
@@ -68,7 +66,7 @@ RDEPENDS_${PN} = "util-linux iptables \
                   ${@bb.utils.contains('DISTRO_FEATURES', 'aufs', 'aufs-util', '', d)} \
                   ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '', 'cgroup-lite', d)} \
                  "
-RDEPENDS_${PN} += "virtual/containerd virtual/runc"
+RDEPENDS_${PN} += "virtual/containerd virtual/runc docker-proxy"
 
 RRECOMMENDS_${PN} = "kernel-module-dm-thin-pool kernel-module-nf-nat"
 RSUGGESTS_${PN} = "lxc rt-tests"
@@ -115,9 +113,6 @@ do_compile() {
 	# to build this:
 	VERSION="${DOCKER_VERSION}" DOCKER_GITCOMMIT="${SRCREV_docker}" ./hack/make.sh dynbinary
 
-	# build the proxy
-	go build -o ${S}/src/import/docker-proxy github.com/docker/libnetwork/cmd/proxy
-
         # build the cli
 	cd ${S}/src/import/.gopath/src/github.com/docker/cli
 	export CFLAGS=""
@@ -139,7 +134,6 @@ do_install() {
 	mkdir -p ${D}/${bindir}
 	cp ${WORKDIR}/cli/build/docker ${D}/${bindir}/docker
 	cp ${S}/src/import/bundles/latest/dynbinary-daemon/dockerd ${D}/${bindir}/dockerd
-	cp ${S}/src/import/docker-proxy ${D}/${bindir}/docker-proxy
 
 	if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
 		install -d ${D}${systemd_unitdir}/system
-- 
2.11.0


