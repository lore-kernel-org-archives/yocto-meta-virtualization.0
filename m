Return-Path: <Qi.Chen@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 69156E00DE2; Fri,  9 Aug 2019 02:36:49 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D99D5E00D74
	for <meta-virtualization@yoctoproject.org>;
	Fri,  9 Aug 2019 02:36:48 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x799aR7I019975
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Fri, 9 Aug 2019 02:36:38 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Fri, 9 Aug 2019 02:36:16 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Fri, 9 Aug 2019 17:36:14 +0800
Message-ID: <20190809093615.11069-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [PATCH 1/2] cni: fix problem about cross compilation
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
X-List-Received-Date: Fri, 09 Aug 2019 09:36:49 -0000
Content-Type: text/plain

When setting up k8s, the following error appeared, failing
to setup coredns pod.

  NetworkPlugin cni failed to set up pod "coredns-5f7fc64c95-4nnfq_kube-system" network: fork/exec /opt/cni/bin/loopback: no such file or directory

This is because the binary, /opt/cni/bin/loopback, has wrong interpreter.

So fix do_compile to use ${GO} instead of go to fix this problem.

Also clean up all unnecessary settings which have already been in go.bbclass.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-networking/cni/cni_git.bb | 25 +++----------------------
 1 file changed, 3 insertions(+), 22 deletions(-)

diff --git a/recipes-networking/cni/cni_git.bb b/recipes-networking/cni/cni_git.bb
index d07154b..f392ea6 100644
--- a/recipes-networking/cni/cni_git.bb
+++ b/recipes-networking/cni/cni_git.bb
@@ -29,18 +29,6 @@ inherit go
 inherit goarch
 
 do_compile() {
-	export GOARCH="${TARGET_GOARCH}"
-	export GOROOT="${STAGING_LIBDIR_NATIVE}/${TARGET_SYS}/go"
-	export GOPATH="${S}/src/import:${S}/src/import/vendor"
-
-	# Pass the needed cflags/ldflags so that cgo
-	# can find the needed headers files and libraries
-	export CGO_ENABLED="1"
-	export CFLAGS=""
-	export LDFLAGS=""
-	export CGO_CFLAGS="${BUILDSDK_CFLAGS} --sysroot=${STAGING_DIR_TARGET}"
-	export CGO_LDFLAGS="${BUILDSDK_LDFLAGS} --sysroot=${STAGING_DIR_TARGET}"
-
 	# link fixups for compilation
 	rm -f ${S}/src/import/vendor/src
 	mkdir -p ${S}/src/import/vendor/
@@ -56,19 +44,12 @@ do_compile() {
 	ln -sf ${WORKDIR}/plugins ${S}/src/import/vendor/github.com/containernetworking/plugins
 
 	export GOPATH="${S}/src/import/.gopath:${S}/src/import/vendor:${STAGING_DIR_TARGET}/${prefix}/local/go"
-	export GOROOT="${STAGING_DIR_NATIVE}/${nonarch_libdir}/${HOST_SYS}/go"
-
-	# Pass the needed cflags/ldflags so that cgo
-	# can find the needed headers files and libraries
-	export CGO_ENABLED="1"
-	export CGO_CFLAGS="${CFLAGS} --sysroot=${STAGING_DIR_TARGET}"
-	export CGO_LDFLAGS="${LDFLAGS} --sysroot=${STAGING_DIR_TARGET}"
 
 	cd ${S}/src/import/vendor/github.com/containernetworking/cni/libcni
-	go build
+	${GO} build
 
 	cd ${S}/src/import/vendor/github.com/containernetworking/cni/cnitool
-	go build
+	${GO} build
 
 	cd ${S}/src/import/vendor/github.com/containernetworking/plugins/
 	PLUGINS="$(ls -d plugins/meta/*; ls -d plugins/main/* | grep -v windows)"
@@ -76,7 +57,7 @@ do_compile() {
 	for p in $PLUGINS; do
 	    plugin="$(basename "$p")"
 	    echo "building: $p"
-	    go build -o ${WORKDIR}/plugins/bin/$plugin github.com/containernetworking/plugins/$p
+	    ${GO} build -o ${WORKDIR}/plugins/bin/$plugin github.com/containernetworking/plugins/$p
 	done
 }
 
-- 
2.17.1


