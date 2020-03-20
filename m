Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web12.7708.1584697911399525420
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 20 Mar 2020 02:51:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com header.s=axis-central1 header.b=cYDOGXyu;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: joakim.roubert@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=26630; q=dns/txt; s=axis-central1;
  t=1584697911; x=1616233911;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Adjy79xf97KXGA/sz6Zwo8L1OS9XUgS3p79EL8+lbhY=;
  b=cYDOGXyufXDxX5Yddw/q0pmscO4Ki1X1kNIPALp/ZYXPmFBbTHkjU9Lc
   ljjNtZzXWGfV7MWIWPkbPrSrxr3KGq81GkAYG4b0QJMAN4OPpdUZr0ynA
   NzIkahqHPdH8Vax2XEKKoh1cFqVBrC8899x0kv4JWRpH61FTD5keHuUUv
   iZgRQCLHFnQqXCWY2fUv9/R+3oCyYrQsgjL9vdKjX9MBlzBtK93RVVLYx
   T2CmrgWKxqPj3dzbqbswGD6dUxNxFuvNPQrU13jmwMXFyvtdOPGH79Gyz
   nrNvcg/+4ET3uaRffGjZfjRagADNVoB2ksQauCRFJRiFGWlf9VzKsjROS
   Q==;
IronPort-SDR: CBx4J3Wv5PdyW5hIKu3Ogd7bnbN7rhXIpU9Y7B5W5vFqXRTvEiyN36lZW5snc0RRm0O9+6FMaL
 STGLcwWkb6+SeMUUodePTeS2wuoyGq8aVSj7ShuIDMrVc3wYZwZyujDFGrvcEniOk7SQ1vczH+
 TH1pDsF2i9CDzOQBFiPNBTkrU3hTU308hGpJfZsKnn9P1lzml6D1CwWajOUIo6RMMwy8mfr9Wp
 Vw7JX+O1JpNz6Z9xEyezMJBzQ8YGAZa7XEMlMfNDG9GhMHiELYUGJwq1JGLPouXlLe/jaNtOyS
 DAI=
X-IronPort-AV: E=Sophos;i="5.72,284,1580770800"; 
   d="scan'208";a="6725337"
From: "Joakim Roubert" <joakim.roubert@axis.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: Joakim Roubert <joakimr@axis.com>
Subject: [meta-virtualization][PATCH] go: Enable different target dir by using variable
Date: Fri, 20 Mar 2020 10:51:24 +0100
Message-ID: <20200320095124.3297-1-joakimr@axis.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Return-Path: joakimr@axis.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Enable setting the target installation (sub)directory for go by adding
such a variable in a class (go.class). The default target installation
value is local, to get binaries in /usr/local/bin just like before. But
on systems where e.g. /usr/bin is the desired target that is achieved by
setting this variable to "".

Change-Id: I1a3de8e70340931391cd4382cba2478403ae27ce
Signed-off-by: Joakim Roubert <joakimr@axis.com>
---
 classes/go.bbclass                         |  4 ++++
 recipes-devtools/go/compose-file_git.bb    | 20 +++++++++++---------
 recipes-devtools/go/go-capability_git.bb   | 12 +++++++-----
 recipes-devtools/go/go-cli_git.bb          | 12 +++++++-----
 recipes-devtools/go/go-connections_git.bb  | 18 ++++++++++--------
 recipes-devtools/go/go-context_git.bb      | 12 +++++++-----
 recipes-devtools/go/go-dbus_git.bb         | 12 +++++++-----
 recipes-devtools/go/go-distribution_git.bb | 18 ++++++++++--------
 recipes-devtools/go/go-fsnotify_git.bb     | 12 +++++++-----
 recipes-devtools/go/go-libtrust_git.bb     | 12 +++++++-----
 recipes-devtools/go/go-logrus_git.bb       | 12 +++++++-----
 recipes-devtools/go/go-metalinter_git.bb   |  8 +++++---
 recipes-devtools/go/go-mux_git.bb          | 12 +++++++-----
 recipes-devtools/go/go-patricia_git.bb     | 12 +++++++-----
 recipes-devtools/go/go-pty_git.bb          | 12 +++++++-----
 recipes-devtools/go/go-systemd_git.bb      | 12 +++++++-----
 recipes-devtools/go/grpc-go_git.bb         | 18 ++++++++++--------
 recipes-devtools/go/notary_git.bb          | 18 ++++++++++--------
 18 files changed, 137 insertions(+), 99 deletions(-)
 create mode 100644 classes/go.bbclass

