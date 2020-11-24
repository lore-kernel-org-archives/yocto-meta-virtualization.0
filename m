Received: from 7.mo68.mail-out.ovh.net (7.mo68.mail-out.ovh.net [46.105.63.230])
 by mx.groups.io with SMTP id smtpd.web11.212.1606238437363174128
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 24 Nov 2020 09:20:37 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: 3mdeb.com, ip: 46.105.63.230, mailfrom: maciej.pijanowski@3mdeb.com)
Received: from player755.ha.ovh.net (unknown [10.108.35.128])
	by mo68.mail-out.ovh.net (Postfix) with ESMTP id 0034E180124
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 24 Nov 2020 18:20:34 +0100 (CET)
Received: from 3mdeb.com (89-66-159-90.dynamic.chello.pl [89.66.159.90])
	(Authenticated sender: maciej.pijanowski@3mdeb.com)
	by player755.ha.ovh.net (Postfix) with ESMTPSA id 20D7318904616
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 24 Nov 2020 17:20:33 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass (GARM-106R00608942065-6e93-4f44-82a6-c423b805b7a9,
                    BC82A14BF08680DC96B4491CA353477796433981) smtp.auth=maciej.pijanowski@3mdeb.com
From: "Maciej Pijanowski" <maciej.pijanowski@3mdeb.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH] balena-engine: add recipe
Date: Tue, 24 Nov 2020 18:20:12 +0100
Message-Id: <20201124172012.318030-1-maciej.pijanowski@3mdeb.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Ovh-Tracer-Id: 4675299363193564849
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudegkedguddtudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhephffvufffkffogggtgfesthekredtredtjeenucfhrhhomhepofgrtghivghjucfrihhjrghnohifshhkihcuoehmrggtihgvjhdrphhijhgrnhhofihskhhiseefmhguvggsrdgtohhmqeenucggtffrrghtthgvrhhnpedthffffedvheeugfffgeehtedvhfekuddtffffleekfeefieekffeiueetvdekleenucffohhmrghinhephihotghtohhprhhojhgvtghtrdhorhhgpdhgihhthhhusgdrtghomhdpsggrlhgvnhgrrdhiohenucfkpheptddrtddrtddrtddpkeelrdeiiedrudehledrledtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeehhedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehmrggtihgvjhdrphhijhgrnhhofihskhhiseefmhguvggsrdgtohhmpdhrtghpthhtohepmhgvthgrqdhvihhrthhurghlihiirghtihhonheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhg
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

As explained in [1], I have created the balena-engine recipe which could =
be
used in "regular" Yocto/OE builds (outside of the balenaOS). The
recipe is mostly a copy of the original recipe from meta-balena,
stripped from the balenaOS-specific parts so it can be compiled and
build outside of it. This recipe was tested at build and runtime
on the dunfell release on two targets: RPi4 and qemux86-64.

[1] https://lists.yoctoproject.org/g/meta-virtualization/message/5913

Signed-off-by: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
---
 ...dcoded-CC-on-cross-compile-docker-ce.patch |  60 +++++++
 .../balena-engine/balena-tmpfiles.conf        |   2 +
 .../balena-engine/balena-engine_git.bb        | 159 ++++++++++++++++++
 3 files changed, 221 insertions(+)
 create mode 100644 recipes-containers/balena-engine/balena-engine/0001-i=
mporve-hardcoded-CC-on-cross-compile-docker-ce.patch
 create mode 100644 recipes-containers/balena-engine/balena-engine/balena=
-tmpfiles.conf
 create mode 100644 recipes-containers/balena-engine/balena-engine_git.bb

