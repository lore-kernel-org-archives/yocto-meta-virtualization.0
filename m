Return-Path: <joakim.roubert@axis.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E1054E00D07; Fri, 11 Jan 2019 02:40:16 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [195.60.68.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0570BE00CB0
	for <meta-virtualization@yoctoproject.org>;
	Fri, 11 Jan 2019 02:40:13 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 1D06518579
	for <meta-virtualization@yoctoproject.org>;
	Fri, 11 Jan 2019 11:40:13 +0100 (CET)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id Z_F2gixwLK0y for <meta-virtualization@yoctoproject.org>;
	Fri, 11 Jan 2019 11:40:11 +0100 (CET)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 09D1A18539
	for <meta-virtualization@yoctoproject.org>;
	Fri, 11 Jan 2019 11:40:11 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EC5971A05E
	for <meta-virtualization@yoctoproject.org>;
	Fri, 11 Jan 2019 11:40:10 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E10071A05B
	for <meta-virtualization@yoctoproject.org>;
	Fri, 11 Jan 2019 11:40:10 +0100 (CET)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <meta-virtualization@yoctoproject.org>;
	Fri, 11 Jan 2019 11:40:10 +0100 (CET)
Received: from XBOX03.axis.com (xbox03.axis.com [10.0.5.17])
	by seth.se.axis.com (Postfix) with ESMTP id D5575F05
	for <meta-virtualization@yoctoproject.org>;
	Fri, 11 Jan 2019 11:40:10 +0100 (CET)
Received: from [10.88.9.1] (10.0.5.60) by XBOX03.axis.com (10.0.5.17) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Fri, 11 Jan 2019 11:40:10 +0100
Resent-From: Joakim Roubert <joakim.roubert@axis.com>
Resent-To: <meta-virtualization@yoctoproject.org>
Resent-Date: Fri, 11 Jan 2019 11:40:10 +0100
Resent-Message-ID: <f9a66dfa-b0ea-f772-7dc3-4af747e98582@axis.com>
Resent-User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:60.0) Gecko/20100101 Thunderbird/60.4.0
To: <meta-virtualization@yoctoproject.org>
From: Joakim Roubert <joakim.roubert@axis.com>
Message-ID: <efdca034-0566-bf7d-47e4-6bbbf0595d45@axis.com>
Date: Fri, 11 Jan 2019 11:03:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: XBOX03.axis.com (10.0.5.17) To XBOX03.axis.com (10.0.5.17)
X-TM-AS-GCONF: 00
Subject: [PATCH] go: Update recipes to conform with OE styleguide
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
X-List-Received-Date: Fri, 11 Jan 2019 10:40:17 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: sv
Content-Transfer-Encoding: 7bit

Updates based on https://www.openembedded.org/wiki/Styleguide and using
contrib/oe-stylize.py.

Change-Id: I636eaecdecb56ad27f79d25b0976939da4f92b84
---
 recipes-devtools/go/compose-file_git.bb    | 36
+++++++++++++----------------
 recipes-devtools/go/go-capability_git.bb   | 20 ++++++++--------
 recipes-devtools/go/go-cli_git.bb          | 20 ++++++++--------
 recipes-devtools/go/go-connections_git.bb  | 33 ++++++++++++--------------
 recipes-devtools/go/go-context_git.bb      | 18 +++++++--------
 recipes-devtools/go/go-dbus_git.bb         | 20 ++++++++--------
 recipes-devtools/go/go-distribution_git.bb | 33 ++++++++++++--------------
 recipes-devtools/go/go-fsnotify_git.bb     | 20 ++++++++--------
 recipes-devtools/go/go-libtrust_git.bb     | 20 ++++++++--------
 recipes-devtools/go/go-logrus_git.bb       | 20 ++++++++--------
 recipes-devtools/go/go-mux_git.bb          | 18 +++++++--------
 recipes-devtools/go/go-patricia_git.bb     | 20 ++++++++--------
 recipes-devtools/go/go-pty_git.bb          | 18 +++++++--------
 recipes-devtools/go/go-systemd_git.bb      | 22 ++++++++----------
 recipes-devtools/go/grpc-go_git.bb         | 37
++++++++++++++----------------
 recipes-devtools/go/notary_git.bb          | 33 ++++++++++++--------------
 16 files changed, 175 insertions(+), 213 deletions(-)

diff --git a/recipes-devtools/go/compose-file_git.bb
b/recipes-devtools/go/compose-file_git.bb
index bcf8c3d..f129f5d 100644
--- a/recipes-devtools/go/compose-file_git.bb
+++ b/recipes-devtools/go/compose-file_git.bb
@@ -3,39 +3,35 @@ HOMEPAGE = "https://github.com/aanand/compose-file"
 SECTION = "devel/go"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM =
