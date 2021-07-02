Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.6728.1625212788126224000
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 02 Jul 2021 00:59:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: hongxu.jia@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 1627xiPx025985
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 2 Jul 2021 00:59:44 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Fri, 2 Jul 2021 00:59:44 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.10 via Frontend Transport; Fri, 2 Jul 2021 00:59:43 -0700
From: "hongxu" <hongxu.jia@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>, <bruce.ashfield@gmail.com>
Subject: [meta-virtualization][PATCH] umoci: rework recipe
Date: Fri, 2 Jul 2021 15:59:42 +0800
Message-ID: <20210702075942.37015-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

1. tweak homepage

2. Use go_do_compile of go bbclass in oe-core to replace
   the do_compile in recipe, variables such as LD,CC,
   CFLAGS, CGO_CFLAGS will be set automatically

3. Use go_do_install of go bbclass in oe-core to replace
   the do_install in recipe, all necessary will be installed

4. export GO111MODULE=off globally

5. Skip file-rdeps insane for umoci dev packages since scripts
   in umoci dev packages contains awk, bash shebang

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 recipes-containers/umoci/umoci_git.bb | 75 ++++-----------------------
 1 file changed, 10 insertions(+), 65 deletions(-)

diff --git a/recipes-containers/umoci/umoci_git.bb b/recipes-containers/umoci/umoci_git.bb
index f83a35a7..c4007eb3 100644
--- a/recipes-containers/umoci/umoci_git.bb
+++ b/recipes-containers/umoci/umoci_git.bb
@@ -1,80 +1,25 @@
-HOMEPAGE = "https://github.com/openSUSE/umoci"
+HOMEPAGE = "https://umo.ci"
 SUMMARY = "umoci modifies Open Container images"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://COPYING;md5=3b83ef96387f14655fc854ddc3c6bd57"
+LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/COPYING;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 RDEPENDS_${PN} = "skopeo"
 RDEPENDS_${PN}_class-native = ""
 
-SRCREV_umoci = "758044fc26ad65eb900143e90d1e22c2d6e4484d"
-SRC_URI = "git://github.com/opencontainers/umoci.git;branch=master;name=umoci;destsuffix=github.com/opencontainers/umoci \
-          "
+SRCREV = "758044fc26ad65eb900143e90d1e22c2d6e4484d"
+SRC_URI = " \
+    git://${GO_IMPORT}; \
+"
 
 PV = "v0.4.7-dev+git${SRCPV}"
-S = "${WORKDIR}/github.com/opencontainers/umoci"
+S = "${WORKDIR}/git"
 GO_IMPORT = "github.com/opencontainers/umoci"
 
 inherit goarch
 inherit go
 
-# This disables seccomp and apparmor, which are on by default in the
-# go package. 
-EXTRA_OEMAKE="BUILDTAGS=''"
+export GO111MODULE="off"
 
-
-do_compile_class-native () {
-    export GOARCH="${BUILD_GOARCH}"
-
-    # Pass the needed cflags/ldflags so that cgo can find the needed headers files and libraries
-    export CGO_ENABLED="1"
-    export CFLAGS="${BUILD_CFLAGS}"
-    export LDFLAGS="${BUILD_LDFLAGS}"
-    export CGO_CFLAGS="${BUILD_CFLAGS}"
-
-    # as of go 1.15.5, there are some flags the CGO doesn't like. Rather than
-    # clearing them all, we sed away the ones we don't want.
-    # export CGO_LDFLAGS="$(echo ${BUILD_LDFLAGS} | sed 's/-Wl,-O1//g' | sed 's/-Wl,--dynamic-linker.*?( \|$\)//g')"
-    export CC="${BUILD_CC}"
-    export LD="${BUILD_LD}"
-
-    export GOPATH="${WORKDIR}/git/"
-    export GO111MODULE=off
-
-    cd ${S}
-
-    # why static ? patchelf will be run on dynamic binaries and it breaks
-    # the executable (coredump)
-    # https://forum.snapcraft.io/t/patchelf-broke-my-binary/4928
-    # https://github.com/NixOS/patchelf/issues/146
-    oe_runmake umoci.static
-
-    # so the common install can find our binary
-    cp umoci.static umoci
-}
-
-do_compile() {
-    export GOARCH="${TARGET_GOARCH}"
-    export GOPATH="${WORKDIR}/git/"
-
-    # Pass the needed cflags/ldflags so that cgo
-    # can find the needed headers files and libraries
-    export CGO_ENABLED="1"
-    export CFLAGS=""
-    export LDFLAGS=""
-    export CGO_CFLAGS="${BUILDSDK_CFLAGS} --sysroot=${STAGING_DIR_TARGET}"
-    export CGO_LDFLAGS="${BUILDSDK_LDFLAGS} --sysroot=${STAGING_DIR_TARGET}"
-
-    export GO111MODULE=off
-
-    cd ${S}
-
-    oe_runmake umoci
-}
-
-do_install() {
-    install -d ${D}/${sbindir}
-    install ${S}/umoci ${D}/${sbindir}
-}
-
-INSANE_SKIP_${PN} += "ldflags already-stripped"
+INSANE_SKIP_${PN}-dev += "file-rdeps"
+INSANE_SKIP_${PN} += "already-stripped"
 BBCLASSEXTEND = "native nativesdk"
-- 
2.27.0

