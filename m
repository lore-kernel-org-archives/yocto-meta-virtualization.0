Return-Path: <stefan@agner.ch>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7EF48E00CB9; Sun,  1 Sep 2019 13:33:44 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 28BE7E00D53
	for <meta-virtualization@yoctoproject.org>;
	Sun,  1 Sep 2019 13:33:43 -0700 (PDT)
Received: from linuxdev2.toradex.int (unknown [46.140.72.82])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id CE77D5C298D;
	Sun,  1 Sep 2019 22:33:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1567370021;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=vDTAVorSouWWFTJa3xdfHFCOHsZxfQfILnRep5aTEq8=;
	b=aWUg7/Jc+QRHi1CfHto1UVqA7oNZyPdk59LFD4FKuYEM/jQ+2LuFTwqOixJTURtdOXSiMZ
	Me0+yG2l4PKiGFRUGM/4B0LggoB+ALxWaUJmbbrkl95jca+Jq4SZtSy3JqjGrHhquH3kDR
	0v2iXE6ja1cJZyBPsPIjzf7hQ8kB7f8=
From: Stefan Agner <stefan@agner.ch>
To: meta-virtualization@yoctoproject.org
Date: Sun,  1 Sep 2019 22:33:38 +0200
Message-Id: <20190901203338.38768-7-stefan@agner.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190901203338.38768-1-stefan@agner.ch>
References: <20190901203338.38768-1-stefan@agner.ch>
MIME-Version: 1.0
Cc: Stefan Agner <stefan.agner@toradex.com>
Subject: [PATCH 6/6] podmon: add the Pod Manager tool
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
X-List-Received-Date: Sun, 01 Sep 2019 20:33:44 -0000
Content-Transfer-Encoding: 8bit

From: Stefan Agner <stefan.agner@toradex.com>

Podman is a daemonless container engine for developing, managing, and
running OCI Containers on your Linux System. Containers can either be
run as root or in rootless mode.

This patch adds the initial recipe for podman. Currently a minimal
feature set is supported. It seems that libseccomp is mandatory, which
makes meta-security a mandatory dependency for this recipe.

Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
---
 recipes-containers/podman/podman_git.bb | 91 +++++++++++++++++++++++++
 1 file changed, 91 insertions(+)
 create mode 100644 recipes-containers/podman/podman_git.bb

diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
new file mode 100644
index 0000000..6f4e7d4
--- /dev/null
+++ b/recipes-containers/podman/podman_git.bb
@@ -0,0 +1,91 @@
+HOMEPAGE = "https://podman.io/"
+SUMMARY =  "A daemonless container engine"
+DESCRIPTION = "Podman is a daemonless container engine for developing, \
+    managing, and running OCI Containers on your Linux System. Containers can \
+    either be run as root or in rootless mode. Simply put: \
+    `alias docker=podman`. \
+    "
+
+DEPENDS = " \
+    go-metalinter-native \
+    go-md2man-native \
+    gpgme \
+    libseccomp \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
+"
+
+SRCREV = "00057929f5acfd98341964d85722383363376d52"
+SRC_URI = " \
+    git://github.com/containers/libpod.git;branch=master \
+"
+
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=e3fc50a88d0a364313df4b21ef20c29e"
+
+GO_IMPORT = "import"
+
+S = "${WORKDIR}/git"
+
+PV = "1.5.1+git${SRCREV}"
+
+PACKAGES =+ "${PN}-contrib"
+
+PODMAN_PKG = "github.com/containers/libpod"
+BUILDTAGS = "seccomp systemd exclude_graphdriver_btrfs exclude_graphdriver_devicemapper"
+
+# overide LDFLAGS to allow criu to build without: "x86_64-poky-linux-ld: unrecognized option '-Wl,-O1'"
+export LDFLAGS=""
+
+inherit go goarch
+inherit systemd pkgconfig
+
+do_configure[noexec] = "1"
+
+EXTRA_OEMAKE = " \
+     PREFIX=${prefix} BINDIR=${bindir} LIBEXECDIR=${libexecdir} \
+     ETCDIR=${sysconfdir} TMPFILESDIR=${nonarch_libdir}/tmpfiles.d \
+     SYSTEMDDIR=${systemd_unitdir}/system USERSYSTEMDDIR=${systemd_unitdir}/user \
+"
+
+do_compile() {
+	# Set GOPATH. See 'PACKAGERS.md'. Don't rely on
+	# docker to download its dependencies but rather
+	# use dependencies packaged independently.
+	cd ${S}/src
+	rm -rf .gopath
+	mkdir -p .gopath/src/"$(dirname "${PODMAN_PKG}")"
+	ln -sf ../../../../import/ .gopath/src/"${PODMAN_PKG}"
+
+	ln -sf "../../../import/vendor/github.com/varlink/" ".gopath/src/github.com/varlink"
+
+	export GOPATH="${S}/src/.gopath"
+	export GOROOT="${STAGING_DIR_NATIVE}/${nonarch_libdir}/${HOST_SYS}/go"
+
+	cd ${S}/src/.gopath/src/"${PODMAN_PKG}"
+
+	make cmd/podman/varlink/iopodman.go GO=go
+
+	# Pass the needed cflags/ldflags so that cgo
+	# can find the needed headers files and libraries
+	export GOARCH=${TARGET_GOARCH}
+	export CGO_ENABLED="1"
+	export CGO_CFLAGS="${CFLAGS} --sysroot=${STAGING_DIR_TARGET}"
+	export CGO_LDFLAGS="${LDFLAGS} --sysroot=${STAGING_DIR_TARGET}"
+
+	make BUILDTAGS="${BUILDTAGS}"
+}
+
+do_install() {
+	cd ${S}/src/.gopath/src/"${PODMAN_PKG}"
+
+	oe_runmake install install.docker DESTDIR="${D}"
+}
+
+FILES_${PN} += " \
+    ${systemd_unitdir}/system/* \
+    ${systemd_unitdir}/user/* \
+    ${nonarch_libdir}/tmpfiles.d/* \
+    ${sysconfdir}/docker \
+"
+
+RDEPENDS_${PN} += "conmon runc-opencontainers iptables cni skopeo"
-- 
2.20.1