diff --git a/recipes-containers/balena-engine/balena-engine/0001-imporve-=
hardcoded-CC-on-cross-compile-docker-ce.patch b/recipes-containers/balena=
-engine/balena-engine/0001-imporve-hardcoded-CC-on-cross-compile-docker-c=
e.patch
new file mode 100644
index 000000000000..0f257f1bd964
--- /dev/null
+++ b/recipes-containers/balena-engine/balena-engine/0001-imporve-hardcod=
ed-CC-on-cross-compile-docker-ce.patch
@@ -0,0 +1,60 @@
+From 1263fdb50a540e9db742694b7cee08284ad986d0 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Wed, 17 Jul 2019 17:34:04 +0800
+Subject: [PATCH] imporve hardcoded CC on cross compile
+
+Since commit applied in moby [61a3285 Support cross-compile for arm]
+it hardcoded var-CC to support cross-compile for arm
+
+Correct it with "${parameter:-word}" format, it is helpful for user
+define toolchains
+
+(Use Default Values.  If parameter is unset or null, the expansion of
+word is substituted.  Otherwise, the value of parameter is substituted.)
+
+Upstream-Status: Submitted [https://github.com/moby/moby/pull/39546]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ hack/make/.binary | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/src/import/hack/make/.binary b/src/import/hack/make/.binary
+index 53de6749e5..66f4ca05f3 100644
+--- a/src/import/hack/make/.binary
++++ b/src/import/hack/make/.binary
+@@ -44,27 +44,27 @@ if [ "$(go env GOOS)/$(go env GOARCH)" !=3D "$(go en=
v GOHOSTOS)/$(go env GOHOSTARC
+	# must be cross-compiling!
+	case "$(go env GOOS)/$(go env GOARCH)" in
+		windows/amd64)
+-			export CC=3Dx86_64-w64-mingw32-gcc
++			export CC=3D"${CC:-x86_64-w64-mingw32-gcc}"
+			export CGO_ENABLED=3D1
+			;;
+		linux/arm)
+			case "${GOARM}" in
+			5|"")
+-				export CC=3Darm-linux-gnueabi-gcc
++				export CC=3D"${CC:-arm-linux-gnueabi-gcc}"
+				export CGO_ENABLED=3D1
+				;;
+			7)
+-				export CC=3Darm-linux-gnueabihf-gcc
++				export CC=3D"${CC:-arm-linux-gnueabihf-gcc}"
+				export CGO_ENABLED=3D1
+				;;
+			esac
+			;;
+		linux/arm64)
+-			export CC=3Daarch64-linux-gnu-gcc
++			export CC=3D"${CC:-aarch64-linux-gnu-gcc}"
+			export CGO_ENABLED=3D1
+			;;
+		linux/amd64)
+-			export CC=3Dx86_64-linux-gnu-gcc
++			export CC=3D"${CC:-x86_64-linux-gnu-gcc}"
+			export CGO_ENABLED=3D1
+			;;
+	esac
+--
+2.23.0
diff --git a/recipes-containers/balena-engine/balena-engine/balena-tmpfil=
es.conf b/recipes-containers/balena-engine/balena-engine/balena-tmpfiles.=
conf
new file mode 100644
index 000000000000..548a25d3ae49
--- /dev/null
+++ b/recipes-containers/balena-engine/balena-engine/balena-tmpfiles.conf
@@ -0,0 +1,2 @@
+L	/run/docker.pid	-	-	-	-	/run/balena-engine.pid
+L	/run/balena.pid	-	-	-	-	/run/balena-engine.pid
diff --git a/recipes-containers/balena-engine/balena-engine_git.bb b/reci=
pes-containers/balena-engine/balena-engine_git.bb
new file mode 100644
index 000000000000..5d78dc02350f
--- /dev/null
+++ b/recipes-containers/balena-engine/balena-engine_git.bb
@@ -0,0 +1,159 @@
+HOMEPAGE =3D "https://www.balena.io/"
+SUMMARY =3D "A Moby-based container engine for IoT"
+DESCRIPTION =3D "Balena is a new container engine purpose-built for embe=
dded \
+and IoT use cases and compatible with Docker containers. Based on Docker=
=E2=80=99s \
+Moby Project, balena supports container deltas for 10-70x more efficient=
 \