"file://src/${PKG_NAME}/LICENSE;md5=9cd86830b557232ce55e2a6b47387471"
-
-SRCNAME = "compose-file"
-
-PKG_NAME = "github.com/aanand/${SRCNAME}"
-SRC_URI = "git://${PKG_NAME}.git;destsuffix=git/src/${PKG_NAME}"
-
 SRCREV = "a3e58764f50597b6217fec07e9bff7225c4a1719"
 PV = "3.0+git${SRCPV}"

+SRC_URI = "git://${PKG_NAME}.git;destsuffix=git/src/${PKG_NAME}"
+
+SRCNAME = "compose-file"
 S = "${WORKDIR}/git"
+SYSROOT_PREPROCESS_FUNCS += "go_compose_file_sysroot_preprocess"

 # NO-OP the do compile rule because this recipe is source only.
 do_compile() {
 }
-
 do_install() {
-	install -d ${D}${prefix}/local/go/src/${PKG_NAME}
-	for j in $(cd ${S} && find src/${PKG_NAME} -name "*.go"); do
-	    if [ ! -d ${D}${prefix}/local/go/$(dirname $j) ]; then
-	        mkdir -p ${D}${prefix}/local/go/$(dirname $j)
-	    fi
-	    cp $j ${D}${prefix}/local/go/$j
-	done
-	cp -r ${S}/src/${PKG_NAME}/LICENSE ${D}${prefix}/local/go/src/${PKG_NAME}/
+    install -d ${D}${prefix}/local/go/src/${PKG_NAME}
+    for j in $(cd ${S} && find src/${PKG_NAME} -name "*.go"); do
+        if [ ! -d ${D}${prefix}/local/go/$(dirname $j) ]; then
+            mkdir -p ${D}${prefix}/local/go/$(dirname $j)
+        fi
+        cp $j ${D}${prefix}/local/go/$j
+    done
+    cp -r ${S}/src/${PKG_NAME}/LICENSE
${D}${prefix}/local/go/src/${PKG_NAME}/
 }

