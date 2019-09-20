Return-Path: <stefan@agner.ch>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7EF4AE00D9E; Fri, 20 Sep 2019 00:18:16 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	https://www.dnswl.org/, no *      trust
	*      [178.209.48.109 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3C322E00D98
	for <meta-virtualization@yoctoproject.org>;
	Fri, 20 Sep 2019 00:18:15 -0700 (PDT)
Received: from linuxdev2.toradex.int (unknown [46.140.72.82])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 4A6E05C0D8D;
	Fri, 20 Sep 2019 09:18:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1568963894;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=3KrvqrNM1NDPnp2E1UIA+bVLXfMKUp2Aku80WPqniA0=;
	b=HJrSTUsTXGDDbj9XCek7cVIMti4Sx85muwuyb0cp3/psi9XogYGwwU0zHktYlWuIrLyAtz
	deRiB/jU1JKLgFE7ys74H3ZI+XLh7YNxU8qPxvwAnog5Xwv9TZYv/oesZKLAC4S8sBmc9+
	HbBjjc+XLgH72ZuGXAxBS9zZnhYiZAc=
From: Stefan Agner <stefan@agner.ch>
To: meta-virtualization@yoctoproject.org
Date: Fri, 20 Sep 2019 09:18:04 +0200
Message-Id: <20190920071807.13139-5-stefan@agner.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190920071807.13139-1-stefan@agner.ch>
References: <20190920071807.13139-1-stefan@agner.ch>
MIME-Version: 1.0
Cc: Stefan Agner <stefan.agner@toradex.com>
Subject: [PATCH v2 4/7] skopeo: add skopeo
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
X-List-Received-Date: Fri, 20 Sep 2019 07:18:16 -0000
Content-Transfer-Encoding: 8bit

From: Stefan Agner <stefan.agner@toradex.com>

skopeo is a command line utility that performs various operations on
container images and image repositories.

skopeo can work with OCI images as well as the original Docker v2
images.

The recipe originates from from meta-overc commit a497792. It has
been updated with the new project URL and v0.1.39.

Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
---
 recipes-containers/skopeo/skopeo_git.bb | 73 +++++++++++++++++++++++++
 1 file changed, 73 insertions(+)
 create mode 100644 recipes-containers/skopeo/skopeo_git.bb

diff --git a/recipes-containers/skopeo/skopeo_git.bb b/recipes-containers/skopeo/skopeo_git.bb
new file mode 100644
index 0000000..82d3f23
--- /dev/null
+++ b/recipes-containers/skopeo/skopeo_git.bb
@@ -0,0 +1,73 @@
+HOMEPAGE = "https://github.com/containers/skopeo"
+SUMMARY = "Work with remote images registries - retrieving information, images, signing content"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=7e611105d3e369954840a6668c438584"
+
+DEPENDS = " \
+    gpgme \
+    multipath-tools \
+    btrfs-tools \
+    glib-2.0 \
+    ostree \
+"
+
+inherit go
+
+RDEPENDS_${PN} = " \
+     gpgme \
+     libgpg-error \
+     libassuan \
+"
+
+SRC_URI = "git://github.com/containers/skopeo"
+
+SRCREV = "1cf1e06582142c522543560f2bc6d6756696e8ad"
+PV = "v0.1.39-dev+git${SRCPV}"
+GO_IMPORT = "import"
+
+S = "${WORKDIR}/git"
+
+inherit goarch
+inherit pkgconfig
+
+# This disables seccomp and apparmor, which are on by default in the
+# go package. 
+EXTRA_OEMAKE="BUILDTAGS=''"
+
+do_compile() {
+	export GOARCH="${TARGET_GOARCH}"
+
+	# Setup vendor directory so that it can be used in GOPATH.
+	#
+	# Go looks in a src directory under any directory in GOPATH but riddler
+	# uses 'vendor' instead of 'vendor/src'. We can fix this with a symlink.
+	#
+	# We also need to link in the ipallocator directory as that is not under
+	# a src directory.
+	ln -sfn . "${S}/src/import/vendor/src"
+	mkdir -p "${S}/src/import/vendor/src/github.com/projectatomic/skopeo"
+	ln -sfn "${S}/src/import/skopeo" "${S}/src/import/vendor/src/github.com/projectatomic/skopeo"
+	ln -sfn "${S}/src/import/version" "${S}/src/import/vendor/src/github.com/projectatomic/skopeo/version"
+	export GOPATH="${S}/src/import/vendor"
+
+	# Pass the needed cflags/ldflags so that cgo
+	# can find the needed headers files and libraries
+	export CGO_ENABLED="1"
+	export CFLAGS=""
+	export LDFLAGS=""
+	export CGO_CFLAGS="${BUILDSDK_CFLAGS} --sysroot=${STAGING_DIR_TARGET}"
+	export CGO_LDFLAGS="${BUILDSDK_LDFLAGS} --sysroot=${STAGING_DIR_TARGET}"
+	cd ${S}/src/import
+
+	oe_runmake binary-local
+}
+
+do_install() {
+	install -d ${D}/${sbindir}
+	install -d ${D}/${sysconfdir}/containers
+
+	install ${S}/src/import/skopeo ${D}/${sbindir}/
+	install ${S}/src/import/default-policy.json ${D}/${sysconfdir}/containers/policy.json
+}
+
+INSANE_SKIP_${PN} += "ldflags"
-- 
2.20.1


