Return-Path: <amy.fong@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0D403E00522; Sat, 28 Feb 2015 20:36:21 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BF8B5E0034A
	for <meta-virtualization@yoctoproject.org>;
	Sat, 28 Feb 2015 20:36:16 -0800 (PST)
Received: from yow-dellw-af (yow-dellw-af.wrs.com [128.224.56.22])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t214aEW6011322
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NO)
	for <meta-virtualization@yoctoproject.org>;
	Sat, 28 Feb 2015 20:36:15 -0800 (PST)
Received: from afong by yow-dellw-af with local (Exim 4.84)
	(envelope-from <amy.fong@windriver.com>) id 1YRvbo-0007lI-90
	for meta-virtualization@yoctoproject.org;
	Sat, 28 Feb 2015 23:36:04 -0500
Date: Sat, 28 Feb 2015 23:36:04 -0500
From: Amy Fong <amy.fong@windriver.com>
To: meta-virtualization@yoctoproject.org
Message-ID: <20150301043604.GA29812@windriver.com>
References: <20150227214013.GA2160@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20150227214013.GA2160@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: [PATCH 2/5] Package docker
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: amy.fong@windriver.com
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Sun, 01 Mar 2015 04:36:21 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

From 710262f1d13f6a81b77ced6b94c009ab4bd3f1d7 Mon Sep 17 00:00:00 2001
From: Amy Fong <amy.fong@windriver.com>
Date: Fri, 27 Feb 2015 15:59:10 -0500
Subject: [PATCH 2/5] Package docker

Adding docker (Linux container runtime)

Signed-off-by: Amy Fong <amy.fong@windriver.com>
---
 recipes-containers/docker/docker_git.bb        | 122 +++++++++++++++++++++++++
 recipes-containers/docker/files/docker.service |  15 +++
 recipes-containers/docker/files/hi.Dockerfile  |   7 ++
 3 files changed, 144 insertions(+)
 create mode 100644 recipes-containers/docker/docker_git.bb
 create mode 100644 recipes-containers/docker/files/docker.service
 create mode 100644 recipes-containers/docker/files/hi.Dockerfile

