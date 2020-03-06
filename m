Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.1020.1583531711920922718
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 06 Mar 2020 13:55:12 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: mark.asselstine@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 026LsYd3011670
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Fri, 6 Mar 2020 13:54:44 -0800
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Fri, 6 Mar 2020
 13:54:23 -0800
From: "Mark Asselstine" <mark.asselstine@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>, <bruce.ashfield@gmail.com>
Subject: [meta-virtualization][PATCH] cri-o: uprev from 1.15 to 1.17
Date: Fri, 6 Mar 2020 16:54:08 -0500
Message-ID: <1583531648-22033-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain

Uprev to the latest release of cri-o to pick up some fixes and
CVEs. Makefile updates along with updates to the go.bbclass allow us
to remove most of the do_compile() tweaks that were in place. To test
that these removals are sane builds were done for x86_64 and arm64 in
docker containers with network=none, no issues were found.

Quite a few runtime tests were done as well since we are stepping up 2
releases, and we also just uprev'd 'cni' and wanted to validate its
runtime as well.

Once the system is started and cri-o is given time to start you can
use the new 'crio-status info' command to retrieve the runtime status
of cri-o:

   root@qemux86-64:~# crio-status info
   cgroup driver: cgroupfs
   storage driver:
   storage root: /var/lib/containers/storage
   default GID mappings (format <container>:<host>:<size>):
     0:0:4294967295
   default UID mappings (format <container>:<host>:<size>):
     0:0:4294967295

Additionally 'crictl' was installed (the recipe will be submitted
shortly) and the cri-o Tutorial found here was run
(https://github.com/cri-o/cri-o/blob/master/tutorials/crictl.md)

In order to run the tutorial /etc/cni/net.d/99-loopback.conf and
/etc/containers/policy.json were taken from
./contrib/cni/99-loopback.conf and ./contrib/policy.json in the cri-o
src repo. The sandbox_config.json and container_redis.json were taken
from https://github.com/cri-o/cri-o/blob/master/test/testdata (note:
using core-image-minimal with systemd enabled I had to remove
"cpu_period": 10000 and "cpu_quota": 20000 to get the tutorial to
work). We are not able to use the loopback networking to telnet to the
redis container, but we can use other techniques to validate that it
is running.

  root@qemux86-64:~# /usr/lib/go/src/import/_output/crictl --runtime-endpoint unix:///var/run/crio/crio.sock ps
  CONTAINER           IMAGE                       CREATED             STATE               NAME                ATTEMPT             POD ID
  72718714360ef       quay.io/crio/redis:alpine   47 seconds ago      Running             podsandbox1-redis   0                   38b97e5a7bb99
  root@qemux86-64:~# /usr/lib/go/src/import/_output/crictl --runtime-endpoint unix:///var/run/crio/crio.sock exec -i 72718714360ef cat /etc/issue
  Welcome to Alpine Linux 3.7
  Kernel \r on an \m (\l)

The CRIO_BUILD_CROSS approach was no longer valid and was
dropped. There is most likely some other cleanup we can do but this
gets us to a good state on the latest release.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 recipes-containers/cri-o/cri-o_git.bb    | 74 ++++++--------------------------
 recipes-containers/cri-o/files/crio.conf |  7 ++-
 2 files changed, 17 insertions(+), 64 deletions(-)

diff --git a/recipes-containers/cri-o/cri-o_git.bb b/recipes-containers/cri-o/cri-o_git.bb
index 4fee385..ebf5bab 100644
--- a/recipes-containers/cri-o/cri-o_git.bb
+++ b/recipes-containers/cri-o/cri-o_git.bb
@@ -14,9 +14,9 @@ At a high level, we expect the scope of cri-o to be restricted to the following
  - Resource isolation as required by the CRI \
  "
 
-SRCREV_cri-o = "f61719a88b7de10a88c50e35640f4a7f1f53fbab"
+SRCREV_cri-o = "6d0ffae63b9b7d8f07e7f9cf50736a67fb31faf3"
 SRC_URI = "\
-	git://github.com/kubernetes-sigs/cri-o.git;branch=release-1.15;name=cri-o \
+	git://github.com/kubernetes-sigs/cri-o.git;branch=release-1.17;name=cri-o \
 	file://0001-Makefile-force-symlinks.patch \
         file://crio.conf \
 	"