diff --git a/classes/go.bbclass b/classes/go.bbclass
new file mode 100644
index 0000000..273842c
--- /dev/null
+++ b/classes/go.bbclass
@@ -0,0 +1,4 @@
+# Set the target installation (sub)directory for go. The default is local,
+# to get binaries in /usr/local/bin, but on systems where e.g. /usr/bin is
+# the desired target that is achieved by setting this variable to "".
+LOCAL_SUBDIR_go ?= "/local"
diff --git a/recipes-devtools/go/compose-file_git.bb b/recipes-devtools/go/compose-file_git.bb
index bcf8c3d..be2284e 100644
--- a/recipes-devtools/go/compose-file_git.bb
+++ b/recipes-devtools/go/compose-file_git.bb
@@ -1,3 +1,5 @@
+inherit go
+
 DESCRIPTION = "Parser for the Compose file format (version 3)"
 HOMEPAGE = "https://github.com/aanand/compose-file"
 SECTION = "devel/go"
@@ -19,23 +21,23 @@ do_compile() {
 }
 
 do_install() {
-	install -d ${D}${prefix}/local/go/src/${PKG_NAME}
+	install -d ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
 	for j in $(cd ${S} && find src/${PKG_NAME} -name "*.go"); do
-	    if [ ! -d ${D}${prefix}/local/go/$(dirname $j) ]; then
-	        mkdir -p ${D}${prefix}/local/go/$(dirname $j)
+	    if [ ! -d ${D}${prefix}${LOCAL_SUBDIR_go}/go/$(dirname $j) ]; then
+	        mkdir -p ${D}${prefix}${LOCAL_SUBDIR_go}/go/$(dirname $j)
 	    fi
-	    cp $j ${D}${prefix}/local/go/$j
+	    cp $j ${D}${prefix}${LOCAL_SUBDIR_go}/go/$j
 	done
-	cp -r ${S}/src/${PKG_NAME}/LICENSE ${D}${prefix}/local/go/src/${PKG_NAME}/
+	cp -r ${S}/src/${PKG_NAME}/LICENSE ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}/
 }
 
 SYSROOT_PREPROCESS_FUNCS += "go_compose_file_sysroot_preprocess"
 
 go_compose_file_sysroot_preprocess () {
-    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
-    cp -r ${D}${prefix}/local/go/src/${PKG_NAME} ${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
+    install -d ${SYSROOT_DESTDIR}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
+    cp -r ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME} ${SYSROOT_DESTDIR}${prefix}${LOCAL_SUBDIR_go}/go/src/$(dirname ${PKG_NAME})
 }
 