diff --git a/recipes-containers/docker/docker_git.bb b/recipes-containers/docker/docker_git.bb
new file mode 100644
index 0000000..a1d6ff4
--- /dev/null
+++ b/recipes-containers/docker/docker_git.bb
@@ -0,0 +1,122 @@
+HOMEPAGE = "http://www.docker.com"
+SUMMARY = "Linux container runtime"
+DESCRIPTION = "Linux container runtime \
+ Docker complements kernel namespacing with a high-level API which \
+ operates at the process level. It runs unix processes with strong \
+ guarantees of isolation and repeatability across servers. \
+ . \
+ Docker is a great building block for automating distributed systems: \
+ large-scale web deployments, database clusters, continuous deployment \
+ systems, private PaaS, service-oriented architectures, etc. \
+ . \
+ This package contains the daemon and client. Using docker.io on non-amd64 \
+ hosts is not supported at this time. Please be careful when using it \
+ on anything besides amd64. \
+ . \
+ Also, note that kernel version 3.8 or above is required for proper \
+ operation of the daemon process, and that any lower versions may have \
+ subtle and/or glaring issues. \
+ "
+
+SRCREV = "2243e32cbbf1c9809c262a7376d34ca43a7a36dc"
+SRC_URI = "\
+	git://github.com/docker/docker.git \
+	file://docker.service \
+	file://hi.Dockerfile \
+	"
+
+# Apache-2.0 for docker
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1cc0497778922bfd6cb48721deb80dc7"
+
+S = "${WORKDIR}/git"
+
+DOCKER_VERSION = "1.5.0"
+PV = "${DOCKER_VERSION}+git${SRCREV}"
+
+DEPENDS = "golang-cross btrfs-tools sqlite3 "
+DEPENDS_append_class-target = "lvm2"
+RDEPENDS_${PN} = "curl aufs-util git cgroup-lite util-linux"
+RRECOMMENDS_${PN} = "lxc docker-registry rt-tests"
+
+do_compile() {
+	export GOARCH="${TARGET_ARCH}"
+	# supported amd64, 386, arm
+	if [ "${TARGET_ARCH}" = "x86_64" ]; then
+		export GOARCH="amd64"
+	fi
+
+	# setting AUTO_GOPATH to use the default vendor configuration
+	# as opposed to setting up GOPATH with all the explicit vendor
+	# directory structure...
+	#
+	# From docker's PACKAGERS.md:
+	# If you'd rather not be bothered with the hassles that setting up
+	# `GOPATH` appropriately can be, and prefer to just get a "build
+	# that works", you should add something similar to this to whatever
+	# script or process you're using to build Docker
+	export AUTO_GOPATH=1
+
+	# Pass the needed cflags/ldflags so that cgo
+	# can find the needed headers files and libraries
+	export CGO_CFLAGS="${BUILD_CFLAGS}"
+	export CGO_LDFLAGS="${BUILD_LDFLAGS}"
+
+	# this is the unsupported built structure
+	# that doesn't rely on an existing docker
+	# to build this:
+	DOCKER_GITCOMMIT="${SRCREV}" \
+	  ./hack/make.sh dynbinary
+
+	export GOPATH=${S}/vendor
+
+	# make nsinit from libcontainer - installed in vendor/bin
+	ln -s ${S} ${S}/vendor/src/github.com/docker/docker
+	mkdir -p ${S}/vendor/src/github.com/codegangsta
+	(cd ${S}/vendor/src/github.com/codegangsta && git clone https://github.com/codegangsta/cli)
+	go install github.com/docker/libcontainer/nsinit/
+}
+
+inherit systemd
+
+SYSTEMD_PACKAGES = "${@base_contains('DISTRO_FEATURES','systemd','${PN}','',d)}"
+SYSTEMD_SERVICE_${PN} = "${@base_contains('DISTRO_FEATURES','systemd','docker.service','',d)}"
+
+do_install() {
+	mkdir -p ${D}/${bindir}
+	cp ${S}/bundles/${DOCKER_VERSION}-dev/dynbinary/docker-${DOCKER_VERSION}-dev \
+	  ${D}/${bindir}/docker
+	cp ${S}/bundles/${DOCKER_VERSION}-dev/dynbinary/dockerinit-${DOCKER_VERSION}-dev \
+	  ${D}/${bindir}/dockerinit
+
+	if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+		install -d ${D}${systemd_unitdir}/system
+		install -m 644 ${S}/contrib/init/systemd/docker.* ${D}/${systemd_unitdir}/system
+		# replaces one copied from above with one that uses the local registry for a mirror
+		install -m 644 ${WORKDIR}/docker.service ${D}/${systemd_unitdir}/system
+	fi
+
+	cp ${S}/vendor/bin/nsinit ${D}/${bindir}
+
+	mkdir -p ${D}/usr/share/docker/
+	cp ${WORKDIR}/hi.Dockerfile ${D}/usr/share/docker/
+}
+
+inherit useradd
+USERADD_PACKAGES = "${PN}"
+GROUPADD_PARAM_${PN} = "-r docker"
+
+FILES_${PN} += "/lib/systemd/system/*"
+
+# DO NOT STRIP docker and dockerinit!!!
+#
+# Reason:
+# The "docker" package contains two binaries: "docker" and "dockerinit",
+# which are both written in Go. The "dockerinit" package is built first,
+# then its checksum is given to the build process compiling the "docker"
+# binary. Hence the checksum of the unstripped "dockerinit" binary is hard
+# coded into the "docker" binary. At runtime the "docker" binary invokes
+# the "dockerinit" binary, but before doing that it ensures the checksum
+# of "dockerinit" matches with the hard coded value.
+#
+INHIBIT_PACKAGE_STRIP = "1"
diff --git a/recipes-containers/docker/files/docker.service b/recipes-containers/docker/files/docker.service
new file mode 100644
index 0000000..6801031
--- /dev/null
+++ b/recipes-containers/docker/files/docker.service
@@ -0,0 +1,15 @@
+[Unit]
+Description=Docker Application Container Engine
+Documentation=http://docs.docker.com
+After=network.target docker.socket
+Requires=docker.socket
+
+[Service]
+ExecStart=/usr/bin/docker -d -H fd:// --registry-mirror=http://localhost:5000 --insecure-registry=http://localhost:5000
+MountFlags=slave
+LimitNOFILE=1048576
+LimitNPROC=1048576
+LimitCORE=infinity
+
+[Install]
+WantedBy=multi-user.target
diff --git a/recipes-containers/docker/files/hi.Dockerfile b/recipes-containers/docker/files/hi.Dockerfile
new file mode 100644
index 0000000..9af6805
--- /dev/null
+++ b/recipes-containers/docker/files/hi.Dockerfile
@@ -0,0 +1,7 @@
+FROM debian
+
+MAINTAINER amy.fong@windriver.com
+
+RUN apt-get update && apt-get install figlet
+
+ENTRYPOINT [ "/usr/bin/figlet", "hi" ]
-- 
2.1.4