-SYSROOT_PREPROCESS_FUNCS += "go_compose_file_sysroot_preprocess"
+FILES_${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
+
+PKG_NAME = "github.com/aanand/${SRCNAME}"

 go_compose_file_sysroot_preprocess () {
     install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
     cp -r ${D}${prefix}/local/go/src/${PKG_NAME}
${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
 }
-
-FILES_${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
-
-CLEANBROKEN = "1"
\ No newline at end of file
+CLEANBROKEN = "1"
diff --git a/recipes-devtools/go/go-capability_git.bb
b/recipes-devtools/go/go-capability_git.bb
index 8524af6..4be88b3 100644
--- a/recipes-devtools/go/go-capability_git.bb
+++ b/recipes-devtools/go/go-capability_git.bb
@@ -3,27 +3,25 @@ HOMEPAGE = "https://github.com/syndtr/gocapability"
 SECTION = "devel/go"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a7304f5073e7be4ba7bffabbf9f2bbca"
-
-SRCNAME = "gocapability"
-
-PKG_NAME = "github.com/syndtr/${SRCNAME}"
-SRC_URI = "git://${PKG_NAME}.git"
-
 SRCREV = "2c00daeb6c3b45114c80ac44119e7b8801fdd852"
 PV = "0.0+git${SRCPV}"

+SRC_URI = "git://${PKG_NAME}.git"
+
+SRCNAME = "gocapability"
 S = "${WORKDIR}/git"
+SYSROOT_PREPROCESS_FUNCS += "go_capability_sysroot_preprocess"

 do_install() {
-	install -d ${D}${prefix}/local/go/src/${PKG_NAME}
-	cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
+    install -d ${D}${prefix}/local/go/src/${PKG_NAME}
+    cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
 }

-SYSROOT_PREPROCESS_FUNCS += "go_capability_sysroot_preprocess"
+FILES_${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
+
+PKG_NAME = "github.com/syndtr/${SRCNAME}"

 go_capability_sysroot_preprocess () {
     install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
     cp -r ${D}${prefix}/local/go/src/${PKG_NAME}
${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
 }
-
-FILES_${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
diff --git a/recipes-devtools/go/go-cli_git.bb
b/recipes-devtools/go/go-cli_git.bb
index 21d01ac..1e86b6b 100644
--- a/recipes-devtools/go/go-cli_git.bb
+++ b/recipes-devtools/go/go-cli_git.bb
@@ -3,27 +3,25 @@ HOMEPAGE = "https://github.com/codegangsta/cli"
 SECTION = "devel/go"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=ed9b539ed65d73926f30ff1f1587dc44"
-
-SRCNAME = "cli"
-
-PKG_NAME = "github.com/codegangsta/${SRCNAME}"
-SRC_URI = "git://${PKG_NAME}.git"
-
 SRCREV = "27ecc97192df1bf053a22b04463f2b51b8b8373e"
 PV = "1.1.0+git${SRCREV}"

+SRC_URI = "git://${PKG_NAME}.git"
+
+SRCNAME = "cli"
 S = "${WORKDIR}/git"
+SYSROOT_PREPROCESS_FUNCS += "go_cli_sysroot_preprocess"

 do_install() {
-	install -d ${D}${prefix}/local/go/src/${PKG_NAME}
-	cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
+    install -d ${D}${prefix}/local/go/src/${PKG_NAME}
+    cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
 }

-SYSROOT_PREPROCESS_FUNCS += "go_cli_sysroot_preprocess"
+FILES_${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
+
+PKG_NAME = "github.com/codegangsta/${SRCNAME}"

 go_cli_sysroot_preprocess () {
     install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
     cp -r ${D}${prefix}/local/go/src/${PKG_NAME}
${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
 }
-
-FILES_${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
diff --git a/recipes-devtools/go/go-connections_git.bb
b/recipes-devtools/go/go-connections_git.bb
index 5d071b0..34ce2bc 100644
--- a/recipes-devtools/go/go-connections_git.bb
+++ b/recipes-devtools/go/go-connections_git.bb
@@ -3,37 +3,34 @@ HOMEPAGE = "https://github.com/docker/connections"
 SECTION = "devel/go"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM =
"file://src/${PKG_NAME}/LICENSE;md5=04424bc6f5a5be60691b9824d65c2ad8"
-
-SRCNAME = "go-connections"
-
-PKG_NAME = "github.com/docker/${SRCNAME}"
-SRC_URI = "git://${PKG_NAME}.git;destsuffix=git/src/${PKG_NAME}"
-
 SRCREV = "4ccf312bf1d35e5dbda654e57a9be4c3f3cd0366"
 PV = "0.2.1+git${SRCPV}"

+SRC_URI = "git://${PKG_NAME}.git;destsuffix=git/src/${PKG_NAME}"
+
+SRCNAME = "go-connections"
 S = "${WORKDIR}/git"
+SYSROOT_PREPROCESS_FUNCS += "go_connections_sysroot_preprocess"

 # NO-OP the do compile rule because this recipe is source only.
 do_compile() {
 }
-
 do_install() {
-	install -d ${D}${prefix}/local/go/src/${PKG_NAME}
-	for j in $(cd ${S} && find src/${PKG_NAME} -name "*.go"); do
-	    if [ ! -d ${D}${prefix}/local/go/$(dirname $j) ]; then
-	        mkdir -p ${D}${prefix}/local/go/$(dirname $j)
-	    fi
-	    cp $j ${D}${prefix}/local/go/$j
-	done
-	cp -r ${S}/src/${PKG_NAME}/LICENSE ${D}${prefix}/local/go/src/${PKG_NAME}/
+    install -d ${D}${prefix}/local/go/src/${PKG_NAME}
+    for j in $(cd ${S} && find src/${PKG_NAME} -name "*.go"); do
+        if [ ! -d ${D}${prefix}/local/go/$(dirname $j) ]; then
+            mkdir -p ${D}${prefix}/local/go/$(dirname $j)
+        fi
+        cp $j ${D}${prefix}/local/go/$j
+    done
+    cp -r ${S}/src/${PKG_NAME}/LICENSE
${D}${prefix}/local/go/src/${PKG_NAME}/
 }

-SYSROOT_PREPROCESS_FUNCS += "go_connections_sysroot_preprocess"
+FILES_${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
+
+PKG_NAME = "github.com/docker/${SRCNAME}"

 go_connections_sysroot_preprocess () {
     install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
     cp -r ${D}${prefix}/local/go/src/${PKG_NAME}
${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
 }
-
-FILES_${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
diff --git a/recipes-devtools/go/go-context_git.bb
b/recipes-devtools/go/go-context_git.bb
index 15f6a8d..8bbc68b 100644
--- a/recipes-devtools/go/go-context_git.bb
+++ b/recipes-devtools/go/go-context_git.bb
@@ -3,26 +3,24 @@ HOMEPAGE = "https://github.com/gorilla/context"
 SECTION = "devel/go"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c50f6bd9c1e15ed0bad3bea18e3c1b7f"
+SRCREV = "14f550f51af52180c2eefed15e5fd18d63c0a64a"

-SRCNAME = "context"
-
-PKG_NAME = "github.com/gorilla/${SRCNAME}"
 SRC_URI = "git://${PKG_NAME}.git"

-SRCREV = "14f550f51af52180c2eefed15e5fd18d63c0a64a"
-
+SRCNAME = "context"
 S = "${WORKDIR}/git"
+SYSROOT_PREPROCESS_FUNCS += "go_context_sysroot_preprocess"

 do_install() {
-	install -d ${D}${prefix}/local/go/src/${PKG_NAME}
-	cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
+    install -d ${D}${prefix}/local/go/src/${PKG_NAME}
+    cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
 }

-SYSROOT_PREPROCESS_FUNCS += "go_context_sysroot_preprocess"
+FILES_${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
+
+PKG_NAME = "github.com/gorilla/${SRCNAME}"

 go_context_sysroot_preprocess () {
     install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
     cp -r ${D}${prefix}/local/go/src/${PKG_NAME}
${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
 }
-
-FILES_${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
diff --git a/recipes-devtools/go/go-dbus_git.bb
b/recipes-devtools/go/go-dbus_git.bb
index 9b206a1..74fec5b 100644
--- a/recipes-devtools/go/go-dbus_git.bb
+++ b/recipes-devtools/go/go-dbus_git.bb
@@ -3,27 +3,25 @@ HOMEPAGE = "https://github.com/godbus/dbus"
 SECTION = "devel/go"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=09042bd5c6c96a2b9e45ddf1bc517eed"
-
-SRCNAME = "dbus"
-
-PKG_NAME = "github.com/godbus/${SRCNAME}"
-SRC_URI = "git://${PKG_NAME}.git"
-
 SRCREV = "5f6efc7ef2759c81b7ba876593971bfce311eab3"
 PV = "4.0.0+git${SRCREV}"

+SRC_URI = "git://${PKG_NAME}.git"
+
+SRCNAME = "dbus"
 S = "${WORKDIR}/git"
+SYSROOT_PREPROCESS_FUNCS += "go_dbus_sysroot_preprocess"

 do_install() {
-	install -d ${D}${prefix}/local/go/src/${PKG_NAME}
-	cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
+    install -d ${D}${prefix}/local/go/src/${PKG_NAME}
+    cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
 }

-SYSROOT_PREPROCESS_FUNCS += "go_dbus_sysroot_preprocess"
+FILES_${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
+
+PKG_NAME = "github.com/godbus/${SRCNAME}"

 go_dbus_sysroot_preprocess () {
     install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
     cp -r ${D}${prefix}/local/go/src/${PKG_NAME}
${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
 }
-
-FILES_${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
diff --git a/recipes-devtools/go/go-distribution_git.bb
b/recipes-devtools/go/go-distribution_git.bb
index 9e3f209..a79ee97 100644
--- a/recipes-devtools/go/go-distribution_git.bb
+++ b/recipes-devtools/go/go-distribution_git.bb
@@ -3,37 +3,34 @@ HOMEPAGE = "https://github.com/docker/distribution"
 SECTION = "devel/go"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM =
"file://src/${PKG_NAME}/LICENSE;md5=d2794c0df5b907fdace235a619d80314"
-
-SRCNAME = "distribution"
-
-PKG_NAME = "github.com/docker/${SRCNAME}"
-SRC_URI =
"git://${PKG_NAME}.git;branch=docker/1.13;destsuffix=git/src/${PKG_NAME}"
-
 SRCREV = "28602af35aceda2f8d571bad7ca37a54cf0250bc"
 PV = "2.6.0+git${SRCPV}"

+SRC_URI =
"git://${PKG_NAME}.git;branch=docker/1.13;destsuffix=git/src/${PKG_NAME}"
+
+SRCNAME = "distribution"
 S = "${WORKDIR}/git"
+SYSROOT_PREPROCESS_FUNCS += "go_distribution_digeset_sysroot_preprocess"

 # NO-OP the do compile rule because this recipe is source only.
 do_compile() {
 }
-
 do_install() {
-	install -d ${D}${prefix}/local/go/src/${PKG_NAME}
-	for j in $(cd ${S} && find src/${PKG_NAME} -name "*.go"); do
-	    if [ ! -d ${D}${prefix}/local/go/$(dirname $j) ]; then
-	        mkdir -p ${D}${prefix}/local/go/$(dirname $j)
-	    fi
-	    cp $j ${D}${prefix}/local/go/$j
-	done
-	cp -r ${S}/src/${PKG_NAME}/LICENSE ${D}${prefix}/local/go/src/${PKG_NAME}/
+    install -d ${D}${prefix}/local/go/src/${PKG_NAME}
+    for j in $(cd ${S} && find src/${PKG_NAME} -name "*.go"); do
+        if [ ! -d ${D}${prefix}/local/go/$(dirname $j) ]; then
+            mkdir -p ${D}${prefix}/local/go/$(dirname $j)
+        fi
+        cp $j ${D}${prefix}/local/go/$j
+    done
+    cp -r ${S}/src/${PKG_NAME}/LICENSE
${D}${prefix}/local/go/src/${PKG_NAME}/
 }

-SYSROOT_PREPROCESS_FUNCS += "go_distribution_digeset_sysroot_preprocess"
+FILES_${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
+
+PKG_NAME = "github.com/docker/${SRCNAME}"

 go_distribution_digeset_sysroot_preprocess () {
     install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
     cp -r ${D}${prefix}/local/go/src/${PKG_NAME}
${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
 }
-
-FILES_${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
diff --git a/recipes-devtools/go/go-fsnotify_git.bb
b/recipes-devtools/go/go-fsnotify_git.bb
index 1d9fbdc..25ed1da 100644
--- a/recipes-devtools/go/go-fsnotify_git.bb
+++ b/recipes-devtools/go/go-fsnotify_git.bb
@@ -3,27 +3,25 @@ HOMEPAGE = "https://github.com/go-fsnotify/fsnotify"
 SECTION = "devel/go"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c38914c9a7ab03bb2b96d4baaee10769"
-
-SRCNAME = "fsnotify"
-
-PKG_NAME = "github.com/fsnotify/${SRCNAME}"
-SRC_URI = "git://${PKG_NAME}.git"
-
 SRCREV = "836bfd95fecc0f1511dd66bdbf2b5b61ab8b00b6"
 PV = "1.2.11+git${SRCREV}"

+SRC_URI = "git://${PKG_NAME}.git"
+
+SRCNAME = "fsnotify"
 S = "${WORKDIR}/git"
+SYSROOT_PREPROCESS_FUNCS += "go_fsnotify_sysroot_preprocess"

 do_install() {
-	install -d ${D}${prefix}/local/go/src/${PKG_NAME}
-	cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
+    install -d ${D}${prefix}/local/go/src/${PKG_NAME}
+    cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
 }

-SYSROOT_PREPROCESS_FUNCS += "go_fsnotify_sysroot_preprocess"
+FILES_${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
+
+PKG_NAME = "github.com/fsnotify/${SRCNAME}"

 go_fsnotify_sysroot_preprocess () {
     install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
     cp -r ${D}${prefix}/local/go/src/${PKG_NAME}
${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
 }
-
-FILES_${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
diff --git a/recipes-devtools/go/go-libtrust_git.bb
b/recipes-devtools/go/go-libtrust_git.bb
index 5565946..37c5606 100644
--- a/recipes-devtools/go/go-libtrust_git.bb
+++ b/recipes-devtools/go/go-libtrust_git.bb
@@ -3,27 +3,25 @@ HOMEPAGE = "https://github.com/docker/libtrust"
 SECTION = "devel/go"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=435b266b3899aa8a959f17d41c56def8"
-
-SRCNAME = "libtrust"
-
-PKG_NAME = "github.com/docker/${SRCNAME}"
-SRC_URI = "git://${PKG_NAME}.git"
-
 SRCREV = "9cbd2a1374f46905c68a4eb3694a130610adc62a"
 PV = "0.0+git${SRCPV}"

+SRC_URI = "git://${PKG_NAME}.git"
+
+SRCNAME = "libtrust"
 S = "${WORKDIR}/git"
+SYSROOT_PREPROCESS_FUNCS += "go_libtrust_sysroot_preprocess"

 do_install() {
-	install -d ${D}${prefix}/local/go/src/${PKG_NAME}
-	cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
+    install -d ${D}${prefix}/local/go/src/${PKG_NAME}
+    cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
 }

-SYSROOT_PREPROCESS_FUNCS += "go_libtrust_sysroot_preprocess"
+FILES_${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
+
+PKG_NAME = "github.com/docker/${SRCNAME}"

 go_libtrust_sysroot_preprocess () {
     install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
     cp -r ${D}${prefix}/local/go/src/${PKG_NAME}
${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
 }
-
-FILES_${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
diff --git a/recipes-devtools/go/go-logrus_git.bb
b/recipes-devtools/go/go-logrus_git.bb
index 5c0c359..bd226ce 100644
--- a/recipes-devtools/go/go-logrus_git.bb
+++ b/recipes-devtools/go/go-logrus_git.bb
@@ -3,27 +3,25 @@ HOMEPAGE = "https://github.com/Sirupsen/logrus"
 SECTION = "devel/go"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8dadfef729c08ec4e631c4f6fc5d43a0"
-
-SRCNAME = "logrus"
-
-PKG_NAME = "github.com/Sirupsen/${SRCNAME}"
-SRC_URI = "git://${PKG_NAME}.git"
-
 SRCREV = "d26492970760ca5d33129d2d799e34be5c4782eb"
 PV = "0.11.0+git${SRCREV}"

+SRC_URI = "git://${PKG_NAME}.git"
+
+SRCNAME = "logrus"
 S = "${WORKDIR}/git"
+SYSROOT_PREPROCESS_FUNCS += "go_logrus_sysroot_preprocess"

 do_install() {
-	install -d ${D}${prefix}/local/go/src/${PKG_NAME}
-	cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
+    install -d ${D}${prefix}/local/go/src/${PKG_NAME}
+    cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
 }

-SYSROOT_PREPROCESS_FUNCS += "go_logrus_sysroot_preprocess"
+FILES_${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
+
+PKG_NAME = "github.com/Sirupsen/${SRCNAME}"

 go_logrus_sysroot_preprocess () {
     install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
     cp -r ${D}${prefix}/local/go/src/${PKG_NAME}
${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
 }
-
-FILES_${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
diff --git a/recipes-devtools/go/go-mux_git.bb
b/recipes-devtools/go/go-mux_git.bb
index 7a2025a..26557b8 100644
--- a/recipes-devtools/go/go-mux_git.bb
+++ b/recipes-devtools/go/go-mux_git.bb
@@ -3,26 +3,24 @@ HOMEPAGE = "https://github.com/gorilla/mux"
 SECTION = "devel/go"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c50f6bd9c1e15ed0bad3bea18e3c1b7f"
+SRCREV = "136d54f81f00414c45c3c68dd47e98cc97519c5e"

-SRCNAME = "mux"
-
-PKG_NAME = "github.com/gorilla/${SRCNAME}"
 SRC_URI = "git://${PKG_NAME}.git"

-SRCREV = "136d54f81f00414c45c3c68dd47e98cc97519c5e"
-
+SRCNAME = "mux"
 S = "${WORKDIR}/git"
+SYSROOT_PREPROCESS_FUNCS += "go_mux_sysroot_preprocess"

 do_install() {
-	install -d ${D}${prefix}/local/go/src/${PKG_NAME}
-	cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
+    install -d ${D}${prefix}/local/go/src/${PKG_NAME}
+    cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
 }

-SYSROOT_PREPROCESS_FUNCS += "go_mux_sysroot_preprocess"
+FILES_${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
+
+PKG_NAME = "github.com/gorilla/${SRCNAME}"

 go_mux_sysroot_preprocess () {
     install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
     cp -r ${D}${prefix}/local/go/src/${PKG_NAME}
${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
 }
-
-FILES_${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
diff --git a/recipes-devtools/go/go-patricia_git.bb
b/recipes-devtools/go/go-patricia_git.bb
index 8c1e10d..c466cbe 100644
--- a/recipes-devtools/go/go-patricia_git.bb
+++ b/recipes-devtools/go/go-patricia_git.bb
@@ -3,27 +3,25 @@ HOMEPAGE = "https://github.com/gorilla/context"
 SECTION = "devel/go"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=9949b99212edd6b1e24ce702376c3baf"
-
-SRCNAME = "go-patricia"
-
-PKG_NAME = "github.com/tchap/${SRCNAME}"
-SRC_URI = "git://${PKG_NAME}.git"
-
 SRCREV = "666120de432aea38ab06bd5c818f04f4129882c9"
 PV = "2.2.6+git${SRCPV}"

+SRC_URI = "git://${PKG_NAME}.git"
+
+SRCNAME = "go-patricia"
 S = "${WORKDIR}/git"
+SYSROOT_PREPROCESS_FUNCS += "go_patricia_sysroot_preprocess"

 do_install() {
-	install -d ${D}${prefix}/local/go/src/${PKG_NAME}
-	cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
+    install -d ${D}${prefix}/local/go/src/${PKG_NAME}
+    cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
 }

-SYSROOT_PREPROCESS_FUNCS += "go_patricia_sysroot_preprocess"
+FILES_${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
+
+PKG_NAME = "github.com/tchap/${SRCNAME}"

 go_patricia_sysroot_preprocess () {
     install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
     cp -r ${D}${prefix}/local/go/src/${PKG_NAME}
${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
 }
-
-FILES_${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
diff --git a/recipes-devtools/go/go-pty_git.bb
b/recipes-devtools/go/go-pty_git.bb
index bc94b31..60ef321 100644
--- a/recipes-devtools/go/go-pty_git.bb
+++ b/recipes-devtools/go/go-pty_git.bb
@@ -3,26 +3,24 @@ HOMEPAGE = "https://github.com/kr/pty"
 SECTION = "devel/go"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://License;md5=93958070863d769117fa33b129020050"
+SRCREV = "05017fcccf23c823bfdea560dcc958a136e54fb7"

-SRCNAME = "pty"
-
-PKG_NAME = "github.com/kr/${SRCNAME}"
 SRC_URI = "git://${PKG_NAME}.git"

-SRCREV = "05017fcccf23c823bfdea560dcc958a136e54fb7"
-
+SRCNAME = "pty"
 S = "${WORKDIR}/git"
+SYSROOT_PREPROCESS_FUNCS += "go_pty_sysroot_preprocess"

 do_install() {
-	install -d ${D}${prefix}/local/go/src/${PKG_NAME}
-	cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
+    install -d ${D}${prefix}/local/go/src/${PKG_NAME}
+    cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
 }

-SYSROOT_PREPROCESS_FUNCS += "go_pty_sysroot_preprocess"
+FILES_${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
+
+PKG_NAME = "github.com/kr/${SRCNAME}"

 go_pty_sysroot_preprocess () {
     install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
     cp -r ${D}${prefix}/local/go/src/${PKG_NAME}
${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
 }
-
-FILES_${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
diff --git a/recipes-devtools/go/go-systemd_git.bb
b/recipes-devtools/go/go-systemd_git.bb
index b61c97a..b76f4a0 100644
--- a/recipes-devtools/go/go-systemd_git.bb
+++ b/recipes-devtools/go/go-systemd_git.bb
@@ -3,29 +3,27 @@ HOMEPAGE = "https://github.com/coreos/go-systemd"
 SECTION = "devel/go"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=19cbd64715b51267a47bf3750cc6a8a5"
-
-SRCNAME = "systemd"
-
-PKG_NAME = "github.com/coreos/go-${SRCNAME}"
-SRC_URI = "git://${PKG_NAME}.git"
-
 SRCREV = "b4a58d95188dd092ae20072bac14cece0e67c388"
 PV = "4+git${SRCREV}"

-RDEPENDS_${PN} += "bash"
+SRC_URI = "git://${PKG_NAME}.git"

+SRCNAME = "systemd"
 S = "${WORKDIR}/git"
+SYSROOT_PREPROCESS_FUNCS += "go_systemd_sysroot_preprocess"

 do_install() {
-	install -d ${D}${prefix}/local/go/src/${PKG_NAME}
-	cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
+    install -d ${D}${prefix}/local/go/src/${PKG_NAME}
+    cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
 }

-SYSROOT_PREPROCESS_FUNCS += "go_systemd_sysroot_preprocess"
+RDEPENDS_${PN} += "bash"
+
+FILES_${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
+
+PKG_NAME = "github.com/coreos/go-${SRCNAME}"

 go_systemd_sysroot_preprocess () {
     install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
     cp -r ${D}${prefix}/local/go/src/${PKG_NAME}
${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
 }
-
-FILES_${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
diff --git a/recipes-devtools/go/grpc-go_git.bb
b/recipes-devtools/go/grpc-go_git.bb
index 48c4249..f8114e3 100644
--- a/recipes-devtools/go/grpc-go_git.bb
+++ b/recipes-devtools/go/grpc-go_git.bb
@@ -3,39 +3,36 @@ HOMEPAGE = "https://github.com/grpc/grpc-go"
 SECTION = "devel/go"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM =
"file://src/${PKG_NAME}/LICENSE;md5=a4bad33881612090c6035d8393175996"
-
-SRCNAME = "grpc-go"
-
-PKG_NAME = "google.golang.org/grpc"
-SRC_URI =
"git://github.com/grpc/${SRCNAME}.git;destsuffix=git/src/${PKG_NAME}"
-
 SRCREV = "777daa17ff9b5daef1cfdf915088a2ada3332bf0"
 PV = "1.4.0+git${SRCPV}"

+SRC_URI =
"git://github.com/grpc/${SRCNAME}.git;destsuffix=git/src/${PKG_NAME}"
+
+SRCNAME = "grpc-go"
 S = "${WORKDIR}/git"
+SYSROOT_PREPROCESS_FUNCS += "go_grpc_sysroot_preprocess"

 # NO-OP the do compile rule because this recipe is source only.
 do_compile() {
 }
-
 do_install() {
-	install -d ${D}${prefix}/local/go/src/${PKG_NAME}
-	for j in $(cd ${S} && find src/${PKG_NAME} -name "*.go"); do
-	    if [ ! -d ${D}${prefix}/local/go/$(dirname $j) ]; then
-	        mkdir -p ${D}${prefix}/local/go/$(dirname $j)
-	    fi
-	    cp $j ${D}${prefix}/local/go/$j
-	done
-	cp -r ${S}/src/${PKG_NAME}/LICENSE ${D}${prefix}/local/go/src/${PKG_NAME}/
+    install -d ${D}${prefix}/local/go/src/${PKG_NAME}
+    for j in $(cd ${S} && find src/${PKG_NAME} -name "*.go"); do
+        if [ ! -d ${D}${prefix}/local/go/$(dirname $j) ]; then
+            mkdir -p ${D}${prefix}/local/go/$(dirname $j)
+        fi
+        cp $j ${D}${prefix}/local/go/$j
+    done
+    cp -r ${S}/src/${PKG_NAME}/LICENSE
${D}${prefix}/local/go/src/${PKG_NAME}/
 }

-SYSROOT_PREPROCESS_FUNCS += "go_grpc_sysroot_preprocess"
+FILES_${PN} += " \
+    ${prefix}/local/go/src/${PKG_NAME}/* \
+"
+
+PKG_NAME = "google.golang.org/grpc"

 go_grpc_sysroot_preprocess () {
     install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
     cp -r ${D}${prefix}/local/go/src/${PKG_NAME}
${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
 }
-
-FILES_${PN} += " \
-    ${prefix}/local/go/src/${PKG_NAME}/* \
-"
diff --git a/recipes-devtools/go/notary_git.bb
b/recipes-devtools/go/notary_git.bb
index d638dc1..15da097 100644
--- a/recipes-devtools/go/notary_git.bb
+++ b/recipes-devtools/go/notary_git.bb
@@ -3,37 +3,34 @@ HOMEPAGE = "https://github.com/docker/notary"
 SECTION = "devel/go"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM =
"file://src/${PKG_NAME}/LICENSE;md5=771ddb425ba03c8fab49e5bd9854a4a2"
-
-SRCNAME = "notary"
-
-PKG_NAME = "github.com/docker/${SRCNAME}"
-SRC_URI = "git://${PKG_NAME}.git;destsuffix=git/src/${PKG_NAME}"
-
 SRCREV = "c8aa8cf53cbcda2e92def0c9291e25d770493494"
 PV = "0.4.2+git${SRCPV}"

+SRC_URI = "git://${PKG_NAME}.git;destsuffix=git/src/${PKG_NAME}"
+
+SRCNAME = "notary"
 S = "${WORKDIR}/git"
+SYSROOT_PREPROCESS_FUNCS += "go_notary_sysroot_preprocess"

 # NO-OP the do compile rule because this recipe is source only.
 do_compile() {
 }
-
 do_install() {
-	install -d ${D}${prefix}/local/go/src/${PKG_NAME}
-	for j in $(cd ${S} && find src/${PKG_NAME} -name "*.go"); do
-	    if [ ! -d ${D}${prefix}/local/go/$(dirname $j) ]; then
-	        mkdir -p ${D}${prefix}/local/go/$(dirname $j)
-	    fi
-	    cp $j ${D}${prefix}/local/go/$j
-	done
-	cp -r ${S}/src/${PKG_NAME}/LICENSE ${D}${prefix}/local/go/src/${PKG_NAME}/
+    install -d ${D}${prefix}/local/go/src/${PKG_NAME}
+    for j in $(cd ${S} && find src/${PKG_NAME} -name "*.go"); do
+        if [ ! -d ${D}${prefix}/local/go/$(dirname $j) ]; then
+            mkdir -p ${D}${prefix}/local/go/$(dirname $j)
+        fi
+        cp $j ${D}${prefix}/local/go/$j
+    done
+    cp -r ${S}/src/${PKG_NAME}/LICENSE
${D}${prefix}/local/go/src/${PKG_NAME}/
 }

-SYSROOT_PREPROCESS_FUNCS += "go_notary_sysroot_preprocess"
+FILES_${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
+
+PKG_NAME = "github.com/docker/${SRCNAME}"

 go_notary_sysroot_preprocess () {
     install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
     cp -r ${D}${prefix}/local/go/src/${PKG_NAME}
${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
 }
-
-FILES_${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
-- 
2.11.0