-FILES_${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
+FILES_${PN} += "${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}/*"
 
-CLEANBROKEN = "1"
\ No newline at end of file
+CLEANBROKEN = "1"
diff --git a/recipes-devtools/go/go-capability_git.bb b/recipes-devtools/go/go-capability_git.bb
index 8524af6..b4f9d1b 100644
--- a/recipes-devtools/go/go-capability_git.bb
+++ b/recipes-devtools/go/go-capability_git.bb
@@ -1,3 +1,5 @@
+inherit go
+
 DESCRIPTION = "Utilities for manipulating POSIX capabilities in Go."
 HOMEPAGE = "https://github.com/syndtr/gocapability"
 SECTION = "devel/go"
@@ -15,15 +17,15 @@ PV = "0.0+git${SRCPV}"
 S = "${WORKDIR}/git"
 
 do_install() {
-	install -d ${D}${prefix}/local/go/src/${PKG_NAME}
-	cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
+	install -d ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
+	cp -r ${S}/* ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}/
 }
 
 SYSROOT_PREPROCESS_FUNCS += "go_capability_sysroot_preprocess"
 
 go_capability_sysroot_preprocess () {
-    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
-    cp -r ${D}${prefix}/local/go/src/${PKG_NAME} ${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
+    install -d ${SYSROOT_DESTDIR}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
+    cp -r ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME} ${SYSROOT_DESTDIR}${prefix}${LOCAL_SUBDIR_go}/go/src/$(dirname ${PKG_NAME})
 }
 
-FILES_${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
+FILES_${PN} += "${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}/*"
diff --git a/recipes-devtools/go/go-cli_git.bb b/recipes-devtools/go/go-cli_git.bb
index 434594c..2ef5a50 100644
--- a/recipes-devtools/go/go-cli_git.bb
+++ b/recipes-devtools/go/go-cli_git.bb
@@ -1,3 +1,5 @@
+inherit go
+
 DESCRIPTION = "A small package for building command line apps in Go"
 HOMEPAGE = "https://github.com/codegangsta/cli"
 SECTION = "devel/go"
@@ -15,15 +17,15 @@ PV = "1.1.0+git${SRCPV}"
 S = "${WORKDIR}/git"
 
 do_install() {
-	install -d ${D}${prefix}/local/go/src/${PKG_NAME}
-	cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
+	install -d ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
+	cp -r ${S}/* ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}/
 }
 
 SYSROOT_PREPROCESS_FUNCS += "go_cli_sysroot_preprocess"
 
 go_cli_sysroot_preprocess () {
-    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
-    cp -r ${D}${prefix}/local/go/src/${PKG_NAME} ${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
+    install -d ${SYSROOT_DESTDIR}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
+    cp -r ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME} ${SYSROOT_DESTDIR}${prefix}${LOCAL_SUBDIR_go}/go/src/$(dirname ${PKG_NAME})
 }
 
-FILES_${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
+FILES_${PN} += "${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}/*"
diff --git a/recipes-devtools/go/go-connections_git.bb b/recipes-devtools/go/go-connections_git.bb
index 5d071b0..57e2f14 100644
--- a/recipes-devtools/go/go-connections_git.bb
+++ b/recipes-devtools/go/go-connections_git.bb
@@ -1,3 +1,5 @@
+inherit go
+
 DESCRIPTION = "Utility package to work with network connections"
 HOMEPAGE = "https://github.com/docker/connections"
 SECTION = "devel/go"
@@ -19,21 +21,21 @@ do_compile() {
 }
 
 do_install() {
-	install -d ${D}${prefix}/local/go/src/${PKG_NAME}
+	install -d ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
 	for j in $(cd ${S} && find src/${PKG_NAME} -name "*.go"); do
-	    if [ ! -d ${D}${prefix}/local/go/$(dirname $j) ]; then
-	        mkdir -p ${D}${prefix}/local/go/$(dirname $j)
+	    if [ ! -d ${D}${prefix}${LOCAL_SUBDIR_go}/go/$(dirname $j) ]; then
+	        mkdir -p ${D}${prefix}${LOCAL_SUBDIR_go}/go/$(dirname $j)
 	    fi
-	    cp $j ${D}${prefix}/local/go/$j
+	    cp $j ${D}${prefix}${LOCAL_SUBDIR_go}/go/$j
 	done
-	cp -r ${S}/src/${PKG_NAME}/LICENSE ${D}${prefix}/local/go/src/${PKG_NAME}/
+	cp -r ${S}/src/${PKG_NAME}/LICENSE ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}/
 }
 
 SYSROOT_PREPROCESS_FUNCS += "go_connections_sysroot_preprocess"
 
 go_connections_sysroot_preprocess () {
-    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
-    cp -r ${D}${prefix}/local/go/src/${PKG_NAME} ${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
+    install -d ${SYSROOT_DESTDIR}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
+    cp -r ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME} ${SYSROOT_DESTDIR}${prefix}${LOCAL_SUBDIR_go}/go/src/$(dirname ${PKG_NAME})
 }
 
-FILES_${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
+FILES_${PN} += "${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}/*"
diff --git a/recipes-devtools/go/go-context_git.bb b/recipes-devtools/go/go-context_git.bb
index 15f6a8d..369b910 100644
--- a/recipes-devtools/go/go-context_git.bb
+++ b/recipes-devtools/go/go-context_git.bb
@@ -1,3 +1,5 @@
+inherit go
+
 DESCRIPTION = "A golang registry for global request variables."
 HOMEPAGE = "https://github.com/gorilla/context"
 SECTION = "devel/go"
@@ -14,15 +16,15 @@ SRCREV = "14f550f51af52180c2eefed15e5fd18d63c0a64a"
 S = "${WORKDIR}/git"
 
 do_install() {
-	install -d ${D}${prefix}/local/go/src/${PKG_NAME}
-	cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
+	install -d ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
+	cp -r ${S}/* ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}/
 }
 
 SYSROOT_PREPROCESS_FUNCS += "go_context_sysroot_preprocess"
 
 go_context_sysroot_preprocess () {
-    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
-    cp -r ${D}${prefix}/local/go/src/${PKG_NAME} ${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
+    install -d ${SYSROOT_DESTDIR}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
+    cp -r ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME} ${SYSROOT_DESTDIR}${prefix}${LOCAL_SUBDIR_go}/go/src/$(dirname ${PKG_NAME})
 }
 
-FILES_${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
+FILES_${PN} += "${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}/*"
diff --git a/recipes-devtools/go/go-dbus_git.bb b/recipes-devtools/go/go-dbus_git.bb
index 2390861..15b718e 100644
--- a/recipes-devtools/go/go-dbus_git.bb
+++ b/recipes-devtools/go/go-dbus_git.bb
@@ -1,3 +1,5 @@
+inherit go
+
 DESCRIPTION = "Native Go bindings for D-Bus"
 HOMEPAGE = "https://github.com/godbus/dbus"
 SECTION = "devel/go"
@@ -15,15 +17,15 @@ PV = "4.0.0+git${SRCPV}"
 S = "${WORKDIR}/git"
 
 do_install() {
-	install -d ${D}${prefix}/local/go/src/${PKG_NAME}
-	cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
+	install -d ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
+	cp -r ${S}/* ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}/
 }
 
 SYSROOT_PREPROCESS_FUNCS += "go_dbus_sysroot_preprocess"
 
 go_dbus_sysroot_preprocess () {
-    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
-    cp -r ${D}${prefix}/local/go/src/${PKG_NAME} ${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
+    install -d ${SYSROOT_DESTDIR}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
+    cp -r ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME} ${SYSROOT_DESTDIR}${prefix}${LOCAL_SUBDIR_go}/go/src/$(dirname ${PKG_NAME})
 }
 
-FILES_${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
+FILES_${PN} += "${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}/*"
diff --git a/recipes-devtools/go/go-distribution_git.bb b/recipes-devtools/go/go-distribution_git.bb
index 9e3f209..e81eea4 100644
--- a/recipes-devtools/go/go-distribution_git.bb
+++ b/recipes-devtools/go/go-distribution_git.bb
@@ -1,3 +1,5 @@
+inherit go
+
 DESCRIPTION = "The Docker toolset to pack, ship, store, and deliver content"
 HOMEPAGE = "https://github.com/docker/distribution"
 SECTION = "devel/go"
@@ -19,21 +21,21 @@ do_compile() {
 }
 
 do_install() {
-	install -d ${D}${prefix}/local/go/src/${PKG_NAME}
+	install -d ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
 	for j in $(cd ${S} && find src/${PKG_NAME} -name "*.go"); do
-	    if [ ! -d ${D}${prefix}/local/go/$(dirname $j) ]; then
-	        mkdir -p ${D}${prefix}/local/go/$(dirname $j)
+	    if [ ! -d ${D}${prefix}${LOCAL_SUBDIR_go}/go/$(dirname $j) ]; then
+	        mkdir -p ${D}${prefix}${LOCAL_SUBDIR_go}/go/$(dirname $j)
 	    fi
-	    cp $j ${D}${prefix}/local/go/$j
+	    cp $j ${D}${prefix}${LOCAL_SUBDIR_go}/go/$j
 	done
-	cp -r ${S}/src/${PKG_NAME}/LICENSE ${D}${prefix}/local/go/src/${PKG_NAME}/
+	cp -r ${S}/src/${PKG_NAME}/LICENSE ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}/
 }
 
 SYSROOT_PREPROCESS_FUNCS += "go_distribution_digeset_sysroot_preprocess"
 
 go_distribution_digeset_sysroot_preprocess () {
-    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
-    cp -r ${D}${prefix}/local/go/src/${PKG_NAME} ${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
+    install -d ${SYSROOT_DESTDIR}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
+    cp -r ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME} ${SYSROOT_DESTDIR}${prefix}${LOCAL_SUBDIR_go}/go/src/$(dirname ${PKG_NAME})
 }
 
-FILES_${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
+FILES_${PN} += "${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}/*"
diff --git a/recipes-devtools/go/go-fsnotify_git.bb b/recipes-devtools/go/go-fsnotify_git.bb
index 0826aa7..3f5d769 100644
--- a/recipes-devtools/go/go-fsnotify_git.bb
+++ b/recipes-devtools/go/go-fsnotify_git.bb
@@ -1,3 +1,5 @@
+inherit go
+
 DESCRIPTION = "A golang registry for global request variables."
 HOMEPAGE = "https://github.com/go-fsnotify/fsnotify"
 SECTION = "devel/go"
@@ -15,15 +17,15 @@ PV = "1.2.11+git${SRCPV}"
 S = "${WORKDIR}/git"
 
 do_install() {
-	install -d ${D}${prefix}/local/go/src/${PKG_NAME}
-	cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
+	install -d ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
+	cp -r ${S}/* ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}/
 }
 
 SYSROOT_PREPROCESS_FUNCS += "go_fsnotify_sysroot_preprocess"
 
 go_fsnotify_sysroot_preprocess () {
-    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
-    cp -r ${D}${prefix}/local/go/src/${PKG_NAME} ${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
+    install -d ${SYSROOT_DESTDIR}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
+    cp -r ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME} ${SYSROOT_DESTDIR}${prefix}${LOCAL_SUBDIR_go}/go/src/$(dirname ${PKG_NAME})
 }
 
-FILES_${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
+FILES_${PN} += "${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}/*"
diff --git a/recipes-devtools/go/go-libtrust_git.bb b/recipes-devtools/go/go-libtrust_git.bb
index 5565946..448423c 100644
--- a/recipes-devtools/go/go-libtrust_git.bb
+++ b/recipes-devtools/go/go-libtrust_git.bb
@@ -1,3 +1,5 @@
+inherit go
+
 DESCRIPTION = "Primitives for identity and authorization"
 HOMEPAGE = "https://github.com/docker/libtrust"
 SECTION = "devel/go"
@@ -15,15 +17,15 @@ PV = "0.0+git${SRCPV}"
 S = "${WORKDIR}/git"
 
 do_install() {
-	install -d ${D}${prefix}/local/go/src/${PKG_NAME}
-	cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
+	install -d ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
+	cp -r ${S}/* ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}/
 }
 
 SYSROOT_PREPROCESS_FUNCS += "go_libtrust_sysroot_preprocess"
 
 go_libtrust_sysroot_preprocess () {
-    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
-    cp -r ${D}${prefix}/local/go/src/${PKG_NAME} ${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
+    install -d ${SYSROOT_DESTDIR}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
+    cp -r ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME} ${SYSROOT_DESTDIR}${prefix}${LOCAL_SUBDIR_go}/go/src/$(dirname ${PKG_NAME})
 }
 
-FILES_${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
+FILES_${PN} += "${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}/*"
diff --git a/recipes-devtools/go/go-logrus_git.bb b/recipes-devtools/go/go-logrus_git.bb
index aa89033..12bb183 100644
--- a/recipes-devtools/go/go-logrus_git.bb
+++ b/recipes-devtools/go/go-logrus_git.bb
@@ -1,3 +1,5 @@
+inherit go
+
 DESCRIPTION = "A golang registry for global request variables."
 HOMEPAGE = "https://github.com/Sirupsen/logrus"
 SECTION = "devel/go"
@@ -15,15 +17,15 @@ PV = "0.11.0+git${SRCPV}"
 S = "${WORKDIR}/git"
 
 do_install() {
-	install -d ${D}${prefix}/local/go/src/${PKG_NAME}
-	cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
+	install -d ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
+	cp -r ${S}/* ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}/
 }
 
 SYSROOT_PREPROCESS_FUNCS += "go_logrus_sysroot_preprocess"
 
 go_logrus_sysroot_preprocess () {
-    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
-    cp -r ${D}${prefix}/local/go/src/${PKG_NAME} ${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
+    install -d ${SYSROOT_DESTDIR}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
+    cp -r ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME} ${SYSROOT_DESTDIR}${prefix}${LOCAL_SUBDIR_go}/go/src/$(dirname ${PKG_NAME})
 }
 
-FILES_${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
+FILES_${PN} += "${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}/*"
diff --git a/recipes-devtools/go/go-metalinter_git.bb b/recipes-devtools/go/go-metalinter_git.bb
index 668b431..fd5195b 100644
--- a/recipes-devtools/go/go-metalinter_git.bb
+++ b/recipes-devtools/go/go-metalinter_git.bb
@@ -1,3 +1,5 @@
+inherit go
+
 DESCRIPTION = "Go Meta Linter."
 HOMEPAGE = "https://github.com/alecthomas/gometalinter"
 SECTION = "devel/go"
@@ -17,8 +19,8 @@ PV = "0.0+git${SRCPV}"
 S = "${WORKDIR}/git"
 
 do_install() {
-	install -d ${D}${prefix}/local/go/src/${PKG_NAME}
-	cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
+	install -d ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
+	cp -r ${S}/* ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}/
 }
 
-FILES_${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
+FILES_${PN} += "${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}/*"
diff --git a/recipes-devtools/go/go-mux_git.bb b/recipes-devtools/go/go-mux_git.bb
index 7a2025a..a88ee69 100644
--- a/recipes-devtools/go/go-mux_git.bb
+++ b/recipes-devtools/go/go-mux_git.bb
@@ -1,3 +1,5 @@
+inherit go
+
 DESCRIPTION = "A powerful URL router and dispatcher for golang."
 HOMEPAGE = "https://github.com/gorilla/mux"
 SECTION = "devel/go"
@@ -14,15 +16,15 @@ SRCREV = "136d54f81f00414c45c3c68dd47e98cc97519c5e"
 S = "${WORKDIR}/git"
 
 do_install() {
-	install -d ${D}${prefix}/local/go/src/${PKG_NAME}
-	cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
+	install -d ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
+	cp -r ${S}/* ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}/
 }
 
 SYSROOT_PREPROCESS_FUNCS += "go_mux_sysroot_preprocess"
 
 go_mux_sysroot_preprocess () {
-    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
-    cp -r ${D}${prefix}/local/go/src/${PKG_NAME} ${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
+    install -d ${SYSROOT_DESTDIR}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
+    cp -r ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME} ${SYSROOT_DESTDIR}${prefix}${LOCAL_SUBDIR_go}/go/src/$(dirname ${PKG_NAME})
 }
 
-FILES_${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
+FILES_${PN} += "${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}/*"
diff --git a/recipes-devtools/go/go-patricia_git.bb b/recipes-devtools/go/go-patricia_git.bb
index 8c1e10d..a6aa66b 100644
--- a/recipes-devtools/go/go-patricia_git.bb
+++ b/recipes-devtools/go/go-patricia_git.bb
@@ -1,3 +1,5 @@
+inherit go
+
 DESCRIPTION = "A generic patricia trie (also called radix tree) implemented in Go (Golang)"
 HOMEPAGE = "https://github.com/gorilla/context"
 SECTION = "devel/go"
@@ -15,15 +17,15 @@ PV = "2.2.6+git${SRCPV}"
 S = "${WORKDIR}/git"
 
 do_install() {
-	install -d ${D}${prefix}/local/go/src/${PKG_NAME}
-	cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
+	install -d ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
+	cp -r ${S}/* ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}/
 }
 
 SYSROOT_PREPROCESS_FUNCS += "go_patricia_sysroot_preprocess"
 
 go_patricia_sysroot_preprocess () {
-    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
-    cp -r ${D}${prefix}/local/go/src/${PKG_NAME} ${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
+    install -d ${SYSROOT_DESTDIR}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
+    cp -r ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME} ${SYSROOT_DESTDIR}${prefix}${LOCAL_SUBDIR_go}/go/src/$(dirname ${PKG_NAME})
 }
 
-FILES_${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
+FILES_${PN} += "${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}/*"
diff --git a/recipes-devtools/go/go-pty_git.bb b/recipes-devtools/go/go-pty_git.bb
index bc94b31..53a53a0 100644
--- a/recipes-devtools/go/go-pty_git.bb
+++ b/recipes-devtools/go/go-pty_git.bb
@@ -1,3 +1,5 @@
+inherit go
+
 DESCRIPTION = "PTY interface for Go"
 HOMEPAGE = "https://github.com/kr/pty"
 SECTION = "devel/go"
@@ -14,15 +16,15 @@ SRCREV = "05017fcccf23c823bfdea560dcc958a136e54fb7"
 S = "${WORKDIR}/git"
 
 do_install() {
-	install -d ${D}${prefix}/local/go/src/${PKG_NAME}
-	cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
+	install -d ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
+	cp -r ${S}/* ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}/
 }
 
 SYSROOT_PREPROCESS_FUNCS += "go_pty_sysroot_preprocess"
 
 go_pty_sysroot_preprocess () {
-    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
-    cp -r ${D}${prefix}/local/go/src/${PKG_NAME} ${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
+    install -d ${SYSROOT_DESTDIR}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
+    cp -r ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME} ${SYSROOT_DESTDIR}${prefix}${LOCAL_SUBDIR_go}/go/src/$(dirname ${PKG_NAME})
 }
 
-FILES_${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
+FILES_${PN} += "${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}/*"
diff --git a/recipes-devtools/go/go-systemd_git.bb b/recipes-devtools/go/go-systemd_git.bb
index 0f89c0f..8c5e8ec 100644
--- a/recipes-devtools/go/go-systemd_git.bb
+++ b/recipes-devtools/go/go-systemd_git.bb
@@ -1,3 +1,5 @@
+inherit go
+
 DESCRIPTION = "Go bindings to systemd socket activation, journal, D-Bus, and unit files"
 HOMEPAGE = "https://github.com/coreos/go-systemd"
 SECTION = "devel/go"
@@ -17,15 +19,15 @@ RDEPENDS_${PN} += "bash"
 S = "${WORKDIR}/git"
 
 do_install() {
-	install -d ${D}${prefix}/local/go/src/${PKG_NAME}
-	cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
+	install -d ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
+	cp -r ${S}/* ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}/
 }
 
 SYSROOT_PREPROCESS_FUNCS += "go_systemd_sysroot_preprocess"
 
 go_systemd_sysroot_preprocess () {
-    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
-    cp -r ${D}${prefix}/local/go/src/${PKG_NAME} ${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
+    install -d ${SYSROOT_DESTDIR}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
+    cp -r ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME} ${SYSROOT_DESTDIR}${prefix}${LOCAL_SUBDIR_go}/go/src/$(dirname ${PKG_NAME})
 }
 
-FILES_${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
+FILES_${PN} += "${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}/*"
diff --git a/recipes-devtools/go/grpc-go_git.bb b/recipes-devtools/go/grpc-go_git.bb
index 48c4249..ab4870c 100644
--- a/recipes-devtools/go/grpc-go_git.bb
+++ b/recipes-devtools/go/grpc-go_git.bb
@@ -1,3 +1,5 @@
+inherit go
+
 DESCRIPTION = "The Go language implementation of gRPC. HTTP/2 based RPC"
 HOMEPAGE = "https://github.com/grpc/grpc-go"
 SECTION = "devel/go"
@@ -19,23 +21,23 @@ do_compile() {
 }
 
 do_install() {
-	install -d ${D}${prefix}/local/go/src/${PKG_NAME}
+	install -d ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
 	for j in $(cd ${S} && find src/${PKG_NAME} -name "*.go"); do
-	    if [ ! -d ${D}${prefix}/local/go/$(dirname $j) ]; then
-	        mkdir -p ${D}${prefix}/local/go/$(dirname $j)
+	    if [ ! -d ${D}${prefix}${LOCAL_SUBDIR_go}/go/$(dirname $j) ]; then
+	        mkdir -p ${D}${prefix}${LOCAL_SUBDIR_go}/go/$(dirname $j)
 	    fi
-	    cp $j ${D}${prefix}/local/go/$j
+	    cp $j ${D}${prefix}${LOCAL_SUBDIR_go}/go/$j
 	done
-	cp -r ${S}/src/${PKG_NAME}/LICENSE ${D}${prefix}/local/go/src/${PKG_NAME}/
+	cp -r ${S}/src/${PKG_NAME}/LICENSE ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}/
 }
 
 SYSROOT_PREPROCESS_FUNCS += "go_grpc_sysroot_preprocess"
 
 go_grpc_sysroot_preprocess () {
-    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
-    cp -r ${D}${prefix}/local/go/src/${PKG_NAME} ${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
+    install -d ${SYSROOT_DESTDIR}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
+    cp -r ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME} ${SYSROOT_DESTDIR}${prefix}${LOCAL_SUBDIR_go}/go/src/$(dirname ${PKG_NAME})
 }
 
 FILES_${PN} += " \
-    ${prefix}/local/go/src/${PKG_NAME}/* \
+    ${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}/* \
 "
diff --git a/recipes-devtools/go/notary_git.bb b/recipes-devtools/go/notary_git.bb
index 9cfb46e..abfafc6 100644
--- a/recipes-devtools/go/notary_git.bb
+++ b/recipes-devtools/go/notary_git.bb
@@ -1,3 +1,5 @@
+inherit go
+
 DESCRIPTION = "Notary is a Docker project that allows anyone to have trust over arbitrary collections of data"
 HOMEPAGE = "https://github.com/docker/notary"
 SECTION = "devel/go"
@@ -19,21 +21,21 @@ do_compile() {
 }
 
 do_install() {
-	install -d ${D}${prefix}/local/go/src/${PKG_NAME}
+	install -d ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
 	for j in $(cd ${S} && find src/${PKG_NAME} -name "*.go"); do
-	    if [ ! -d ${D}${prefix}/local/go/$(dirname $j) ]; then
-	        mkdir -p ${D}${prefix}/local/go/$(dirname $j)
+	    if [ ! -d ${D}${prefix}${LOCAL_SUBDIR_go}/go/$(dirname $j) ]; then
+	        mkdir -p ${D}${prefix}${LOCAL_SUBDIR_go}/go/$(dirname $j)
 	    fi
-	    cp $j ${D}${prefix}/local/go/$j
+	    cp $j ${D}${prefix}${LOCAL_SUBDIR_go}/go/$j
 	done
-	cp -r ${S}/src/${PKG_NAME}/LICENSE ${D}${prefix}/local/go/src/${PKG_NAME}/
+	cp -r ${S}/src/${PKG_NAME}/LICENSE ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}/
 }
 
 SYSROOT_PREPROCESS_FUNCS += "go_notary_sysroot_preprocess"
 
 go_notary_sysroot_preprocess () {
-    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
-    cp -r ${D}${prefix}/local/go/src/${PKG_NAME} ${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
+    install -d ${SYSROOT_DESTDIR}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
+    cp -r ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME} ${SYSROOT_DESTDIR}${prefix}${LOCAL_SUBDIR_go}/go/src/$(dirname ${PKG_NAME})
 }
 
-FILES_${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
+FILES_${PN} += "${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}/*"
-- 
2.20.1

