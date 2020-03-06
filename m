Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web11.1004.1583531640212412269
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 06 Mar 2020 13:54:00 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: mark.asselstine@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 026LrvhK014867
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Fri, 6 Mar 2020 13:53:57 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Fri, 6 Mar 2020
 13:53:56 -0800
From: "Mark Asselstine" <mark.asselstine@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>, <bruce.ashfield@gmail.com>
Subject: [meta-virtualization][PATCH 2/2] cni: prevent go from downloading stuff in the background
Date: Fri, 6 Mar 2020 16:53:42 -0500
Message-ID: <1583531622-21685-2-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1583531622-21685-1-git-send-email-mark.asselstine@windriver.com>
References: <1583531622-21685-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain

While testing the cni uprev by building in a container with
network=none the following error was found:

  go: github.com/Microsoft/go-winio@v0.4.11: Get
   https://proxy.golang.org/github.com/%21microsoft/go-winio/@v/v0.4.11.mod:
   dial tcp: lookup proxy.golang.org on 128.224.144.130:53:
   dial udp 128.224.144.130:53: connect: network is unreachable

After some digging through the go documentation it was found that the
'-mod=vendor' is required for 'go build' to use shipped vendor modules
when building modules. This can be confirmed by look at the
'build_linux.sh' script which is found in the plugins repo.

By using '-mod=vendor' and also ensuring things are properly placed in
the GOPATH (ie $B) we can avoid having to create many of the links we
had been previously.

We also put all the build artifacts into $B to avoid mixing source and
build.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 recipes-networking/cni/cni_git.bb | 32 +++++++++-----------------------
 1 file changed, 9 insertions(+), 23 deletions(-)

diff --git a/recipes-networking/cni/cni_git.bb b/recipes-networking/cni/cni_git.bb
index a81e6cc..3ad939b 100644
--- a/recipes-networking/cni/cni_git.bb
+++ b/recipes-networking/cni/cni_git.bb
@@ -14,7 +14,7 @@ SRCREV_cni = "4cfb7b568922a3c79a23e438dc52fe537fc9687e"
 SRCREV_plugins = "1f33fb729ae2b8900785f896df2dc1f6fe5e8239"
 SRC_URI = "\
 	git://github.com/containernetworking/cni.git;nobranch=1;name=cni \
-        git://github.com/containernetworking/plugins.git;nobranch=1;destsuffix=plugins;name=plugins \
+        git://github.com/containernetworking/plugins.git;nobranch=1;destsuffix=${S}/src/github.com/containernetworking/plugins;name=plugins \
 	"
 
 RPROVIDES_${PN} += "kubernetes-cni"
@@ -30,36 +30,22 @@ inherit go
 inherit goarch
 
 do_compile() {
-	# link fixups for compilation
-	rm -f ${S}/src/import/vendor/src
-	mkdir -p ${S}/src/import/vendor/
-	ln -sf ./ ${S}/src/import/vendor/src
-	rm -rf ${S}/src/import/plugins
-	rm -rf ${S}/src/import/vendor/github.com/containernetworking/plugins
+	mkdir -p ${S}/src/github.com/containernetworking
+	ln -sfr ${S}/src/import ${S}/src/github.com/containernetworking/cni
 
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
+	cd ${B}/src/github.com/containernetworking/cni/libcni
 	${GO} build
 
-	cd ${S}/src/import/vendor/github.com/containernetworking/cni/cnitool
+	cd ${B}/src/github.com/containernetworking/cni/cnitool
 	${GO} build
 
-	cd ${S}/src/import/vendor/github.com/containernetworking/plugins/
+	cd ${B}/src/github.com/containernetworking/plugins
 	PLUGINS="$(ls -d plugins/meta/*; ls -d plugins/ipam/*; ls -d plugins/main/* | grep -v windows)"
-	mkdir -p ${WORKDIR}/plugins/bin/
+	mkdir -p ${B}/plugins/bin/
 	for p in $PLUGINS; do
 	    plugin="$(basename "$p")"
 	    echo "building: $p"
-	    ${GO} build -o ${WORKDIR}/plugins/bin/$plugin github.com/containernetworking/plugins/$p
+	    ${GO} build -mod=vendor -o ${B}/plugins/bin/$plugin github.com/containernetworking/plugins/$p
 	done
 }
 
@@ -70,7 +56,7 @@ do_install() {
     install -d ${D}/${sysconfdir}/cni/net.d
 
     install -m 755 ${S}/src/import/cnitool/cnitool ${D}/${localbindir}
-    install -m 755 -D ${WORKDIR}/plugins/bin/* ${D}/${localbindir}
+    install -m 755 -D ${B}/plugins/bin/* ${D}/${localbindir}
 
     # Parts of k8s expect the cni binaries to be available in /opt/cni
     install -d ${D}/opt/cni
-- 
2.7.4

