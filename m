Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.7754.1600152533445906723
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 14 Sep 2020 23:48:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: hongxu.jia@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 08F6mFp8021231
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Mon, 14 Sep 2020 23:48:25 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.40) with Microsoft SMTP Server id 14.3.487.0; Mon, 14 Sep 2020
 23:48:04 -0700
From: "hongxu" <hongxu.jia@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>, <bruce.ashfield@gmail.com>
Subject: [meta-virtualization][PATCH 1/2] skopeo: upgrade to 1.1.1
Date: Tue, 15 Sep 2020 14:48:02 +0800
Message-ID: <20200915064803.14962-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.18.2
MIME-Version: 1.0
Content-Type: text/plain

- Drop ostree

- Support native and nativesdk

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../skopeo/{skopeo_git.bb => skopeo_1.1.1.bb} | 50 +++++--------------
 1 file changed, 12 insertions(+), 38 deletions(-)
 rename recipes-containers/skopeo/{skopeo_git.bb => skopeo_1.1.1.bb} (33%)

diff --git a/recipes-containers/skopeo/skopeo_git.bb b/recipes-containers/skopeo/skopeo_1.1.1.bb
similarity index 33%
rename from recipes-containers/skopeo/skopeo_git.bb
rename to recipes-containers/skopeo/skopeo_1.1.1.bb
index f5a6231..ca23ac6 100644
--- a/recipes-containers/skopeo/skopeo_git.bb
+++ b/recipes-containers/skopeo/skopeo_1.1.1.bb
@@ -1,14 +1,14 @@
 HOMEPAGE = "https://github.com/containers/skopeo"
 SUMMARY = "Work with remote images registries - retrieving information, images, signing content"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=7e611105d3e369954840a6668c438584"
+LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/LICENSE;md5=7e611105d3e369954840a6668c438584"
 
 DEPENDS = " \
     gpgme \
-    multipath-tools \
+    libdevmapper \
+    lvm2 \
     btrfs-tools \
     glib-2.0 \
-    ostree \
 "
 
 inherit go
@@ -17,64 +17,38 @@ RDEPENDS_${PN} = " \
      gpgme \
      libgpg-error \
      libassuan \
+     libdevmapper \
 "
 
 SRC_URI = " \
-    git://github.com/containers/skopeo \
+    git://${GO_IMPORT};branch=release-1.1 \
     file://storage.conf \
     file://registries.conf \
 "
 
-SRCREV = "1cf1e06582142c522543560f2bc6d6756696e8ad"
-PV = "v0.1.39-dev+git${SRCPV}"
-GO_IMPORT = "import"
+SRCREV = "67abbb3cefbdc876447583d5ea45e76bf441eba7"
+GO_IMPORT = "github.com/containers/skopeo"
 
 S = "${WORKDIR}/git"
 
 inherit goarch
 inherit pkgconfig
 
-# This disables seccomp and apparmor, which are on by default in the
-# go package. 
-EXTRA_OEMAKE="BUILDTAGS=''"
-
 do_compile() {
-	export GOARCH="${TARGET_GOARCH}"
-
-	# Setup vendor directory so that it can be used in GOPATH.
-	#
-	# Go looks in a src directory under any directory in GOPATH but riddler
-	# uses 'vendor' instead of 'vendor/src'. We can fix this with a symlink.
-	#
-	# We also need to link in the ipallocator directory as that is not under
-	# a src directory.
-	ln -sfn . "${S}/src/import/vendor/src"
-	mkdir -p "${S}/src/import/vendor/src/github.com/projectatomic/skopeo"
-	ln -sfn "${S}/src/import/skopeo" "${S}/src/import/vendor/src/github.com/projectatomic/skopeo"
-	ln -sfn "${S}/src/import/version" "${S}/src/import/vendor/src/github.com/projectatomic/skopeo/version"
-	export GOPATH="${S}/src/import/vendor"
-
-	# Pass the needed cflags/ldflags so that cgo
-	# can find the needed headers files and libraries
-	export CGO_ENABLED="1"
-	export CFLAGS=""
-	export LDFLAGS=""
-	export CGO_CFLAGS="${BUILDSDK_CFLAGS} --sysroot=${STAGING_DIR_TARGET}"
-	export CGO_LDFLAGS="${BUILDSDK_LDFLAGS} --sysroot=${STAGING_DIR_TARGET}"
-	cd ${S}/src/import
-
+	cd ${S}/src/${GO_IMPORT}
 	oe_runmake binary-local
 }
 
 do_install() {
 	install -d ${D}/${sbindir}
 	install -d ${D}/${sysconfdir}/containers
-
-	install ${S}/src/import/skopeo ${D}/${sbindir}/
-	install ${S}/src/import/default-policy.json ${D}/${sysconfdir}/containers/policy.json
+	install ${S}/src/${GO_IMPORT}/skopeo ${D}/${sbindir}/
+	install ${S}/src/${GO_IMPORT}/default-policy.json ${D}/${sysconfdir}/containers/policy.json
 
 	install ${WORKDIR}/storage.conf ${D}/${sysconfdir}/containers/storage.conf
 	install ${WORKDIR}/registries.conf ${D}/${sysconfdir}/containers/registries.conf
 }
 
 INSANE_SKIP_${PN} += "ldflags"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.18.2

