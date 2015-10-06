Return-Path: <amy.fong@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7D0C9E00D65; Tue,  6 Oct 2015 11:34:27 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 910B1E00C30
	for <meta-virtualization@yoctoproject.org>;
	Tue,  6 Oct 2015 11:34:23 -0700 (PDT)
Received: from yow-dellw-af.wrs.com (yow-dellw-af.wrs.com [128.224.56.22])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTP id t96IYJLb016263;
	Tue, 6 Oct 2015 11:34:22 -0700 (PDT)
From: Amy Fong <amy.fong@windriver.com>
To: meta-virtualization@yoctoproject.org
Date: Tue,  6 Oct 2015 14:34:08 -0400
Message-Id: <1444156449-19847-7-git-send-email-amy.fong@windriver.com>
X-Mailer: git-send-email 2.5.3
In-Reply-To: <1444156449-19847-1-git-send-email-amy.fong@windriver.com>
References: <1444156449-19847-1-git-send-email-amy.fong@windriver.com>
Subject: [PATCH 6/7] docker: fix paths for cross compile
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
X-List-Received-Date: Tue, 06 Oct 2015 18:34:27 -0000

Some of the cgo variables were pointing to host paths and not target
Fix install rules - binaries can be installed to a subdirectory.

Signed-off-by: Amy Fong <amy.fong@windriver.com>
---
 recipes-containers/docker/docker_git.bb | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/recipes-containers/docker/docker_git.bb b/recipes-containers/docker/docker_git.bb
index 165b319..0127baf 100644
--- a/recipes-containers/docker/docker_git.bb
+++ b/recipes-containers/docker/docker_git.bb
@@ -83,10 +83,12 @@ do_compile() {
 	export GOPATH="${S}/.gopath:${S}/vendor:${STAGING_DIR_TARGET}/${prefix}/local/go"
 	cd -
 
+	export CGO_ENABLED="1"
+
 	# Pass the needed cflags/ldflags so that cgo
 	# can find the needed headers files and libraries
-	export CGO_CFLAGS="${BUILD_CFLAGS}"
-	export CGO_LDFLAGS="${BUILD_LDFLAGS}"
+	export CGO_CFLAGS="${BUILDSDK_CFLAGS}"
+	export CGO_LDFLAGS="${BUILDSDK_LDFLAGS}"
 
 	# this is the unsupported built structure
 	# that doesn't rely on an existing docker
@@ -124,7 +126,11 @@ do_install() {
             install -m 0755 ${WORKDIR}/docker.init ${D}${sysconfdir}/init.d/docker.init
 	fi
 
-	cp ${S}/vendor/bin/nsinit ${D}/${bindir}
+	if [ -d ${S}/vendor/bin/linux_* ]; then
+		cp ${S}/vendor/bin/linux_*/* ${D}/${bindir}
+	else
+		cp ${S}/vendor/bin/* ${D}/${bindir}
+	fi
 
 	mkdir -p ${D}/usr/share/docker/
 	cp ${WORKDIR}/hi.Dockerfile ${D}/usr/share/docker/
-- 
2.5.3


