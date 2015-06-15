Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7274CE00A2C; Sun, 14 Jun 2015 20:11:14 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.160.179 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yk0-f179.google.com (mail-yk0-f179.google.com
	[209.85.160.179])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DCD48E009F8
	for <meta-virtualization@yoctoproject.org>;
	Sun, 14 Jun 2015 20:11:09 -0700 (PDT)
Received: by ykar6 with SMTP id r6so20199261yka.2
	for <meta-virtualization@yoctoproject.org>;
	Sun, 14 Jun 2015 20:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=snJeV+Kd8tY+2KdDx6lU+nK+d0h25f5w89iQsYbS9Us=;
	b=lycjVDRhiPUxptM+6Ikga+FJ0oP0fDt1i4Czofp4cx4cps7N0OfM2JPMxqZ2hFR081
	1bPJwyndXVOS//SfSlXAvycc3Wp7VdkzVOrIwfVzf44MeL/qB4gCSY8EEm0Sykle0mik
	sGZyMdtGfZbJ7Ipdj1q1LyAwIlvxcncvjNJ8eA3ugSG/MaAH8HweClcE49G3a1Su/7Fz
	igaIpx8xIKWKYXQ9/k/NhwBHTg6pyF21PsrFJrPSNRPvgtXp8AUQxdJJwuUqJa37qBn6
	LbK7CAj95FMctxu2L2ITANMrAVL0j46UHP77PYTyFtFRqMGpb4nxSLKuoJbj/9fKZ2L9
	/qsA==
MIME-Version: 1.0
X-Received: by 10.170.34.4 with SMTP id 4mr31483484ykc.62.1434337867965; Sun,
	14 Jun 2015 20:11:07 -0700 (PDT)
Received: by 10.129.128.2 with HTTP; Sun, 14 Jun 2015 20:11:07 -0700 (PDT)
In-Reply-To: <20150611144630.GA22550@windriver.com>
References: <20150611144630.GA22550@windriver.com>
Date: Sun, 14 Jun 2015 23:11:07 -0400
Message-ID: <CADkTA4NMBFqXqcM1vFsqUJBg27+DBpmvy-40_g-OtvzY27WakA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Amy Fong <amy.fong@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] docker uprev 1.6.2
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
X-List-Received-Date: Mon, 15 Jun 2015 03:11:14 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jun 11, 2015 at 10:46 AM, Amy Fong <amy.fong@windriver.com> wrote:
> From c129f2fc5442f77221f669baf6743f71a785b6a8 Mon Sep 17 00:00:00 2001
> From: Amy Fong <amy.fong@windriver.com>
> Date: Mon, 8 Jun 2015 13:26:01 -0400
> Subject: [PATCH] docker uprev 1.6.2
>
> Uprev docker to 1.6.2
>
> go-capability is upreved to a later git commit
> go-dbus is upreved to version 2
> go-distribution-digest is added as a new dependency. Only the
>    digest part of go-distribution is needed/kept here,
>    hence go-distribution-digest
> go-logrus is upreved to 0.7.1

merged.

Bruce