@@ -27,7 +27,7 @@ LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=e3fc50a88d0a364313df4b21ef20c2
 
 GO_IMPORT = "import"
 
-PV = "1.15.0+git${SRCREV_cri-o}"
+PV = "1.17.0+git${SRCREV_cri-o}"
 
 DEPENDS = " \
     glib-2.0 \
@@ -62,7 +62,7 @@ python __anonymous() {
 PACKAGES =+ "${PN}-config"
 
 RDEPENDS_${PN} += " virtual/containerd virtual/runc"
-RDEPENDS_${PN} += " e2fsprogs-mke2fs"
+RDEPENDS_${PN} += " e2fsprogs-mke2fs conmon util-linux iptables conntrack-tools"
 
 inherit systemd
 inherit go
@@ -70,63 +70,14 @@ inherit goarch
 inherit pkgconfig
 
 EXTRA_OEMAKE="BUILDTAGS=''"
-CRIO_BUILD_CROSS ?= "1"
 
 do_compile() {
 	set +e
-	export GOPATH="${S}/src/import:${S}/src/import/vendor"
-
-	# link fixups for compilation
-	rm -f ${S}/src/import/vendor/src
-	ln -sf ./ ${S}/src/import/vendor/src
-
-	mkdir -p ${S}/src/import/vendor/github.com/kubernetes-sigs/cri-o
-	ln -sf ../../../../cmd ${S}/src/import/vendor/github.com/kubernetes-sigs/cri-o/cmd
-	ln -sf ../../../../test ${S}/src/import/vendor/github.com/kubernetes-sigs/cri-o/test
-	ln -sf ../../../../oci ${S}/src/import/vendor/github.com/kubernetes-sigs/cri-o/oci
-	ln -sf ../../../../server ${S}/src/import/vendor/github.com/kubernetes-sigs/cri-o/server
-	ln -sf ../../../../pkg ${S}/src/import/vendor/github.com/kubernetes-sigs/cri-o/pkg
-	ln -sf ../../../../libpod ${S}/src/import/vendor/github.com/kubernetes-sigs/cri-o/libpod
-	ln -sf ../../../../libkpod ${S}/src/import/vendor/github.com/kubernetes-sigs/cri-o/libkpod
-	ln -sf ../../../../utils ${S}/src/import/vendor/github.com/kubernetes-sigs/cri-o/utils
-	ln -sf ../../../../types ${S}/src/import/vendor/github.com/kubernetes-sigs/cri-o/types
-	ln -sf ../../../../version ${S}/src/import/vendor/github.com/kubernetes-sigs/cri-o/version
-	ln -sf ../../../../lib ${S}/src/import/vendor/github.com/kubernetes-sigs/cri-o/lib
-
-
-	rm -f ${S}/src/import/src
-	ln -sf ./ ${S}/src/import/src
-	mkdir -p ${S}/src/import/src/github.com/cri-o/cri-o/cmd
-	ln -sf ../../../../cmd/crio-config ${S}/src/import/src/github.com/cri-o/cri-o/cmd
-	ln -sf ../../../lib ${S}/src/import/src/github.com/cri-o/cri-o/lib
-	ln -sf ../../../oci ${S}/src/import/src/github.com/cri-o/cri-o/oci
-	ln -sf ../../../pkg ${S}/src/import/src/github.com/cri-o/cri-o/pkg
-	ln -sf ../../../utils ${S}/src/import/src/github.com/cri-o/cri-o/utils
-	ln -sf ../../../version ${S}/src/import/src/github.com/cri-o/cri-o/version
-	ln -sf ../../../server ${S}/src/import/src/github.com/cri-o/cri-o/server
-	ln -sf ../../../types ${S}/src/import/src/github.com/cri-o/cri-o/types
-
-	# fixes the bin/crio build of oe_runmake binaries below
-	ln -sf ../../../../cmd/crio ${S}/src/import/src/github.com/cri-o/cri-o/cmd/
-
-	# workaround `use of vendored package not allowed' failure
-	mv ${S}/src/import/vendor/golang.org  ${S}/src/import/
 
 	cd ${S}/src/import
 
-	if [ "${CRIO_BUILD_CROSS}" = "1" ]; then
-	    # New: using the -cross target. But this doesn't build conmon and pause. So
-	    #      keeping the old parts around if someone yells.
-	    oe_runmake local-cross
-	else
-	    # Build conmon/config.h, requires native versions of
-	    # cmd/crio-config/config.go and oci/oci.go
-	    (CGO_ENABLED=0 GO=go GOARCH=${BUILD_GOARCH} GOOS=${BUILD_GOOS} oe_runmake conmon/config.h)
-	    rm -f bin/crio-config
-	    rm -rf vendor/pkg
-
-	    oe_runmake binaries
-	fi
+	oe_runmake local-cross
+	oe_runmake binaries
 }
 
 SYSTEMD_PACKAGES = "${@bb.utils.contains('DISTRO_FEATURES','systemd','${PN}','',d)}"
