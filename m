Return-Path: <Qi.Chen@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C9941E00DAA; Tue, 13 Aug 2019 00:52:08 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [192.103.53.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AE8F4E00D98
	for <meta-virtualization@yoctoproject.org>;
	Tue, 13 Aug 2019 00:52:03 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x7D7pR17025365
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 13 Aug 2019 00:51:53 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Tue, 13 Aug 2019 00:51:48 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 13 Aug 2019 15:51:34 +0800
Message-ID: <20190813075136.6248-2-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190813075136.6248-1-Qi.Chen@windriver.com>
References: <20190813075136.6248-1-Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] cni: extract common settings to cni.inc
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
X-List-Received-Date: Tue, 13 Aug 2019 07:52:08 -0000
Content-Type: text/plain

Extract common settings of two cni recipe into cni.inc.
Add comment in recipe file to explicitly state what the version is for.
More sepcifically, the git version is used to track latest upstream,
while the 0.7.1 version is used to ensure basic setup works for k8s.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-networking/cni/cni.inc      | 79 +++++++++++++++++++++++++++++
 recipes-networking/cni/cni_0.7.1.bb | 71 +-------------------------
 recipes-networking/cni/cni_git.bb   | 73 +-------------------------
 3 files changed, 83 insertions(+), 140 deletions(-)
 create mode 100644 recipes-networking/cni/cni.inc