>
> Remove PR since it's no longer used
>
> Signed-off-by: Amy Fong <amy.fong@windriver.com>
> ---
>  recipes-containers/docker/docker_git.bb            | 11 +++----
>  .../docker/files/disable_sha1sum_startup.patch     |  8 ++---
>  recipes-devtools/go/go-capability_git.bb           |  7 ++---
>  recipes-devtools/go/go-cli_git.bb                  |  1 -
>  recipes-devtools/go/go-context_git.bb              |  1 -
>  recipes-devtools/go/go-dbus_git.bb                 |  5 ++--
>  recipes-devtools/go/go-distribution-digest_git.bb  | 34 ++++++++++++++++++++++
>  recipes-devtools/go/go-fsnotify_git.bb             |  1 -
>  recipes-devtools/go/go-libtrust_git.bb             |  1 -
>  recipes-devtools/go/go-logrus_git.bb               |  5 ++--
>  recipes-devtools/go/go-mux_git.bb                  |  1 -
>  recipes-devtools/go/go-net_hg.bb                   |  1 -
>  recipes-devtools/go/go-patricia_git.bb             |  1 -
>  recipes-devtools/go/go-pty_git.bb                  |  1 -
>  recipes-devtools/go/go-sqlite_hg.bb                |  1 -
>  recipes-devtools/go/go-systemd_git.bb              |  1 -
>  16 files changed, 51 insertions(+), 29 deletions(-)
>  create mode 100644 recipes-devtools/go/go-distribution-digest_git.bb
>
> diff --git a/recipes-containers/docker/docker_git.bb b/recipes-containers/docker/docker_git.bb
> index cb54616..8bcaee9 100644
> --- a/recipes-containers/docker/docker_git.bb
> +++ b/recipes-containers/docker/docker_git.bb
> @@ -18,9 +18,9 @@ DESCRIPTION = "Linux container runtime \
>   subtle and/or glaring issues. \
>   "
>
> -SRCREV = "2243e32cbbf1c9809c262a7376d34ca43a7a36dc"
> +SRCREV = "7c8fca2ddb58c8d2c4fb4df31c242886df7dd257"
>  SRC_URI = "\
> -       git://github.com/docker/docker.git \
> +       git://github.com/docker/docker.git;branch=release \
>         file://docker.service \
>         file://docker.init \
>         file://hi.Dockerfile \
> @@ -38,7 +38,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=1cc0497778922bfd6cb48721deb80dc7"
>
>  S = "${WORKDIR}/git"
>
> -DOCKER_VERSION = "1.5.0"
> +DOCKER_VERSION = "1.6.2"
>  PV = "${DOCKER_VERSION}+git${SRCREV}"
>
>  DEPENDS = "golang-cross \
> @@ -57,6 +57,7 @@ DEPENDS = "golang-cross \
>      go-systemd \
>      btrfs-tools \
>      sqlite3 \
> +    go-distribution-digest \
>      "
>
>  DEPENDS_append_class-target = "lvm2"
> @@ -110,9 +111,9 @@ INITSCRIPT_PARAMS_${PN} = "${OS_DEFAULT_INITSCRIPT_PARAMS}"
>
>  do_install() {
>         mkdir -p ${D}/${bindir}
> -       cp ${S}/bundles/${DOCKER_VERSION}-dev/dynbinary/docker-${DOCKER_VERSION}-dev \
> +       cp ${S}/bundles/${DOCKER_VERSION}/dynbinary/docker-${DOCKER_VERSION} \
>           ${D}/${bindir}/docker
> -       cp ${S}/bundles/${DOCKER_VERSION}-dev/dynbinary/dockerinit-${DOCKER_VERSION}-dev \
> +       cp ${S}/bundles/${DOCKER_VERSION}/dynbinary/dockerinit-${DOCKER_VERSION} \
>           ${D}/${bindir}/dockerinit
>
>         if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
> diff --git a/recipes-containers/docker/files/disable_sha1sum_startup.patch b/recipes-containers/docker/files/disable_sha1sum_startup.patch
> index cc6819b..580ca23 100644
> --- a/recipes-containers/docker/files/disable_sha1sum_startup.patch
> +++ b/recipes-containers/docker/files/disable_sha1sum_startup.patch
> @@ -17,15 +17,15 @@ Signed-off-by: Amy Fong <amy.fong@windriver.com>
>
>  --- a/utils/utils.go
>  +++ b/utils/utils.go
> -@@ -4,7 +4,6 @@
> +@@ -3,7 +3,6 @@
> + import (
>         "bufio"
>         "bytes"
> -       "crypto/rand"
>  -      "crypto/sha1"
>         "crypto/sha256"
>         "encoding/hex"
>         "fmt"
> -@@ -76,20 +75,6 @@
> +@@ -75,20 +74,6 @@
>         return path
>   }
>
> @@ -46,7 +46,7 @@ Signed-off-by: Amy Fong <amy.fong@windriver.com>
>   func isValidDockerInitPath(target string, selfPath string) bool { // target and selfPath should be absolute (InitPath and SelfPath already do this)
>         if target == "" {
>                 return false
> -@@ -111,7 +96,7 @@
> +@@ -110,7 +95,7 @@
>                 }
>                 return os.SameFile(targetFileInfo, selfPathFileInfo)
>         }
> diff --git a/recipes-devtools/go/go-capability_git.bb b/recipes-devtools/go/go-capability_git.bb
> index 6f5b833..4f8f431 100644
> --- a/recipes-devtools/go/go-capability_git.bb
> +++ b/recipes-devtools/go/go-capability_git.bb
> @@ -4,13 +4,12 @@ SECTION = "devel/go"
>  LICENSE = "BSD-2-Clause"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=a7304f5073e7be4ba7bffabbf9f2bbca"
>
> -PR = "r0"
>  SRCNAME = "gocapability"
>
>  PKG_NAME = "github.com/syndtr/${SRCNAME}"
>  SRC_URI = "git://${PKG_NAME}.git"
>
> -SRCREV = "3c85049eaeb429febe7788d9c7aac42322a377fe"
> +SRCREV = "8e4cdcb3c22b40d5e330ade0b68cb2e2a3cf6f98"
>
>  S = "${WORKDIR}/git"
>
> @@ -19,9 +18,9 @@ do_install() {
>         cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
>  }
>
> -SYSROOT_PREPROCESS_FUNCS += "go_mux_sysroot_preprocess"
> +SYSROOT_PREPROCESS_FUNCS += "go_capability_sysroot_preprocess"
>
> -go_mux_sysroot_preprocess () {
> +go_capability_sysroot_preprocess () {
>      install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
>      cp -r ${D}${prefix}/local/go/src/${PKG_NAME} ${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
>  }
> diff --git a/recipes-devtools/go/go-cli_git.bb b/recipes-devtools/go/go-cli_git.bb
> index ef37357..21d01ac 100644
> --- a/recipes-devtools/go/go-cli_git.bb
> +++ b/recipes-devtools/go/go-cli_git.bb
> @@ -4,7 +4,6 @@ SECTION = "devel/go"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=ed9b539ed65d73926f30ff1f1587dc44"
>
> -PR = "r0"
>  SRCNAME = "cli"
>
>  PKG_NAME = "github.com/codegangsta/${SRCNAME}"
> diff --git a/recipes-devtools/go/go-context_git.bb b/recipes-devtools/go/go-context_git.bb
> index a4b832e..15f6a8d 100644
> --- a/recipes-devtools/go/go-context_git.bb
> +++ b/recipes-devtools/go/go-context_git.bb
> @@ -4,7 +4,6 @@ SECTION = "devel/go"
>  LICENSE = "BSD-3-Clause"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=c50f6bd9c1e15ed0bad3bea18e3c1b7f"
>
> -PR = "r0"
>  SRCNAME = "context"
>
>  PKG_NAME = "github.com/gorilla/${SRCNAME}"
> diff --git a/recipes-devtools/go/go-dbus_git.bb b/recipes-devtools/go/go-dbus_git.bb
> index 8edbd1e..092bd50 100644
> --- a/recipes-devtools/go/go-dbus_git.bb
> +++ b/recipes-devtools/go/go-dbus_git.bb
> @@ -4,14 +4,13 @@ SECTION = "devel/go"
>  LICENSE = "BSD-2-Clause"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=b5ac622301483800715d770434e27e5b"
>
> -PR = "r0"
>  SRCNAME = "dbus"
>
>  PKG_NAME = "github.com/godbus/${SRCNAME}"
>  SRC_URI = "git://${PKG_NAME}.git"
>
> -SRCREV = "cb98efbb933d8389ab549a060e880ea3c375d213"
> -PV = "1+git${SRCREV}"
> +SRCREV = "88765d85c0fdadcd98a54e30694fa4e4f5b51133"
> +PV = "2+git${SRCREV}"
>
>  S = "${WORKDIR}/git"
>
> diff --git a/recipes-devtools/go/go-distribution-digest_git.bb b/recipes-devtools/go/go-distribution-digest_git.bb
> new file mode 100644
> index 0000000..31d724c
> --- /dev/null
> +++ b/recipes-devtools/go/go-distribution-digest_git.bb
> @@ -0,0 +1,34 @@
> +DESCRIPTION = "The Docker toolset to pack, ship, store, and deliver content"
> +HOMEPAGE = "https://github.com/docker/distribution"
> +SECTION = "devel/go"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=d2794c0df5b907fdace235a619d80314"
> +
> +SRCNAME = "distribution"
> +
> +PKG_NAME = "github.com/docker/${SRCNAME}"
> +SRC_URI = "git://${PKG_NAME}.git"
> +
> +SRCREV = "d957768537c5af40e4f4cd96871f7b2bde9e2923"
> +
> +S = "${WORKDIR}/git"
> +
> +do_unpackpost() {
> +       rm -rf ${S}/[A-KM-Za-ce-z]* ${S}/doc*
> +}
> +
> +addtask unpackpost after do_unpack before do_patch
> +
> +do_install() {
> +       install -d ${D}${prefix}/local/go/src/${PKG_NAME}
> +       cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
> +}
> +
> +SYSROOT_PREPROCESS_FUNCS += "go_distribution_digeset_sysroot_preprocess"
> +
> +go_distribution_digeset_sysroot_preprocess () {
> +    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
> +    cp -r ${D}${prefix}/local/go/src/${PKG_NAME} ${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
> +}
> +
> +FILES_${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
> diff --git a/recipes-devtools/go/go-fsnotify_git.bb b/recipes-devtools/go/go-fsnotify_git.bb
> index cb4a974..e18f574 100644
> --- a/recipes-devtools/go/go-fsnotify_git.bb
> +++ b/recipes-devtools/go/go-fsnotify_git.bb
> @@ -4,7 +4,6 @@ SECTION = "devel/go"
>  LICENSE = "BSD-3-Clause"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=c38914c9a7ab03bb2b96d4baaee10769"
>
> -PR = "r0"
>  SRCNAME = "fsnotify"
>
>  PKG_NAME = "github.com/go-fsnotify/${SRCNAME}"
> diff --git a/recipes-devtools/go/go-libtrust_git.bb b/recipes-devtools/go/go-libtrust_git.bb
> index d84cc34..f2acfb4 100644
> --- a/recipes-devtools/go/go-libtrust_git.bb
> +++ b/recipes-devtools/go/go-libtrust_git.bb
> @@ -4,7 +4,6 @@ SECTION = "devel/go"
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=435b266b3899aa8a959f17d41c56def8"
>
> -PR = "r0"
>  SRCNAME = "libtrust"
>
>  PKG_NAME = "github.com/docker/${SRCNAME}"
> diff --git a/recipes-devtools/go/go-logrus_git.bb b/recipes-devtools/go/go-logrus_git.bb
> index d1ae6e1..082c1a6 100644
> --- a/recipes-devtools/go/go-logrus_git.bb
> +++ b/recipes-devtools/go/go-logrus_git.bb
> @@ -4,14 +4,13 @@ SECTION = "devel/go"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=8dadfef729c08ec4e631c4f6fc5d43a0"
>
> -PR = "r0"
>  SRCNAME = "logrus"
>
>  PKG_NAME = "github.com/Sirupsen/${SRCNAME}"
>  SRC_URI = "git://${PKG_NAME}.git"
>
> -SRCREV = "6ebb4e7b3c24b9fef150d7693e728cb1ebadf1f5"
> -PV = "0.6.0+git${SRCREV}"
> +SRCREV = "3fc34d061b9c78a70db853c7cb6b0576b6d4f32d"
> +PV = "0.7.1+git${SRCREV}"
>
>  S = "${WORKDIR}/git"
>
> diff --git a/recipes-devtools/go/go-mux_git.bb b/recipes-devtools/go/go-mux_git.bb
> index ddd9559..7a2025a 100644
> --- a/recipes-devtools/go/go-mux_git.bb
> +++ b/recipes-devtools/go/go-mux_git.bb
> @@ -4,7 +4,6 @@ SECTION = "devel/go"
>  LICENSE = "BSD-3-Clause"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=c50f6bd9c1e15ed0bad3bea18e3c1b7f"
>
> -PR = "r0"
>  SRCNAME = "mux"
>
>  PKG_NAME = "github.com/gorilla/${SRCNAME}"
> diff --git a/recipes-devtools/go/go-net_hg.bb b/recipes-devtools/go/go-net_hg.bb
> index 4a159fa..9eff3ea 100644
> --- a/recipes-devtools/go/go-net_hg.bb
> +++ b/recipes-devtools/go/go-net_hg.bb
> @@ -4,7 +4,6 @@ SECTION = "devel/go"
>  LICENSE = "BSD-3-Clause"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
>
> -PR = "r0"
>  SRCNAME = "go.net"
>
>  PKG_NAME = "code.google.com/p/${SRCNAME}"
> diff --git a/recipes-devtools/go/go-patricia_git.bb b/recipes-devtools/go/go-patricia_git.bb
> index 687677f..18c188d 100644
> --- a/recipes-devtools/go/go-patricia_git.bb
> +++ b/recipes-devtools/go/go-patricia_git.bb
> @@ -4,7 +4,6 @@ SECTION = "devel/go"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=9949b99212edd6b1e24ce702376c3baf"
>
> -PR = "r0"
>  SRCNAME = "go-patricia"
>
>  PKG_NAME = "github.com/tchap/${SRCNAME}"
> diff --git a/recipes-devtools/go/go-pty_git.bb b/recipes-devtools/go/go-pty_git.bb
> index 8238540..bc94b31 100644
> --- a/recipes-devtools/go/go-pty_git.bb
> +++ b/recipes-devtools/go/go-pty_git.bb
> @@ -4,7 +4,6 @@ SECTION = "devel/go"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://License;md5=93958070863d769117fa33b129020050"
>
> -PR = "r0"
>  SRCNAME = "pty"
>
>  PKG_NAME = "github.com/kr/${SRCNAME}"
> diff --git a/recipes-devtools/go/go-sqlite_hg.bb b/recipes-devtools/go/go-sqlite_hg.bb
> index b4c1d0b..ddca920 100644
> --- a/recipes-devtools/go/go-sqlite_hg.bb
> +++ b/recipes-devtools/go/go-sqlite_hg.bb
> @@ -4,7 +4,6 @@ SECTION = "devel/go"
>  LICENSE = "BSD-3-Clause"
>  LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=550794465ba0ec5312d6919e203a55f9"
>
> -PR = "r0"
>  SRCNAME = "gosqlite"
>
>  PKG_NAME = "code.google.com/p/${SRCNAME}"
> diff --git a/recipes-devtools/go/go-systemd_git.bb b/recipes-devtools/go/go-systemd_git.bb
> index 0a5ec24..358e6bb 100644
> --- a/recipes-devtools/go/go-systemd_git.bb
> +++ b/recipes-devtools/go/go-systemd_git.bb
> @@ -4,7 +4,6 @@ SECTION = "devel/go"
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=19cbd64715b51267a47bf3750cc6a8a5"
>
> -PR = "r0"
>  SRCNAME = "systemd"
>
>  PKG_NAME = "github.com/coreos/go-${SRCNAME}"
> --
> 2.1.4
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