@@ -141,6 +92,7 @@ do_install() {
     install -d ${D}/${libexecdir}/crio
     install -d ${D}/${sysconfdir}/crio
     install -d ${D}${systemd_unitdir}/system/
+    install -d ${D}/usr/share/containers/oci/hooks.d
 
     install ${WORKDIR}/crio.conf ${D}/${sysconfdir}/crio/crio.conf
 
@@ -149,19 +101,21 @@ do_install() {
     install -m 755 -D ${S}/src/import/test/testdata/* ${D}/${sysconfdir}/crio/config/
 
     install ${S}/src/import/bin/crio.cross.linux* ${D}/${localbindir}/crio
-
-    if [ "${CRIO_BUILD_CROSS}" = "1" ]; then
-	install ${S}/src/import/bin/conmon ${D}/${localbindir}/crio
-	install ${S}/src/import/bin/pause ${D}/${localbindir}/crio
-    fi
+    install ${S}/src/import/bin/crio-status ${D}/${localbindir}/
+    install ${S}/src/import/bin/pinns ${D}/${localbindir}/
 
     install -m 0644 ${S}/src/import/contrib/systemd/crio.service  ${D}${systemd_unitdir}/system/
     install -m 0644 ${S}/src/import/contrib/systemd/crio-shutdown.service  ${D}${systemd_unitdir}/system/
+    install -m 0644 ${S}/src/import/contrib/systemd/crio-wipe.service  ${D}${systemd_unitdir}/system/
 }
 
 FILES_${PN}-config = "${sysconfdir}/crio/config/*"
 FILES_${PN} += "${systemd_unitdir}/system/*"
 FILES_${PN} += "/usr/local/bin/*"
+FILES_${PN} += "/usr/share/containers/oci/hooks.d"
+
+# don't clobber hooks.d
+ALLOW_EMPTY_${PN} = "1"
 
 INSANE_SKIP_${PN} += "ldflags already-stripped"
 
diff --git a/recipes-containers/cri-o/files/crio.conf b/recipes-containers/cri-o/files/crio.conf
index 9135df0..899d255 100644
--- a/recipes-containers/cri-o/files/crio.conf
+++ b/recipes-containers/cri-o/files/crio.conf
@@ -24,7 +24,7 @@ storage_option = [
 [crio.api]
 
 # listen is the path to the AF_LOCAL socket on which crio will listen.
-listen = "/var/run/crio.sock"
+listen = "/var/run/crio/crio.sock"
 
 # stream_address is the IP address on which the stream server will listen
 stream_address = ""
@@ -69,7 +69,7 @@ runtime_untrusted_workload = ""
 default_workload_trust = "trusted"
 
 # conmon is the path to conmon binary, used for managing the runtime.
-conmon = "/usr/libexec/crio/conmon"
+conmon = "/usr/bin/conmon"
 
 # conmon_env is the environment variable list for conmon process,
 # used for passing necessary environment variable to conmon or runtime.
@@ -132,8 +132,7 @@ insecure_registries = [
 
 # registries is used to specify a comma separated list of registries to be used
 # when pulling an unqualified image (e.g. fedora:rawhide).
-registries = [
-]
+registries = ['docker.io', 'registry.fedoraproject.org', 'registry.access.redhat.com']
 
 # The "crio.network" table contains settings pertaining to the
 # management of CNI plugins.
-- 
2.7.4