diff --git a/recipes-networking/cni/cni.inc b/recipes-networking/cni/cni.inc
new file mode 100644
index 0000000..7a3b87f
--- /dev/null
+++ b/recipes-networking/cni/cni.inc
@@ -0,0 +1,79 @@
+HOMEPAGE = "https://github.com/containernetworking/cni"
+SUMMARY = "Container Network Interface - networking for Linux containers"
+DESCRIPTION = "CNI (Container Network Interface), a Cloud Native Computing \
+Foundation project, consists of a specification and libraries for writing \
+plugins to configure network interfaces in Linux containers, along with a \
+number of supported plugins. CNI concerns itself only with network connectivity \
+of containers and removing allocated resources when the container is deleted. \
+Because of this focus, CNI has a wide range of support and the specification \
+is simple to implement. \
+"
+
+# 0.7.1
+SRCREV_cni = "4cfb7b568922a3c79a23e438dc52fe537fc9687e"
+# 0.7.5
+SRCREV_plugins = "a62711a5da7a2dc2eb93eac47e103738ad923fd6"
+SRC_URI = "\
+	git://github.com/containernetworking/cni.git;branch=master;name=cni \
+        git://github.com/containernetworking/plugins.git;branch=v0.7;destsuffix=plugins;name=plugins \
+	"
+
+RPROVIDES_${PN} += "kubernetes-cni"
+
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=fa818a259cbed7ce8bc2a22d35a464fc"
+
+GO_IMPORT = "import"
+
+PV = "0.7.1"
+
+inherit go
+inherit goarch
+
+do_compile() {
+	# link fixups for compilation
+	rm -f ${S}/src/import/vendor/src
+	mkdir -p ${S}/src/import/vendor/
+	ln -sf ./ ${S}/src/import/vendor/src
+	rm -rf ${S}/src/import/plugins
+	rm -rf ${S}/src/import/vendor/github.com/containernetworking/plugins
+
+	mkdir -p ${S}/src/import/vendor/github.com/containernetworking/cni
+
+	ln -sf ../../../../libcni ${S}/src/import/vendor/github.com/containernetworking/cni/libcni
+	ln -sf ../../../../pkg ${S}/src/import/vendor/github.com/containernetworking/cni/pkg
+	ln -sf ../../../../cnitool ${S}/src/import/vendor/github.com/containernetworking/cni/cnitool
+	ln -sf ${WORKDIR}/plugins ${S}/src/import/vendor/github.com/containernetworking/plugins
+
+	export GOPATH="${S}/src/import/.gopath:${S}/src/import/vendor:${STAGING_DIR_TARGET}/${prefix}/local/go"
+	export CGO_ENABLED="1"
+
+	cd ${S}/src/import/vendor/github.com/containernetworking/cni/libcni
+	${GO} build
+
+	cd ${S}/src/import/vendor/github.com/containernetworking/cni/cnitool
+	${GO} build
+
+	cd ${S}/src/import/vendor/github.com/containernetworking/plugins/
+	PLUGINS="$(ls -d plugins/meta/*; ls -d plugins/ipam/*; ls -d plugins/main/* | grep -v windows)"
+	mkdir -p ${WORKDIR}/plugins/bin/
+	for p in $PLUGINS; do
+	    plugin="$(basename "$p")"
+	    echo "building: $p"
+	    ${GO} build -o ${WORKDIR}/plugins/bin/$plugin github.com/containernetworking/plugins/$p
+	done
+}
+
+do_install() {
+    localbindir="/opt/cni/bin"
+
+    install -d ${D}${localbindir}
+    install -d ${D}/${sysconfdir}/cni/net.d
+
+    install -m 755 ${S}/src/import/cnitool/cnitool ${D}/${localbindir}
+    install -m 755 -D ${WORKDIR}/plugins/bin/* ${D}/${localbindir}
+}
+
+FILES_${PN} += "/opt/cni/bin/*"
+
+INSANE_SKIP_${PN} += "ldflags already-stripped"
diff --git a/recipes-networking/cni/cni_0.7.1.bb b/recipes-networking/cni/cni_0.7.1.bb
index 7a3b87f..7977040 100644
--- a/recipes-networking/cni/cni_0.7.1.bb
+++ b/recipes-networking/cni/cni_0.7.1.bb
@@ -1,13 +1,5 @@
-HOMEPAGE = "https://github.com/containernetworking/cni"
-SUMMARY = "Container Network Interface - networking for Linux containers"
-DESCRIPTION = "CNI (Container Network Interface), a Cloud Native Computing \
-Foundation project, consists of a specification and libraries for writing \
-plugins to configure network interfaces in Linux containers, along with a \
-number of supported plugins. CNI concerns itself only with network connectivity \
-of containers and removing allocated resources when the container is deleted. \
-Because of this focus, CNI has a wide range of support and the specification \
-is simple to implement. \
-"
+# This cni version is here to ensure that basic k8s setup with flannel could work.
+require cni.inc
 
 # 0.7.1
 SRCREV_cni = "4cfb7b568922a3c79a23e438dc52fe537fc9687e"
@@ -17,63 +9,4 @@ SRC_URI = "\
 	git://github.com/containernetworking/cni.git;branch=master;name=cni \
         git://github.com/containernetworking/plugins.git;branch=v0.7;destsuffix=plugins;name=plugins \
 	"
-
-RPROVIDES_${PN} += "kubernetes-cni"
-
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=fa818a259cbed7ce8bc2a22d35a464fc"
-
-GO_IMPORT = "import"
-
 PV = "0.7.1"
-
-inherit go
-inherit goarch
-
-do_compile() {
-	# link fixups for compilation
-	rm -f ${S}/src/import/vendor/src
-	mkdir -p ${S}/src/import/vendor/
-	ln -sf ./ ${S}/src/import/vendor/src
-	rm -rf ${S}/src/import/plugins
-	rm -rf ${S}/src/import/vendor/github.com/containernetworking/plugins
-
-	mkdir -p ${S}/src/import/vendor/github.com/containernetworking/cni
-
-	ln -sf ../../../../libcni ${S}/src/import/vendor/github.com/containernetworking/cni/libcni
-	ln -sf ../../../../pkg ${S}/src/import/vendor/github.com/containernetworking/cni/pkg
-	ln -sf ../../../../cnitool ${S}/src/import/vendor/github.com/containernetworking/cni/cnitool
-	ln -sf ${WORKDIR}/plugins ${S}/src/import/vendor/github.com/containernetworking/plugins
-
-	export GOPATH="${S}/src/import/.gopath:${S}/src/import/vendor:${STAGING_DIR_TARGET}/${prefix}/local/go"
-	export CGO_ENABLED="1"
-
-	cd ${S}/src/import/vendor/github.com/containernetworking/cni/libcni
-	${GO} build
-
-	cd ${S}/src/import/vendor/github.com/containernetworking/cni/cnitool
-	${GO} build
-
-	cd ${S}/src/import/vendor/github.com/containernetworking/plugins/
-	PLUGINS="$(ls -d plugins/meta/*; ls -d plugins/ipam/*; ls -d plugins/main/* | grep -v windows)"
-	mkdir -p ${WORKDIR}/plugins/bin/
-	for p in $PLUGINS; do
-	    plugin="$(basename "$p")"
-	    echo "building: $p"
-	    ${GO} build -o ${WORKDIR}/plugins/bin/$plugin github.com/containernetworking/plugins/$p
-	done
-}
-
-do_install() {
-    localbindir="/opt/cni/bin"
-
-    install -d ${D}${localbindir}
-    install -d ${D}/${sysconfdir}/cni/net.d
-
-    install -m 755 ${S}/src/import/cnitool/cnitool ${D}/${localbindir}
-    install -m 755 -D ${WORKDIR}/plugins/bin/* ${D}/${localbindir}
-}
-
-FILES_${PN} += "/opt/cni/bin/*"
-
-INSANE_SKIP_${PN} += "ldflags already-stripped"
diff --git a/recipes-networking/cni/cni_git.bb b/recipes-networking/cni/cni_git.bb
index 5348b95..06b37a4 100644
--- a/recipes-networking/cni/cni_git.bb
+++ b/recipes-networking/cni/cni_git.bb
@@ -1,13 +1,5 @@
-HOMEPAGE = "https://github.com/containernetworking/cni"
-SUMMARY = "Container Network Interface - networking for Linux containers"
-DESCRIPTION = "CNI (Container Network Interface), a Cloud Native Computing \
-Foundation project, consists of a specification and libraries for writing \
-plugins to configure network interfaces in Linux containers, along with a \
-number of supported plugins. CNI concerns itself only with network connectivity \
-of containers and removing allocated resources when the container is deleted. \
-Because of this focus, CNI has a wide range of support and the specification \
-is simple to implement. \
-"
+# This cni version is supposed to track latest upstream.
+require cni.inc
 
 SRCREV_cni = "dc71cd2ba60c452c56a0a259f2a23d2afe42b688"
 SRCREV_plugins = "0eddc554c0747200b7b112ce5322dcfa525298cf"
@@ -15,65 +7,4 @@ SRC_URI = "\
 	git://github.com/containernetworking/cni.git;nobranch=1;name=cni \
         git://github.com/containernetworking/plugins.git;nobranch=1;destsuffix=plugins;name=plugins \
 	"
-
-RPROVIDES_${PN} += "kubernetes-cni"
-
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=fa818a259cbed7ce8bc2a22d35a464fc"
-
-GO_IMPORT = "import"
-
 PV = "0.7.0+git${SRCREV_cni}"
-
-inherit go
-inherit goarch
-
-do_compile() {
-	# link fixups for compilation
-	rm -f ${S}/src/import/vendor/src
-	mkdir -p ${S}/src/import/vendor/
-	ln -sf ./ ${S}/src/import/vendor/src
-	rm -rf ${S}/src/import/plugins
-	rm -rf ${S}/src/import/vendor/github.com/containernetworking/plugins
-
-	mkdir -p ${S}/src/import/vendor/github.com/containernetworking/cni
-
-	ln -sf ../../../../libcni ${S}/src/import/vendor/github.com/containernetworking/cni/libcni
-	ln -sf ../../../../pkg ${S}/src/import/vendor/github.com/containernetworking/cni/pkg
-	ln -sf ../../../../cnitool ${S}/src/import/vendor/github.com/containernetworking/cni/cnitool
-	ln -sf ${WORKDIR}/plugins ${S}/src/import/vendor/github.com/containernetworking/plugins
-
-	export GOPATH="${S}/src/import/.gopath:${S}/src/import/vendor:${STAGING_DIR_TARGET}/${prefix}/local/go"
-	export CGO_ENABLED="1"
-
-	cd ${S}/src/import/vendor/github.com/containernetworking/cni/libcni
-	${GO} build
-
-	cd ${S}/src/import/vendor/github.com/containernetworking/cni/cnitool
-	${GO} build
-
-	cd ${S}/src/import/vendor/github.com/containernetworking/plugins/
-	PLUGINS="$(ls -d plugins/meta/*; ls -d plugins/ipam/*; ls -d plugins/main/* | grep -v windows)"
-	mkdir -p ${WORKDIR}/plugins/bin/
-	for p in $PLUGINS; do
-	    plugin="$(basename "$p")"
-	    echo "building: $p"
-	    ${GO} build -o ${WORKDIR}/plugins/bin/$plugin github.com/containernetworking/plugins/$p
-	done
-}
-
-do_install() {
-    localbindir="/opt/cni/bin"
-
-    install -d ${D}${localbindir}
-    install -d ${D}/${sysconfdir}/cni/net.d
-
-    install -m 755 ${S}/src/import/cnitool/cnitool ${D}/${localbindir}
-    install -m 755 -D ${WORKDIR}/plugins/bin/* ${D}/${localbindir}
-}
-
-FILES_${PN} += "/opt/cni/bin/*"
-
-INSANE_SKIP_${PN} += "ldflags already-stripped"
-
-deltask compile_ptest_base
-- 
2.17.1