+bandwidth usage, has 3.5x smaller binaries, uses RAM and storage more \
+conservatively, and focuses on atomicity and durability of container \
+pulling."
+LICENSE =3D "Apache-2.0"
+LIC_FILES_CHKSUM =3D "file://src/import/LICENSE;md5=3D4859e97a9c7780e779=
72d989f0823f28"
+
+inherit systemd go pkgconfig useradd
+
+BALENA_VERSION =3D "19.03.13-dev"
+BALENA_BRANCH=3D "master"
+
+SRCREV =3D "074a481789174b4b6fd2d706086e8ffceb72e924"
+SRC_URI =3D "\
+	git://github.com/balena-os/balena-engine.git;branch=3D${BALENA_BRANCH};=
destsuffix=3Dgit/src/import \
+	file://0001-imporve-hardcoded-CC-on-cross-compile-docker-ce.patch \
+        file://balena-tmpfiles.conf \
+	"
+
+S =3D "${WORKDIR}/git"
+
+PV =3D "${BALENA_VERSION}+git${SRCREV}"
+
+SECURITY_CFLAGS =3D "${SECURITY_NOPIE_CFLAGS}"
+SECURITY_LDFLAGS =3D ""
+
+SYSTEMD_PACKAGES =3D "${PN}"
+SYSTEMD_SERVICE_${PN} =3D "balena-engine.service balena-engine.socket"
+GO_IMPORT =3D "import"
+USERADD_PACKAGES =3D "${PN}"
+GROUPADD_PARAM_${PN} =3D "-r balena-engine"
+
+DEPENDS_append_class-target =3D " systemd"
+RDEPENDS_${PN}_class-target =3D "curl util-linux iptables tini systemd b=
ash"
+RRECOMMENDS_${PN} +=3D "kernel-module-nf-nat kernel-module-br-netfilter =
kernel-module-nf-conntrack-netlink kernel-module-xt-masquerade kernel-mod=
ule-xt-addrtype"
+
+# oe-meta-go recipes try to build go-cross-native
+DEPENDS_remove_class-native =3D "go-cross-native"
+DEPENDS_append_class-native =3D " go-native"
+
+INSANE_SKIP_${PN} +=3D "already-stripped"
+
+FILES_${PN} +=3D " \
+	/lib/systemd/system/* \
+	/home/root \
+	/boot/init \
+	/boot/storage-driver \
+	${localstatedir} \
+	"
+
+DOCKER_PKG=3D"github.com/docker/docker"
+
+# By default no extra LDFLAGS needed when compiling mobynit
+MOBYNIT_EXTRA_LDFLAGS ??=3D ""
+
+do_configure[noexec] =3D "1"
+
+do_compile() {
+	export PATH=3D${STAGING_BINDIR_NATIVE}/${HOST_SYS}:$PATH
+
+	export GOCACHE=3D"${B}/.cache"
+	export GOHOSTOS=3D"linux"
+	export GOOS=3D"linux"
+	case "${TARGET_ARCH}" in
+		x86_64)
+			GOARCH=3Damd64
+			;;
+		i586|i686)
+			GOARCH=3D386
+			;;
+		arm)
+			GOARCH=3D${TARGET_ARCH}
+			case "${TUNE_PKGARCH}" in
+				cortexa*)
+					export GOARM=3D7
+					;;
+			esac
+			;;
+		aarch64)
+			# ARM64 is invalid for Go 1.4
+			GOARCH=3Darm64
+		;;
+		*)
+			GOARCH=3D"${TARGET_ARCH}"
+		;;
+	esac
+	export GOARCH
+
+	# Set GOPATH. See 'PACKAGERS.md'. Don't rely on
+	# docker to download its dependencies but rather
+	# use dependencies packaged independently.
+	cd ${S}/src/import
+	rm -rf .gopath
+	mkdir -p .gopath/src/"$(dirname "${DOCKER_PKG}")"
+	ln -sf ../../../.. .gopath/src/"${DOCKER_PKG}"
+	export GOPATH=3D"${S}/src/import/.gopath:${S}/src/import/vendor:${STAGI=
NG_DIR_TARGET}/${prefix}/local/go"
+
+	export CGO_ENABLED=3D"1"
+
+	# Pass the needed cflags/ldflags so that cgo
+	# can find the needed headers files and libraries
+	export CGO_CFLAGS=3D"${CFLAGS} --sysroot=3D${STAGING_DIR_TARGET}"
+	export CGO_LDFLAGS=3D"${LDFLAGS}  --sysroot=3D${STAGING_DIR_TARGET}"
+
+	export DOCKER_GITCOMMIT=3D"${SRCREV}"
+	export DOCKER_BUILDTAGS=3D"no_buildkit no_btrfs no_cri no_devmapper no_=
zfs exclude_disk_quota exclude_graphdriver_btrfs exclude_graphdriver_devi=
cemapper exclude_graphdriver_zfs"
+	export DOCKER_LDFLAGS=3D"-s"
+
+	VERSION=3D${BALENA_VERSION} ./hack/make.sh dynbinary-balena
+
+	# Compile mobynit
+	cd .gopath/src/"${DOCKER_PKG}"/cmd/mobynit
+	go build -ldflags '-extldflags "-static ${MOBYNIT_EXTRA_LDFLAGS}"' .
+	cd -
+}
+
+do_install() {
+	mkdir -p ${D}/${bindir}
+	install -m 0755 ${S}/src/import/bundles/dynbinary-balena/balena-engine =
${D}/${bindir}/balena-engine
+	# install -d ${D}/boot
+	# install -m 0755 ${S}/src/import/cmd/mobynit/mobynit ${D}/boot/init
+	# echo ${BALENA_STORAGE} > ${D}/boot/storage-driver
+
+	ln -sf balena-engine ${D}/${bindir}/balena
+	ln -sf balena-engine ${D}/${bindir}/balenad
+	ln -sf balena-engine ${D}/${bindir}/balena-containerd
+	ln -sf balena-engine ${D}/${bindir}/balena-containerd-shim
+	ln -sf balena-engine ${D}/${bindir}/balena-containerd-ctr
+	ln -sf balena-engine ${D}/${bindir}/balena-runc
+	ln -sf balena-engine ${D}/${bindir}/balena-proxy
+
+	ln -sf balena-engine ${D}/${bindir}/balena-engine-daemon
+	ln -sf balena-engine ${D}/${bindir}/balena-engine-containerd
+	ln -sf balena-engine ${D}/${bindir}/balena-engine-containerd-shim
+	ln -sf balena-engine ${D}/${bindir}/balena-engine-containerd-ctr
+	ln -sf balena-engine ${D}/${bindir}/balena-engine-runc
+	ln -sf balena-engine ${D}/${bindir}/balena-engine-proxy
+
+	install -d ${D}${systemd_unitdir}/system
+	install -m 0644 ${S}/src/import/contrib/init/systemd/balena-engine.sock=
et ${D}/${systemd_unitdir}/system
+	install -m 0644 ${S}/src/import/contrib/init/systemd/balena-engine.serv=
ice ${D}/${systemd_unitdir}/system
+
+	install -d ${D}/home/root/.docker
+	ln -sf .docker ${D}/home/root/.balena
+	ln -sf .docker ${D}/home/root/.balena-engine
+
+	install -d ${D}${localstatedir}/lib/docker
+	ln -sf docker ${D}${localstatedir}/lib/balena
+	ln -sf docker ${D}${localstatedir}/lib/balena-engine
+
+	install -d ${D}${sysconfdir}/tmpfiles.d
+	install -m 0644 ${WORKDIR}/balena-tmpfiles.conf ${D}${sysconfdir}/tmpfi=
les.d/
+}
+
+BBCLASSEXTEND =3D " native"
--=20
2.25.1

