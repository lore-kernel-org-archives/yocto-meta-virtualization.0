Return-Path: <thomas.perrot@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67432CA5FF0
	for <webhook@archiver.kernel.org>; Mon,  5 Oct 2026 11:36:49 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18032.1791200205933631135
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 05 Oct 2026 04:36:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=WuqHQwEK;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: thomas.perrot@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 918A64E4117E
	for <meta-virtualization@lists.yoctoproject.org>; Mon,  5 Oct 2026 11:36:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6520E604FE
	for <meta-virtualization@lists.yoctoproject.org>; Mon,  5 Oct 2026 11:36:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6A04A1033077A;
	Mon,  5 Oct 2026 13:36:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791200197; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=fXwo/E00tkVRBx2KZDSOpw3Om9KKaYd6dynJB/4EVXU=;
	b=WuqHQwEKBDi6lmym/qX7JES9uepQCLAw12ZvQMmZT/bVW3VY7PxTCByndQWPvqwgcx3I38
	HfarvxSWlue2MpYm3vmu7dbx4yE8O9vU+ZAYGPa+oBZ6PLPpvkc1hkNYh+tgCAkWFb2xoC
	DHzv15SbV36AdyqnjzbfXmoZtM34Nc0iJQS/AAbbPuJIsN4dlNH2nfs3XbbIyk6jMC6fqY
	m99brs0+loZjxlxEpN9Y5q2w02+Vnvblubm7WFtSahElace8NWQgSM82YQmTbzAkxPg7DZ
	4k3va7qqwjJlwmG6v3EPm8m3QIfHnaDaYfqCxwxlOGkdEYX4A6cxovdqO5+CsQ==
From: thomas.perrot@bootlin.com
To: meta-virtualization@lists.yoctoproject.org
Cc: thomas.petazzoni@bootlin.com,
	Thomas Perrot <thomas.perrot@bootlin.com>
Subject: [meta-virtualization][PATCH] fuse-overlayfs-snapshotter: add recipe
Date: Mon,  5 Oct 2026 13:36:30 +0200
Message-ID: <20261005113630.1669431-1-thomas.perrot@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 05 Oct 2026 11:36:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10107

From: Thomas Perrot <thomas.perrot@bootlin.com>

Add fuse-overlayfs-snapshotter v2.1.7, enabling containerd to use
fuse-overlayfs as its snapshotter. This supports container storage on
filesystems where kernel overlayfs is unavailable and rootless container
workloads on kernels without unprivileged overlayfs support.

Install the gRPC proxy service and its configuration example, along with
the generated Go module source and license metadata.

Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
---
 .../files/config.toml                         |   9 +
 .../files/containerd-fuse-overlayfs.service   |  15 +
 .../fuse-overlayfs-snapshotter_git.bb         |  95 +++++
 .../go-mod-cache.inc                          | 332 ++++++++++++++++++
 .../fuse-overlayfs-snapshotter/go-mod-git.inc | 312 ++++++++++++++++
 .../go-mod-hybrid-cache.inc                   |  34 ++
 .../go-mod-hybrid-git.inc                     |  31 ++
 .../go-mod-hybrid-gomod.inc                   | 303 ++++++++++++++++
 .../go-mod-licenses.inc                       |  50 +++
 9 files changed, 1181 insertions(+)
 create mode 100644 recipes-containers/fuse-overlayfs-snapshotter/files/c=
onfig.toml
 create mode 100644 recipes-containers/fuse-overlayfs-snapshotter/files/c=
ontainerd-fuse-overlayfs.service
 create mode 100644 recipes-containers/fuse-overlayfs-snapshotter/fuse-ov=
erlayfs-snapshotter_git.bb
 create mode 100644 recipes-containers/fuse-overlayfs-snapshotter/go-mod-=
cache.inc
 create mode 100644 recipes-containers/fuse-overlayfs-snapshotter/go-mod-=
git.inc
 create mode 100644 recipes-containers/fuse-overlayfs-snapshotter/go-mod-=
hybrid-cache.inc
 create mode 100644 recipes-containers/fuse-overlayfs-snapshotter/go-mod-=
hybrid-git.inc
 create mode 100644 recipes-containers/fuse-overlayfs-snapshotter/go-mod-=
hybrid-gomod.inc
 create mode 100644 recipes-containers/fuse-overlayfs-snapshotter/go-mod-=
licenses.inc

diff --git a/recipes-containers/fuse-overlayfs-snapshotter/files/config.t=
oml b/recipes-containers/fuse-overlayfs-snapshotter/files/config.toml
new file mode 100644
index 000000000000..4cd356365043
--- /dev/null
+++ b/recipes-containers/fuse-overlayfs-snapshotter/files/config.toml
@@ -0,0 +1,9 @@
+version =3D 2
+
+# The fuse-overlayfs snapshotter is provided by the containerd-fuse-over=
layfs-grpc
+# proxy plugin (containerd-fuse-overlayfs.service). Docker selects it wi=
th
+# "storage-driver": "fuse-overlayfs" in /etc/docker/daemon.json.
+[proxy_plugins]
+  [proxy_plugins."fuse-overlayfs"]
+    type =3D "snapshot"
+    address =3D "/run/containerd-fuse-overlayfs/containerd-fuse-overlayf=
s.sock"
diff --git a/recipes-containers/fuse-overlayfs-snapshotter/files/containe=
rd-fuse-overlayfs.service b/recipes-containers/fuse-overlayfs-snapshotter=
/files/containerd-fuse-overlayfs.service
new file mode 100644
index 000000000000..fd52d4842c33
--- /dev/null
+++ b/recipes-containers/fuse-overlayfs-snapshotter/files/containerd-fuse=
-overlayfs.service
@@ -0,0 +1,15 @@
+[Unit]
+Description=3Dcontainerd fuse-overlayfs snapshotter gRPC proxy plugin
+Documentation=3Dhttps://github.com/containerd/fuse-overlayfs-snapshotter
+After=3Dlocal-fs.target
+Before=3Dcontainerd.service docker.service
+
+[Service]
+RuntimeDirectory=3Dcontainerd-fuse-overlayfs
+ExecStart=3D/usr/bin/containerd-fuse-overlayfs-grpc /run/containerd-fuse=
-overlayfs/containerd-fuse-overlayfs.sock /mnt/data/containerd-fuse-overl=
ayfs
+Restart=3Don-failure
+RestartSec=3D5
+OOMScoreAdjust=3D-999
+
+[Install]
+WantedBy=3Dmulti-user.target
diff --git a/recipes-containers/fuse-overlayfs-snapshotter/fuse-overlayfs=
-snapshotter_git.bb b/recipes-containers/fuse-overlayfs-snapshotter/fuse-=
overlayfs-snapshotter_git.bb
new file mode 100644
index 000000000000..6dd363e3050e
--- /dev/null
+++ b/recipes-containers/fuse-overlayfs-snapshotter/fuse-overlayfs-snapsh=
otter_git.bb
@@ -0,0 +1,95 @@
+SUMMARY =3D "fuse-overlayfs snapshotter plugin for containerd"
+DESCRIPTION =3D "containerd proxy snapshotter plugin implementing the ov=
erlay \
+semantics with fuse-overlayfs, allowing the containerd image store to ru=
n \
+on filesystems without kernel overlayfs support (NFS, UBIFS)."
+
+HOMEPAGE =3D "https://github.com/containerd/fuse-overlayfs-snapshotter"
+LICENSE =3D "Apache-2.0"
+LIC_FILES_CHKSUM =3D "file://src/import/LICENSE;md5=3D1269f40c0d099c21a8=
71163984590d89"
+
+RDEPENDS:${PN} =3D "fuse-overlayfs"
+
+SRCREV_snapshotter =3D "da57796c7d0a2b608abf173651cf148706e33337"
+SRCREV_FORMAT =3D "snapshotter"
+
+SRC_URI =3D "git://github.com/containerd/fuse-overlayfs-snapshotter;prot=
ocol=3Dhttps;nobranch=3D1;name=3Dsnapshotter;destsuffix=3D${GO_SRCURI_DES=
TSUFFIX} \
+           file://containerd-fuse-overlayfs.service \
+           file://config.toml \
+"
+
+GO_MOD_FETCH_MODE ?=3D "hybrid"
+
+# VCS mode: all modules via git://
+include ${@ "go-mod-git.inc" if d.getVar("GO_MOD_FETCH_MODE") =3D=3D "vc=
s" else ""}
+include ${@ "go-mod-cache.inc" if d.getVar("GO_MOD_FETCH_MODE") =3D=3D "=
vcs" else ""}
+
+# Hybrid mode: gomod:// for most, git:// for selected
+include ${@ "go-mod-hybrid-gomod.inc" if d.getVar("GO_MOD_FETCH_MODE") =3D=
=3D "hybrid" else ""}
+include ${@ "go-mod-hybrid-git.inc" if d.getVar("GO_MOD_FETCH_MODE") =3D=
=3D "hybrid" else ""}
+include ${@ "go-mod-hybrid-cache.inc" if d.getVar("GO_MOD_FETCH_MODE") =3D=
=3D "hybrid" else ""}
+
+# Per-dependency license tracking
+require go-mod-licenses.inc
+
+GO_IMPORT =3D "import"
+
+PV =3D "2.1.7"
+
+# go-mod-discovery configuration
+GO_MOD_DISCOVERY_BUILD_TARGET =3D "./cmd/containerd-fuse-overlayfs-grpc"
+GO_MOD_DISCOVERY_LICENSE_TARGETS =3D "./cmd/containerd-fuse-overlayfs-gr=
pc"
+GO_MOD_DISCOVERY_GIT_REPO =3D "https://github.com/containerd/fuse-overla=
yfs-snapshotter.git"
+GO_MOD_DISCOVERY_GIT_REF =3D "${SRCREV_snapshotter}"
+
+inherit go goarch go-mod-discovery systemd
+
+COMPATIBLE_HOST =3D "^(?!mips).*"
+
+do_configure[noexec] =3D "1"
+
+do_compile() {
+	cd ${S}/src/import
+
+	export GOPATH=3D"${S}/src/import/.gopath:${STAGING_DIR_TARGET}/${prefix=
}/local/go"
+
+	# cgo is required on 32-bit targets: GOBUILDFLAGS contains
+	# -buildmode=3Dpie (added by the go class to satisfy the textrel QA
+	# check), and buildmode=3Dpie needs external linking there. Pass the
+	# needed cflags/ldflags so that cgo can find the needed headers
+	# files and libraries.
+	export CGO_ENABLED=3D"1"
+	export CGO_CFLAGS=3D"${CFLAGS}"
+	export CGO_LDFLAGS=3D"${LDFLAGS}"
+	export GOARCH=3D${TARGET_GOARCH}
+
+	mkdir -p ./bin
+	${GO} build ${GOBUILDFLAGS} -o ./bin/containerd-fuse-overlayfs-grpc ./c=
md/containerd-fuse-overlayfs-grpc
+}
+
+do_install() {
+	install -d ${D}${bindir}
+	install -m 0755 ${S}/src/import/bin/containerd-fuse-overlayfs-grpc ${D}=
${bindir}
+
+	if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)};=
 then
+		install -d ${D}${systemd_system_unitdir}
+		install -m 0644 ${UNPACKDIR}/containerd-fuse-overlayfs.service ${D}${s=
ystemd_system_unitdir}
+	fi
+
+	install -d ${D}${docdir}/${PN}
+	install -m 0644 ${UNPACKDIR}/config.toml ${D}${docdir}/${PN}/config.tom=
l
+
+	install -d ${D}${sysconfdir}/tmpfiles.d
+	echo "d /mnt/data/containerd-fuse-overlayfs 0700 root root - -" > ${D}$=
{sysconfdir}/tmpfiles.d/containerd-fuse-overlayfs.conf
+}
+
+SYSTEMD_PACKAGES =3D "${PN}"
+SYSTEMD_SERVICE:${PN} =3D "containerd-fuse-overlayfs.service"
+
+FILES:${PN} +=3D " \
+    ${systemd_system_unitdir}/containerd-fuse-overlayfs.service \
+    ${docdir}/${PN}/config.toml \
+    ${sysconfdir}/tmpfiles.d/containerd-fuse-overlayfs.conf \
+"
+
+# INHIBIT_PACKAGE_STRIP =3D "1"
+# INSANE_SKIP:${PN} +=3D "ldflags"
diff --git a/recipes-containers/fuse-overlayfs-snapshotter/go-mod-cache.i=
nc b/recipes-containers/fuse-overlayfs-snapshotter/go-mod-cache.inc
new file mode 100644
index 000000000000..42d18179c303
--- /dev/null
+++ b/recipes-containers/fuse-overlayfs-snapshotter/go-mod-cache.inc
@@ -0,0 +1,332 @@
+# Generated by oe-go-mod-fetcher.py v3.0.0
+# Module cache data for Go dependencies
+#
+# This file contains recipe-specific module metadata.
+# The task implementations are in go-mod-vcs.bbclass.
+
+inherit go-mod-vcs
+
+# Module metadata for cache building (one module per line)
+GO_MODULE_CACHE_DATA =3D '[\
+{"module":"tags.cncf.io/container-device-interface","version":"v1.0.1","=
vcs_hash":"228f05c3a05800a5e1340385d34910aac599df817838e50aa367b9cd091511=
86","timestamp":"2025-03-22T07:35:24Z","subdir":"","vcs_ref":"refs/tags/v=
1.0.1"},\
+{"module":"tags.cncf.io/container-device-interface/specs-go","version":"=
v1.0.0","vcs_hash":"a9b36137e55bc5c537c3eddc79e73eca4dc1c855628a8e32e0271=
03df4d865f4","timestamp":"2025-03-07T16:36:12Z","subdir":"specs-go","vcs_=
ref":"refs/tags/specs-go/v1.0.0"},\
+{"module":"sigs.k8s.io/yaml","version":"v1.6.0","vcs_hash":"289ff1bc36e2=
275d8f58e8de4b1e27b0cabf0d8bfcb2058f040045490a48f9fc","timestamp":"2025-0=
7-24T18:12:28Z","subdir":"","vcs_ref":"refs/tags/v1.6.0"},\
+{"module":"sigs.k8s.io/structured-merge-diff/v6","version":"v6.3.0","vcs=
_hash":"d66ac94ec61bd2ff1830ecd910c5ba59307d9987a0b5e8bc4d43eed2a9670e03"=
,"timestamp":"2025-07-16T20:34:24Z","subdir":"","vcs_ref":"refs/tags/v6.3=
.0"},\
+{"module":"sigs.k8s.io/json","version":"v0.0.0-20241014173422-cfa47c3a1c=
c8","vcs_hash":"af72b3861f1b450d8fac535a64ce765bba3c291956ec3c652a5f54db4=
6add460","timestamp":"2024-10-14T17:34:22Z","subdir":"","vcs_ref":""},\
+{"module":"sigs.k8s.io/randfill","version":"v1.0.0","vcs_hash":"64598686=
d0dc1d499a7860fd9d58ec01370c353b03b4e9377d668d615af13dc6","timestamp":"20=
25-03-04T18:23:53Z","subdir":"","vcs_ref":"refs/tags/v1.0.0"},\
+{"module":"k8s.io/utils","version":"v0.0.0-20250604170112-4c0f3b243397",=
"vcs_hash":"60ee1a48e44e3b939997e0fd54e801d1b11cfe7183c5f295746d2564bd686=
0e8","timestamp":"2025-06-04T17:01:12Z","subdir":"","vcs_ref":""},\
+{"module":"k8s.io/klog/v2","version":"v2.130.1","vcs_hash":"eaab5e8e1958=
570d9bced9a912298fdaa9472cecec794161f58aebf8c4d1e963","timestamp":"2024-0=
6-20T00:51:19Z","subdir":"","vcs_ref":"refs/tags/v2.130.1"},\
+{"module":"k8s.io/cri-api","version":"v0.34.1","vcs_hash":"7301e739a4795=
b683b66e93dd7c6f440f5c5fddd2ad7816c05a5678c723aca60","timestamp":"2025-08=
-16T07:57:26Z","subdir":"","vcs_ref":"refs/tags/v0.34.1"},\
+{"module":"k8s.io/client-go","version":"v0.34.1","vcs_hash":"25b2ca19570=
dcf36fcfa8a5388cc7647944fee1a9a445671e69704dbd6f452b5","timestamp":"2025-=
09-10T04:55:33Z","subdir":"","vcs_ref":"refs/tags/v0.34.1"},\
+{"module":"k8s.io/apimachinery","version":"v0.34.1","vcs_hash":"9131e9eb=
e36078f01c5a5e8e9866300b853aa46fab527d00fc089d4c16938663","timestamp":"20=
25-08-16T07:57:26Z","subdir":"","vcs_ref":"refs/tags/v0.34.1"},\
+{"module":"k8s.io/api","version":"v0.34.1","vcs_hash":"5c4bbd0617f6f594b=
275f1999f97eca8f79dbb30e908e7d6b5c7a80fd5b9b0d2","timestamp":"2025-09-10T=
04:39:36Z","subdir":"","vcs_ref":"refs/tags/v0.34.1"},\
+{"module":"go.yaml.in/yaml/v2","version":"v2.4.2","vcs_hash":"8e5c657c86=
d0e182b5f4d6ed3715a0ec93dfb998d8ef94555af035578a3aba8d","timestamp":"2025=
-06-02T16:37:17Z","subdir":"","vcs_ref":"refs/tags/v2.4.2"},\
+{"module":"go.uber.org/mock","version":"v0.5.0","vcs_hash":"84690e1069b4=
ad70e2d5fec3d8f934623d7d299829df8ba8c5fcaeec38806c67","timestamp":"2024-1=
0-17T21:35:14Z","subdir":"","vcs_ref":"refs/tags/v0.5.0"},\
+{"module":"go.uber.org/goleak","version":"v1.3.0","vcs_hash":"358840d6c8=
d4d8a268b95a505fd6f93da14af34041c0824fe51920b4cd523ae2","timestamp":"2023=
-10-24T16:28:03Z","subdir":"","vcs_ref":"refs/tags/v1.3.0"},\
+{"module":"dario.cat/mergo","version":"v1.0.2","vcs_hash":"b16914f71b927=
e268f1d35e84fd54af7eca655000013af4d0f184bcbd154847c","timestamp":"2025-05=
-07T20:15:06Z","subdir":"","vcs_ref":"refs/tags/v1.0.2"},\
+{"module":"cel.dev/expr","version":"v0.24.0","vcs_hash":"22be8bab702f88e=
e991b30c18c7bac8535814d8de3215c69ac9ee1e73da82c45","timestamp":"2025-05-0=
7T15:31:15Z","subdir":"","vcs_ref":"refs/tags/v0.24.0"},\
+{"module":"gopkg.in/inf.v0","version":"v0.9.1","vcs_hash":"61185ca91404d=
2e09a193aede807b4a9ededd43199f58cd49ec4cef480d7bc7f","timestamp":"2018-03=
-26T17:23:32Z","subdir":"","vcs_ref":"refs/tags/v0.9.1"},\
+{"module":"gopkg.in/yaml.v3","version":"v3.0.0-20200313102051-9f266ea9e7=
7c","vcs_hash":"ae6e6119974a43d5668501b6efe7e743408319dee4094d1929d3e75a4=
f5dac98","timestamp":"2020-03-13T10:20:51Z","subdir":"","vcs_ref":""},\
+{"module":"gopkg.in/yaml.v3","version":"v3.0.1","vcs_hash":"8d340fff421a=
1861f196061b40e49b2f9e802647204935d08e1062b8ecd90b0d","timestamp":"2022-0=
5-27T08:35:30Z","subdir":"","vcs_ref":"refs/tags/v3.0.1"},\
+{"module":"gopkg.in/check.v1","version":"v0.0.0-20161208181325-20d25e280=
405","vcs_hash":"f6f7125ac7ef086ca6395a14a9a28c8c11cd6f8790a8be7cfd6475d1=
acd0f40b","timestamp":"2016-12-08T18:13:25Z","subdir":"","vcs_ref":""},\
+{"module":"gopkg.in/check.v1","version":"v1.0.0-20201130134442-10cb98267=
c6c","vcs_hash":"b8ed7c01feb15e76511fd0dcf4b7d5e0ab535f96b5fe0e22cd9854a7=
58a6c38d","timestamp":"2020-11-30T13:44:42Z","subdir":"","vcs_ref":""},\
+{"module":"go.opentelemetry.io/proto/otlp","version":"v1.5.0","vcs_hash"=
:"bb2df70072e7b2abbf91b8af5835a5535fafdffbd50581924af5c001b24385f3","time=
stamp":"2025-01-06T12:02:47Z","subdir":"otlp","vcs_ref":"refs/tags/otlp/v=
1.5.0"},\
+{"module":"go.opentelemetry.io/otel","version":"v1.37.0","vcs_hash":"781=
ff191099a4dbb688b1ab043b1c6ab5c6d691f0f32fade9b2451f7eb5f55dc","timestamp=
":"2025-06-25T06:41:12Z","subdir":"","vcs_ref":"refs/tags/v1.37.0"},\
+{"module":"go.opentelemetry.io/otel/exporters/otlp/otlptrace","version":=
"v1.35.0","vcs_hash":"b9cfff93834a1198be78227766ecca2711856b6b1b0c7afbad3=
71f153e4a7552","timestamp":"2025-03-05T18:33:59Z","subdir":"exporters/otl=
p/otlptrace","vcs_ref":"refs/tags/exporters/otlp/otlptrace/v1.35.0"},\
+{"module":"go.opentelemetry.io/otel/exporters/otlp/otlptrace/otlptraceht=
tp","version":"v1.35.0","vcs_hash":"b9cfff93834a1198be78227766ecca2711856=
b6b1b0c7afbad371f153e4a7552","timestamp":"2025-03-05T18:33:59Z","subdir":=
"exporters/otlp/otlptrace/otlptracehttp","vcs_ref":"refs/tags/exporters/o=
tlp/otlptrace/otlptracehttp/v1.35.0"},\
+{"module":"go.opentelemetry.io/otel/exporters/otlp/otlptrace/otlptracegr=
pc","version":"v1.35.0","vcs_hash":"b9cfff93834a1198be78227766ecca2711856=
b6b1b0c7afbad371f153e4a7552","timestamp":"2025-03-05T18:33:59Z","subdir":=
"exporters/otlp/otlptrace/otlptracegrpc","vcs_ref":"refs/tags/exporters/o=
tlp/otlptrace/otlptracegrpc/v1.35.0"},\
+{"module":"go.opentelemetry.io/otel/trace","version":"v1.37.0","vcs_hash=
":"781ff191099a4dbb688b1ab043b1c6ab5c6d691f0f32fade9b2451f7eb5f55dc","tim=
estamp":"2025-06-25T06:41:12Z","subdir":"trace","vcs_ref":"refs/tags/trac=
e/v1.37.0"},\
+{"module":"go.opentelemetry.io/otel/sdk","version":"v1.37.0","vcs_hash":=
"781ff191099a4dbb688b1ab043b1c6ab5c6d691f0f32fade9b2451f7eb5f55dc","times=
tamp":"2025-06-25T06:41:12Z","subdir":"sdk","vcs_ref":"refs/tags/sdk/v1.3=
7.0"},\
+{"module":"go.opentelemetry.io/otel/sdk/metric","version":"v1.37.0","vcs=
_hash":"781ff191099a4dbb688b1ab043b1c6ab5c6d691f0f32fade9b2451f7eb5f55dc"=
,"timestamp":"2025-06-25T06:41:12Z","subdir":"sdk/metric","vcs_ref":"refs=
/tags/sdk/metric/v1.37.0"},\
+{"module":"go.opentelemetry.io/otel/metric","version":"v1.37.0","vcs_has=
h":"781ff191099a4dbb688b1ab043b1c6ab5c6d691f0f32fade9b2451f7eb5f55dc","ti=
mestamp":"2025-06-25T06:41:12Z","subdir":"metric","vcs_ref":"refs/tags/me=
tric/v1.37.0"},\
+{"module":"go.opentelemetry.io/contrib/detectors/gcp","version":"v1.36.0=
","vcs_hash":"66834093881db18fc755a4aa1f4a68c031d78efbf6766aeccc5cec78359=
7bb87","timestamp":"2025-05-22T14:29:43Z","subdir":"detectors/gcp","vcs_r=
ef":"refs/tags/detectors/gcp/v1.36.0"},\
+{"module":"go.opentelemetry.io/contrib/instrumentation/google.golang.org=
/grpc/otelgrpc","version":"v0.60.0","vcs_hash":"e68cfa240102a0ba411506ff8=
b1aa264dbdc8d1fde95e16ea08f3695aad05b0b","timestamp":"2025-03-06T01:43:27=
Z","subdir":"instrumentation/google.golang.org/grpc/otelgrpc","vcs_ref":"=
refs/tags/instrumentation/google.golang.org/grpc/otelgrpc/v0.60.0"},\
+{"module":"go.opentelemetry.io/contrib/instrumentation/net/http/otelhttp=
","version":"v0.60.0","vcs_hash":"e68cfa240102a0ba411506ff8b1aa264dbdc8d1=
fde95e16ea08f3695aad05b0b","timestamp":"2025-03-06T01:43:27Z","subdir":"i=
nstrumentation/net/http/otelhttp","vcs_ref":"refs/tags/instrumentation/ne=
t/http/otelhttp/v0.60.0"},\
+{"module":"go.opentelemetry.io/auto/sdk","version":"v1.1.0","vcs_hash":"=
7d299be0b1f84cdc22954c7fe0a7398309e62b99c0488a544fd0be16b0db85f4","timest=
amp":"2024-12-05T17:49:43Z","subdir":"sdk","vcs_ref":"refs/tags/sdk/v1.1.=
0"},\
+{"module":"go.opencensus.io","version":"v0.24.0","vcs_hash":"8607148e6fb=
ec2ab3d0020ea3ffb8bdce7bc15dae97ebec60385afa6ddb97c29","timestamp":"2022-=
11-03T20:13:50Z","subdir":"","vcs_ref":"refs/tags/v0.24.0"},\
+{"module":"gonum.org/v1/gonum","version":"v0.16.0","vcs_hash":"525f00d61=
16e74b77041f8bb562564ec0e4c1d66d02a48c7b8093f8f931ae1c4","timestamp":"202=
5-03-21T18:40:20Z","subdir":"","vcs_ref":"refs/tags/v0.16.0"},\
+{"module":"cloud.google.com/go/compute/metadata","version":"v0.7.0","vcs=
_hash":"af589471350866ad3ad2a6aa6c7dc61e09cf4bf82c155b086a7852014fe178c8"=
,"timestamp":"2025-05-13T23:14:54Z","subdir":"compute/metadata","vcs_ref"=
:"refs/tags/compute/metadata/v0.7.0"},\
+{"module":"go.etcd.io/gofail","version":"v0.2.0","vcs_hash":"94af41cb379=
1d3446ad2efcce59de525d2df0ae4cf689775b2914bcf4100d3a8","timestamp":"2024-=
06-19T04:45:01Z","subdir":"","vcs_ref":"refs/tags/v0.2.0"},\
+{"module":"go.etcd.io/bbolt","version":"v1.4.3","vcs_hash":"5983ea71bb9e=
5e22aede686f4e2d57552e937bd9f2a5a3ca5e595c01b957c33a","timestamp":"2025-0=
8-19T17:17:23Z","subdir":"","vcs_ref":"refs/tags/v1.4.3"},\
+{"module":"golang.org/x/time","version":"v0.14.0","vcs_hash":"0b5a85f52d=
49b5c97b97cde355131c98905f13038f61a5848c4d01a01512f74b","timestamp":"2025=
-09-16T23:29:52Z","subdir":"","vcs_ref":"refs/tags/v0.14.0"},\
+{"module":"golang.org/x/term","version":"v0.34.0","vcs_hash":"4068bd62e6=
33557f5121f1150b74cc041354352d709c0b6f81073ee6de3b795a","timestamp":"2025=
-08-07T14:52:19Z","subdir":"","vcs_ref":"refs/tags/v0.34.0"},\
+{"module":"golang.org/x/tools","version":"v0.35.0","vcs_hash":"6f7867e63=
04cc0b73a1fd60c236062aaec4940936d8451f9889a59124598273f","timestamp":"202=
5-07-11T16:19:56Z","subdir":"","vcs_ref":"refs/tags/v0.35.0"},\
+{"module":"golang.org/x/oauth2","version":"v0.30.0","vcs_hash":"9d690404=
d55fe61f12b60291b8248b30b26748c84367097aae3de38a202f1504","timestamp":"20=
25-04-30T15:42:02Z","subdir":"","vcs_ref":"refs/tags/v0.30.0"},\
+{"module":"golang.org/x/mod","version":"v0.29.0","vcs_hash":"e2f24273f66=
162f4a2bfde7357a860b565262f0932e1d1bcba22f2c375336f39","timestamp":"2025-=
10-08T15:23:01Z","subdir":"","vcs_ref":"refs/tags/v0.29.0"},\
+{"module":"golang.org/x/exp","version":"v0.0.0-20241108190413-2d47ceb269=
2f","vcs_hash":"fa78cf25fa01c74cefb0336713724c43d794cf309539a0b58c51aa1c4=
13b6612","timestamp":"2024-11-08T19:04:13Z","subdir":"","vcs_ref":""},\
+{"module":"golang.org/x/crypto","version":"v0.41.0","vcs_hash":"e7261c94=
7a2da7702ddfbd8b4b2103f3f83b5024b046bd0f0762dddf1cc0b39d","timestamp":"20=
25-08-07T17:21:04Z","subdir":"","vcs_ref":"refs/tags/v0.41.0"},\
+{"module":"golang.org/x/text","version":"v0.28.0","vcs_hash":"a7d5fe8772=
3af3c471d5ed18e25d604d34081f39ab1219b457b5da3a8ff54d08","timestamp":"2025=
-08-07T14:53:29Z","subdir":"","vcs_ref":"refs/tags/v0.28.0"},\
+{"module":"golang.org/x/net","version":"v0.43.0","vcs_hash":"82a07fe1904=
c263f9f213772e8b13c56a46fabfea0ee1ca2eed4873551103c0e","timestamp":"2025-=
08-07T19:56:06Z","subdir":"","vcs_ref":"refs/tags/v0.43.0"},\
+{"module":"golang.org/x/sys","version":"v0.37.0","vcs_hash":"d42e571dbce=
072ee3cd8b155fac41a1903dbf8dea6dd0be1ac8aeda71971e97d","timestamp":"2025-=
10-02T20:28:30Z","subdir":"","vcs_ref":"refs/tags/v0.37.0"},\
+{"module":"golang.org/x/sync","version":"v0.17.0","vcs_hash":"77b1c2128d=
3d3a72f0ab85d6800e7273fdd14749e9845be6f1c126d8c02f57fc","timestamp":"2025=
-08-13T14:47:05Z","subdir":"","vcs_ref":"refs/tags/v0.17.0"},\
+{"module":"github.com/zeebo/errs","version":"v1.4.0","vcs_hash":"c48b324=
7a05cb20bf2a81d75ef369d317463f64a4267ed1c3e73da685dd8fa09","timestamp":"2=
023-05-08T22:56:17Z","subdir":"","vcs_ref":"refs/tags/v1.4.0"},\
+{"module":"github.com/xrash/smetrics","version":"v0.0.0-20240521201337-6=
86a1a2994c1","vcs_hash":"39f621debd197a5e0bcda4514cb54d787e4e443693f31736=
3918ceb70d590944","timestamp":"2024-05-21T20:13:37Z","subdir":"","vcs_ref=
":""},\
+{"module":"github.com/yashtewari/glob-intersection","version":"v0.2.0","=
vcs_hash":"f808bebdb4b58643c351139a2ad430afee40f2154d96cfe1086091dbffa08d=
35","timestamp":"2023-06-22T20:17:32Z","subdir":"","vcs_ref":"refs/tags/v=
0.2.0"},\
+{"module":"github.com/xeipuuv/gojsonreference","version":"v0.0.0-2018012=
7040603-bd5ef7bd5415","vcs_hash":"6cce19ebe3be9e8f13d8b3c5090971f010f3f3c=
da349fa51197c974450d133ee","timestamp":"2018-01-27T04:06:03Z","subdir":""=
,"vcs_ref":""},\
+{"module":"github.com/xeipuuv/gojsonpointer","version":"v0.0.0-201909051=
94746-02993c407bfb","vcs_hash":"4b0abfc7aeea962cf44836059fabc8aebf20db8d2=
e9ce317db13d42ade75c19f","timestamp":"2019-09-05T19:47:46Z","subdir":"","=
vcs_ref":""},\
+{"module":"github.com/x448/float16","version":"v0.8.4","vcs_hash":"e395e=
ca01f11e874b5b2b165e3dc2620faa30374fb308657449d3a3023ce5cbb","timestamp":=
"2020-01-17T18:31:28Z","subdir":"","vcs_ref":"refs/tags/v0.8.4"},\
+{"module":"github.com/vishvananda/netns","version":"v0.0.5","vcs_hash":"=
9f1ef5c3417729b4f24554f4b88d06d9e7cdeb771a5d62000cc1344bb1c985d8","timest=
amp":"2024-08-13T19:31:45Z","subdir":"","vcs_ref":"refs/tags/v0.0.5"},\
+{"module":"github.com/vishvananda/netlink","version":"v1.3.1","vcs_hash"=
:"add152ec680cd6ba7b1daeb50425ed8986ca51024d78c50810923119dbf60a49","time=
stamp":"2025-05-09T18:59:25Z","subdir":"","vcs_ref":"refs/tags/v1.3.1"},\
+{"module":"github.com/vbatts/tar-split","version":"v0.11.3","vcs_hash":"=
73d588e2ca387fd17befa8dbe72f26485ff53e601a1fe3d7ecda3c716b4fdac7","timest=
amp":"2023-03-26T02:25:25Z","subdir":"","vcs_ref":"refs/tags/v0.11.3"},\
+{"module":"github.com/urfave/cli","version":"v1.22.15","vcs_hash":"b0eb7=
1ed2c128bfda3da72798845f362addf53e6bd24c90f8c51c74afe3acec9","timestamp":=
"2024-04-27T03:07:03Z","subdir":"","vcs_ref":"refs/tags/v1.22.15"},\
+{"module":"github.com/urfave/cli/v2","version":"v2.27.7","vcs_hash":"b06=
3b9db6f64a681153d8de9f4474fe963c29b610e0cb156372dbc3dffad882a","timestamp=
":"2025-06-14T02:47:17Z","subdir":"","vcs_ref":"refs/tags/v2.27.7"},\
+{"module":"github.com/veraison/go-cose","version":"v1.1.0","vcs_hash":"5=
0c5af8aef66bbc4e1a8a9f6b19b68ca530de0496e90d9cd401290662aa52946","timesta=
mp":"2023-05-18T12:32:47Z","subdir":"","vcs_ref":"refs/tags/v1.1.0"},\
+{"module":"github.com/tetratelabs/wazero","version":"v1.9.0","vcs_hash":=
"8184e4b8a52d22bbf7a3100e9a800f7f69b67c8a4a0349fa457cf7c0f1833060","times=
tamp":"2025-02-18T15:24:27Z","subdir":"","vcs_ref":"refs/tags/v1.9.0"},\
+{"module":"github.com/tchap/go-patricia/v2","version":"v2.3.3","vcs_hash=
":"196ec21f158dd5c10370dcd9b618d17460a5f3dec6cbc351a797a1a4f906b7bb","tim=
estamp":"2025-07-01T06:30:56Z","subdir":"","vcs_ref":"refs/tags/v2.3.3"},=
\
+{"module":"github.com/spiffe/go-spiffe/v2","version":"v2.5.0","vcs_hash"=
:"1493a5bfbe7b3525b8e369dad6284bf19f8510cf53db0a7f023db2d97777cabd","time=
stamp":"2025-01-31T20:43:36Z","subdir":"","vcs_ref":"refs/tags/v2.5.0"},\
+{"module":"github.com/stefanberger/go-pkcs11uri","version":"v0.0.0-20230=
803200340-78284954bff6","vcs_hash":"38fa201d7d655497d33723d139ffc3ec2ee78=
d3caab251015a1c3a5190f5e073","timestamp":"2023-08-03T20:03:40Z","subdir":=
"","vcs_ref":""},\
+{"module":"github.com/smallstep/pkcs7","version":"v0.1.1","vcs_hash":"2f=
19e869b678f6b075729ec3df26ac81f8f576057860ead9a9c70212023b6927","timestam=
p":"2024-12-16T14:13:52Z","subdir":"","vcs_ref":"refs/tags/v0.1.1"},\
+{"module":"github.com/spf13/cobra","version":"v1.8.1","vcs_hash":"2d91d6=
bc5de03fdd7c7a38386c83b43ea19399859bc492d6f78c8a36a38a0a6f","timestamp":"=
2024-06-01T10:31:11Z","subdir":"","vcs_ref":"refs/tags/v1.8.1"},\
+{"module":"github.com/spf13/pflag","version":"v1.0.6","vcs_hash":"b7f51c=
906eabb517613129455992f23a2f48e1c6186855b1b66ba9e619db1aa4","timestamp":"=
2025-01-09T00:37:54Z","subdir":"","vcs_ref":"refs/tags/v1.0.6"},\
+{"module":"github.com/sasha-s/go-deadlock","version":"v0.3.5","vcs_hash"=
:"fa29175221f16401d041954c9a07bc5aa8b90d585d480873eaa15a18b5fa8e6d","time=
stamp":"2024-08-14T18:50:39Z","subdir":"","vcs_ref":"refs/tags/v0.3.5"},\
+{"module":"github.com/santhosh-tekuri/jsonschema/v5","version":"v5.3.1",=
"vcs_hash":"9964fa94eb99b405ebcfa3af19e0e16d07aef590c7af497cdfc6743aa4544=
776","timestamp":"2023-07-22T18:48:50Z","subdir":"","vcs_ref":"refs/tags/=
v5.3.1"},\
+{"module":"github.com/russross/blackfriday","version":"v1.6.0","vcs_hash=
":"45882c51d4da17f32775abbdabd353753e5115f6ec6282c3bf028fe3471fc743","tim=
estamp":"2020-10-27T03:46:40Z","subdir":"","vcs_ref":"refs/tags/v1.6.0"},=
\
+{"module":"github.com/russross/blackfriday/v2","version":"v2.1.0","vcs_h=
ash":"6dd1604eceba1790dbf7f827f1e22a5866a5348a2ab616daed7363a6e16e081d","=
timestamp":"2020-10-27T03:47:54Z","subdir":"v2","vcs_ref":"refs/tags/v2.1=
.0"},\
+{"module":"github.com/rcrowley/go-metrics","version":"v0.0.0-20200313005=
456-10cdbea86bc0","vcs_hash":"72f5f2e29a16b9692a19a2b94e23cbbb89dbabf006c=
0af691e69618cebfb7b5b","timestamp":"2020-03-13T00:54:56Z","subdir":"","vc=
s_ref":""},\
+{"module":"github.com/planetscale/vtprotobuf","version":"v0.6.1-0.202403=
19094008-0393e58bdf10","vcs_hash":"2a8f7a744764b6b7d0f6b17003fd8217cc861b=
e946aee65fccc7d1491634942f","timestamp":"2024-03-19T09:40:08Z","subdir":"=
","vcs_ref":""},\
+{"module":"github.com/petermattis/goid","version":"v0.0.0-20240813172612=
-4fcff4a6cae7","vcs_hash":"28fe23d2ffb5463ca74406309be8d07f56f5b77b8f151b=
1f3d5a8edf6d6ae9be","timestamp":"2024-08-13T17:26:12Z","subdir":"","vcs_r=
ef":""},\
+{"module":"github.com/pelletier/go-toml","version":"v1.9.5","vcs_hash":"=
22bc2e212b193b23af04b0014dd6e6f15e66953913e88670099f8375927b48c7","timest=
amp":"2022-01-05T14:17:32Z","subdir":"","vcs_ref":"refs/tags/v1.9.5"},\
+{"module":"github.com/pelletier/go-toml/v2","version":"v2.2.4","vcs_hash=
":"024e6f520632e6be8a8fbc0202fdf0da2cfc0266ff95451a8e8d944dd0d8882f","tim=
estamp":"2025-04-07T11:11:38Z","subdir":"","vcs_ref":"refs/tags/v2.2.4"},=
\
+{"module":"github.com/open-policy-agent/opa","version":"v0.70.0","vcs_ha=
sh":"641f2a5b6fed75b61eb34170348c055f38b88df452e53b69fd5fb5f5707b475c","t=
imestamp":"2024-10-31T19:39:52Z","subdir":"","vcs_ref":"refs/tags/v0.70.0=
"},\
+{"module":"github.com/mxk/go-flowrate","version":"v0.0.0-20140419014527-=
cca7078d478f","vcs_hash":"12c25c020a66ecc07c7c90ff8a8793d5462f3f4e58338c9=
b36012b25b4ed81b8","timestamp":"2014-04-19T01:45:27Z","subdir":"","vcs_re=
f":""},\
+{"module":"github.com/munnerz/goautoneg","version":"v0.0.0-2019101008341=
6-a7dc8b61c822","vcs_hash":"0f68eeb31e17a8fc96eede1943fe26be5835b08f5cc4a=
9eee4ed1b8eee4887ee","timestamp":"2019-10-10T08:34:16Z","subdir":"","vcs_=
ref":""},\
+{"module":"github.com/modern-go/reflect2","version":"v1.0.3-0.2025032223=
2337-35a7c28c31ee","vcs_hash":"b0f41ee692517b4a6786fb48ce9d49e532c4f77cac=
6cacadd6ff49dcb7325931","timestamp":"2025-03-22T23:23:37Z","subdir":"","v=
cs_ref":""},\
+{"module":"github.com/modern-go/concurrent","version":"v0.0.0-2018030601=
2644-bacd9c7ef1dd","vcs_hash":"09a996e0549b43adaeb1c40a8dc339563ed1a8dcc8=
31e5cb074441a30d502d23","timestamp":"2018-03-06T01:26:44Z","subdir":"","v=
cs_ref":""},\
+{"module":"github.com/mitchellh/go-homedir","version":"v1.1.0","vcs_hash=
":"0466071bcdbaca5ed0a5cdacf380534de6af614c1d6ebac6ec08513f20ffc5ad","tim=
estamp":"2019-01-27T04:21:35Z","subdir":"","vcs_ref":"refs/tags/v1.1.0"},=
\
+{"module":"github.com/mistifyio/go-zfs/v3","version":"v3.0.1","vcs_hash"=
:"14a067948c9001a8443e88278679f597430282136bcd53894095ccfed51182ca","time=
stamp":"2023-05-23T02:04:01Z","subdir":"","vcs_ref":"refs/tags/v3.0.1"},\
+{"module":"github.com/miekg/pkcs11","version":"v1.1.1","vcs_hash":"cfc32=
d6973be9c203ec1d8480b59f61c59be67d146de9d920f82d4eb7c4d994a","timestamp":=
"2022-01-05T09:50:38Z","subdir":"","vcs_ref":"refs/tags/v1.1.1"},\
+{"module":"github.com/mdlayher/vsock","version":"v1.2.1","vcs_hash":"a7b=
2ec13026e78d41b91e1e452aab0a78ae155b70966624ec8e5e52ba56a0b08","timestamp=
":"2023-04-29T14:19:24Z","subdir":"","vcs_ref":"refs/tags/v1.2.1"},\
+{"module":"github.com/mdlayher/socket","version":"v0.5.1","vcs_hash":"ad=
e2a4b5630096b489828944f4f75b866125a6d37fc95c3524f0cc002cbe8cf9","timestam=
p":"2024-03-15T15:39:10Z","subdir":"","vcs_ref":"refs/tags/v0.5.1"},\
+{"module":"github.com/mattn/go-shellwords","version":"v1.0.12","vcs_hash=
":"3e9de7967c04a07a314669e56b72110ac8eee96a9646f5b9863c709575abe8d1","tim=
estamp":"2021-06-04T13:07:19Z","subdir":"","vcs_ref":"refs/tags/v1.0.12"}=
,\
+{"module":"github.com/linuxkit/virtsock","version":"v0.0.0-2020101023201=
2-f8cee7dfc7a3","vcs_hash":"706021837a1fd29aa5615d81a9fc5095a64d5a29eb285=
50399942b9a15e7881f","timestamp":"2020-10-10T23:20:12Z","subdir":"","vcs_=
ref":""},\
+{"module":"github.com/lestrrat-go/option","version":"v1.0.1","vcs_hash":=
"1f8dcec97d12a81cde1ec2ba90e51e5a7642e0b6ac69fa6d060c924499d9e826","times=
tamp":"2022-12-15T23:46:30Z","subdir":"","vcs_ref":"refs/tags/v1.0.1"},\
+{"module":"github.com/lestrrat-go/jwx","version":"v1.2.29","vcs_hash":"0=
222375b3ed66cac8023dafca7428deb89df4aeb20d854951140e101b0c5f28b","timesta=
mp":"2024-03-07T02:56:40Z","subdir":"","vcs_ref":"refs/tags/v1.2.29"},\
+{"module":"github.com/lestrrat-go/iter","version":"v1.0.2","vcs_hash":"8=
798d95cb251c99e3a5db9f362a5935bbe2e986c343f71908f1aecf634de6fbf","timesta=
mp":"2022-03-29T05:42:43Z","subdir":"","vcs_ref":"refs/tags/v1.0.2"},\
+{"module":"github.com/lestrrat-go/httpcc","version":"v1.0.1","vcs_hash":=
"466b0cb68191ccc31d667d0e1cf8f0eec07556bbc61fdad149b67379fba0f789","times=
tamp":"2022-03-29T04:21:01Z","subdir":"","vcs_ref":"refs/tags/v1.0.1"},\
+{"module":"github.com/lestrrat-go/blackmagic","version":"v1.0.2","vcs_ha=
sh":"27d85daf215783d115f87d7b6624f7770dd9d8cbe340e8b4bef8784123d8c5f9","t=
imestamp":"2022-11-07T10:26:54Z","subdir":"","vcs_ref":"refs/tags/v1.0.2"=
},\
+{"module":"github.com/lestrrat-go/backoff/v2","version":"v2.0.8","vcs_ha=
sh":"cac61700ad617eae68ad7b4b604e2484e0a4f702cfdf125e784add42fc9af8c1","t=
imestamp":"2021-02-28T05:19:12Z","subdir":"v2","vcs_ref":"refs/tags/v2.0.=
8"},\
+{"module":"github.com/knqyf263/go-plugin","version":"v0.9.0","vcs_hash":=
"a8467353858eb68db6c0dd39ab99d740baa3155c9ebe2dee04be36a524fc48f7","times=
tamp":"2025-03-11T05:42:07Z","subdir":"","vcs_ref":"refs/tags/v0.9.0"},\
+{"module":"github.com/json-iterator/go","version":"v1.1.12","vcs_hash":"=
bdb67d21e426f2274ff76d4829ac60348539016b1aa54fa98cfccc554be12f3b","timest=
amp":"2021-09-11T02:17:26Z","subdir":"","vcs_ref":"refs/tags/v1.1.12"},\
+{"module":"github.com/josephspurrier/goversioninfo","version":"v1.5.0","=
vcs_hash":"b14f0e2f17bab02822d89dad4f493816dcdc4b2d99b9f56600d21318edc8d3=
fc","timestamp":"2025-04-02T16:32:54Z","subdir":"","vcs_ref":"refs/tags/v=
1.5.0"},\
+{"module":"github.com/intel/goresctrl","version":"v0.10.0","vcs_hash":"2=
9a6109926a2e174fae849b3c015435e64e4f34ea86919fbc693930c06128b9b","timesta=
mp":"2025-11-03T07:45:09Z","subdir":"","vcs_ref":"refs/tags/v0.10.0"},\
+{"module":"github.com/hashicorp/errwrap","version":"v1.1.0","vcs_hash":"=
a0949020a0c14672f86d32cbf0d984b8d048a27e6f75aeac79f8ca3f7cc4ecae","timest=
amp":"2020-07-14T15:51:01Z","subdir":"","vcs_ref":"refs/tags/v1.1.0"},\
+{"module":"github.com/inconshreveable/mousetrap","version":"v1.1.0","vcs=
_hash":"a9f0ac4cf05240ceb9790811cbd8ab3cbdcd404501a9ca5a402a28033e7235d8"=
,"timestamp":"2022-11-27T22:01:53Z","subdir":"","vcs_ref":"refs/tags/v1.1=
.0"},\
+{"module":"github.com/grpc-ecosystem/grpc-gateway/v2","version":"v2.26.1=
","vcs_hash":"7a398ff2d549d51a63c658f61a0fc12fe4994094b59196ef4d8a96d94d8=
b0b11","timestamp":"2025-02-07T19:13:24Z","subdir":"","vcs_ref":"refs/tag=
s/v2.26.1"},\
+{"module":"github.com/grpc-ecosystem/go-grpc-middleware/v2","version":"v=
2.1.0","vcs_hash":"4e15ad209f57f1610bea03c67dbeef9ef7792fafe9b2902ca1a141=
277719f091","timestamp":"2024-02-22T15:43:25Z","subdir":"","vcs_ref":"ref=
s/tags/v2.1.0"},\
+{"module":"github.com/grpc-ecosystem/go-grpc-middleware/providers/promet=
heus","version":"v1.1.0","vcs_hash":"42aacc0b51ca4683515670ecfde267af8722=
802b2bb4d002d5647da7d38f9a47","timestamp":"2025-06-12T22:31:32Z","subdir"=
:"providers/prometheus","vcs_ref":"refs/tags/providers/prometheus/v1.1.0"=
},\
+{"module":"github.com/gorilla/websocket","version":"v1.5.4-0.20250319132=
907-e064f32e3674","vcs_hash":"722c87c831f4b73fd3a40f24d8693191974f7a5a180=
d73f29a05c9bb3f84589f","timestamp":"2025-03-19T13:29:07Z","subdir":"","vc=
s_ref":""},\
+{"module":"github.com/gorilla/mux","version":"v1.8.1","vcs_hash":"489d45=
11710bd1a1fc80974aa65ee7c2b851f7c6354c34549b8cd131f4435f0f","timestamp":"=
2023-10-18T11:23:00Z","subdir":"","vcs_ref":"refs/tags/v1.8.1"},\
+{"module":"github.com/godbus/dbus/v5","version":"v5.1.0","vcs_hash":"64a=
1380eac8fb56f64570a9ee44f46ff49a8cfc74d31623d696b49699728d072","timestamp=
":"2022-02-27T11:53:47Z","subdir":"v5","vcs_ref":"refs/tags/v5.1.0"},\
+{"module":"github.com/goccy/go-json","version":"v0.10.2","vcs_hash":"740=
855cec7c87c7ae05c90a05b7441ee62d8206d1f61f89e36a20ee76b0af7ec","timestamp=
":"2023-03-19T20:01:20Z","subdir":"","vcs_ref":"refs/tags/v0.10.2"},\
+{"module":"github.com/gobwas/glob","version":"v0.2.3","vcs_hash":"9ea137=
b0f545be63130971285b3e0b109491f0a0c45197efd72385336ab0ed05","timestamp":"=
2018-02-08T21:06:56Z","subdir":"","vcs_ref":"refs/tags/v0.2.3"},\
+{"module":"github.com/go-ole/go-ole","version":"v1.2.6","vcs_hash":"f8a3=
7b093a9da7f7719abb71318560d985c5c38e6d58c2c73adde45616845d0c","timestamp"=
:"2021-09-15T00:35:42Z","subdir":"","vcs_ref":"refs/tags/v1.2.6"},\
+{"module":"github.com/go-ini/ini","version":"v1.67.0","vcs_hash":"cad9f4=
49f807ba878152dab9e71ba0f300b51a0a69390f502d55fb24a11f73a2","timestamp":"=
2022-08-08T11:35:30Z","subdir":"","vcs_ref":"refs/tags/v1.67.0"},\
+{"module":"github.com/go-jose/go-jose/v4","version":"v4.1.2","vcs_hash":=
"558fa32425fb33e37f25523c5b69743af7afff9df1b286b6e33e93aec4bbaee2","times=
tamp":"2025-07-18T17:04:53Z","subdir":"","vcs_ref":"refs/tags/v4.1.2"},\
+{"module":"github.com/fxamacker/cbor/v2","version":"v2.9.0","vcs_hash":"=
a2e55d2b4fdba69f8a4cfc76758713247ee27c62d5ad4168e8c14369f3c94c36","timest=
amp":"2025-07-14T04:00:34Z","subdir":"","vcs_ref":"refs/tags/v2.9.0"},\
+{"module":"github.com/fsnotify/fsnotify","version":"v1.9.0","vcs_hash":"=
e7e3eb9997b88b1856ec41676de694527bda7173c94d395822f6eec3ec2067e2","timest=
amp":"2025-04-04T15:13:49Z","subdir":"","vcs_ref":"refs/tags/v1.9.0"},\
+{"module":"github.com/emicklei/go-restful/v3","version":"v3.13.0","vcs_h=
ash":"2b1cb5344031e14606bed4c9c1a5462fa536c12e0f7359188d69f5709fdff9a1","=
timestamp":"2025-08-14T12:44:48Z","subdir":"","vcs_ref":"refs/tags/v3.13.=
0"},\
+{"module":"github.com/decred/dcrd/dcrec/secp256k1/v4","version":"v4.2.0"=
,"vcs_hash":"969124e062705319ea1df3e035f29c8b4731d2905da0ac8d80229f2c33b0=
e217","timestamp":"2023-04-13T20:31:48Z","subdir":"dcrec/secp256k1","vcs_=
ref":"refs/tags/dcrec/secp256k1/v4.2.0"},\
+{"module":"github.com/distribution/reference","version":"v0.6.0","vcs_ha=
sh":"ac2c94a9c45cfe172807163d3f9ae441bf0db0b30e528660d1b5db49678ed93a","t=
imestamp":"2024-03-20T17:09:59Z","subdir":"","vcs_ref":"refs/tags/v0.6.0"=
},\
+{"module":"github.com/cpuguy83/go-md2man/v2","version":"v2.0.7","vcs_has=
h":"44790142f31974c97a48f51298f4d80d17cdea0211947e7cbfe90054a7fe7774","ti=
mestamp":"2025-04-24T23:51:24Z","subdir":"","vcs_ref":"refs/tags/v2.0.7"}=
,\
+{"module":"github.com/containers/ocicrypt","version":"v1.2.1","vcs_hash"=
:"bec170205b8cb4f7646d21f6d05f4e78b62b540ff061d55788f38ccecc6313b7","time=
stamp":"2024-12-16T16:02:12Z","subdir":"","vcs_ref":"refs/tags/v1.2.1"},\
+{"module":"github.com/containernetworking/plugins","version":"v1.8.0","v=
cs_hash":"f6503a87c1f81aa33a6d29c40a420afbc08e92fc8e1791dc7f439650e37194c=
a","timestamp":"2025-09-01T15:23:06Z","subdir":"","vcs_ref":"refs/tags/v1=
.8.0"},\
+{"module":"github.com/containernetworking/cni","version":"v1.3.0","vcs_h=
ash":"6fa30880d920c48b1630347223a375694a450629a1037b649907b1ab1f2f237a","=
timestamp":"2025-04-07T15:37:53Z","subdir":"","vcs_ref":"refs/tags/v1.3.0=
"},\
+{"module":"github.com/cilium/ebpf","version":"v0.16.0","vcs_hash":"8e810=
695e5aecdedc82025b50fe217f458e95243dfd6f3a725e4be31bb89421b","timestamp":=
"2024-07-23T16:13:54Z","subdir":"","vcs_ref":"refs/tags/v0.16.0"},\
+{"module":"github.com/GoogleCloudPlatform/opentelemetry-operations-go/de=
tectors/gcp","version":"v1.29.0","vcs_hash":"49958282a27585aaf02e289d3431=
a76a06b31d241e40f4c0c4400d29db6a8e01","timestamp":"2025-06-18T16:30:13Z",=
"subdir":"detectors/gcp","vcs_ref":"refs/tags/detectors/gcp/v1.29.0"},\
+{"module":"github.com/cespare/xxhash/v2","version":"v2.3.0","vcs_hash":"=
4cf9134295bfe252b2146507759140e7050e00021c322cfd0d38a231ef3c0b20","timest=
amp":"2024-04-04T20:00:10Z","subdir":"","vcs_ref":"refs/tags/v2.3.0"},\
+{"module":"github.com/AdaLogics/go-fuzz-headers","version":"v0.0.0-20240=
806141605-e8a1dd7889d6","vcs_hash":"618ef3cd1ed01872674845eae25e7d6a50a3d=
70b49881ccd500327b0778fedb9","timestamp":"2024-08-06T14:16:05Z","subdir":=
"","vcs_ref":""},\
+{"module":"github.com/cenkalti/backoff/v4","version":"v4.3.0","vcs_hash"=
:"c644c1d0f5212c0210f056d6c7d45f3e482a1fca002b7c3e65edf8d3c060566f","time=
stamp":"2024-01-02T22:56:19Z","subdir":"","vcs_ref":"refs/tags/v4.3.0"},\
+{"module":"github.com/blang/semver/v4","version":"v4.0.0","vcs_hash":"59=
2c6d9a3fd1b340b1d148a1229b29c0f07951f6a2324b4abdbe310d546bda36","timestam=
p":"2020-05-24T15:15:11Z","subdir":"v4","vcs_ref":"refs/tags/v4.0.0"},\
+{"module":"github.com/StackExchange/wmi","version":"v0.0.0-2019052321331=
5-cbe66965904d","vcs_hash":"1fc27d9cac14b2a03bbb0b0458896762317bee884884e=
f85b821fa4cb18c6952","timestamp":"2019-05-23T21:33:15Z","subdir":"","vcs_=
ref":""},\
+{"module":"github.com/OneOfOne/xxhash","version":"v1.2.8","vcs_hash":"57=
4662bdca3437a1a2b63a6fb52e05b654c57b8d21015a54e240b726cc649b5c","timestam=
p":"2020-05-24T17:46:06Z","subdir":"","vcs_ref":"refs/tags/v1.2.8"},\
+{"module":"github.com/checkpoint-restore/go-criu/v7","version":"v7.2.0",=
"vcs_hash":"cd3a96bfb455f01e0ad41b83fe0a2ba40c017e12b43cf536dd72401c0a9ef=
a9b","timestamp":"2024-09-09T09:30:43Z","subdir":"","vcs_ref":"refs/tags/=
v7.2.0"},\
+{"module":"github.com/checkpoint-restore/checkpointctl","version":"v1.4.=
0","vcs_hash":"6b759ce79ef9b0cf0e95821c6506ecb3e1f87ff4709b914b3e18ce7b12=
ed0769","timestamp":"2025-09-01T08:42:45Z","subdir":"","vcs_ref":"refs/ta=
gs/v1.4.0"},\
+{"module":"github.com/akavel/rsrc","version":"v0.10.2","vcs_hash":"98e00=
1b3b120966f753da164ca31ce83a6735298cb3b3365762a81db7f41969f","timestamp":=
"2021-03-12T14:42:57Z","subdir":"","vcs_ref":"refs/tags/v0.10.2"},\
+{"module":"github.com/beorn7/perks","version":"v1.0.1","vcs_hash":"c20c7=
a1c80a243f687008566bc9b8a9517bdf7e3a4f9db15e17160ad20568e9d","timestamp":=
"2019-07-31T12:00:54Z","subdir":"","vcs_ref":"refs/tags/v1.0.1"},\
+{"module":"github.com/agnivade/levenshtein","version":"v1.2.0","vcs_hash=
":"f146c0125792f4a7b478a5ade3d2578eaabd4d7c8a31f42ea28d318a29c2e289","tim=
estamp":"2024-09-24T15:25:24Z","subdir":"","vcs_ref":"refs/tags/v1.2.0"},=
\
+{"module":"github.com/yuin/goldmark","version":"v1.1.27","vcs_hash":"fb4=
5f805a799ac2f897942f334c68fc215fa5bfc06f4b0277d583fe78f6c36ca","timestamp=
":"2020-03-31T17:10:28Z","subdir":"","vcs_ref":"refs/tags/v1.1.27"},\
+{"module":"github.com/yuin/goldmark","version":"v1.2.1","vcs_hash":"4c58=
efe0c28d74a0131cf65fc06af9bf723f3852cb20f81dce6ce9ae50793119","timestamp"=
:"2020-07-30T13:33:42Z","subdir":"","vcs_ref":"refs/tags/v1.2.1"},\
+{"module":"github.com/stretchr/testify","version":"v1.11.1","vcs_hash":"=
ba91b84762300277627df761c9f004ffcc560434a1a1c2e613269b0c2e378278","timest=
amp":"2025-08-27T10:46:31Z","subdir":"","vcs_ref":"refs/tags/v1.11.1"},\
+{"module":"github.com/stretchr/testify","version":"v1.7.0","vcs_hash":"f=
87883f9ef1ad6bd6ecb844fe9108ae126c4dfab49080e5fb37bd27ca64417be","timesta=
mp":"2021-01-13T09:54:11Z","subdir":"","vcs_ref":"refs/tags/v1.7.0"},\
+{"module":"github.com/stretchr/testify","version":"v1.7.1","vcs_hash":"7=
19be8c83742fcd5ea6c60cce03388f5367bceeb8522379d83d0110c884426a5","timesta=
mp":"2022-03-15T21:08:43Z","subdir":"","vcs_ref":"refs/tags/v1.7.1"},\
+{"module":"github.com/stretchr/testify","version":"v1.8.0","vcs_hash":"3=
9798af0c50431f2d4ce305d1aea9c6d13ad19d1ab6af227d59ebb3580e7a7f0","timesta=
mp":"2022-06-29T10:56:06Z","subdir":"","vcs_ref":"refs/tags/v1.8.0"},\
+{"module":"github.com/stretchr/testify","version":"v1.8.1","vcs_hash":"d=
45ab2961914a9a432c9fbbee6a5e2e51a7c04a9c7b64b567c83074a7152bb5f","timesta=
mp":"2022-10-20T10:50:56Z","subdir":"","vcs_ref":"refs/tags/v1.8.1"},\
+{"module":"github.com/stretchr/objx","version":"v0.1.0","vcs_hash":"3982=
8321881a0709a36a2d1edde8fc9928ddd471ebd0bbdf7012076e7214bb02","timestamp"=
:"2018-01-06T01:13:53Z","subdir":"","vcs_ref":"refs/tags/v0.1.0"},\
+{"module":"github.com/stretchr/objx","version":"v0.4.0","vcs_hash":"4ca5=
32f3c50e5c7c19e3dc9316d05026ba007fe253a359de8b2a8492d16f1faa","timestamp"=
:"2022-04-12T09:17:15Z","subdir":"","vcs_ref":"refs/tags/v0.4.0"},\
+{"module":"github.com/stretchr/objx","version":"v0.5.0","vcs_hash":"9569=
98068f3cc530e52afae6bcb80d92158cdaee2b707bdfdaf132ff05de3b4f","timestamp"=
:"2022-09-18T03:09:40Z","subdir":"","vcs_ref":"refs/tags/v0.5.0"},\
+{"module":"github.com/stretchr/objx","version":"v0.5.2","vcs_hash":"fe4a=
57d26379977ebf461da8c71a20095b9f973a91d55076b67fa0de48206a1e","timestamp"=
:"2024-02-29T09:57:51Z","subdir":"","vcs_ref":"refs/tags/v0.5.2"},\
+{"module":"github.com/rogpeppe/go-internal","version":"v1.13.1","vcs_has=
h":"6a8cf885e1574a3d34afe5d7b0a7b4272403e5d756cae287c06d90a7e9eb2d09","ti=
mestamp":"2024-09-23T11:44:11Z","subdir":"","vcs_ref":"refs/tags/v1.13.1"=
},\
+{"module":"github.com/prometheus/common","version":"v0.66.1","vcs_hash":=
"4004fe14db85cf2a2119d66ea225f2b9d7d14ea63e1e3bfa539d1d2440d107c4","times=
tamp":"2025-09-05T07:53:47Z","subdir":"","vcs_ref":"refs/tags/v0.66.1"},\
+{"module":"github.com/prometheus/client_golang","version":"v1.23.2","vcs=
_hash":"d9bbeca592abd4abe4a9bb304c93ff338301ffcad964694c918522126d52a1d2"=
,"timestamp":"2025-09-05T14:03:59Z","subdir":"","vcs_ref":"refs/tags/v1.2=
3.2"},\
+{"module":"github.com/prometheus/procfs","version":"v0.16.1","vcs_hash":=
"c5636022955615867ff5e898a254c352486ff4f35f8066d4296d4561c4ef4d2e","times=
tamp":"2025-04-19T15:43:08Z","subdir":"","vcs_ref":"refs/tags/v0.16.1"},\
+{"module":"github.com/prometheus/client_model","version":"v0.0.0-2019081=
2154241-14fe0d1b01d4","vcs_hash":"51e8f292b7b4c73ee0cd08ea12700b5d30bb89b=
5b541d85eaee134d6035c3069","timestamp":"2019-08-12T15:42:41Z","subdir":""=
,"vcs_ref":""},\
+{"module":"github.com/prometheus/client_model","version":"v0.6.2","vcs_h=
ash":"ce4113e6c8f9de1c05a5198a36f67001c5b8ac458bbdbca291a0800fa698d5b1","=
timestamp":"2025-04-11T05:38:16Z","subdir":"","vcs_ref":"refs/tags/v0.6.2=
"},\
+{"module":"github.com/pmezard/go-difflib","version":"v1.0.0","vcs_hash":=
"c04ad296d2e3203fda8b7ca96feaca21b20b3b7441e33c7d67cda029ea61ab4c","times=
tamp":"2016-01-10T10:55:54Z","subdir":"","vcs_ref":"refs/tags/v1.0.0"},\
+{"module":"github.com/pmezard/go-difflib","version":"v1.0.1-0.2018122610=
5442-5d4384ee4fb2","vcs_hash":"542a02198867d48986449e0f3353a6afa6fd53ac0a=
9f07be5882207092512174","timestamp":"2018-12-26T10:54:42Z","subdir":"","v=
cs_ref":""},\
+{"module":"github.com/pkg/errors","version":"v0.9.1","vcs_hash":"58e5251=
51c02acebc6662bf19060e7ee1112335787f1ffb059ea8d46a3164e5e","timestamp":"2=
020-01-14T19:47:44Z","subdir":"","vcs_ref":"refs/tags/v0.9.1"},\
+{"module":"github.com/Microsoft/didx509go","version":"v0.0.3","vcs_hash"=
:"9d732379493b8d4ba557d271dfac2f175c56544888b810e4884820c70ff7fb20","time=
stamp":"2024-02-23T09:37:27Z","subdir":"","vcs_ref":"refs/tags/v0.0.3"},\
+{"module":"github.com/Microsoft/cosesign1go","version":"v1.4.0","vcs_has=
h":"1eadcf4b7177fc71d2fa87bdfd2145aaaad8dd60403a2ba1c5bb507e71d85138","ti=
mestamp":"2024-11-07T16:43:12Z","subdir":"","vcs_ref":"refs/tags/v1.4.0"}=
,\
+{"module":"github.com/Microsoft/hcsshim","version":"v0.14.0-rc.1","vcs_h=
ash":"f493369c2a96e959905afa70d80efbf15bd25304bc9938aafdaa00d931825b26","=
timestamp":"2025-08-12T17:46:53Z","subdir":"","vcs_ref":"refs/tags/v0.14.=
0-rc.1"},\
+{"module":"github.com/Microsoft/go-winio","version":"v0.6.2","vcs_hash":=
"963154633520174004b7a508de4bfa23c0374f9312f6db845c29aa3cb751d708","times=
tamp":"2024-04-09T20:07:04Z","subdir":"","vcs_ref":"refs/tags/v0.6.2"},\
+{"module":"github.com/kr/text","version":"v0.2.0","vcs_hash":"62674ecb33=
f72b9ab66dd856fe2e651dbf7344dea40ba5132203c7b4b32cfd61","timestamp":"2020=
-02-14T20:31:06Z","subdir":"","vcs_ref":"refs/tags/v0.2.0"},\
+{"module":"github.com/kr/pretty","version":"v0.3.1","vcs_hash":"487dccea=
2d19da29e6f873ffd57f7f4d33720781a3f60bb9f852176acb476435","timestamp":"20=
22-08-29T23:03:05Z","subdir":"","vcs_ref":"refs/tags/v0.3.1"},\
+{"module":"github.com/klauspost/compress","version":"v1.18.1","vcs_hash"=
:"b48c3ccd9eeacff33408e742c5cba28495d19318773a2419734e1f7f12be4596","time=
stamp":"2025-10-02T12:00:22Z","subdir":"","vcs_ref":"refs/tags/v1.18.1"},=
\
+{"module":"github.com/kisielk/gotool","version":"v1.0.0","vcs_hash":"5f4=
48e8a93894c89c55e73478ef6dc8a0a1a6a3fd3fe3a2b5cd5e03e65915fb1","timestamp=
":"2018-02-21T18:54:26Z","subdir":"","vcs_ref":"refs/tags/v1.0.0"},\
+{"module":"github.com/kisielk/errcheck","version":"v1.5.0","vcs_hash":"2=
ae681313b6ac49c6c60836f406eed1f7f4db5b86a3027f0ec720f5984386390","timesta=
mp":"2021-01-05T19:12:31Z","subdir":"","vcs_ref":"refs/tags/v1.5.0"},\
+{"module":"github.com/go-logr/stdr","version":"v1.2.2","vcs_hash":"e69aa=
58ea5f2f28aa8623652f5e6643b2299d9fe8ba1e6c73a8e3d602290ac67","timestamp":=
"2021-12-14T08:00:35Z","subdir":"","vcs_ref":"refs/tags/v1.2.2"},\
+{"module":"github.com/go-logr/logr","version":"v1.2.2","vcs_hash":"761d6=
b76e4ca57583edd8a7d6cf39d5a0c0dfd1fb4f82f099c044f754193f7d1","timestamp":=
"2021-12-05T13:02:31Z","subdir":"","vcs_ref":"refs/tags/v1.2.2"},\
+{"module":"github.com/go-logr/logr","version":"v1.4.3","vcs_hash":"5b4f8=
e13d26b7581594ade5c47d93fb87ebb7720ce23eff7afaed11743464e1f","timestamp":=
"2025-05-19T04:56:57Z","subdir":"","vcs_ref":"refs/tags/v1.4.3"},\
+{"module":"github.com/golang/protobuf","version":"v1.2.0","vcs_hash":"c6=
20195ee748026eed07d7e16b36050b97c69cfe3f735e96aafd915e5397baa5","timestam=
p":"2018-08-14T21:14:27Z","subdir":"","vcs_ref":"refs/tags/v1.2.0"},\
+{"module":"github.com/golang/protobuf","version":"v1.3.2","vcs_hash":"cb=
db48339b27d250cd1655e4e658760981e0b526face5866f3cfac54fd21200c","timestam=
p":"2019-07-01T18:22:01Z","subdir":"","vcs_ref":"refs/tags/v1.3.2"},\
+{"module":"github.com/golang/protobuf","version":"v1.4.0","vcs_hash":"97=
01e384e22d2f09b50e22d6c6600a8ff9d29bbe79215d2d3d0eb4ec3ae88f76","timestam=
p":"2020-04-13T19:43:07Z","subdir":"","vcs_ref":"refs/tags/v1.4.0"},\
+{"module":"github.com/golang/protobuf","version":"v1.4.0-rc.1","vcs_hash=
":"efeddbb7df08ac6ca9b2bbda927e2b2189b92b06a73e55799fb3bf9581e75dcf","tim=
estamp":"2020-02-12T18:09:08Z","subdir":"","vcs_ref":"refs/tags/v1.4.0-rc=
.1"},\
+{"module":"github.com/golang/protobuf","version":"v1.4.0-rc.2","vcs_hash=
":"4d51dcd940a624407a36666d25477186e59714137829ca237592547b2456897b","tim=
estamp":"2020-02-28T23:19:22Z","subdir":"","vcs_ref":"refs/tags/v1.4.0-rc=
.2"},\
+{"module":"github.com/golang/protobuf","version":"v1.4.1","vcs_hash":"1e=
b4b95e7f54d310a313a166f271987ca8ef42c83b650550333c53b4493a87d9","timestam=
p":"2020-05-04T19:38:55Z","subdir":"","vcs_ref":"refs/tags/v1.4.1"},\
+{"module":"github.com/golang/protobuf","version":"v1.4.3","vcs_hash":"af=
cc28cc9d69ccbdadf7d3b64dd61a2449f1316c579ba313fc8f7c2f7b0a2c5d","timestam=
p":"2020-10-15T06:18:29Z","subdir":"","vcs_ref":"refs/tags/v1.4.3"},\
+{"module":"github.com/golang/protobuf","version":"v1.5.4","vcs_hash":"ff=
75ecee442381e7c87bac5ec092ebaf50137bc693ba5c5c1edce6eb4bd3ce94","timestam=
p":"2024-03-06T06:45:40Z","subdir":"","vcs_ref":"refs/tags/v1.5.4"},\
+{"module":"github.com/golang/mock","version":"v1.1.1","vcs_hash":"cfc715=
55d14f8ab66f92807e40f5893bb08b8eb5bdecd40b444f71558441e179","timestamp":"=
2018-04-05T21:54:04Z","subdir":"","vcs_ref":"refs/tags/v1.1.1"},\
+{"module":"github.com/golang/groupcache","version":"v0.0.0-2020012104513=
6-8c9f03a8e57e","vcs_hash":"650bdea426b0ab9b6b2f1702e9e9d6abe4d771a6acdd8=
f04a1b6bc48e374550f","timestamp":"2020-01-21T04:51:36Z","subdir":"","vcs_=
ref":""},\
+{"module":"github.com/golang/groupcache","version":"v0.0.0-2024112921072=
6-2c02b8208cf8","vcs_hash":"42d84b5a864149912b1976573aa12f43cdea041dfbb41=
206b5548b1134452af5","timestamp":"2024-11-29T21:07:26Z","subdir":"","vcs_=
ref":""},\
+{"module":"github.com/golang/glog","version":"v0.0.0-20160126235308-23de=
f4e6c14b","vcs_hash":"f5cbb2974dc34ce4944f2c4c42cdc6c20abcd2a192abab4ba1b=
6e9c67ef409d5","timestamp":"2016-01-26T23:53:08Z","subdir":"","vcs_ref":"=
"},\
+{"module":"github.com/golang/glog","version":"v1.2.5","vcs_hash":"c9f39b=
fa0a44d36bb33abf5da9f941c03e1a2e8b3c98916cabc3aaca09d17583","timestamp":"=
2025-04-29T08:43:26Z","subdir":"","vcs_ref":"refs/tags/v1.2.5"},\
+{"module":"github.com/felixge/httpsnoop","version":"v1.0.4","vcs_hash":"=
4faaa0a5649a2ae9245609ad7ed739dbc2e39cfd27a3018400f3dad114269d26","timest=
amp":"2023-03-12T10:31:09Z","subdir":"","vcs_ref":"refs/tags/v1.0.4"},\
+{"module":"github.com/envoyproxy/protoc-gen-validate","version":"v0.1.0"=
,"vcs_hash":"17dee49ca0a12c9d068fb9ddd8d0ade5d40bec4965b4d5b57c0163c07b7c=
c1f7","timestamp":"2019-06-13T14:36:32Z","subdir":"","vcs_ref":"refs/tags=
/v0.1.0"},\
+{"module":"github.com/envoyproxy/protoc-gen-validate","version":"v1.2.1"=
,"vcs_hash":"d5f02e84a7cac6538441cf10353084bc8986687c4fb1dbec8ce868f36087=
a44c","timestamp":"2025-01-22T20:15:32Z","subdir":"","vcs_ref":"refs/tags=
/v1.2.1"},\
+{"module":"github.com/envoyproxy/go-control-plane","version":"v0.9.0","v=
cs_hash":"7b9d6b3bb8d89496a2b4604c64fe742706539fd157f8455324b5c536248f32d=
6","timestamp":"2019-09-10T22:06:41Z","subdir":"","vcs_ref":"refs/tags/v0=
.9.0"},\
+{"module":"github.com/envoyproxy/go-control-plane","version":"v0.9.1-0.2=
0191026205805-5f8ba28d4473","vcs_hash":"ae18408e2dabff9eae443474dd88764e1=
702f08db99eaa197e196d11fef11707","timestamp":"2019-10-26T20:58:05Z","subd=
ir":"","vcs_ref":""},\
+{"module":"github.com/envoyproxy/go-control-plane","version":"v0.9.4","v=
cs_hash":"f149a73577cc7366678c404cd18196812505b84e63e52c4bb54a8fc51de6e11=
9","timestamp":"2020-02-13T20:12:56Z","subdir":"","vcs_ref":"refs/tags/v0=
.9.4"},\
+{"module":"github.com/envoyproxy/go-control-plane","version":"v0.13.4","=
vcs_hash":"1248bc92f13bca22704468dd7a1863c1e00e9349148860487e5fbfba3c05f3=
03","timestamp":"2025-01-06T21:37:05Z","subdir":"","vcs_ref":"refs/tags/v=
0.13.4"},\
+{"module":"github.com/envoyproxy/go-control-plane/ratelimit","version":"=
v0.1.0","vcs_hash":"906f63aa0b71e9714823fdb45d45be4659d30de781b6a053c93f4=
3371894845f","timestamp":"2024-12-23T15:25:59Z","subdir":"ratelimit","vcs=
_ref":"refs/tags/ratelimit/v0.1.0"},\
+{"module":"github.com/envoyproxy/go-control-plane/envoy","version":"v1.3=
2.4","vcs_hash":"b764640e72f39b0abeb1eee792c7fd920bb28361222420dedee7bbe3=
0022afa6","timestamp":"2025-02-03T00:33:09Z","subdir":"envoy","vcs_ref":"=
refs/tags/envoy/v1.32.4"},\
+{"module":"github.com/docker/go-metrics","version":"v0.0.1","vcs_hash":"=
96ae8893e24907a70aef922af47d48651611460f2b982f7e1e27dacd5ad82b9f","timest=
amp":"2019-08-28T14:40:21Z","subdir":"","vcs_ref":"refs/tags/v0.0.1"},\
+{"module":"github.com/docker/go-events","version":"v0.0.0-20190806004212=
-e31b211e4f1c","vcs_hash":"3e0bfea9682128db4b902dfb300a63020f2a4e0fd9e50a=
9a43529185ded21203","timestamp":"2019-08-06T00:42:12Z","subdir":"","vcs_r=
ef":""},\
+{"module":"github.com/docker/docker","version":"v24.0.0+incompatible","v=
cs_hash":"fef1acd534062d3bdbabf1925b4ad9af4ae1c35e830092e03e7087c0de10291=
3","timestamp":"2023-05-15T14:40:33Z","subdir":"","vcs_ref":"refs/tags/v2=
4.0.0"},\
+{"module":"github.com/docker/docker-credential-helpers","version":"v0.7.=
0","vcs_hash":"dec3c7feaf80b600beff65a7a5011fa4215905f39ed602aa878644f3df=
db1de3","timestamp":"2022-08-31T07:33:52Z","subdir":"","vcs_ref":"refs/ta=
gs/v0.7.0"},\
+{"module":"github.com/docker/cli","version":"v24.0.0+incompatible","vcs_=
hash":"767941a450a63257ae8acd03345fc8dfbf6b58bc08b69d36c97c92a3e76e3ad5",=
"timestamp":"2023-05-12T14:10:05Z","subdir":"","vcs_ref":"refs/tags/v24.0=
.0"},\
+{"module":"github.com/docker/distribution","version":"v2.8.2+incompatibl=
e","vcs_hash":"5963ff551a76f6e4574c31bfbaf16ab787fad1c87da7a097024b4d7c61=
59107b","timestamp":"2023-05-11T10:11:57Z","subdir":"","vcs_ref":"refs/ta=
gs/v2.8.2"},\
+{"module":"github.com/docker/go-units","version":"v0.5.0","vcs_hash":"2f=
970538f28b36d4a39663fa90033ec5c742ddd7774a86d94cc6c179e63a1c49","timestam=
p":"2022-05-17T10:43:04Z","subdir":"","vcs_ref":"refs/tags/v0.5.0"},\
+{"module":"github.com/davecgh/go-spew","version":"v1.1.0","vcs_hash":"5c=
e38ad71c2d3bc390b87154a89c53fd5ead19aed2bf005419db5c0b28ea9dfd","timestam=
p":"2016-10-29T20:57:26Z","subdir":"","vcs_ref":"refs/tags/v1.1.0"},\
+{"module":"github.com/davecgh/go-spew","version":"v1.1.1","vcs_hash":"4c=
7d69cfe586f86079773ff48d94f76d327c2914d8dfeffca9e34fd1146e5d5e","timestam=
p":"2018-02-21T23:26:28Z","subdir":"","vcs_ref":"refs/tags/v1.1.1"},\
+{"module":"github.com/cncf/xds/go","version":"v0.0.0-20250501225837-2ac5=
32fd4443","vcs_hash":"e0bdc15b1a7c1a8070f042c4642f13845c0a3597e8027bebaf1=
5f8d169e221ab","timestamp":"2025-05-01T22:58:37Z","subdir":"go","vcs_ref"=
:""},\
+{"module":"github.com/cncf/udpa/go","version":"v0.0.0-20191209042840-269=
d4d468f6f","vcs_hash":"2d4bb3719cd74b7802454af2a99a01288222b8d83502e76ab1=
00cd853a9f4b62","timestamp":"2019-12-09T04:28:40Z","subdir":"go","vcs_ref=
":""},\
+{"module":"github.com/client9/misspell","version":"v0.3.4","vcs_hash":"1=
24db3874e1d4102a9dc47478928c54062b3baec396eed15d1359e70ed21b796","timesta=
mp":"2018-03-09T01:55:12Z","subdir":"","vcs_ref":"refs/tags/v0.3.4"},\
+{"module":"github.com/census-instrumentation/opencensus-proto","version"=
:"v0.2.1","vcs_hash":"47f526897b6e692b88b3517f7ef7e68b617de38122f7782931e=
45d8d2be2fef6","timestamp":"2019-07-18T16:27:18Z","subdir":"","vcs_ref":"=
refs/tags/v0.2.1"},\
+{"module":"github.com/BurntSushi/toml","version":"v0.3.1","vcs_hash":"c7=
591feaba0db5f458f0e6745283c8246ea0f50af4eb4714a53ff88805ecd88a","timestam=
p":"2018-08-15T10:47:33Z","subdir":"","vcs_ref":"refs/tags/v0.3.1"},\
+{"module":"github.com/gogo/protobuf","version":"v1.3.2","vcs_hash":"e07d=
7c0e03a0e2831dd973581be0944984030693bc73f0b67a64e53b4c690635","timestamp"=
:"2021-01-10T08:01:47Z","subdir":"","vcs_ref":"refs/tags/v1.3.2"},\
+{"module":"github.com/moby/spdystream","version":"v0.5.0","vcs_hash":"d7=
500df0fff4308611e91e5edf74d69178b53dccca9230c03beecb0a26d56124","timestam=
p":"2024-07-23T13:25:06Z","subdir":"","vcs_ref":"refs/tags/v0.5.0"},\
+{"module":"github.com/moby/locker","version":"v1.0.1","vcs_hash":"5549df=
51df50be0334c0cca67abc7ed6c0bd4fceee3f7bb56eb917b56bfe8644","timestamp":"=
2020-09-10T19:56:44Z","subdir":"","vcs_ref":"refs/tags/v1.0.1"},\
+{"module":"github.com/moby/sys/user","version":"v0.4.0","vcs_hash":"1ea4=
d88317a39a40b500e6a8370c6c5f6d53cf5486d16925f6374042d8bf9896","timestamp"=
:"2025-02-27T19:37:07Z","subdir":"user","vcs_ref":"refs/tags/user/v0.4.0"=
},\
+{"module":"github.com/moby/sys/signal","version":"v0.7.1","vcs_hash":"c5=
c70dcea521c7e4cc66d0ca1ccdc1721b1a865780c1a1b9274ced410fa0553f","timestam=
p":"2024-07-16T17:21:58Z","subdir":"signal","vcs_ref":"refs/tags/signal/v=
0.7.1"},\
+{"module":"github.com/moby/sys/symlink","version":"v0.3.0","vcs_hash":"c=
5c70dcea521c7e4cc66d0ca1ccdc1721b1a865780c1a1b9274ced410fa0553f","timesta=
mp":"2024-07-16T17:21:58Z","subdir":"symlink","vcs_ref":"refs/tags/symlin=
k/v0.3.0"},\
+{"module":"github.com/moby/sys/sequential","version":"v0.6.0","vcs_hash"=
:"c5c70dcea521c7e4cc66d0ca1ccdc1721b1a865780c1a1b9274ced410fa0553f","time=
stamp":"2024-07-16T17:21:58Z","subdir":"sequential","vcs_ref":"refs/tags/=
sequential/v0.6.0"},\
+{"module":"github.com/moby/sys/capability","version":"v0.4.0","vcs_hash"=
:"e67c1b1913863f71a44fb255bb4ceafcd322cbb0790a301c410f76acaf083f75","time=
stamp":"2024-11-11T19:02:25Z","subdir":"capability","vcs_ref":"refs/tags/=
capability/v0.4.0"},\
+{"module":"github.com/moby/sys/mountinfo","version":"v0.7.2","vcs_hash":=
"c5c70dcea521c7e4cc66d0ca1ccdc1721b1a865780c1a1b9274ced410fa0553f","times=
tamp":"2024-07-16T17:21:58Z","subdir":"mountinfo","vcs_ref":"refs/tags/mo=
untinfo/v0.7.2"},\
+{"module":"github.com/moby/sys/userns","version":"v0.1.0","vcs_hash":"8e=
a1faceda9bb3618c7b96f0749fcc6b4672432eef27c1f25c4bf631513501f2","timestam=
p":"2024-08-07T23:23:49Z","subdir":"userns","vcs_ref":"refs/tags/userns/v=
0.1.0"},\
+{"module":"github.com/google/go-containerregistry","version":"v0.20.1","=
vcs_hash":"a2844d6ba65e6b80271cad050f89b6c0158f173d5b155bfd7f8f4e93d826c2=
1d","timestamp":"2024-07-17T01:32:55Z","subdir":"","vcs_ref":"refs/tags/v=
0.20.1"},\
+{"module":"github.com/google/deck","version":"v0.0.0-20230104221208-105a=
d94aa8ae","vcs_hash":"9c43c7ddfa82c3fc0dbcab5945f7f810fa68c290504895ba9a3=
31c514051c140","timestamp":"2023-01-04T22:12:08Z","subdir":"","vcs_ref":"=
"},\
+{"module":"github.com/google/certtostore","version":"v1.0.6","vcs_hash":=
"03eab8e8fd9152de179043ef32fd09e4375ad5a3b8e25efbeeba6b44d1ca9d4f","times=
tamp":"2025-09-02T15:28:35Z","subdir":"","vcs_ref":"refs/tags/v1.0.6"},\
+{"module":"github.com/google/uuid","version":"v1.1.2","vcs_hash":"192548=
bfd3acdce00ddcc9091abd663f637e675eb5470859ea5ca544d5150646","timestamp":"=
2020-07-02T18:56:42Z","subdir":"","vcs_ref":"refs/tags/v1.1.2"},\
+{"module":"github.com/google/uuid","version":"v1.6.0","vcs_hash":"1743dd=
7863ebf20fb946ec26a0525a27c91536f2d01acf863b0a99566cd8f3e5","timestamp":"=
2024-01-23T18:54:04Z","subdir":"","vcs_ref":"refs/tags/v1.6.0"},\
+{"module":"github.com/google/go-cmp","version":"v0.7.0","vcs_hash":"460e=
d71bde70f3a932cad8d9044d3f12302bf8b6e95353bd17c44189712e2763","timestamp"=
:"2025-01-14T18:15:44Z","subdir":"","vcs_ref":"refs/tags/v0.7.0"},\
+{"module":"github.com/google/go-cmp","version":"v0.2.0","vcs_hash":"bb28=
51e042ef699bbc2df1ef8c7b0c754822560b89602db9ff6f6315b5afddf7","timestamp"=
:"2018-02-02T21:19:42Z","subdir":"","vcs_ref":"refs/tags/v0.2.0"},\
+{"module":"github.com/google/go-cmp","version":"v0.3.0","vcs_hash":"ae58=
fd0d54f7194cd02ff68b9600f09892901604ebd985b881c9860505e91785","timestamp"=
:"2019-03-12T03:24:27Z","subdir":"","vcs_ref":"refs/tags/v0.3.0"},\
+{"module":"github.com/google/go-cmp","version":"v0.3.1","vcs_hash":"bbba=
6265e3e26d3a892583135ccfff338512124f01097cb15f8532f41f14d3f1","timestamp"=
:"2019-08-05T20:51:40Z","subdir":"","vcs_ref":"refs/tags/v0.3.1"},\
+{"module":"github.com/google/go-cmp","version":"v0.4.0","vcs_hash":"04ff=
364bb494ac39b4a8c906ddd6c47ddef7d89071af49fc9d78eebd2ee4f937","timestamp"=
:"2019-12-16T21:18:14Z","subdir":"","vcs_ref":"refs/tags/v0.4.0"},\
+{"module":"github.com/google/go-cmp","version":"v0.5.0","vcs_hash":"0640=
1ba5971b1b6dbf869860d7b89a3bf1fbcf3c04ffb585b80919dddb781ca6","timestamp"=
:"2020-06-18T00:25:47Z","subdir":"","vcs_ref":"refs/tags/v0.5.0"},\
+{"module":"github.com/google/go-cmp","version":"v0.5.3","vcs_hash":"f064=
8a9cebe17ac6cb2e543c1b3c24b2c85c8b2bc09d2e2ba22ce58b2b89cdb0","timestamp"=
:"2020-11-12T20:24:02Z","subdir":"","vcs_ref":"refs/tags/v0.5.3"},\
+{"module":"github.com/opencontainers/selinux","version":"v1.12.0","vcs_h=
ash":"4335d93e7b91bac4d4e22725cfaafc1cae44ef37a037022ea852d084e488e42a","=
timestamp":"2025-03-20T18:30:23Z","subdir":"","vcs_ref":"refs/tags/v1.12.=
0"},\
+{"module":"github.com/opencontainers/runtime-tools","version":"v0.9.1-0.=
20250523060157-0ea5ed0382a2","vcs_hash":"f53bb2252a6ed943b856ebf9ca177b61=
6be13e0631422a2c5167b1eeada6cc21","timestamp":"2025-05-23T06:01:57Z","sub=
dir":"","vcs_ref":""},\
+{"module":"github.com/opencontainers/runc","version":"v1.2.3","vcs_hash"=
:"12690fc9d5ecc8fe915b6cb0164c724b2a0fed93540b9e523062cab10c0c2ba2","time=
stamp":"2024-12-10T10:14:40Z","subdir":"","vcs_ref":"refs/tags/v1.2.3"},\
+{"module":"github.com/opencontainers/runtime-spec","version":"v1.2.1","v=
cs_hash":"527ad6550cd654c758c3a90c33fba5de9598578a66be5e157153797cc1e49aa=
3","timestamp":"2025-02-25T22:46:15Z","subdir":"","vcs_ref":"refs/tags/v1=
.2.1"},\
+{"module":"github.com/opencontainers/go-digest","version":"v1.0.0","vcs_=
hash":"1a4d20c74c510ca00ecb86a3379c151579ed626508723e74a394480a71a0af24",=
"timestamp":"2020-05-14T01:46:00Z","subdir":"","vcs_ref":"refs/tags/v1.0.=
0"},\
+{"module":"github.com/opencontainers/image-spec","version":"v1.1.1","vcs=
_hash":"5bb7cbac46d5df774d087c364c00445553d3db253ca80dc7050c4e57832c118d"=
,"timestamp":"2025-02-24T17:26:57Z","subdir":"","vcs_ref":"refs/tags/v1.1=
.1"},\
+{"module":"github.com/sirupsen/logrus","version":"v1.9.3","vcs_hash":"a1=
230aee5f8f1a866199cbec636d1525e00a9b13cf2fe0023dcf6b874c525014","timestam=
p":"2023-05-21T12:59:35Z","subdir":"","vcs_ref":"refs/tags/v1.9.3"},\
+{"module":"github.com/containerd/stargz-snapshotter/estargz","version":"=
v0.14.3","vcs_hash":"c0a45b74bb21bc7e7c0163054aff213d8dc61e3fa18ff5547b73=
2362f881d13a","timestamp":"2023-03-08T08:28:23Z","subdir":"estargz","vcs_=
ref":"refs/tags/estargz/v0.14.3"},\
+{"module":"github.com/containerd/zfs/v2","version":"v2.0.0-rc.0","vcs_ha=
sh":"760d9b417b3649f7335a5437c1ddc3ce9a7d15632bcac73a7aabc3c145104a12","t=
imestamp":"2024-10-24T13:31:35Z","subdir":"","vcs_ref":"refs/tags/v2.0.0-=
rc.0"},\
+{"module":"github.com/containerd/protobuild","version":"v0.3.0","vcs_has=
h":"7cfac99318ce6513d3f62c22baae310b7cc70562da7c000901e610a84fb83c70","ti=
mestamp":"2022-11-07T19:29:47Z","subdir":"","vcs_ref":"refs/tags/v0.3.0"}=
,\
+{"module":"github.com/containerd/imgcrypt/v2","version":"v2.0.1","vcs_ha=
sh":"cf07f49bde1cc9b1c042dfb7055d38c832cb69592e89521daa5ad46b367e047b","t=
imestamp":"2025-03-18T01:41:40Z","subdir":"","vcs_ref":"refs/tags/v2.0.1"=
},\
+{"module":"github.com/containerd/otelttrpc","version":"v0.1.0","vcs_hash=
":"c27d4a7087a7f4624cdf40c161f9707dbb90cd2d71159840f7c7b610260e9f24","tim=
estamp":"2025-01-09T19:17:17Z","subdir":"","vcs_ref":"refs/tags/v0.1.0"},=
\
+{"module":"github.com/containerd/nri","version":"v0.10.0","vcs_hash":"9e=
8aeba250dfc002831e46adace86815de4667ce3a2125acdbc5818f536de05c","timestam=
p":"2025-08-16T08:15:07Z","subdir":"","vcs_ref":"refs/tags/v0.10.0"},\
+{"module":"github.com/containerd/go-runc","version":"v1.1.0","vcs_hash":=
"9044e9e240020298712a51a4db4736afc66d70b1870cf11cac73c0661be06842","times=
tamp":"2023-05-17T04:55:20Z","subdir":"","vcs_ref":"refs/tags/v1.1.0"},\
+{"module":"github.com/containerd/go-cni","version":"v1.1.13","vcs_hash":=
"42aaa61d2bb4bd3a1eb278daa53bed3b31e3af601d35dafceb8b7714333cef05","times=
tamp":"2025-07-01T22:01:58Z","subdir":"","vcs_ref":"refs/tags/v1.1.13"},\
+{"module":"github.com/containerd/fifo","version":"v1.1.0","vcs_hash":"e4=
b0152cde11b075ce8a8a9f0db77d54abb72ee1bab1036ab0c157b678aade47","timestam=
p":"2023-02-17T21:37:13Z","subdir":"","vcs_ref":"refs/tags/v1.1.0"},\
+{"module":"github.com/containerd/console","version":"v1.0.5","vcs_hash":=
"a38aca664db28f607862e39301d2fd06b3c58312662cbd189f451215c3eb9894","times=
tamp":"2025-05-20T06:25:07Z","subdir":"","vcs_ref":"refs/tags/v1.0.5"},\
+{"module":"github.com/containerd/btrfs/v2","version":"v2.0.0","vcs_hash"=
:"8a2ee3ce7d871ae06962c07984197acdfd6035091884c9db0791378ac0229823","time=
stamp":"2023-02-10T01:01:25Z","subdir":"","vcs_ref":"refs/tags/v2.0.0"},\
+{"module":"github.com/containerd/plugin","version":"v1.0.0","vcs_hash":"=
f786b847c888d27ca5c517b566772c78216ed963d31d5119a32ebad7494855ea","timest=
amp":"2024-10-20T22:03:21Z","subdir":"","vcs_ref":"refs/tags/v1.0.0"},\
+{"module":"github.com/containerd/platforms","version":"v1.0.0-rc.2","vcs=
_hash":"a5b697e2dcecbe42edb518786dede1d257aecc63276621eb03e3917cae97e344"=
,"timestamp":"2025-08-21T22:24:38Z","subdir":"","vcs_ref":"refs/tags/v1.0=
.0-rc.2"},\
+{"module":"github.com/containerd/cgroups/v3","version":"v3.1.0","vcs_has=
h":"afcdc6b74bd9b0d30fcd801d4175ef54783d125d29b7cf31da1bed7135dae03e","ti=
mestamp":"2025-10-27T22:43:47Z","subdir":"","vcs_ref":"refs/tags/v3.1.0"}=
,\
+{"module":"github.com/containerd/fuse-overlayfs-snapshotter/v2","version=
":"v2.1.7","vcs_hash":"ebd7034108ca2f7b1a5d3724f3248f21f9cf17f5ecf3db9b5c=
71ee2e6de56563","timestamp":"2025-11-06T01:42:49Z","subdir":"v2","vcs_ref=
":"refs/tags/v2.1.7"},\
+{"module":"github.com/containerd/typeurl/v2","version":"v2.2.3","vcs_has=
h":"60bc9255cadbea28631b3293cd629cbe0b9a9cffb987712231cdc4f9dc75a2cb","ti=
mestamp":"2024-11-07T03:45:23Z","subdir":"","vcs_ref":"refs/tags/v2.2.3"}=
,\
+{"module":"github.com/containerd/errdefs","version":"v1.0.0","vcs_hash":=
"d9d1c9949e837f39205605237b656e944c7d0cd69e48a906fabdb6bebe0edb66","times=
tamp":"2024-10-08T13:10:09Z","subdir":"","vcs_ref":"refs/tags/v1.0.0"},\
+{"module":"github.com/containerd/errdefs/pkg","version":"v0.3.0","vcs_ha=
sh":"d9d1c9949e837f39205605237b656e944c7d0cd69e48a906fabdb6bebe0edb66","t=
imestamp":"2024-10-08T13:10:09Z","subdir":"pkg","vcs_ref":"refs/tags/pkg/=
v0.3.0"},\
+{"module":"github.com/containerd/ttrpc","version":"v1.2.7","vcs_hash":"8=
9e0e59ec2637becf69ff869326d460e7b3aa5c251d58a6d42981bc9c12360fd","timesta=
mp":"2024-12-28T23:29:38Z","subdir":"","vcs_ref":"refs/tags/v1.2.7"},\
+{"module":"github.com/containerd/continuity","version":"v0.4.5","vcs_has=
h":"ef286b146362aa5da58f9ef4e88323a32e1ea45eda78c6d484875972ce0a81e0","ti=
mestamp":"2024-10-30T04:18:59Z","subdir":"","vcs_ref":"refs/tags/v0.4.5"}=
,\
+{"module":"github.com/containerd/log","version":"v0.1.0","vcs_hash":"697=
be36d9b8a0eb34f8591d0f69b6d596e1e9341b5944ebf81ddd334b1907bc6","timestamp=
":"2023-09-09T00:27:15Z","subdir":"","vcs_ref":"refs/tags/v0.1.0"},\
+{"module":"github.com/containerd/containerd/api","version":"v1.10.0","vc=
s_hash":"4ae09c91c596d23f3127d6821ac6178aa6512e66eba4da3a39e7c94903e2407b=
","timestamp":"2025-11-05T15:11:32Z","subdir":"api","vcs_ref":"refs/tags/=
api/v1.10.0"},\
+{"module":"github.com/containerd/containerd/v2","version":"v2.2.0","vcs_=
hash":"003bc34c1dde3a2ee67d971788503962fb4b2b4dd2f0c77c2b690f26457b75ca",=
"timestamp":"2025-11-06T01:13:11Z","subdir":"","vcs_ref":"refs/tags/v2.2.=
0"},\
+{"module":"github.com/coreos/go-systemd/v22","version":"v22.6.0","vcs_ha=
sh":"cb3155042a873c409f7dda7401561f3206a5dc4225d8ce9335fd9da1ee482c05","t=
imestamp":"2025-08-20T18:00:08Z","subdir":"","vcs_ref":"refs/tags/v22.6.0=
"},\
+{"module":"google.golang.org/appengine","version":"v1.1.0","vcs_hash":"0=
02b5670204043ccd079efb6d63593281adeda7cdb3438553d5f59123714dd9d","timesta=
mp":"2018-05-21T22:34:13Z","subdir":"","vcs_ref":"refs/tags/v1.1.0"},\
+{"module":"google.golang.org/appengine","version":"v1.4.0","vcs_hash":"6=
985551872e9385a78906b511015e4428f8582eda7da3fa8b99f12fc9e94e0e3","timesta=
mp":"2018-12-17T20:59:03Z","subdir":"","vcs_ref":"refs/tags/v1.4.0"},\
+{"module":"google.golang.org/genproto","version":"v0.0.0-20180817151627-=
c66870c02cf8","vcs_hash":"2e90a35366d1da1bf52aba5763ec05ba14e4ec06446cdfe=
1a754af830eb9fc4a","timestamp":"2018-08-17T15:16:27Z","subdir":"","vcs_re=
f":""},\
+{"module":"google.golang.org/genproto","version":"v0.0.0-20190819201941-=
24fa4b261c55","vcs_hash":"8c877fcc5f4a5bef6db5a87334d34f9165c6d6c864a08e9=
fe01ad2e1269bb030","timestamp":"2019-08-19T20:19:41Z","subdir":"","vcs_re=
f":""},\
+{"module":"google.golang.org/genproto","version":"v0.0.0-20200526211855-=
cb27e3aa2013","vcs_hash":"f4e88ad01c32fa84f172d06a8fd34c47643c43e7c69ee97=
316a94e1a0ace3b25","timestamp":"2020-05-26T21:18:55Z","subdir":"","vcs_re=
f":""},\
+{"module":"google.golang.org/genproto/googleapis/api","version":"v0.0.0-=
20250804133106-a7a43d27e69b","vcs_hash":"8d1ae8953d4e81e4a7b4b6ad849d7016=
ae871670c27f2ee0089c64c2e4294ddc","timestamp":"2025-08-04T13:31:06Z","sub=
dir":"googleapis/api","vcs_ref":""},\
+{"module":"google.golang.org/genproto/googleapis/rpc","version":"v0.0.0-=
20250804133106-a7a43d27e69b","vcs_hash":"8d1ae8953d4e81e4a7b4b6ad849d7016=
ae871670c27f2ee0089c64c2e4294ddc","timestamp":"2025-08-04T13:31:06Z","sub=
dir":"googleapis/rpc","vcs_ref":""},\
+{"module":"google.golang.org/protobuf","version":"v1.36.10","vcs_hash":"=
3436497d01a86cde43a5e76c997e02e0547f362e8f0246dcbb7680acad79157f","timest=
amp":"2025-10-02T08:56:10Z","subdir":"","vcs_ref":"refs/tags/v1.36.10"},\
+{"module":"google.golang.org/protobuf","version":"v0.0.0-20200109180630-=
ec00e32a8dfd","vcs_hash":"11dd3abcdf0bca5a664e8bbb4cfe97a029b0429be1f3ffa=
36c3ff6291d482fe6","timestamp":"2020-01-09T18:06:30Z","subdir":"","vcs_re=
f":""},\
+{"module":"google.golang.org/protobuf","version":"v0.0.0-20200221191635-=
4d8936d0db64","vcs_hash":"5ff0520fa4067b911a561ac5bd9b5c4aef35ed0b28bc716=
a0d7503df6f292fba","timestamp":"2020-02-21T19:16:35Z","subdir":"","vcs_re=
f":""},\
+{"module":"google.golang.org/protobuf","version":"v0.0.0-20200228230310-=
ab0ca4ff8a60","vcs_hash":"bc64bffea0101db18ce198fe50ccee1b34ede4bbe6df0da=
f4943785f88a2665f","timestamp":"2020-02-28T23:03:10Z","subdir":"","vcs_re=
f":""},\
+{"module":"google.golang.org/protobuf","version":"v1.20.1-0.202003092002=
17-e05f789c0967","vcs_hash":"5be79d49c339af2a47aec21e2a6c3827a854579ce046=
e58eb12c45b13cc54dfb","timestamp":"2020-03-09T20:02:17Z","subdir":"","vcs=
_ref":""},\
+{"module":"google.golang.org/protobuf","version":"v1.21.0","vcs_hash":"b=
66e2f94014f3dadd38321a8ae33347a24d4580a57d66c71189f792e6fbdccb2","timesta=
mp":"2020-04-13T18:57:02Z","subdir":"","vcs_ref":"refs/tags/v1.21.0"},\
+{"module":"google.golang.org/protobuf","version":"v1.22.0","vcs_hash":"3=
97e5b05f3f4e5369964001986d9c4c3e998f4f07ff952c7073f4a6eb41ed83e","timesta=
mp":"2020-05-04T19:17:18Z","subdir":"","vcs_ref":"refs/tags/v1.22.0"},\
+{"module":"google.golang.org/protobuf","version":"v1.23.0","vcs_hash":"f=
e9b8770004b8051ad2328d8bc677057a91d457f03b0a432dda814855d97d008","timesta=
mp":"2020-05-14T20:12:30Z","subdir":"","vcs_ref":"refs/tags/v1.23.0"},\
+{"module":"google.golang.org/protobuf","version":"v1.23.1-0.202005261951=
55-81db48ad09cc","vcs_hash":"6672d6c61253550fee094c62b7113d620e09975c4fdd=
6a2d3f730f829d3aa7b5","timestamp":"2020-05-26T19:51:55Z","subdir":"","vcs=
_ref":""},\
+{"module":"google.golang.org/protobuf","version":"v1.25.0","vcs_hash":"3=
d6aee3027d2f1fb2a147e8904f03ce6eb1828daf030dc46aaf1528caa0d21f7","timesta=
mp":"2020-06-22T20:32:15Z","subdir":"","vcs_ref":"refs/tags/v1.25.0"},\
+{"module":"google.golang.org/grpc","version":"v1.76.0","vcs_hash":"0c7b8=
28398bb55c8fc7b52129e4867f1f0efae601c9c27e2295d6fca0d979bfc","timestamp":=
"2025-10-06T20:38:31Z","subdir":"","vcs_ref":"refs/tags/v1.76.0"},\
+{"module":"google.golang.org/grpc","version":"v1.19.0","vcs_hash":"a0c19=
6f14d37fa5876674ce232fea42efebf6c35dc46d41f266e22b2c7e30959","timestamp":=
"2019-02-26T18:45:09Z","subdir":"","vcs_ref":"refs/tags/v1.19.0"},\
+{"module":"google.golang.org/grpc","version":"v1.23.0","vcs_hash":"ffbc3=
aa648503af50d3781760eb60394842a0f05e745dbb7f28b5246843e0675","timestamp":=
"2019-08-13T19:31:37Z","subdir":"","vcs_ref":"refs/tags/v1.23.0"},\
+{"module":"google.golang.org/grpc","version":"v1.25.1","vcs_hash":"418d5=
4448e9be6e664bfa3e3e2514e15f092e4297963eed5c1e3c7e7e569c464","timestamp":=
"2019-11-08T18:22:05Z","subdir":"","vcs_ref":"refs/tags/v1.25.1"},\
+{"module":"google.golang.org/grpc","version":"v1.27.0","vcs_hash":"d3344=
0dd79b6e7c93174f3dcb6fccb7ccfebd02a4405850443d56e62d285f44a","timestamp":=
"2020-01-28T19:14:05Z","subdir":"","vcs_ref":"refs/tags/v1.27.0"},\
+{"module":"google.golang.org/grpc","version":"v1.33.2","vcs_hash":"9dd08=
885e1a8db43a8455d2fd3a42384ff1ed9a8f79e116dffcce781b4dee045","timestamp":=
"2020-11-06T17:41:19Z","subdir":"","vcs_ref":"refs/tags/v1.33.2"},\
+{"module":"google.golang.org/grpc/cmd/protoc-gen-go-grpc","version":"v1.=
5.1","vcs_hash":"ce5a862c22ded840bff7b7ec1016804cb0af284075ea09fb5fe73b98=
66532a3a","timestamp":"2024-07-29T17:04:12Z","subdir":"cmd/protoc-gen-go-=
grpc","vcs_ref":"refs/tags/cmd/protoc-gen-go-grpc/v1.5.1"},\
+{"module":"cloud.google.com/go","version":"v0.26.0","vcs_hash":"9baabd0f=
71699c684812b7f389cd3d568e37a0683bd02d5556e7076b96b7c14c","timestamp":"19=
70-01-01T00:00:00Z","subdir":"","vcs_ref":""},\
+{"module":"golang.org/x/lint","version":"v0.0.0-20190313153728-d0100b6bd=
8b3","vcs_hash":"1579e0152a59419ec03794703218d5fb2fa620626cecad2e79ddd1fd=
d861441d","timestamp":"2019-03-13T15:37:28Z","subdir":"","vcs_ref":""},\
+{"module":"golang.org/x/xerrors","version":"v0.0.0-20200804184101-5ec99f=
83aff1","vcs_hash":"1a7eef0babb47828059471e537bef1e9023bf22cd1c23e5fcaf75=
23b68332e82","timestamp":"2020-08-04T18:41:01Z","subdir":"","vcs_ref":""}=
,\
+{"module":"honnef.co/go/tools","version":"v0.0.0-20190523083050-ea95bdfd=
59fc","vcs_hash":"995bdd0e708de1678d46517c89bc37c3a96f080c46f8be3ca8451c4=
2cf0fb77c","timestamp":"2019-05-23T08:30:50Z","subdir":"tools","vcs_ref":=
""},\
+{"module":"golang.org/x/mod","version":"v0.2.0","vcs_hash":"d8ce3a26ef11=
a4e81bfc12391c4d0bf865766bcb2812acb31931c12ee0d326f8","timestamp":"1970-0=
1-01T00:00:00Z","subdir":"","vcs_ref":"refs/tags/v0.2.0"},\
+{"module":"golang.org/x/mod","version":"v0.3.0","vcs_hash":"c7adf8bcca55=
c1652cddd18c7e949788e387f878482d2553dd5f0a8b63dae8ba","timestamp":"1970-0=
1-01T00:00:00Z","subdir":"","vcs_ref":"refs/tags/v0.3.0"},\
+{"module":"golang.org/x/net","version":"v0.0.0-20180724234803-3673e40ba2=
25","vcs_hash":"645542ab30875dc13b8cd02d69294c39bfb243c2b7a5924217909131e=
99f8b30","timestamp":"2018-07-24T23:48:03Z","subdir":"","vcs_ref":"refs/t=
ags/v0.3.0"},\
+{"module":"golang.org/x/net","version":"v0.0.0-20180826012351-8a410e7b63=
8d","vcs_hash":"e31ab9c9a7277e166a279e2fceb43f80960020ca579fa9fb048ecf231=
b9c8448","timestamp":"2018-08-26T01:23:51Z","subdir":"","vcs_ref":"refs/t=
ags/v0.3.0"},\
+{"module":"golang.org/x/net","version":"v0.0.0-20190213061140-3a22650c66=
bd","vcs_hash":"7fc88000c7c9a3a6439d5b27a58b149d3380e568a6d6928be7bd8ebe2=
8174e5b","timestamp":"2019-02-13T06:11:40Z","subdir":"","vcs_ref":"refs/t=
ags/v0.3.0"},\
+{"module":"golang.org/x/net","version":"v0.0.0-20190311183353-d888771761=
5a","vcs_hash":"714bec1e4a790e75c4d5f275f6cc3299377b76073bf188eb3f7cafe8d=
758a77d","timestamp":"2019-03-11T18:33:53Z","subdir":"","vcs_ref":"refs/t=
ags/v0.3.0"},\
+{"module":"golang.org/x/net","version":"v0.0.0-20190404232315-eb5bcb51f2=
a3","vcs_hash":"ae86d4593bf8e0a0514f77d1f3831f0f2f4214c3d1e77cc50661343ba=
4fcdebe","timestamp":"2019-04-04T23:23:15Z","subdir":"","vcs_ref":"refs/t=
ags/v0.3.0"},\
+{"module":"golang.org/x/net","version":"v0.0.0-20190620200207-3b0461eec8=
59","vcs_hash":"3c84774e4b117bf9ca7f463a9106bc672447617fbfdf58b268e7a74cb=
79b8882","timestamp":"2019-06-20T20:02:07Z","subdir":"","vcs_ref":"refs/t=
ags/v0.3.0"},\
+{"module":"golang.org/x/net","version":"v0.0.0-20200226121028-0de0cce016=
9b","vcs_hash":"4a83ce2ea03f8d39736df96f33e3c12c6f2736e4e2d7c83f96b043f96=
b097451","timestamp":"2020-02-26T12:10:28Z","subdir":"","vcs_ref":"refs/t=
ags/v0.3.0"},\
+{"module":"golang.org/x/net","version":"v0.0.0-20201021035429-f5854403a9=
74","vcs_hash":"fc8ecf11eddaf279509465d2c0dde9c76fb90ea7c097356e83c6ed4c3=
75e1c16","timestamp":"2020-10-21T03:54:29Z","subdir":"","vcs_ref":"refs/t=
ags/v0.3.0"},\
+{"module":"golang.org/x/net","version":"v0.0.0-20201110031124-69a78807bb=
2b","vcs_hash":"790f338e43aad3af78a9eb98e04e8e9e896e3a4ba134a79d5c8585b66=
1ac7984","timestamp":"2020-11-10T03:11:24Z","subdir":"","vcs_ref":"refs/t=
ags/v0.3.0"},\
+{"module":"golang.org/x/oauth2","version":"v0.0.0-20180821212333-d2e6202=
438be","vcs_hash":"aa7163e3ef1faa055e8f431a679121b6aa4ca8647ee8b06ea68618=
e819017713","timestamp":"2018-08-21T21:23:33Z","subdir":"","vcs_ref":"ref=
s/tags/v0.3.0"},\
+{"module":"golang.org/x/sync","version":"v0.0.0-20180314180146-1d60e4601=
c6f","vcs_hash":"a474d88ee14fcd89b314b779d02a4628461aebbfc6613a6ba90e583c=
35e15b02","timestamp":"2018-03-14T18:01:46Z","subdir":"","vcs_ref":"refs/=
tags/v0.3.0"},\
+{"module":"golang.org/x/sync","version":"v0.0.0-20181108010431-42b317875=
d0f","vcs_hash":"19d48188f5a03164bde06d13dc555c6a2ebc78aafd3dabc7439ec4c9=
dcca3519","timestamp":"2018-11-08T01:04:31Z","subdir":"","vcs_ref":"refs/=
tags/v0.3.0"},\
+{"module":"golang.org/x/sync","version":"v0.0.0-20190423024810-112230192=
c58","vcs_hash":"b68e56943c8c12324ce0414e7075fd80f016eafe879c0c69e6b25893=
ebb49bce","timestamp":"2019-04-23T02:48:10Z","subdir":"","vcs_ref":"refs/=
tags/v0.3.0"},\
+{"module":"golang.org/x/sync","version":"v0.0.0-20190911185100-cd5d95a43=
a6e","vcs_hash":"eaa2921285a7524f3154ea98a551847767b259c18f901ed97668900b=
204aa7a6","timestamp":"2019-09-11T18:51:00Z","subdir":"","vcs_ref":"refs/=
tags/v0.3.0"},\
+{"module":"golang.org/x/sync","version":"v0.0.0-20201020160332-67f06af15=
bc9","vcs_hash":"63c5dce6fecd17ec0193ec4ee4221b61ccd0834c745a066128df4000=
c7ec583e","timestamp":"2020-10-20T16:03:32Z","subdir":"","vcs_ref":"refs/=
tags/v0.3.0"},\
+{"module":"golang.org/x/sys","version":"v0.0.0-20180830151530-49385e6e15=
22","vcs_hash":"9039de5e2ba775addafc7d6cd06d2390dd60ba6ff11978f6f7708e792=
ae9b202","timestamp":"2018-08-30T15:15:30Z","subdir":"","vcs_ref":"refs/t=
ags/v0.3.0"},\
+{"module":"golang.org/x/sys","version":"v0.0.0-20190215142949-d0b11bdaac=
8a","vcs_hash":"f12e98c7124bdf27aa44290b851a1ac08039087a76b23733d63312bc7=
84b1556","timestamp":"2019-02-15T14:29:49Z","subdir":"","vcs_ref":"refs/t=
ags/v0.3.0"},\
+{"module":"golang.org/x/sys","version":"v0.0.0-20190412213103-9773273309=
9d","vcs_hash":"aa620878a9f9f2576616d28b01af853869a5a014c70f6b2966e79beae=
63baeae","timestamp":"2019-04-12T21:31:03Z","subdir":"","vcs_ref":"refs/t=
ags/v0.3.0"},\
+{"module":"golang.org/x/sys","version":"v0.0.0-20200930185726-fdedc70b46=
8f","vcs_hash":"782e11bb6bc760c1f6beebcc00039d583f0f5dce996fff1adc7a3eac7=
0c2c65b","timestamp":"2020-09-30T18:57:26Z","subdir":"","vcs_ref":"refs/t=
ags/v0.3.0"},\
+{"module":"golang.org/x/sys","version":"v0.0.0-20220715151400-c0bba94af5=
f8","vcs_hash":"e4718f232872f03637fc197e3ccf66bc067874db09f67e7567cae86e8=
cee6732","timestamp":"2022-07-15T15:14:00Z","subdir":"","vcs_ref":"refs/t=
ags/v0.3.0"},\
+{"module":"golang.org/x/text","version":"v0.3.0","vcs_hash":"e9ec4c6af0a=
cd56750bc559cb32d09c01276f0ac22e70bb84dd122fdfa9e2db7","timestamp":"1970-=
01-01T00:00:00Z","subdir":"","vcs_ref":"refs/tags/v0.3.0"},\
+{"module":"golang.org/x/text","version":"v0.3.3","vcs_hash":"fc27daff31c=
5f47a26c7ef94196bf8cee86c79308480edbe7cf8e4dc0c447e43","timestamp":"1970-=
01-01T00:00:00Z","subdir":"","vcs_ref":"refs/tags/v0.3.3"},\
+{"module":"golang.org/x/tools","version":"v0.0.0-20180917221912-90fa682c=
2a6e","vcs_hash":"e396d41e128acc62cbad331ee090a99e470d23a3611d8b07d3c2cc4=
1a1cc0b49","timestamp":"2018-09-17T22:19:12Z","subdir":"","vcs_ref":"refs=
/tags/v0.3.3"},\
+{"module":"golang.org/x/tools","version":"v0.0.0-20190114222345-bf090417=
da8b","vcs_hash":"af3c08c9017348d0a11699087455e33b9a2822c39bdbae5ffe5757b=
448be7d38","timestamp":"2019-01-14T22:23:45Z","subdir":"","vcs_ref":"refs=
/tags/v0.3.3"},\
+{"module":"golang.org/x/tools","version":"v0.0.0-20190226205152-f727befe=
758c","vcs_hash":"4e56e084dd75c8283bc4445105a474a9f715b9fd5d860b0e5c12c56=
7ddd9f950","timestamp":"2019-02-26T20:51:52Z","subdir":"","vcs_ref":"refs=
/tags/v0.3.3"},\
+{"module":"golang.org/x/tools","version":"v0.0.0-20190311212946-11955173=
bddd","vcs_hash":"844d4dad510f2c01dc0afd28d06c23ff2ffc385ddf161fb554c9147=
9292e1856","timestamp":"2019-03-11T21:29:46Z","subdir":"","vcs_ref":"refs=
/tags/v0.3.3"},\
+{"module":"golang.org/x/tools","version":"v0.0.0-20190524140312-2c0ae700=
6135","vcs_hash":"4c8a444f6107791541908255bd50e11af470e356ff01ab9ac1f463d=
ecf2926fe","timestamp":"2019-05-24T14:03:12Z","subdir":"","vcs_ref":"refs=
/tags/v0.3.3"},\
+{"module":"golang.org/x/tools","version":"v0.0.0-20191119224855-298f0cb1=
881e","vcs_hash":"4bdade122172b6644bff0ea433cdb68d5460d8b894432e030ced235=
888ac6fdc","timestamp":"2019-11-19T22:48:55Z","subdir":"","vcs_ref":"refs=
/tags/v0.3.3"},\
+{"module":"golang.org/x/tools","version":"v0.0.0-20200619180055-7c47624d=
f98f","vcs_hash":"a7efe20c5bee119c7e0018be6d57820b9b6a182d1818d3ec344c022=
fad6b7114","timestamp":"2020-06-19T18:00:55Z","subdir":"","vcs_ref":"refs=
/tags/v0.3.3"},\
+{"module":"golang.org/x/tools","version":"v0.0.0-20210106214847-113979e3=
529a","vcs_hash":"74532c68be1c7f64a0eee926ba2b0b7d4552a8c11bae36838bf1701=
86db4264d","timestamp":"2021-01-06T21:48:47Z","subdir":"","vcs_ref":"refs=
/tags/v0.3.3"},\
+{"module":"golang.org/x/xerrors","version":"v0.0.0-20190717185122-a985d3=
407aa7","vcs_hash":"19bf66358270f1db6b287805895c6fc8385236e01234a96b3da1d=
15fe70245f7","timestamp":"2019-07-17T18:51:22Z","subdir":"","vcs_ref":"re=
fs/tags/v0.3.3"},\
+{"module":"golang.org/x/xerrors","version":"v0.0.0-20191011141410-1b5146=
add898","vcs_hash":"8c142112d3bf2046dde4cb3dda11db03c95a8ab51bfb424b4d31b=
e45594f7e6a","timestamp":"2019-10-11T14:14:10Z","subdir":"","vcs_ref":"re=
fs/tags/v0.3.3"},\
+{"module":"golang.org/x/xerrors","version":"v0.0.0-20191204190536-9bdfab=
e68543","vcs_hash":"a190c0bd506167cc1631eefeb81697d88fd666066c0d35abb4f05=
8915f9881cd","timestamp":"2019-12-04T19:05:36Z","subdir":"","vcs_ref":"re=
fs/tags/v0.3.3"},\
+{"module":"honnef.co/go/tools","version":"v0.0.0-20190102054323-c2f93a96=
b099","vcs_hash":"1c8623cf2c7ebfeee0aad3729998ea1016b99ce59691f48e992f1fb=
d376fe06b","timestamp":"2019-01-02T05:43:23Z","subdir":"tools","vcs_ref":=
"refs/tags/v0.3.3"}\
+]'
diff --git a/recipes-containers/fuse-overlayfs-snapshotter/go-mod-git.inc=
 b/recipes-containers/fuse-overlayfs-snapshotter/go-mod-git.inc
new file mode 100644
index 000000000000..b9109ba0757d
--- /dev/null
+++ b/recipes-containers/fuse-overlayfs-snapshotter/go-mod-git.inc
@@ -0,0 +1,312 @@
+# Generated by oe-go-mod-fetcher.py v3.0.0
+# Git repositories for Go module dependencies
+
+SRC_URI +=3D "git://github.com/cncf-tags/container-device-interface;prot=
ocol=3Dhttps;nobranch=3D1;tag=3Dspecs-go/v1.0.0;shallow=3D1;rev=3D40e4c31=
1613750fb2bf8766635d4ed60c0bf3194;name=3Dgit_c2439148_0;destsuffix=3Dvcs_=
cache/a9b36137e55bc5c537c3eddc79e73eca4dc1c855628a8e32e027103df4d865f4"
+SRC_URI +=3D "git://github.com/cncf-tags/container-device-interface;prot=
ocol=3Dhttps;nobranch=3D1;tag=3Dv1.0.1;shallow=3D1;rev=3D79790445c2d70820=
f6824eb42832d2efd0f08dd2;name=3Dgit_c2439148_1;destsuffix=3Dvcs_cache/228=
f05c3a05800a5e1340385d34910aac599df817838e50aa367b9cd09151186"
+SRC_URI +=3D "git://github.com/kubernetes-sigs/yaml;protocol=3Dhttps;nob=
ranch=3D1;tag=3Dv1.6.0;shallow=3D1;rev=3D048d724aca2d37ddb5b03c90b5b4550a=
3a48766d;name=3Dgit_a731a2aa_0;destsuffix=3Dvcs_cache/289ff1bc36e2275d8f5=
8e8de4b1e27b0cabf0d8bfcb2058f040045490a48f9fc"
+SRC_URI +=3D "git://github.com/kubernetes-sigs/structured-merge-diff;pro=
tocol=3Dhttps;nobranch=3D1;tag=3Dv6.3.0;shallow=3D1;rev=3Dd3e4dc6f630e155=
d2fbfdac465eb0da8a737245f;name=3Dgit_68ce0dfe_0;destsuffix=3Dvcs_cache/d6=
6ac94ec61bd2ff1830ecd910c5ba59307d9987a0b5e8bc4d43eed2a9670e03"
+SRC_URI +=3D "git://github.com/kubernetes-sigs/json;protocol=3Dhttps;bra=
nch=3Dmain;rev=3Dcfa47c3a1cc8ff0eff148aa9ec5b0226d0909e87;name=3Dgit_5671=
cdf3_0;destsuffix=3Dvcs_cache/af72b3861f1b450d8fac535a64ce765bba3c291956e=
c3c652a5f54db46add460"
+SRC_URI +=3D "git://github.com/kubernetes-sigs/randfill;protocol=3Dhttps=
;nobranch=3D1;tag=3Dv1.0.0;shallow=3D1;rev=3D1b6128de8ceabf6d20c4d81d770b=
f439c1494960;name=3Dgit_8dcba602_0;destsuffix=3Dvcs_cache/64598686d0dc1d4=
99a7860fd9d58ec01370c353b03b4e9377d668d615af13dc6"
+SRC_URI +=3D "git://github.com/kubernetes/utils;protocol=3Dhttps;branch=3D=
master;rev=3D4c0f3b24339726b3d4a1b610c150919126aad841;name=3Dgit_9da930f9=
_0;destsuffix=3Dvcs_cache/60ee1a48e44e3b939997e0fd54e801d1b11cfe7183c5f29=
5746d2564bd6860e8"
+SRC_URI +=3D "git://github.com/kubernetes/klog;protocol=3Dhttps;nobranch=
=3D1;tag=3Dv2.130.1;shallow=3D1;rev=3D75663bb798999a49e3e4c0f2375ed5cca81=
64194;name=3Dgit_9d03197d_0;destsuffix=3Dvcs_cache/eaab5e8e1958570d9bced9=
a912298fdaa9472cecec794161f58aebf8c4d1e963"
+SRC_URI +=3D "git://github.com/kubernetes/cri-api;protocol=3Dhttps;nobra=
nch=3D1;tag=3Dv0.34.1;shallow=3D1;rev=3D9b3ce5ec47987aa9451184a42273d4d36=
e789f83;name=3Dgit_31e69ce5_0;destsuffix=3Dvcs_cache/7301e739a4795b683b66=
e93dd7c6f440f5c5fddd2ad7816c05a5678c723aca60"
+SRC_URI +=3D "git://github.com/kubernetes/client-go;protocol=3Dhttps;nob=
ranch=3D1;tag=3Dv0.34.1;shallow=3D1;rev=3Dd033c497ffef47be9b4f81abde5c3d9=
4dd78089a;name=3Dgit_0356f569_0;destsuffix=3Dvcs_cache/25b2ca19570dcf36fc=
fa8a5388cc7647944fee1a9a445671e69704dbd6f452b5"
+SRC_URI +=3D "git://github.com/kubernetes/apimachinery;protocol=3Dhttps;=
nobranch=3D1;tag=3Dv0.34.1;shallow=3D1;rev=3Db72d93d174332f952a8d431419fe=
ce5e6f044bcb;name=3Dgit_d6490ebc_0;destsuffix=3Dvcs_cache/9131e9ebe36078f=
01c5a5e8e9866300b853aa46fab527d00fc089d4c16938663"
+SRC_URI +=3D "git://github.com/kubernetes/api;protocol=3Dhttps;nobranch=3D=
1;tag=3Dv0.34.1;shallow=3D1;rev=3D77c9e29b068e14d4bcca2d6a4c85b2cc9da5a92=
3;name=3Dgit_91745483_0;destsuffix=3Dvcs_cache/5c4bbd0617f6f594b275f1999f=
97eca8f79dbb30e908e7d6b5c7a80fd5b9b0d2"
+SRC_URI +=3D "git://github.com/yaml/go-yaml;protocol=3Dhttps;nobranch=3D=
1;tag=3Dv2.4.2;shallow=3D1;rev=3D246a95c22c57f15ef6d3305a1f1b8a0b05e4d560=
;name=3Dgit_780106c7_0;destsuffix=3Dvcs_cache/8e5c657c86d0e182b5f4d6ed371=
5a0ec93dfb998d8ef94555af035578a3aba8d"
+SRC_URI +=3D "git://github.com/uber/mock;protocol=3Dhttps;nobranch=3D1;t=
ag=3Dv0.5.0;shallow=3D1;rev=3Da9c44d91ce00ef09603d3822452a4f9c8fefd278;na=
me=3Dgit_d59a22ac_0;destsuffix=3Dvcs_cache/84690e1069b4ad70e2d5fec3d8f934=
623d7d299829df8ba8c5fcaeec38806c67"
+SRC_URI +=3D "git://github.com/uber-go/goleak;protocol=3Dhttps;nobranch=3D=
1;tag=3Dv1.3.0;shallow=3D1;rev=3D31095c657c34bba405a8d480db27989aa5f60b9c=
;name=3Dgit_aa00c2c2_0;destsuffix=3Dvcs_cache/358840d6c8d4d8a268b95a505fd=
6f93da14af34041c0824fe51920b4cd523ae2"
+SRC_URI +=3D "git://github.com/imdario/mergo;protocol=3Dhttps;nobranch=3D=
1;tag=3Dv1.0.2;shallow=3D1;rev=3D7b33b2b01026fbbbbfcfbb1ee2c9c0a5e0c9a9f7=
;name=3Dgit_c84ab7ed_0;destsuffix=3Dvcs_cache/b16914f71b927e268f1d35e84fd=
54af7eca655000013af4d0f184bcbd154847c"
+SRC_URI +=3D "git://github.com/google/cel-spec;protocol=3Dhttps;nobranch=
=3D1;tag=3Dv0.24.0;shallow=3D1;rev=3D9f069b3ee58b02d6f6736c5ebd6587075c1a=
1b22;name=3Dgit_9b911644_0;destsuffix=3Dvcs_cache/22be8bab702f88ee991b30c=
18c7bac8535814d8de3215c69ac9ee1e73da82c45"
+SRC_URI +=3D "git://github.com/go-inf/inf;protocol=3Dhttps;nobranch=3D1;=
tag=3Dv0.9.1;shallow=3D1;rev=3Dd2d2541c53f18d2a059457998ce2876cc8e67cbf;n=
ame=3Dgit_989ffae9_0;destsuffix=3Dvcs_cache/61185ca91404d2e09a193aede807b=
4a9ededd43199f58cd49ec4cef480d7bc7f"
+SRC_URI +=3D "git://github.com/go-yaml/yaml;protocol=3Dhttps;branch=3Dv3=
;rev=3D9f266ea9e77c4c7aab4cf02650570e7c7b3031a5;name=3Dgit_b0089ab1_0;des=
tsuffix=3Dvcs_cache/ae6e6119974a43d5668501b6efe7e743408319dee4094d1929d3e=
75a4f5dac98"
+SRC_URI +=3D "git://github.com/go-yaml/yaml;protocol=3Dhttps;nobranch=3D=
1;tag=3Dv3.0.1;shallow=3D1;rev=3Df6f7691b1fdeb513f56608cd2c32c51f8194bf51=
;name=3Dgit_b0089ab1_1;destsuffix=3Dvcs_cache/8d340fff421a1861f196061b40e=
49b2f9e802647204935d08e1062b8ecd90b0d"
+SRC_URI +=3D "git://github.com/go-check/check;protocol=3Dhttps;branch=3D=
v1;rev=3D10cb98267c6cb43ea9cd6793f29ff4089c306974;name=3Dgit_fc1e328f_0;d=
estsuffix=3Dvcs_cache/b8ed7c01feb15e76511fd0dcf4b7d5e0ab535f96b5fe0e22cd9=
854a758a6c38d"
+SRC_URI +=3D "git://github.com/go-check/check;protocol=3Dhttps;branch=3D=
v1;rev=3D20d25e2804050c1cd24a7eea1e7a6447dd0e74ec;name=3Dgit_fc1e328f_1;d=
estsuffix=3Dvcs_cache/f6f7125ac7ef086ca6395a14a9a28c8c11cd6f8790a8be7cfd6=
475d1acd0f40b"
+SRC_URI +=3D "git://github.com/open-telemetry/opentelemetry-proto-go;pro=
tocol=3Dhttps;nobranch=3D1;tag=3Dotlp/v1.5.0;shallow=3D1;rev=3Dec37164291=
d0b5f316b241895d14d36aea7bf873;name=3Dgit_430aa893_0;destsuffix=3Dvcs_cac=
he/bb2df70072e7b2abbf91b8af5835a5535fafdffbd50581924af5c001b24385f3"
+SRC_URI +=3D "git://github.com/open-telemetry/opentelemetry-go;protocol=3D=
https;nobranch=3D1;tag=3Dexporters/otlp/otlptrace/otlptracegrpc/v1.35.0;s=
hallow=3D1;rev=3D5ba5e7a449f36c1c02710bbaa517263797046db0;name=3Dgit_120e=
d83a_0;destsuffix=3Dvcs_cache/b9cfff93834a1198be78227766ecca2711856b6b1b0=
c7afbad371f153e4a7552"
+SRC_URI +=3D "git://github.com/open-telemetry/opentelemetry-go;protocol=3D=
https;nobranch=3D1;tag=3Dmetric/v1.37.0;shallow=3D1;rev=3D69e81088ad40f45=
a0764597326722dea8f3f00a8;name=3Dgit_120ed83a_1;destsuffix=3Dvcs_cache/78=
1ff191099a4dbb688b1ab043b1c6ab5c6d691f0f32fade9b2451f7eb5f55dc"
+SRC_URI +=3D "git://github.com/open-telemetry/opentelemetry-go-contrib;p=
rotocol=3Dhttps;nobranch=3D1;tag=3Ddetectors/gcp/v1.36.0;shallow=3D1;rev=3D=
934fb13b40419cc512bb56556f77d29a2f29d202;name=3Dgit_9cecf883_0;destsuffix=
=3Dvcs_cache/66834093881db18fc755a4aa1f4a68c031d78efbf6766aeccc5cec783597=
bb87"
+SRC_URI +=3D "git://github.com/open-telemetry/opentelemetry-go-contrib;p=
rotocol=3Dhttps;nobranch=3D1;tag=3Dinstrumentation/net/http/otelhttp/v0.6=
0.0;shallow=3D1;rev=3Dbc53d2b4eb4de79471bc54f64a5c3dcefa8720d7;name=3Dgit=
_9cecf883_1;destsuffix=3Dvcs_cache/e68cfa240102a0ba411506ff8b1aa264dbdc8d=
1fde95e16ea08f3695aad05b0b"
+SRC_URI +=3D "git://github.com/open-telemetry/opentelemetry-go-instrumen=
tation;protocol=3Dhttps;nobranch=3D1;tag=3Dsdk/v1.1.0;shallow=3D1;rev=3Db=
93ae2eed39af4db57ef0da19b3942b17d961ba1;name=3Dgit_0cf36a85_0;destsuffix=3D=
vcs_cache/7d299be0b1f84cdc22954c7fe0a7398309e62b99c0488a544fd0be16b0db85f=
4"
+SRC_URI +=3D "git://github.com/census-instrumentation/opencensus-go;prot=
ocol=3Dhttps;nobranch=3D1;tag=3Dv0.24.0;shallow=3D1;rev=3Db1a01ee95db0e69=
0d91d7193d037447816fae4c5;name=3Dgit_aae3ac7b_0;destsuffix=3Dvcs_cache/86=
07148e6fbec2ab3d0020ea3ffb8bdce7bc15dae97ebec60385afa6ddb97c29"
+SRC_URI +=3D "git://github.com/gonum/gonum;protocol=3Dhttps;nobranch=3D1=
;tag=3Dv0.16.0;shallow=3D1;rev=3D7826ba4358a76646a8bd1f852201c4fed2c81c38=
;name=3Dgit_63b91e23_0;destsuffix=3Dvcs_cache/525f00d6116e74b77041f8bb562=
564ec0e4c1d66d02a48c7b8093f8f931ae1c4"
+SRC_URI +=3D "git://github.com/googleapis/google-cloud-go;protocol=3Dhtt=
ps;nobranch=3D1;tag=3Dcompute/metadata/v0.7.0;shallow=3D1;rev=3D16fa77667=
978a8350a23247ca52be0670eca789d;name=3Dgit_8ce8c847_0;destsuffix=3Dvcs_ca=
che/af589471350866ad3ad2a6aa6c7dc61e09cf4bf82c155b086a7852014fe178c8"
+SRC_URI +=3D "git://github.com/googleapis/google-cloud-go;protocol=3Dhtt=
ps;branch=3Dmain;rev=3D64a2037ec6be8a4b0c1d1f706ed35b428b989239;name=3Dgi=
t_8ce8c847_1;destsuffix=3Dvcs_cache/9baabd0f71699c684812b7f389cd3d568e37a=
0683bd02d5556e7076b96b7c14c"
+SRC_URI +=3D "git://github.com/etcd-io/gofail;protocol=3Dhttps;nobranch=3D=
1;tag=3Dv0.2.0;shallow=3D1;rev=3Ded9ca8045cc22a3045168306f2039e9f0a5b397e=
;name=3Dgit_1b9be237_0;destsuffix=3Dvcs_cache/94af41cb3791d3446ad2efcce59=
de525d2df0ae4cf689775b2914bcf4100d3a8"
+SRC_URI +=3D "git://github.com/etcd-io/bbolt;protocol=3Dhttps;nobranch=3D=
1;tag=3Dv1.4.3;shallow=3D1;rev=3D68e6b96e6b74ebc396ac1aa7186c92e616960bd1=
;name=3Dgit_bd7d6031_0;destsuffix=3Dvcs_cache/5983ea71bb9e5e22aede686f4e2=
d57552e937bd9f2a5a3ca5e595c01b957c33a"
+SRC_URI +=3D "git://go.googlesource.com/time;protocol=3Dhttps;nobranch=3D=
1;tag=3Dv0.14.0;shallow=3D1;rev=3D2b4e43900c03fd6b77109b7b2b6d77583f48bc1=
c;name=3Dgit_e2f6844a_0;destsuffix=3Dvcs_cache/0b5a85f52d49b5c97b97cde355=
131c98905f13038f61a5848c4d01a01512f74b"
+SRC_URI +=3D "git://go.googlesource.com/term;protocol=3Dhttps;nobranch=3D=
1;tag=3Dv0.34.0;shallow=3D1;rev=3Da35244d18d7756b12deca31a518c0fa1327d050=
a;name=3Dgit_2e975dd2_0;destsuffix=3Dvcs_cache/4068bd62e633557f5121f1150b=
74cc041354352d709c0b6f81073ee6de3b795a"
+SRC_URI +=3D "git://go.googlesource.com/tools;protocol=3Dhttps;branch=3D=
internal-branch.go1.16-vendor;rev=3D113979e3529a77b99c4f3e5f3c8a22802a39c=
c95;name=3Dgit_7d9b3b49_0;destsuffix=3Dvcs_cache/74532c68be1c7f64a0eee926=
ba2b0b7d4552a8c11bae36838bf170186db4264d"
+SRC_URI +=3D "git://go.googlesource.com/tools;protocol=3Dhttps;branch=3D=
master;rev=3D11955173bddd0ab0afcd688e6dc9c1b7c28fb546;name=3Dgit_7d9b3b49=
_1;destsuffix=3Dvcs_cache/844d4dad510f2c01dc0afd28d06c23ff2ffc385ddf161fb=
554c91479292e1856"
+SRC_URI +=3D "git://go.googlesource.com/tools;protocol=3Dhttps;branch=3D=
master;rev=3D298f0cb1881e71e68bc5bc17757fabe78a426460;name=3Dgit_7d9b3b49=
_2;destsuffix=3Dvcs_cache/4bdade122172b6644bff0ea433cdb68d5460d8b894432e0=
30ced235888ac6fdc"
+SRC_URI +=3D "git://go.googlesource.com/tools;protocol=3Dhttps;branch=3D=
master;rev=3D2c0ae70061356820330c96810d9483beb9a6da8e;name=3Dgit_7d9b3b49=
_3;destsuffix=3Dvcs_cache/4c8a444f6107791541908255bd50e11af470e356ff01ab9=
ac1f463decf2926fe"
+SRC_URI +=3D "git://go.googlesource.com/tools;protocol=3Dhttps;nobranch=3D=
1;tag=3Dv0.35.0;shallow=3D1;rev=3D50ec2f15fda46d8960c1d871856265127b4dcce=
5;name=3Dgit_7d9b3b49_4;destsuffix=3Dvcs_cache/6f7867e6304cc0b73a1fd60c23=
6062aaec4940936d8451f9889a59124598273f"
+SRC_URI +=3D "git://go.googlesource.com/tools;protocol=3Dhttps;branch=3D=
master;rev=3D7c47624df98f421302ad5a380f58fd5ed0ecb734;name=3Dgit_7d9b3b49=
_5;destsuffix=3Dvcs_cache/a7efe20c5bee119c7e0018be6d57820b9b6a182d1818d3e=
c344c022fad6b7114"
+SRC_URI +=3D "git://go.googlesource.com/tools;protocol=3Dhttps;branch=3D=
master;rev=3D90fa682c2a6e6a37b3a1364ce2fe1d5e41af9d6d;name=3Dgit_7d9b3b49=
_6;destsuffix=3Dvcs_cache/e396d41e128acc62cbad331ee090a99e470d23a3611d8b0=
7d3c2cc41a1cc0b49"
+SRC_URI +=3D "git://go.googlesource.com/tools;protocol=3Dhttps;branch=3D=
master;rev=3Dbf090417da8b6150dcfe96795325f5aa78fff718;name=3Dgit_7d9b3b49=
_7;destsuffix=3Dvcs_cache/af3c08c9017348d0a11699087455e33b9a2822c39bdbae5=
ffe5757b448be7d38"
+SRC_URI +=3D "git://go.googlesource.com/tools;protocol=3Dhttps;branch=3D=
master;rev=3Df727befe758c04ce68d52abc6e69ad111e2c6797;name=3Dgit_7d9b3b49=
_8;destsuffix=3Dvcs_cache/4e56e084dd75c8283bc4445105a474a9f715b9fd5d860b0=
e5c12c567ddd9f950"
+SRC_URI +=3D "git://go.googlesource.com/oauth2;protocol=3Dhttps;nobranch=
=3D1;tag=3Dv0.30.0;shallow=3D1;rev=3Dcf1431934151b3a93e0b3286eb6798ca08ea=
3770;name=3Dgit_d7a72cb8_0;destsuffix=3Dvcs_cache/9d690404d55fe61f12b6029=
1b8248b30b26748c84367097aae3de38a202f1504"
+SRC_URI +=3D "git://go.googlesource.com/oauth2;protocol=3Dhttps;branch=3D=
master;rev=3Dd2e6202438beef2727060aa7cabdd924d92ebfd9;name=3Dgit_d7a72cb8=
_1;destsuffix=3Dvcs_cache/aa7163e3ef1faa055e8f431a679121b6aa4ca8647ee8b06=
ea68618e819017713"
+SRC_URI +=3D "git://go.googlesource.com/mod;protocol=3Dhttps;nobranch=3D=
1;tag=3Dv0.3.0;shallow=3D1;rev=3D859b3ef565e237f9f1a0fb6b55385c497545680d=
;name=3Dgit_13df7481_0;destsuffix=3Dvcs_cache/c7adf8bcca55c1652cddd18c7e9=
49788e387f878482d2553dd5f0a8b63dae8ba"
+SRC_URI +=3D "git://go.googlesource.com/mod;protocol=3Dhttps;nobranch=3D=
1;tag=3Dv0.29.0;shallow=3D1;rev=3Dbba3e065a67271df90253c78c98f2cea7f57294=
8;name=3Dgit_13df7481_1;destsuffix=3Dvcs_cache/e2f24273f66162f4a2bfde7357=
a860b565262f0932e1d1bcba22f2c375336f39"
+SRC_URI +=3D "git://go.googlesource.com/mod;protocol=3Dhttps;nobranch=3D=
1;tag=3Dv0.2.0;shallow=3D1;rev=3Ded3ec21bb8e252814c380df79a80f366440ddb2d=
;name=3Dgit_13df7481_2;destsuffix=3Dvcs_cache/d8ce3a26ef11a4e81bfc12391c4=
d0bf865766bcb2812acb31931c12ee0d326f8"
+SRC_URI +=3D "git://go.googlesource.com/exp;protocol=3Dhttps;branch=3Dma=
ster;rev=3D2d47ceb2692f22136c9ff680c192d3d19c5dd9e2;name=3Dgit_879ce674_0=
;destsuffix=3Dvcs_cache/fa78cf25fa01c74cefb0336713724c43d794cf309539a0b58=
c51aa1c413b6612"
+SRC_URI +=3D "git://go.googlesource.com/crypto;protocol=3Dhttps;nobranch=
=3D1;tag=3Dv0.41.0;shallow=3D1;rev=3Def5341b70697ceb55f904384bd982587224e=
8b0c;name=3Dgit_f72f7a6f_0;destsuffix=3Dvcs_cache/e7261c947a2da7702ddfbd8=
b4b2103f3f83b5024b046bd0f0762dddf1cc0b39d"
+SRC_URI +=3D "git://go.googlesource.com/text;protocol=3Dhttps;nobranch=3D=
1;tag=3Dv0.3.3;shallow=3D1;rev=3D23ae387dee1f90d29a23c0e87ee0b46038fbed0e=
;name=3Dgit_38515699_0;destsuffix=3Dvcs_cache/fc27daff31c5f47a26c7ef94196=
bf8cee86c79308480edbe7cf8e4dc0c447e43"
+SRC_URI +=3D "git://go.googlesource.com/text;protocol=3Dhttps;nobranch=3D=
1;tag=3Dv0.28.0;shallow=3D1;rev=3D425d715b4a85c7698cedf621412bb53794cbda5=
3;name=3Dgit_38515699_1;destsuffix=3Dvcs_cache/a7d5fe87723af3c471d5ed18e2=
5d604d34081f39ab1219b457b5da3a8ff54d08"
+SRC_URI +=3D "git://go.googlesource.com/text;protocol=3Dhttps;nobranch=3D=
1;tag=3Dv0.3.0;shallow=3D1;rev=3Df21a4dfb5e38f5895301dc265a8def02365cc3d0=
;name=3Dgit_38515699_2;destsuffix=3Dvcs_cache/e9ec4c6af0acd56750bc559cb32=
d09c01276f0ac22e70bb84dd122fdfa9e2db7"
+SRC_URI +=3D "git://go.googlesource.com/net;protocol=3Dhttps;branch=3Dma=
ster;rev=3D0de0cce0169b09b364e001f108dc0399ea8630b3;name=3Dgit_ed42bd05_0=
;destsuffix=3Dvcs_cache/4a83ce2ea03f8d39736df96f33e3c12c6f2736e4e2d7c83f9=
6b043f96b097451"
+SRC_URI +=3D "git://go.googlesource.com/net;protocol=3Dhttps;branch=3Dma=
ster;rev=3D3673e40ba22529d22c3fd7c93e97b0ce50fa7bdd;name=3Dgit_ed42bd05_1=
;destsuffix=3Dvcs_cache/645542ab30875dc13b8cd02d69294c39bfb243c2b7a592421=
7909131e99f8b30"
+SRC_URI +=3D "git://go.googlesource.com/net;protocol=3Dhttps;branch=3Dma=
ster;rev=3D3a22650c66bd7f4fb6d1e8072ffd7b75c8a27898;name=3Dgit_ed42bd05_2=
;destsuffix=3Dvcs_cache/7fc88000c7c9a3a6439d5b27a58b149d3380e568a6d6928be=
7bd8ebe28174e5b"
+SRC_URI +=3D "git://go.googlesource.com/net;protocol=3Dhttps;branch=3Dma=
ster;rev=3D3b0461eec859c4b73bb64fdc8285971fd33e3938;name=3Dgit_ed42bd05_3=
;destsuffix=3Dvcs_cache/3c84774e4b117bf9ca7f463a9106bc672447617fbfdf58b26=
8e7a74cb79b8882"
+SRC_URI +=3D "git://go.googlesource.com/net;protocol=3Dhttps;branch=3Dma=
ster;rev=3D69a78807bb2bb6d1599c68698c6b009505012083;name=3Dgit_ed42bd05_4=
;destsuffix=3Dvcs_cache/790f338e43aad3af78a9eb98e04e8e9e896e3a4ba134a79d5=
c8585b661ac7984"
+SRC_URI +=3D "git://go.googlesource.com/net;protocol=3Dhttps;branch=3Dma=
ster;rev=3D8a410e7b638dca158bf9e766925842f6651ff828;name=3Dgit_ed42bd05_5=
;destsuffix=3Dvcs_cache/e31ab9c9a7277e166a279e2fceb43f80960020ca579fa9fb0=
48ecf231b9c8448"
+SRC_URI +=3D "git://go.googlesource.com/net;protocol=3Dhttps;branch=3Dma=
ster;rev=3Dd8887717615a059821345a5c23649351b52a1c0b;name=3Dgit_ed42bd05_6=
;destsuffix=3Dvcs_cache/714bec1e4a790e75c4d5f275f6cc3299377b76073bf188eb3=
f7cafe8d758a77d"
+SRC_URI +=3D "git://go.googlesource.com/net;protocol=3Dhttps;nobranch=3D=
1;tag=3Dv0.43.0;shallow=3D1;rev=3De74bc31d69f225b635e065a602db3fbfa9850f9=
3;name=3Dgit_ed42bd05_7;destsuffix=3Dvcs_cache/82a07fe1904c263f9f213772e8=
b13c56a46fabfea0ee1ca2eed4873551103c0e"
+SRC_URI +=3D "git://go.googlesource.com/net;protocol=3Dhttps;branch=3Dma=
ster;rev=3Deb5bcb51f2a31c7d5141d810b70815c05d9c9146;name=3Dgit_ed42bd05_8=
;destsuffix=3Dvcs_cache/ae86d4593bf8e0a0514f77d1f3831f0f2f4214c3d1e77cc50=
661343ba4fcdebe"
+SRC_URI +=3D "git://go.googlesource.com/net;protocol=3Dhttps;branch=3Dma=
ster;rev=3Df5854403a9740e74b2e9e725e6cd7c8a57711905;name=3Dgit_ed42bd05_9=
;destsuffix=3Dvcs_cache/fc8ecf11eddaf279509465d2c0dde9c76fb90ea7c097356e8=
3c6ed4c375e1c16"
+SRC_URI +=3D "git://go.googlesource.com/sys;protocol=3Dhttps;nobranch=3D=
1;tag=3Dv0.37.0;shallow=3D1;rev=3D1edeebeea09c66c5a886ccfefb1be5dafac5c89=
3;name=3Dgit_da0444fc_0;destsuffix=3Dvcs_cache/d42e571dbce072ee3cd8b155fa=
c41a1903dbf8dea6dd0be1ac8aeda71971e97d"
+SRC_URI +=3D "git://go.googlesource.com/sys;protocol=3Dhttps;branch=3Dma=
ster;rev=3D49385e6e15226593f68b26af201feec29d5bba22;name=3Dgit_da0444fc_1=
;destsuffix=3Dvcs_cache/9039de5e2ba775addafc7d6cd06d2390dd60ba6ff11978f6f=
7708e792ae9b202"
+SRC_URI +=3D "git://go.googlesource.com/sys;protocol=3Dhttps;branch=3Dma=
ster;rev=3D97732733099d6a942a73b889770774366de963ed;name=3Dgit_da0444fc_2=
;destsuffix=3Dvcs_cache/aa620878a9f9f2576616d28b01af853869a5a014c70f6b296=
6e79beae63baeae"
+SRC_URI +=3D "git://go.googlesource.com/sys;protocol=3Dhttps;branch=3Dma=
ster;rev=3Dc0bba94af5f85fbad9f6dc2e04ed5b8fac9696cf;name=3Dgit_da0444fc_3=
;destsuffix=3Dvcs_cache/e4718f232872f03637fc197e3ccf66bc067874db09f67e756=
7cae86e8cee6732"
+SRC_URI +=3D "git://go.googlesource.com/sys;protocol=3Dhttps;branch=3Dma=
ster;rev=3Dd0b11bdaac8adb652bff00e49bcacf992835621a;name=3Dgit_da0444fc_4=
;destsuffix=3Dvcs_cache/f12e98c7124bdf27aa44290b851a1ac08039087a76b23733d=
63312bc784b1556"
+SRC_URI +=3D "git://go.googlesource.com/sys;protocol=3Dhttps;branch=3Dma=
ster;rev=3Dfdedc70b468f679c263a3ccaefc1faeed3239939;name=3Dgit_da0444fc_5=
;destsuffix=3Dvcs_cache/782e11bb6bc760c1f6beebcc00039d583f0f5dce996fff1ad=
c7a3eac70c2c65b"
+SRC_URI +=3D "git://go.googlesource.com/sync;protocol=3Dhttps;nobranch=3D=
1;tag=3Dv0.17.0;shallow=3D1;rev=3D04914c200cb38d4ea960ee6a4c314a028c63299=
1;name=3Dgit_d7307bee_0;destsuffix=3Dvcs_cache/77b1c2128d3d3a72f0ab85d680=
0e7273fdd14749e9845be6f1c126d8c02f57fc"
+SRC_URI +=3D "git://go.googlesource.com/sync;protocol=3Dhttps;branch=3Dm=
aster;rev=3D112230192c580c3556b8cee6403af37a4fc5f28c;name=3Dgit_d7307bee_=
1;destsuffix=3Dvcs_cache/b68e56943c8c12324ce0414e7075fd80f016eafe879c0c69=
e6b25893ebb49bce"
+SRC_URI +=3D "git://go.googlesource.com/sync;protocol=3Dhttps;branch=3Dm=
aster;rev=3D1d60e4601c6fd243af51cc01ddf169918a5407ca;name=3Dgit_d7307bee_=
2;destsuffix=3Dvcs_cache/a474d88ee14fcd89b314b779d02a4628461aebbfc6613a6b=
a90e583c35e15b02"
+SRC_URI +=3D "git://go.googlesource.com/sync;protocol=3Dhttps;branch=3Dm=
aster;rev=3D42b317875d0fa942474b76e1b46a6060d720ae6e;name=3Dgit_d7307bee_=
3;destsuffix=3Dvcs_cache/19d48188f5a03164bde06d13dc555c6a2ebc78aafd3dabc7=
439ec4c9dcca3519"
+SRC_URI +=3D "git://go.googlesource.com/sync;protocol=3Dhttps;branch=3Dm=
aster;rev=3D67f06af15bc961c363a7260195bcd53487529a21;name=3Dgit_d7307bee_=
4;destsuffix=3Dvcs_cache/63c5dce6fecd17ec0193ec4ee4221b61ccd0834c745a0661=
28df4000c7ec583e"
+SRC_URI +=3D "git://go.googlesource.com/sync;protocol=3Dhttps;branch=3Dm=
aster;rev=3Dcd5d95a43a6e21273425c7ae415d3df9ea832eeb;name=3Dgit_d7307bee_=
5;destsuffix=3Dvcs_cache/eaa2921285a7524f3154ea98a551847767b259c18f901ed9=
7668900b204aa7a6"
+SRC_URI +=3D "git://github.com/zeebo/errs;protocol=3Dhttps;nobranch=3D1;=
tag=3Dv1.4.0;shallow=3D1;rev=3D13450ab50383c5857164d564544fa0bef3ff689d;n=
ame=3Dgit_1cced855_0;destsuffix=3Dvcs_cache/c48b3247a05cb20bf2a81d75ef369=
d317463f64a4267ed1c3e73da685dd8fa09"
+SRC_URI +=3D "git://github.com/xrash/smetrics;protocol=3Dhttps;branch=3D=
master;rev=3D686a1a2994c11fac124829fadcb683a24ab8d25f;name=3Dgit_51ee97a4=
_0;destsuffix=3Dvcs_cache/39f621debd197a5e0bcda4514cb54d787e4e443693f3173=
63918ceb70d590944"
+SRC_URI +=3D "git://github.com/yashtewari/glob-intersection;protocol=3Dh=
ttps;nobranch=3D1;tag=3Dv0.2.0;shallow=3D1;rev=3D9f24ebf25f62b3565b778d6e=
c98775caf0e37720;name=3Dgit_2842a744_0;destsuffix=3Dvcs_cache/f808bebdb4b=
58643c351139a2ad430afee40f2154d96cfe1086091dbffa08d35"
+SRC_URI +=3D "git://github.com/xeipuuv/gojsonreference;protocol=3Dhttps;=
branch=3Dmaster;rev=3Dbd5ef7bd5415a7ac448318e64f11a24cd21e594b;name=3Dgit=
_ca2a9119_0;destsuffix=3Dvcs_cache/6cce19ebe3be9e8f13d8b3c5090971f010f3f3=
cda349fa51197c974450d133ee"
+SRC_URI +=3D "git://github.com/xeipuuv/gojsonpointer;protocol=3Dhttps;br=
anch=3Dmaster;rev=3D02993c407bfbf5f6dae44c4f4b1cf6a39b5fc5bb;name=3Dgit_b=
d44e658_0;destsuffix=3Dvcs_cache/4b0abfc7aeea962cf44836059fabc8aebf20db8d=
2e9ce317db13d42ade75c19f"
+SRC_URI +=3D "git://github.com/x448/float16;protocol=3Dhttps;nobranch=3D=
1;tag=3Dv0.8.4;shallow=3D1;rev=3Dcb9afec31f2649663ebb64da5c6c32c3d365c3ca=
;name=3Dgit_b79b770f_0;destsuffix=3Dvcs_cache/e395eca01f11e874b5b2b165e3d=
c2620faa30374fb308657449d3a3023ce5cbb"
+SRC_URI +=3D "git://github.com/vishvananda/netns;protocol=3Dhttps;nobran=
ch=3D1;tag=3Dv0.0.5;shallow=3D1;rev=3D4c46424d73b556b3ea4bc5a7cec9e7376dc=
b2a73;name=3Dgit_e786acee_0;destsuffix=3Dvcs_cache/9f1ef5c3417729b4f24554=
f4b88d06d9e7cdeb771a5d62000cc1344bb1c985d8"
+SRC_URI +=3D "git://github.com/vishvananda/netlink;protocol=3Dhttps;nobr=
anch=3D1;tag=3Dv1.3.1;shallow=3D1;rev=3D17daef607c6442d47b0565343cf8a69f9=
85a4cb7;name=3Dgit_2270cfb3_0;destsuffix=3Dvcs_cache/add152ec680cd6ba7b1d=
aeb50425ed8986ca51024d78c50810923119dbf60a49"
+SRC_URI +=3D "git://github.com/vbatts/tar-split;protocol=3Dhttps;nobranc=
h=3D1;tag=3Dv0.11.3;shallow=3D1;rev=3D3cdf99b6d45a47170f0092f1f3c0bbf2aca=
55db6;name=3Dgit_b8e88960_0;destsuffix=3Dvcs_cache/73d588e2ca387fd17befa8=
dbe72f26485ff53e601a1fe3d7ecda3c716b4fdac7"
+SRC_URI +=3D "git://github.com/urfave/cli;protocol=3Dhttps;nobranch=3D1;=
tag=3Dv2.27.7;shallow=3D1;rev=3D19b951ab78929023a9a670722b26ffb1d67c733a;=
name=3Dgit_cd035cbf_0;destsuffix=3Dvcs_cache/b063b9db6f64a681153d8de9f447=
4fe963c29b610e0cb156372dbc3dffad882a"
+SRC_URI +=3D "git://github.com/urfave/cli;protocol=3Dhttps;nobranch=3D1;=
tag=3Dv1.22.15;shallow=3D1;rev=3D2421d239f2803b47a757b61dd8ee2772f771f730=
;name=3Dgit_cd035cbf_1;destsuffix=3Dvcs_cache/b0eb71ed2c128bfda3da7279884=
5f362addf53e6bd24c90f8c51c74afe3acec9"
+SRC_URI +=3D "git://github.com/veraison/go-cose;protocol=3Dhttps;nobranc=
h=3D1;tag=3Dv1.1.0;shallow=3D1;rev=3D354ac997519fe3d62314afe2906b106ef43b=
ca5d;name=3Dgit_11746de1_0;destsuffix=3Dvcs_cache/50c5af8aef66bbc4e1a8a9f=
6b19b68ca530de0496e90d9cd401290662aa52946"
+SRC_URI +=3D "git://github.com/tetratelabs/wazero;protocol=3Dhttps;nobra=
nch=3D1;tag=3Dv1.9.0;shallow=3D1;rev=3D96f2052f6d12cccc29193f5452c635b76d=
8a036d;name=3Dgit_59327123_0;destsuffix=3Dvcs_cache/8184e4b8a52d22bbf7a31=
00e9a800f7f69b67c8a4a0349fa457cf7c0f1833060"
+SRC_URI +=3D "git://github.com/tchap/go-patricia;protocol=3Dhttps;nobran=
ch=3D1;tag=3Dv2.3.3;shallow=3D1;rev=3D8c5d7fa2ef98ad77bfbd2d2c3d67d4d17db=
0093a;name=3Dgit_faedb7d0_0;destsuffix=3Dvcs_cache/196ec21f158dd5c10370dc=
d9b618d17460a5f3dec6cbc351a797a1a4f906b7bb"
+SRC_URI +=3D "git://github.com/spiffe/go-spiffe;protocol=3Dhttps;nobranc=
h=3D1;tag=3Dv2.5.0;shallow=3D1;rev=3Ddd15542826b6e12943e74670a8807a74b4da=
09d9;name=3Dgit_217f6de8_0;destsuffix=3Dvcs_cache/1493a5bfbe7b3525b8e369d=
ad6284bf19f8510cf53db0a7f023db2d97777cabd"
+SRC_URI +=3D "git://github.com/stefanberger/go-pkcs11uri;protocol=3Dhttp=
s;branch=3Dmaster;rev=3D78284954bff6dcce7888166bb79bbba93bea0879;name=3Dg=
it_1abe3c80_0;destsuffix=3Dvcs_cache/38fa201d7d655497d33723d139ffc3ec2ee7=
8d3caab251015a1c3a5190f5e073"
+SRC_URI +=3D "git://github.com/smallstep/pkcs7;protocol=3Dhttps;nobranch=
=3D1;tag=3Dv0.1.1;shallow=3D1;rev=3D21b5bd412d3d388540388c0165151f7e3df92=
213;name=3Dgit_dd95d004_0;destsuffix=3Dvcs_cache/2f19e869b678f6b075729ec3=
df26ac81f8f576057860ead9a9c70212023b6927"
+SRC_URI +=3D "git://github.com/spf13/cobra;protocol=3Dhttps;nobranch=3D1=
;tag=3Dv1.8.1;shallow=3D1;rev=3De94f6d0dd9a5e5738dca6bce03c4b1207ffbc0ec;=
name=3Dgit_41456771_0;destsuffix=3Dvcs_cache/2d91d6bc5de03fdd7c7a38386c83=
b43ea19399859bc492d6f78c8a36a38a0a6f"
+SRC_URI +=3D "git://github.com/spf13/pflag;protocol=3Dhttps;nobranch=3D1=
;tag=3Dv1.0.6;shallow=3D1;rev=3D5ca813443bd2a4d9f46a253ea0407d23b3790713;=
name=3Dgit_66b7b8c8_0;destsuffix=3Dvcs_cache/b7f51c906eabb517613129455992=
f23a2f48e1c6186855b1b66ba9e619db1aa4"
+SRC_URI +=3D "git://github.com/sasha-s/go-deadlock;protocol=3Dhttps;nobr=
anch=3D1;tag=3Dv0.3.5;shallow=3D1;rev=3D464d34347a399b840a4f963cc96dfc993=
ccf8c62;name=3Dgit_8c229f40_0;destsuffix=3Dvcs_cache/fa29175221f16401d041=
954c9a07bc5aa8b90d585d480873eaa15a18b5fa8e6d"
+SRC_URI +=3D "git://github.com/santhosh-tekuri/jsonschema;protocol=3Dhtt=
ps;nobranch=3D1;tag=3Dv5.3.1;shallow=3D1;rev=3D16bce71af51f6a4a775f11e649=
a347a8803940d3;name=3Dgit_3ace93c7_0;destsuffix=3Dvcs_cache/9964fa94eb99b=
405ebcfa3af19e0e16d07aef590c7af497cdfc6743aa4544776"
+SRC_URI +=3D "git://github.com/russross/blackfriday;protocol=3Dhttps;nob=
ranch=3D1;tag=3Dv2.1.0;shallow=3D1;rev=3D4c9bf9512682b995722660a4196c0013=
228e2049;name=3Dgit_fb978822_0;destsuffix=3Dvcs_cache/6dd1604eceba1790dbf=
7f827f1e22a5866a5348a2ab616daed7363a6e16e081d"
+SRC_URI +=3D "git://github.com/russross/blackfriday;protocol=3Dhttps;nob=
ranch=3D1;tag=3Dv1.6.0;shallow=3D1;rev=3De96880f42b9343aea6cbfd99693adae0=
e5fe2b2a;name=3Dgit_fb978822_1;destsuffix=3Dvcs_cache/45882c51d4da17f3277=
5abbdabd353753e5115f6ec6282c3bf028fe3471fc743"
+SRC_URI +=3D "git://github.com/rcrowley/go-metrics;protocol=3Dhttps;bran=
ch=3Dmaster;rev=3D10cdbea86bc0b922507ce91d43f4f78a5bea2e8f;name=3Dgit_546=
13f95_0;destsuffix=3Dvcs_cache/72f5f2e29a16b9692a19a2b94e23cbbb89dbabf006=
c0af691e69618cebfb7b5b"
+SRC_URI +=3D "git://github.com/planetscale/vtprotobuf;protocol=3Dhttps;b=
ranch=3Dmain;rev=3D0393e58bdf106fe0347e554d272a8f2c84d12461;name=3Dgit_d2=
0372f0_0;destsuffix=3Dvcs_cache/2a8f7a744764b6b7d0f6b17003fd8217cc861be94=
6aee65fccc7d1491634942f"
+SRC_URI +=3D "git://github.com/petermattis/goid;protocol=3Dhttps;branch=3D=
master;rev=3D4fcff4a6cae7cd8fdaeeaa8bb87443eda9dec107;name=3Dgit_8e87b253=
_0;destsuffix=3Dvcs_cache/28fe23d2ffb5463ca74406309be8d07f56f5b77b8f151b1=
f3d5a8edf6d6ae9be"
+SRC_URI +=3D "git://github.com/pelletier/go-toml;protocol=3Dhttps;nobran=
ch=3D1;tag=3Dv2.2.4;shallow=3D1;rev=3Dee07c9203b72060f12e31c04ace80e8a187=
d5a67;name=3Dgit_5fc8a683_0;destsuffix=3Dvcs_cache/024e6f520632e6be8a8fbc=
0202fdf0da2cfc0266ff95451a8e8d944dd0d8882f"
+SRC_URI +=3D "git://github.com/pelletier/go-toml;protocol=3Dhttps;nobran=
ch=3D1;tag=3Dv1.9.5;shallow=3D1;rev=3Dfed1464066413075eac02cd4dc368b52218=
45541;name=3Dgit_5fc8a683_1;destsuffix=3Dvcs_cache/22bc2e212b193b23af04b0=
014dd6e6f15e66953913e88670099f8375927b48c7"
+SRC_URI +=3D "git://github.com/open-policy-agent/opa;protocol=3Dhttps;no=
branch=3D1;tag=3Dv0.70.0;shallow=3D1;rev=3D2ea031ea04e6a8afbc5dd22f656131=
dc3cfc5a7d;name=3Dgit_345563a6_0;destsuffix=3Dvcs_cache/641f2a5b6fed75b61=
eb34170348c055f38b88df452e53b69fd5fb5f5707b475c"
+SRC_URI +=3D "git://github.com/mxk/go-flowrate;protocol=3Dhttps;branch=3D=
master;rev=3Dcca7078d478f8520f85629ad7c68962d31ed7682;name=3Dgit_a209a0d8=
_0;destsuffix=3Dvcs_cache/12c25c020a66ecc07c7c90ff8a8793d5462f3f4e58338c9=
b36012b25b4ed81b8"
+SRC_URI +=3D "git://github.com/munnerz/goautoneg;protocol=3Dhttps;branch=
=3Dmaster;rev=3Da7dc8b61c822528f973a5e4e7b272055c6fdb43e;name=3Dgit_09d50=
017_0;destsuffix=3Dvcs_cache/0f68eeb31e17a8fc96eede1943fe26be5835b08f5cc4=
a9eee4ed1b8eee4887ee"
+SRC_URI +=3D "git://github.com/modern-go/reflect2;protocol=3Dhttps;branc=
h=3Dmaster;rev=3D35a7c28c31ee079903db043180532306a621943a;name=3Dgit_975c=
3d3f_0;destsuffix=3Dvcs_cache/b0f41ee692517b4a6786fb48ce9d49e532c4f77cac6=
cacadd6ff49dcb7325931"
+SRC_URI +=3D "git://github.com/modern-go/concurrent;protocol=3Dhttps;bra=
nch=3Dmaster;rev=3Dbacd9c7ef1dd9b15be4a9909b8ac7a4e313eec94;name=3Dgit_2b=
baef4c_0;destsuffix=3Dvcs_cache/09a996e0549b43adaeb1c40a8dc339563ed1a8dcc=
831e5cb074441a30d502d23"
+SRC_URI +=3D "git://github.com/mitchellh/go-homedir;protocol=3Dhttps;nob=
ranch=3D1;tag=3Dv1.1.0;shallow=3D1;rev=3Daf06845cf3004701891bf4fdb884bfe4=
920b3727;name=3Dgit_b0f6ef1f_0;destsuffix=3Dvcs_cache/0466071bcdbaca5ed0a=
5cdacf380534de6af614c1d6ebac6ec08513f20ffc5ad"
+SRC_URI +=3D "git://github.com/mistifyio/go-zfs;protocol=3Dhttps;nobranc=
h=3D1;tag=3Dv3.0.1;shallow=3D1;rev=3Df6d5c373cf63ae2477370aa9bda9fa49804c=
2d72;name=3Dgit_9ca91730_0;destsuffix=3Dvcs_cache/14a067948c9001a8443e882=
78679f597430282136bcd53894095ccfed51182ca"
+SRC_URI +=3D "git://github.com/miekg/pkcs11;protocol=3Dhttps;nobranch=3D=
1;tag=3Dv1.1.1;shallow=3D1;rev=3Df3481918a208bd212aa995a41f92d786eb418a7d=
;name=3Dgit_cf5d6134_0;destsuffix=3Dvcs_cache/cfc32d6973be9c203ec1d8480b5=
9f61c59be67d146de9d920f82d4eb7c4d994a"
+SRC_URI +=3D "git://github.com/mdlayher/vsock;protocol=3Dhttps;nobranch=3D=
1;tag=3Dv1.2.1;shallow=3D1;rev=3D8569e301791e164b669ff36b51035bb1d7c9b3a3=
;name=3Dgit_9e9130ba_0;destsuffix=3Dvcs_cache/a7b2ec13026e78d41b91e1e452a=
ab0a78ae155b70966624ec8e5e52ba56a0b08"
+SRC_URI +=3D "git://github.com/mdlayher/socket;protocol=3Dhttps;nobranch=
=3D1;tag=3Dv0.5.1;shallow=3D1;rev=3D9c51a391be6c6bc5b7ce52f328497931c5e97=
733;name=3Dgit_4845c6c9_0;destsuffix=3Dvcs_cache/ade2a4b5630096b489828944=
f4f75b866125a6d37fc95c3524f0cc002cbe8cf9"
+SRC_URI +=3D "git://github.com/mattn/go-shellwords;protocol=3Dhttps;nobr=
anch=3D1;tag=3Dv1.0.12;shallow=3D1;rev=3D973b9d5391598d4ee601db46fa32f6e1=
86a356ac;name=3Dgit_86631c51_0;destsuffix=3Dvcs_cache/3e9de7967c04a07a314=
669e56b72110ac8eee96a9646f5b9863c709575abe8d1"
+SRC_URI +=3D "git://github.com/linuxkit/virtsock;protocol=3Dhttps;branch=
=3Dmaster;rev=3Df8cee7dfc7a3a337738ff3c1852fafe193a4f5d3;name=3Dgit_8f3e9=
c04_0;destsuffix=3Dvcs_cache/706021837a1fd29aa5615d81a9fc5095a64d5a29eb28=
550399942b9a15e7881f"
+SRC_URI +=3D "git://github.com/lestrrat-go/option;protocol=3Dhttps;nobra=
nch=3D1;tag=3Dv1.0.1;shallow=3D1;rev=3Dced73324dba7d8be3a1587a7d6a5fa081d=
9e2dc2;name=3Dgit_7fba3ab3_0;destsuffix=3Dvcs_cache/1f8dcec97d12a81cde1ec=
2ba90e51e5a7642e0b6ac69fa6d060c924499d9e826"
+SRC_URI +=3D "git://github.com/lestrrat-go/jwx;protocol=3Dhttps;nobranch=
=3D1;tag=3Dv1.2.29;shallow=3D1;rev=3D1025f8eec3bd80c8d8f1be8f9cad989a5b78=
fd4b;name=3Dgit_daf2c4dd_0;destsuffix=3Dvcs_cache/0222375b3ed66cac8023daf=
ca7428deb89df4aeb20d854951140e101b0c5f28b"
+SRC_URI +=3D "git://github.com/lestrrat-go/iter;protocol=3Dhttps;nobranc=
h=3D1;tag=3Dv1.0.2;shallow=3D1;rev=3Da02dbb5faff273dfa44a04e34b645ee9338c=
c74a;name=3Dgit_149fc576_0;destsuffix=3Dvcs_cache/8798d95cb251c99e3a5db9f=
362a5935bbe2e986c343f71908f1aecf634de6fbf"
+SRC_URI +=3D "git://github.com/lestrrat-go/httpcc;protocol=3Dhttps;nobra=
nch=3D1;tag=3Dv1.0.1;shallow=3D1;rev=3D962f66809593fba7c5cdc78a0bdcf98827=
250e3c;name=3Dgit_743770ce_0;destsuffix=3Dvcs_cache/466b0cb68191ccc31d667=
d0e1cf8f0eec07556bbc61fdad149b67379fba0f789"
+SRC_URI +=3D "git://github.com/lestrrat-go/blackmagic;protocol=3Dhttps;n=
obranch=3D1;tag=3Dv1.0.2;shallow=3D1;rev=3D420d1921e4b3264eeaa17a7946b486=
a1e6e41796;name=3Dgit_a785ed5c_0;destsuffix=3Dvcs_cache/27d85daf215783d11=
5f87d7b6624f7770dd9d8cbe340e8b4bef8784123d8c5f9"
+SRC_URI +=3D "git://github.com/lestrrat-go/backoff;protocol=3Dhttps;nobr=
anch=3D1;tag=3Dv2.0.8;shallow=3D1;rev=3Dc3af762cb9d2bc8339e1d5099a4550366=
a675f60;name=3Dgit_295c824f_0;destsuffix=3Dvcs_cache/cac61700ad617eae68ad=
7b4b604e2484e0a4f702cfdf125e784add42fc9af8c1"
+SRC_URI +=3D "git://github.com/knqyf263/go-plugin;protocol=3Dhttps;nobra=
nch=3D1;tag=3Dv0.9.0;shallow=3D1;rev=3Dc156889d438cf7d729d5959c02772d9f3a=
86cb2e;name=3Dgit_9ffa8f9a_0;destsuffix=3Dvcs_cache/a8467353858eb68db6c0d=
d39ab99d740baa3155c9ebe2dee04be36a524fc48f7"
+SRC_URI +=3D "git://github.com/json-iterator/go;protocol=3Dhttps;nobranc=
h=3D1;tag=3Dv1.1.12;shallow=3D1;rev=3D024077e996b048517130b21ea6bf12aa230=
55d3d;name=3Dgit_61c80dd4_0;destsuffix=3Dvcs_cache/bdb67d21e426f2274ff76d=
4829ac60348539016b1aa54fa98cfccc554be12f3b"
+SRC_URI +=3D "git://github.com/josephspurrier/goversioninfo;protocol=3Dh=
ttps;nobranch=3D1;tag=3Dv1.5.0;shallow=3D1;rev=3D53cb51b8aa6b6b62ab8196e6=
6a766ea7598c67fa;name=3Dgit_38ae8b7f_0;destsuffix=3Dvcs_cache/b14f0e2f17b=
ab02822d89dad4f493816dcdc4b2d99b9f56600d21318edc8d3fc"
+SRC_URI +=3D "git://github.com/intel/goresctrl;protocol=3Dhttps;nobranch=
=3D1;tag=3Dv0.10.0;shallow=3D1;rev=3D404a7021807bd6c502268a5ab15ff36e11c2=
1f44;name=3Dgit_dd750dae_0;destsuffix=3Dvcs_cache/29a6109926a2e174fae849b=
3c015435e64e4f34ea86919fbc693930c06128b9b"
+SRC_URI +=3D "git://github.com/hashicorp/errwrap;protocol=3Dhttps;nobran=
ch=3D1;tag=3Dv1.1.0;shallow=3D1;rev=3D7b00e5db719c64d14dd0caaacbd13e76254=
d02c0;name=3Dgit_28334120_0;destsuffix=3Dvcs_cache/a0949020a0c14672f86d32=
cbf0d984b8d048a27e6f75aeac79f8ca3f7cc4ecae"
+SRC_URI +=3D "git://github.com/inconshreveable/mousetrap;protocol=3Dhttp=
s;nobranch=3D1;tag=3Dv1.1.0;shallow=3D1;rev=3D4e8053ee7ef85a6bd26368364a6=
d27f1641c1d21;name=3Dgit_b31cc6ad_0;destsuffix=3Dvcs_cache/a9f0ac4cf05240=
ceb9790811cbd8ab3cbdcd404501a9ca5a402a28033e7235d8"
+SRC_URI +=3D "git://github.com/grpc-ecosystem/grpc-gateway;protocol=3Dht=
tps;nobranch=3D1;tag=3Dv2.26.1;shallow=3D1;rev=3D3b8ac9fa5d4fd94aee7519bf=
d5f21d60b1666f0e;name=3Dgit_3fba78e5_0;destsuffix=3Dvcs_cache/7a398ff2d54=
9d51a63c658f61a0fc12fe4994094b59196ef4d8a96d94d8b0b11"
+SRC_URI +=3D "git://github.com/grpc-ecosystem/go-grpc-middleware;protoco=
l=3Dhttps;nobranch=3D1;tag=3Dv2.1.0;shallow=3D1;rev=3D3f5e2b31e36c931159a=
1b80287847840cd581e6e;name=3Dgit_e9f7c9ac_0;destsuffix=3Dvcs_cache/4e15ad=
209f57f1610bea03c67dbeef9ef7792fafe9b2902ca1a141277719f091"
+SRC_URI +=3D "git://github.com/grpc-ecosystem/go-grpc-middleware;protoco=
l=3Dhttps;nobranch=3D1;tag=3Dproviders/prometheus/v1.1.0;shallow=3D1;rev=3D=
53040665d19bab33e444905822557433511bb981;name=3Dgit_e9f7c9ac_1;destsuffix=
=3Dvcs_cache/42aacc0b51ca4683515670ecfde267af8722802b2bb4d002d5647da7d38f=
9a47"
+SRC_URI +=3D "git://github.com/gorilla/websocket;protocol=3Dhttps;branch=
=3Dmain;rev=3De064f32e3674d9d79a8fd417b5bc06fa5c6cad8f;name=3Dgit_05a135b=
6_0;destsuffix=3Dvcs_cache/722c87c831f4b73fd3a40f24d8693191974f7a5a180d73=
f29a05c9bb3f84589f"
+SRC_URI +=3D "git://github.com/gorilla/mux;protocol=3Dhttps;nobranch=3D1=
;tag=3Dv1.8.1;shallow=3D1;rev=3Db4617d0b9670ad14039b2739167fd35a60f557c5;=
name=3Dgit_ebce69d6_0;destsuffix=3Dvcs_cache/489d4511710bd1a1fc80974aa65e=
e7c2b851f7c6354c34549b8cd131f4435f0f"
+SRC_URI +=3D "git://github.com/godbus/dbus;protocol=3Dhttps;nobranch=3D1=
;tag=3Dv5.1.0;shallow=3D1;rev=3De523abc905595cf17fb0001a7d77eaaddfaa216d;=
name=3Dgit_d9e1e146_0;destsuffix=3Dvcs_cache/64a1380eac8fb56f64570a9ee44f=
46ff49a8cfc74d31623d696b49699728d072"
+SRC_URI +=3D "git://github.com/goccy/go-json;protocol=3Dhttps;nobranch=3D=
1;tag=3Dv0.10.2;shallow=3D1;rev=3D8e8cdeacf2f2faef082f32848138f0f9af7cfb6=
6;name=3Dgit_58b9fee8_0;destsuffix=3Dvcs_cache/740855cec7c87c7ae05c90a05b=
7441ee62d8206d1f61f89e36a20ee76b0af7ec"
+SRC_URI +=3D "git://github.com/gobwas/glob;protocol=3Dhttps;nobranch=3D1=
;tag=3Dv0.2.3;shallow=3D1;rev=3D5ccd90ef52e1e632236f7326478d4faa74f99438;=
name=3Dgit_84be3b9c_0;destsuffix=3Dvcs_cache/9ea137b0f545be63130971285b3e=
0b109491f0a0c45197efd72385336ab0ed05"
+SRC_URI +=3D "git://github.com/go-ole/go-ole;protocol=3Dhttps;nobranch=3D=
1;tag=3Dv1.2.6;shallow=3D1;rev=3D8b1f7f90f6b1728609c9694f2cff140d34fd91f8=
;name=3Dgit_c77f8c8d_0;destsuffix=3Dvcs_cache/f8a37b093a9da7f7719abb71318=
560d985c5c38e6d58c2c73adde45616845d0c"
+SRC_URI +=3D "git://github.com/go-ini/ini;protocol=3Dhttps;nobranch=3D1;=
tag=3Dv1.67.0;shallow=3D1;rev=3Db2f570e5b5b844226bbefe6fb521d891f529a951;=
name=3Dgit_833ca107_0;destsuffix=3Dvcs_cache/cad9f449f807ba878152dab9e71b=
a0f300b51a0a69390f502d55fb24a11f73a2"
+SRC_URI +=3D "git://github.com/go-jose/go-jose;protocol=3Dhttps;nobranch=
=3D1;tag=3Dv4.1.2;shallow=3D1;rev=3Da1565a41aa008ae6545e0f50a636d254de5b4=
596;name=3Dgit_3c60bf8b_0;destsuffix=3Dvcs_cache/558fa32425fb33e37f25523c=
5b69743af7afff9df1b286b6e33e93aec4bbaee2"
+SRC_URI +=3D "git://github.com/fxamacker/cbor;protocol=3Dhttps;nobranch=3D=
1;tag=3Dv2.9.0;shallow=3D1;rev=3Dd29ad7351b55b1844387cf9306c4101658cc5256=
;name=3Dgit_3a88ac44_0;destsuffix=3Dvcs_cache/a2e55d2b4fdba69f8a4cfc76758=
713247ee27c62d5ad4168e8c14369f3c94c36"
+SRC_URI +=3D "git://github.com/fsnotify/fsnotify;protocol=3Dhttps;nobran=
ch=3D1;tag=3Dv1.9.0;shallow=3D1;rev=3Dae0e7923765f64fb8061396db7edebb558c=
f6093;name=3Dgit_3fa8b61c_0;destsuffix=3Dvcs_cache/e7e3eb9997b88b1856ec41=
676de694527bda7173c94d395822f6eec3ec2067e2"
+SRC_URI +=3D "git://github.com/emicklei/go-restful;protocol=3Dhttps;nobr=
anch=3D1;tag=3Dv3.13.0;shallow=3D1;rev=3D3fae6e4c6809ebc26315d163196ea7ab=
8e0685cb;name=3Dgit_98baf7ea_0;destsuffix=3Dvcs_cache/2b1cb5344031e14606b=
ed4c9c1a5462fa536c12e0f7359188d69f5709fdff9a1"
+SRC_URI +=3D "git://github.com/decred/dcrd;protocol=3Dhttps;nobranch=3D1=
;tag=3Ddcrec/secp256k1/v4.2.0;shallow=3D1;rev=3Dbacf8444a8bc79178f9eb2c65=
477ab6df01a6439;name=3Dgit_9fd408f7_0;destsuffix=3Dvcs_cache/969124e06270=
5319ea1df3e035f29c8b4731d2905da0ac8d80229f2c33b0e217"
+SRC_URI +=3D "git://github.com/distribution/reference;protocol=3Dhttps;n=
obranch=3D1;tag=3Dv0.6.0;shallow=3D1;rev=3Dff14fafe2236e51c2894ac07d4bdfc=
778e96d682;name=3Dgit_b4d8130d_0;destsuffix=3Dvcs_cache/ac2c94a9c45cfe172=
807163d3f9ae441bf0db0b30e528660d1b5db49678ed93a"
+SRC_URI +=3D "git://github.com/cpuguy83/go-md2man;protocol=3Dhttps;nobra=
nch=3D1;tag=3Dv2.0.7;shallow=3D1;rev=3D061b6c7cbecd6752049221aa15b7a05160=
796698;name=3Dgit_af686cb3_0;destsuffix=3Dvcs_cache/44790142f31974c97a48f=
51298f4d80d17cdea0211947e7cbfe90054a7fe7774"
+SRC_URI +=3D "git://github.com/containers/ocicrypt;protocol=3Dhttps;nobr=
anch=3D1;tag=3Dv1.2.1;shallow=3D1;rev=3D1db71af9f28553231f0b59880d3fe5b16=
2fa8c61;name=3Dgit_1f55eed4_0;destsuffix=3Dvcs_cache/bec170205b8cb4f7646d=
21f6d05f4e78b62b540ff061d55788f38ccecc6313b7"
+SRC_URI +=3D "git://github.com/containernetworking/plugins;protocol=3Dht=
tps;nobranch=3D1;tag=3Dv1.8.0;shallow=3D1;rev=3D0e648479e11c2c6d9109b14fc=
0c9ac64c677861b;name=3Dgit_4541537c_0;destsuffix=3Dvcs_cache/f6503a87c1f8=
1aa33a6d29c40a420afbc08e92fc8e1791dc7f439650e37194ca"
+SRC_URI +=3D "git://github.com/containernetworking/cni;protocol=3Dhttps;=
nobranch=3D1;tag=3Dv1.3.0;shallow=3D1;rev=3Da28faab92684aed3af64d5085733c=
34550ce9877;name=3Dgit_4ce5ee0d_0;destsuffix=3Dvcs_cache/6fa30880d920c48b=
1630347223a375694a450629a1037b649907b1ab1f2f237a"
+SRC_URI +=3D "git://github.com/cilium/ebpf;protocol=3Dhttps;nobranch=3D1=
;tag=3Dv0.16.0;shallow=3D1;rev=3D061e86d8f5e99aa6f04d11a3807c8cacdbe7908b=
;name=3Dgit_1e891de1_0;destsuffix=3Dvcs_cache/8e810695e5aecdedc82025b50fe=
217f458e95243dfd6f3a725e4be31bb89421b"
+SRC_URI +=3D "git://github.com/GoogleCloudPlatform/opentelemetry-operati=
ons-go;protocol=3Dhttps;nobranch=3D1;tag=3Ddetectors/gcp/v1.29.0;shallow=3D=
1;rev=3D214376d00c74923436243b766d25f46a652890e6;name=3Dgit_2c8937f6_0;de=
stsuffix=3Dvcs_cache/49958282a27585aaf02e289d3431a76a06b31d241e40f4c0c440=
0d29db6a8e01"
+SRC_URI +=3D "git://github.com/cespare/xxhash;protocol=3Dhttps;nobranch=3D=
1;tag=3Dv2.3.0;shallow=3D1;rev=3D998dce232f17418a7a5721ecf87ca714025a3243=
;name=3Dgit_9d94b3ef_0;destsuffix=3Dvcs_cache/4cf9134295bfe252b2146507759=
140e7050e00021c322cfd0d38a231ef3c0b20"
+SRC_URI +=3D "git://github.com/AdaLogics/go-fuzz-headers;protocol=3Dhttp=
s;branch=3Dmain;rev=3De8a1dd7889d65b8a6f02175e0d79d7c0557db7f9;name=3Dgit=
_77272b21_0;destsuffix=3Dvcs_cache/618ef3cd1ed01872674845eae25e7d6a50a3d7=
0b49881ccd500327b0778fedb9"
+SRC_URI +=3D "git://github.com/cenkalti/backoff;protocol=3Dhttps;nobranc=
h=3D1;tag=3Dv4.3.0;shallow=3D1;rev=3D720b78985a65c0452fd37bb155c7cac4157a=
7c45;name=3Dgit_67dac28e_0;destsuffix=3Dvcs_cache/c644c1d0f5212c0210f056d=
6c7d45f3e482a1fca002b7c3e65edf8d3c060566f"
+SRC_URI +=3D "git://github.com/blang/semver;protocol=3Dhttps;nobranch=3D=
1;tag=3Dv4.0.0;shallow=3D1;rev=3Daf3461a9cbcf1f3f5889d21b83f5ef63880c33a8=
;name=3Dgit_b6bc1865_0;destsuffix=3Dvcs_cache/592c6d9a3fd1b340b1d148a1229=
b29c0f07951f6a2324b4abdbe310d546bda36"
+SRC_URI +=3D "git://github.com/StackExchange/wmi;protocol=3Dhttps;branch=
=3Dmaster;rev=3Dcbe66965904dbe8a6cd589e2298e5d8b986bd7dd;name=3Dgit_48d6d=
b20_0;destsuffix=3Dvcs_cache/1fc27d9cac14b2a03bbb0b0458896762317bee884884=
ef85b821fa4cb18c6952"
+SRC_URI +=3D "git://github.com/OneOfOne/xxhash;protocol=3Dhttps;nobranch=
=3D1;tag=3Dv1.2.8;shallow=3D1;rev=3D73388e8298b5e5a3611e6b62c2fc41b1b1084=
91e;name=3Dgit_263f925e_0;destsuffix=3Dvcs_cache/574662bdca3437a1a2b63a6f=
b52e05b654c57b8d21015a54e240b726cc649b5c"
+SRC_URI +=3D "git://github.com/checkpoint-restore/go-criu;protocol=3Dhtt=
ps;nobranch=3D1;tag=3Dv7.2.0;shallow=3D1;rev=3D39135d0112fa0fb12e80ba04ef=
843eea097add46;name=3Dgit_400f7838_0;destsuffix=3Dvcs_cache/cd3a96bfb455f=
01e0ad41b83fe0a2ba40c017e12b43cf536dd72401c0a9efa9b"
+SRC_URI +=3D "git://github.com/checkpoint-restore/checkpointctl;protocol=
=3Dhttps;nobranch=3D1;tag=3Dv1.4.0;shallow=3D1;rev=3D854ab59c71dde1991c2f=
dfae9c694aaddc752047;name=3Dgit_3c5c2d9d_0;destsuffix=3Dvcs_cache/6b759ce=
79ef9b0cf0e95821c6506ecb3e1f87ff4709b914b3e18ce7b12ed0769"
+SRC_URI +=3D "git://github.com/akavel/rsrc;protocol=3Dhttps;nobranch=3D1=
;tag=3Dv0.10.2;shallow=3D1;rev=3D936343600d578fb5da472acf6987ed76935a389b=
;name=3Dgit_a0872af8_0;destsuffix=3Dvcs_cache/98e001b3b120966f753da164ca3=
1ce83a6735298cb3b3365762a81db7f41969f"
+SRC_URI +=3D "git://github.com/beorn7/perks;protocol=3Dhttps;nobranch=3D=
1;tag=3Dv1.0.1;shallow=3D1;rev=3D37c8de3658fcb183f997c4e13e8337516ab753e6=
;name=3Dgit_42750950_0;destsuffix=3Dvcs_cache/c20c7a1c80a243f687008566bc9=
b8a9517bdf7e3a4f9db15e17160ad20568e9d"
+SRC_URI +=3D "git://github.com/agnivade/levenshtein;protocol=3Dhttps;nob=
ranch=3D1;tag=3Dv1.2.0;shallow=3D1;rev=3Dfac16fee5348a9e31bde6afdf8a00218=
dcc63941;name=3Dgit_65ddb0f9_0;destsuffix=3Dvcs_cache/f146c0125792f4a7b47=
8a5ade3d2578eaabd4d7c8a31f42ea28d318a29c2e289"
+SRC_URI +=3D "git://github.com/yuin/goldmark;protocol=3Dhttps;nobranch=3D=
1;tag=3Dv1.1.27;shallow=3D1;rev=3D12fc98ebcd751822bbd43314119e483472e6f55=
f;name=3Dgit_40d8a3db_0;destsuffix=3Dvcs_cache/fb45f805a799ac2f897942f334=
c68fc215fa5bfc06f4b0277d583fe78f6c36ca"
+SRC_URI +=3D "git://github.com/yuin/goldmark;protocol=3Dhttps;nobranch=3D=
1;tag=3Dv1.2.1;shallow=3D1;rev=3D91e5269fb0f873f91c9a01e98f32de15ca49440f=
;name=3Dgit_40d8a3db_1;destsuffix=3Dvcs_cache/4c58efe0c28d74a0131cf65fc06=
af9bf723f3852cb20f81dce6ce9ae50793119"
+SRC_URI +=3D "git://github.com/stretchr/testify;protocol=3Dhttps;nobranc=
h=3D1;tag=3Dv1.7.1;shallow=3D1;rev=3D083ff1c0449867d0d8d456483ee5fab8e0c0=
e1e6;name=3Dgit_aa93f7ee_0;destsuffix=3Dvcs_cache/719be8c83742fcd5ea6c60c=
ce03388f5367bceeb8522379d83d0110c884426a5"
+SRC_URI +=3D "git://github.com/stretchr/testify;protocol=3Dhttps;nobranc=
h=3D1;tag=3Dv1.8.0;shallow=3D1;rev=3D181cea6eab8b2de7071383eca4be32a424db=
38dd;name=3Dgit_aa93f7ee_1;destsuffix=3Dvcs_cache/39798af0c50431f2d4ce305=
d1aea9c6d13ad19d1ab6af227d59ebb3580e7a7f0"
+SRC_URI +=3D "git://github.com/stretchr/testify;protocol=3Dhttps;nobranc=
h=3D1;tag=3Dv1.11.1;shallow=3D1;rev=3D2a57335dc9cd6833daa820bc94d9b40c26a=
7917d;name=3Dgit_aa93f7ee_2;destsuffix=3Dvcs_cache/ba91b84762300277627df7=
61c9f004ffcc560434a1a1c2e613269b0c2e378278"
+SRC_URI +=3D "git://github.com/stretchr/testify;protocol=3Dhttps;nobranc=
h=3D1;tag=3Dv1.7.0;shallow=3D1;rev=3Dacba37e5db06f0093b465a7d47822bf13644=
b66c;name=3Dgit_aa93f7ee_3;destsuffix=3Dvcs_cache/f87883f9ef1ad6bd6ecb844=
fe9108ae126c4dfab49080e5fb37bd27ca64417be"
+SRC_URI +=3D "git://github.com/stretchr/testify;protocol=3Dhttps;nobranc=
h=3D1;tag=3Dv1.8.1;shallow=3D1;rev=3Db747d7c5f853d017ddbc5e623d026d7fc277=
0a58;name=3Dgit_aa93f7ee_4;destsuffix=3Dvcs_cache/d45ab2961914a9a432c9fbb=
ee6a5e2e51a7c04a9c7b64b567c83074a7152bb5f"
+SRC_URI +=3D "git://github.com/stretchr/objx;protocol=3Dhttps;nobranch=3D=
1;tag=3Dv0.5.2;shallow=3D1;rev=3D307d0db21292676ac9d469826525c3630f47f63a=
;name=3Dgit_7987da5d_0;destsuffix=3Dvcs_cache/fe4a57d26379977ebf461da8c71=
a20095b9f973a91d55076b67fa0de48206a1e"
+SRC_URI +=3D "git://github.com/stretchr/objx;protocol=3Dhttps;nobranch=3D=
1;tag=3Dv0.5.0;shallow=3D1;rev=3D50a2c064be99303c5dddf725da60e30fbc4f6ede=
;name=3Dgit_7987da5d_1;destsuffix=3Dvcs_cache/956998068f3cc530e52afae6bcb=
80d92158cdaee2b707bdfdaf132ff05de3b4f"
+SRC_URI +=3D "git://github.com/stretchr/objx;protocol=3Dhttps;nobranch=3D=
1;tag=3Dv0.4.0;shallow=3D1;rev=3D5dbb4e6c708f7eb56fc184f7c5dd5e482b555f69=
;name=3Dgit_7987da5d_2;destsuffix=3Dvcs_cache/4ca532f3c50e5c7c19e3dc9316d=
05026ba007fe253a359de8b2a8492d16f1faa"
+SRC_URI +=3D "git://github.com/stretchr/objx;protocol=3Dhttps;nobranch=3D=
1;tag=3Dv0.1.0;shallow=3D1;rev=3Dfacf9a85c22f48d2f52f2380e4efce1768749a89=
;name=3Dgit_7987da5d_3;destsuffix=3Dvcs_cache/39828321881a0709a36a2d1edde=
8fc9928ddd471ebd0bbdf7012076e7214bb02"
+SRC_URI +=3D "git://github.com/rogpeppe/go-internal;protocol=3Dhttps;nob=
ranch=3D1;tag=3Dv1.13.1;shallow=3D1;rev=3De67a4aa07a58fd7f4cc884153739cb7=
7b34f0edb;name=3Dgit_2748cdc3_0;destsuffix=3Dvcs_cache/6a8cf885e1574a3d34=
afe5d7b0a7b4272403e5d756cae287c06d90a7e9eb2d09"
+SRC_URI +=3D "git://github.com/prometheus/common;protocol=3Dhttps;nobran=
ch=3D1;tag=3Dv0.66.1;shallow=3D1;rev=3D8975dde6db7208309e9872891f24c7301a=
a77dfb;name=3Dgit_63ab0745_0;destsuffix=3Dvcs_cache/4004fe14db85cf2a2119d=
66ea225f2b9d7d14ea63e1e3bfa539d1d2440d107c4"
+SRC_URI +=3D "git://github.com/prometheus/client_golang;protocol=3Dhttps=
;nobranch=3D1;tag=3Dv1.23.2;shallow=3D1;rev=3D8179a560819f2c64ef6ade70e6a=
e4c73aecaca3c;name=3Dgit_6ffa6057_0;destsuffix=3Dvcs_cache/d9bbeca592abd4=
abe4a9bb304c93ff338301ffcad964694c918522126d52a1d2"
+SRC_URI +=3D "git://github.com/prometheus/procfs;protocol=3Dhttps;nobran=
ch=3D1;tag=3Dv0.16.1;shallow=3D1;rev=3Dcff69b9d9aa77a0793276da74310e38422=
864e28;name=3Dgit_0ab7c7bc_0;destsuffix=3Dvcs_cache/c5636022955615867ff5e=
898a254c352486ff4f35f8066d4296d4561c4ef4d2e"
+SRC_URI +=3D "git://github.com/prometheus/client_model;protocol=3Dhttps;=
branch=3Dmaster;rev=3D14fe0d1b01d4d5fc031dd4bec1823bd3ebbe8016;name=3Dgit=
_63d71ba5_0;destsuffix=3Dvcs_cache/51e8f292b7b4c73ee0cd08ea12700b5d30bb89=
b5b541d85eaee134d6035c3069"
+SRC_URI +=3D "git://github.com/prometheus/client_model;protocol=3Dhttps;=
nobranch=3D1;tag=3Dv0.6.2;shallow=3D1;rev=3Deb136e513d419e0c31ad750922f0a=
6f7675c2dee;name=3Dgit_63d71ba5_1;destsuffix=3Dvcs_cache/ce4113e6c8f9de1c=
05a5198a36f67001c5b8ac458bbdbca291a0800fa698d5b1"
+SRC_URI +=3D "git://github.com/pmezard/go-difflib;protocol=3Dhttps;branc=
h=3Dmaster;rev=3D5d4384ee4fb2527b0a1256a821ebfc92f91efefc;name=3Dgit_b667=
20d7_0;destsuffix=3Dvcs_cache/542a02198867d48986449e0f3353a6afa6fd53ac0a9=
f07be5882207092512174"
+SRC_URI +=3D "git://github.com/pmezard/go-difflib;protocol=3Dhttps;nobra=
nch=3D1;tag=3Dv1.0.0;shallow=3D1;rev=3D792786c7400a136282c1664665ae0a8db9=
21c6c2;name=3Dgit_b66720d7_1;destsuffix=3Dvcs_cache/c04ad296d2e3203fda8b7=
ca96feaca21b20b3b7441e33c7d67cda029ea61ab4c"
+SRC_URI +=3D "git://github.com/pkg/errors;protocol=3Dhttps;nobranch=3D1;=
tag=3Dv0.9.1;shallow=3D1;rev=3D614d223910a179a466c1767a985424175c39b465;n=
ame=3Dgit_6d82bc63_0;destsuffix=3Dvcs_cache/58e525151c02acebc6662bf19060e=
7ee1112335787f1ffb059ea8d46a3164e5e"
+SRC_URI +=3D "git://github.com/Microsoft/didx509go;protocol=3Dhttps;nobr=
anch=3D1;tag=3Dv0.0.3;shallow=3D1;rev=3Dd6236d5cdf87770cf91ae58586fc35ac4=
ec209ea;name=3Dgit_653ab3b3_0;destsuffix=3Dvcs_cache/9d732379493b8d4ba557=
d271dfac2f175c56544888b810e4884820c70ff7fb20"
+SRC_URI +=3D "git://github.com/Microsoft/cosesign1go;protocol=3Dhttps;no=
branch=3D1;tag=3Dv1.4.0;shallow=3D1;rev=3Daa4d5e387f66760d40cc8b90987c0bf=
00d9abe18;name=3Dgit_3a764ac5_0;destsuffix=3Dvcs_cache/1eadcf4b7177fc71d2=
fa87bdfd2145aaaad8dd60403a2ba1c5bb507e71d85138"
+SRC_URI +=3D "git://github.com/Microsoft/hcsshim;protocol=3Dhttps;nobran=
ch=3D1;tag=3Dv0.14.0-rc.1;shallow=3D1;rev=3D59e0e2f72c87c95fdd376c5fb12a2=
16b6f983e5d;name=3Dgit_d1a645ee_0;destsuffix=3Dvcs_cache/f493369c2a96e959=
905afa70d80efbf15bd25304bc9938aafdaa00d931825b26"
+SRC_URI +=3D "git://github.com/Microsoft/go-winio;protocol=3Dhttps;nobra=
nch=3D1;tag=3Dv0.6.2;shallow=3D1;rev=3D3c9576c9346a1892dee136329e7e15309e=
82fb4f;name=3Dgit_6d816430_0;destsuffix=3Dvcs_cache/963154633520174004b7a=
508de4bfa23c0374f9312f6db845c29aa3cb751d708"
+SRC_URI +=3D "git://github.com/kr/text;protocol=3Dhttps;nobranch=3D1;tag=
=3Dv0.2.0;shallow=3D1;rev=3D702c74938df48b97370179f33ce2107bd7ff3b3e;name=
=3Dgit_2770e00e_0;destsuffix=3Dvcs_cache/62674ecb33f72b9ab66dd856fe2e651d=
bf7344dea40ba5132203c7b4b32cfd61"
+SRC_URI +=3D "git://github.com/kr/pretty;protocol=3Dhttps;nobranch=3D1;t=
ag=3Dv0.3.1;shallow=3D1;rev=3D3cd153a126da607b78d1762779b1e1054f9889fc;na=
me=3Dgit_cd673b00_0;destsuffix=3Dvcs_cache/487dccea2d19da29e6f873ffd57f7f=
4d33720781a3f60bb9f852176acb476435"
+SRC_URI +=3D "git://github.com/klauspost/compress;protocol=3Dhttps;nobra=
nch=3D1;tag=3Dv1.18.1;shallow=3D1;rev=3Dd10b5259eef9d3da9a58bedad041b3673=
1967489;name=3Dgit_98939663_0;destsuffix=3Dvcs_cache/b48c3ccd9eeacff33408=
e742c5cba28495d19318773a2419734e1f7f12be4596"
+SRC_URI +=3D "git://github.com/kisielk/gotool;protocol=3Dhttps;nobranch=3D=
1;tag=3Dv1.0.0;shallow=3D1;rev=3D80517062f582ea3340cd4baf70e86d539ae7d84d=
;name=3Dgit_e251e12c_0;destsuffix=3Dvcs_cache/5f448e8a93894c89c55e73478ef=
6dc8a0a1a6a3fd3fe3a2b5cd5e03e65915fb1"
+SRC_URI +=3D "git://github.com/kisielk/errcheck;protocol=3Dhttps;nobranc=
h=3D1;tag=3Dv1.5.0;shallow=3D1;rev=3Dee08a456fc430219ad80ce5af98415bcc027=
a219;name=3Dgit_19b8b0b3_0;destsuffix=3Dvcs_cache/2ae681313b6ac49c6c60836=
f406eed1f7f4db5b86a3027f0ec720f5984386390"
+SRC_URI +=3D "git://github.com/go-logr/stdr;protocol=3Dhttps;nobranch=3D=
1;tag=3Dv1.2.2;shallow=3D1;rev=3D521af2addfa7c81c8a65d0e85ed34bb6bb6dc262=
;name=3Dgit_76834f06_0;destsuffix=3Dvcs_cache/e69aa58ea5f2f28aa8623652f5e=
6643b2299d9fe8ba1e6c73a8e3d602290ac67"
+SRC_URI +=3D "git://github.com/go-logr/logr;protocol=3Dhttps;nobranch=3D=
1;tag=3Dv1.4.3;shallow=3D1;rev=3D38a1c47ef633fa6b2eee6b8f2e1371ba8626e557=
;name=3Dgit_e0ff909e_0;destsuffix=3Dvcs_cache/5b4f8e13d26b7581594ade5c47d=
93fb87ebb7720ce23eff7afaed11743464e1f"
+SRC_URI +=3D "git://github.com/go-logr/logr;protocol=3Dhttps;nobranch=3D=
1;tag=3Dv1.2.2;shallow=3D1;rev=3D99e02a994f50f904b6b201df394776cf687238a9=
;name=3Dgit_e0ff909e_1;destsuffix=3Dvcs_cache/761d6b76e4ca57583edd8a7d6cf=
39d5a0c0dfd1fb4f82f099c044f754193f7d1"
+SRC_URI +=3D "git://github.com/golang/protobuf;protocol=3Dhttps;nobranch=
=3D1;tag=3Dv1.4.0-rc.1;shallow=3D1;rev=3D0fd14f96108ad68d2571a78c2d8ef528=
7ee57c43;name=3Dgit_6e18cbff_0;destsuffix=3Dvcs_cache/efeddbb7df08ac6ca9b=
2bbda927e2b2189b92b06a73e55799fb3bf9581e75dcf"
+SRC_URI +=3D "git://github.com/golang/protobuf;protocol=3Dhttps;nobranch=
=3D1;tag=3Dv1.4.0;shallow=3D1;rev=3D1b794fe86dd6a0c7c52ae69b5c9cb0aeedc52=
afa;name=3Dgit_6e18cbff_1;destsuffix=3Dvcs_cache/9701e384e22d2f09b50e22d6=
c6600a8ff9d29bbe79215d2d3d0eb4ec3ae88f76"
+SRC_URI +=3D "git://github.com/golang/protobuf;protocol=3Dhttps;nobranch=
=3D1;tag=3Dv1.4.3;shallow=3D1;rev=3D4846b58453b3708320bdb524f25cc5a1d9cda=
4d4;name=3Dgit_6e18cbff_2;destsuffix=3Dvcs_cache/afcc28cc9d69ccbdadf7d3b6=
4dd61a2449f1316c579ba313fc8f7c2f7b0a2c5d"
+SRC_URI +=3D "git://github.com/golang/protobuf;protocol=3Dhttps;nobranch=
=3D1;tag=3Dv1.3.2;shallow=3D1;rev=3D6c65a5562fc06764971b7c5d05c76c75e84bd=
bf7;name=3Dgit_6e18cbff_3;destsuffix=3Dvcs_cache/cbdb48339b27d250cd1655e4=
e658760981e0b526face5866f3cfac54fd21200c"
+SRC_URI +=3D "git://github.com/golang/protobuf;protocol=3Dhttps;nobranch=
=3D1;tag=3Dv1.4.1;shallow=3D1;rev=3D6c66de79d66478d166c7ea05f5d2ccaf016fb=
d6b;name=3Dgit_6e18cbff_4;destsuffix=3Dvcs_cache/1eb4b95e7f54d310a313a166=
f271987ca8ef42c83b650550333c53b4493a87d9"
+SRC_URI +=3D "git://github.com/golang/protobuf;protocol=3Dhttps;nobranch=
=3D1;tag=3Dv1.5.4;shallow=3D1;rev=3D75de7c059e36b64f01d0dd234ff2fff404ec3=
374;name=3Dgit_6e18cbff_5;destsuffix=3Dvcs_cache/ff75ecee442381e7c87bac5e=
c092ebaf50137bc693ba5c5c1edce6eb4bd3ce94"
+SRC_URI +=3D "git://github.com/golang/protobuf;protocol=3Dhttps;nobranch=
=3D1;tag=3Dv1.4.0-rc.2;shallow=3D1;rev=3Da3619c1acae2c674b494328ff4dd53c8=
ba0590dc;name=3Dgit_6e18cbff_6;destsuffix=3Dvcs_cache/4d51dcd940a624407a3=
6666d25477186e59714137829ca237592547b2456897b"
+SRC_URI +=3D "git://github.com/golang/protobuf;protocol=3Dhttps;nobranch=
=3D1;tag=3Dv1.2.0;shallow=3D1;rev=3Daa810b61a9c79d51363740d207bb46cf8e620=
ed5;name=3Dgit_6e18cbff_7;destsuffix=3Dvcs_cache/c620195ee748026eed07d7e1=
6b36050b97c69cfe3f735e96aafd915e5397baa5"
+SRC_URI +=3D "git://github.com/golang/mock;protocol=3Dhttps;nobranch=3D1=
;tag=3Dv1.1.1;shallow=3D1;rev=3Dc34cdb4725f4c3844d095133c6e40e448b86589b;=
name=3Dgit_e0a6dff9_0;destsuffix=3Dvcs_cache/cfc71555d14f8ab66f92807e40f5=
893bb08b8eb5bdecd40b444f71558441e179"
+SRC_URI +=3D "git://github.com/golang/groupcache;protocol=3Dhttps;branch=
=3Dmaster;rev=3D2c02b8208cf8c02a3e358cb1d9b60950647543fc;name=3Dgit_24e75=
0eb_0;destsuffix=3Dvcs_cache/42d84b5a864149912b1976573aa12f43cdea041dfbb4=
1206b5548b1134452af5"
+SRC_URI +=3D "git://github.com/golang/groupcache;protocol=3Dhttps;branch=
=3Dmaster;rev=3D8c9f03a8e57eb486e42badaed3fb287da51807ba;name=3Dgit_24e75=
0eb_1;destsuffix=3Dvcs_cache/650bdea426b0ab9b6b2f1702e9e9d6abe4d771a6acdd=
8f04a1b6bc48e374550f"
+SRC_URI +=3D "git://github.com/golang/glog;protocol=3Dhttps;branch=3Dmas=
ter;rev=3D23def4e6c14b4da8ac2ed8007337bc5eb5007998;name=3Dgit_d14ca79d_0;=
destsuffix=3Dvcs_cache/f5cbb2974dc34ce4944f2c4c42cdc6c20abcd2a192abab4ba1=
b6e9c67ef409d5"
+SRC_URI +=3D "git://github.com/golang/glog;protocol=3Dhttps;nobranch=3D1=
;tag=3Dv1.2.5;shallow=3D1;rev=3D2b790ef78571cd58d29ce909a8d4e3f71cc4c47e;=
name=3Dgit_d14ca79d_1;destsuffix=3Dvcs_cache/c9f39bfa0a44d36bb33abf5da9f9=
41c03e1a2e8b3c98916cabc3aaca09d17583"
+SRC_URI +=3D "git://github.com/felixge/httpsnoop;protocol=3Dhttps;nobran=
ch=3D1;tag=3Dv1.0.4;shallow=3D1;rev=3Dc5817c27ec125409c069052fdd171023c35=
3501c;name=3Dgit_b48d732c_0;destsuffix=3Dvcs_cache/4faaa0a5649a2ae9245609=
ad7ed739dbc2e39cfd27a3018400f3dad114269d26"
+SRC_URI +=3D "git://github.com/envoyproxy/protoc-gen-validate;protocol=3D=
https;nobranch=3D1;tag=3Dv1.2.1;shallow=3D1;rev=3D7b06248484ceeaa947e93ca=
2747eccf336a88ecc;name=3Dgit_ac4e3fea_0;destsuffix=3Dvcs_cache/d5f02e84a7=
cac6538441cf10353084bc8986687c4fb1dbec8ce868f36087a44c"
+SRC_URI +=3D "git://github.com/envoyproxy/protoc-gen-validate;protocol=3D=
https;nobranch=3D1;tag=3Dv0.1.0;shallow=3D1;rev=3D9eff07ddfcb4001aa1aab28=
0648153f46e1a8ddc;name=3Dgit_ac4e3fea_1;destsuffix=3Dvcs_cache/17dee49ca0=
a12c9d068fb9ddd8d0ade5d40bec4965b4d5b57c0163c07b7cc1f7"
+SRC_URI +=3D "git://github.com/envoyproxy/go-control-plane;protocol=3Dht=
tps;nobranch=3D1;tag=3Dratelimit/v0.1.0;shallow=3D1;rev=3D2cdf9fc1e8a104e=
69a6487721514041c335d86f6;name=3Dgit_f80b47a3_0;destsuffix=3Dvcs_cache/90=
6f63aa0b71e9714823fdb45d45be4659d30de781b6a053c93f43371894845f"
+SRC_URI +=3D "git://github.com/envoyproxy/go-control-plane;protocol=3Dht=
tps;nobranch=3D1;tag=3Dv0.13.4;shallow=3D1;rev=3D2d07f5a1efda9ba496b69ffa=
fa7efbf86661c35c;name=3Dgit_f80b47a3_1;destsuffix=3Dvcs_cache/1248bc92f13=
bca22704468dd7a1863c1e00e9349148860487e5fbfba3c05f303"
+SRC_URI +=3D "git://github.com/envoyproxy/go-control-plane;protocol=3Dht=
tps;nobranch=3D1;tag=3Dv0.9.0;shallow=3D1;rev=3D52b167a709f111e6298136064=
bbaae43419ab22f;name=3Dgit_f80b47a3_2;destsuffix=3Dvcs_cache/7b9d6b3bb8d8=
9496a2b4604c64fe742706539fd157f8455324b5c536248f32d6"
+SRC_URI +=3D "git://github.com/envoyproxy/go-control-plane;protocol=3Dht=
tps;branch=3Dmain;rev=3D5f8ba28d44739bd22a47f915a6910b38eea29792;name=3Dg=
it_f80b47a3_3;destsuffix=3Dvcs_cache/ae18408e2dabff9eae443474dd88764e1702=
f08db99eaa197e196d11fef11707"
+SRC_URI +=3D "git://github.com/envoyproxy/go-control-plane;protocol=3Dht=
tps;nobranch=3D1;tag=3Dv0.9.4;shallow=3D1;rev=3Dba8e577f987f6676343cac845=
25b92ed1b2d86fe;name=3Dgit_f80b47a3_4;destsuffix=3Dvcs_cache/f149a73577cc=
7366678c404cd18196812505b84e63e52c4bb54a8fc51de6e119"
+SRC_URI +=3D "git://github.com/envoyproxy/go-control-plane;protocol=3Dht=
tps;nobranch=3D1;tag=3Denvoy/v1.32.4;shallow=3D1;rev=3Dc19bf63a811c90bf9e=
02f8e0dc1dcef94931ebb4;name=3Dgit_f80b47a3_5;destsuffix=3Dvcs_cache/b7646=
40e72f39b0abeb1eee792c7fd920bb28361222420dedee7bbe30022afa6"
+SRC_URI +=3D "git://github.com/docker/go-metrics;protocol=3Dhttps;nobran=
ch=3D1;tag=3Dv0.0.1;shallow=3D1;rev=3Db619b3592b65de4f087d9f16863a7e6ff90=
5973c;name=3Dgit_08ad7bc8_0;destsuffix=3Dvcs_cache/96ae8893e24907a70aef92=
2af47d48651611460f2b982f7e1e27dacd5ad82b9f"
+SRC_URI +=3D "git://github.com/docker/go-events;protocol=3Dhttps;branch=3D=
main;rev=3De31b211e4f1cd09aa76fe4ac244571fab96ae47f;name=3Dgit_2703dc86_0=
;destsuffix=3Dvcs_cache/3e0bfea9682128db4b902dfb300a63020f2a4e0fd9e50a9a4=
3529185ded21203"
+SRC_URI +=3D "git://github.com/docker/docker;protocol=3Dhttps;nobranch=3D=
1;tag=3Dv24.0.0;shallow=3D1;rev=3D1331b8c39a601c77d678f3e03f3f39cb07aa5f7=
6;name=3Dgit_248eb0d1_0;destsuffix=3Dvcs_cache/fef1acd534062d3bdbabf1925b=
4ad9af4ae1c35e830092e03e7087c0de102913"
+SRC_URI +=3D "git://github.com/docker/docker-credential-helpers;protocol=
=3Dhttps;nobranch=3D1;tag=3Dv0.7.0;shallow=3D1;rev=3Dac5992b5f4756fc0398a=
7d0c93c609e624368bde;name=3Dgit_46e68097_0;destsuffix=3Dvcs_cache/dec3c7f=
eaf80b600beff65a7a5011fa4215905f39ed602aa878644f3dfdb1de3"
+SRC_URI +=3D "git://github.com/docker/cli;protocol=3Dhttps;nobranch=3D1;=
tag=3Dv24.0.0;shallow=3D1;rev=3D98fdcd769bcd137f7538f898b37348f919536ea4;=
name=3Dgit_cad1045a_0;destsuffix=3Dvcs_cache/767941a450a63257ae8acd03345f=
c8dfbf6b58bc08b69d36c97c92a3e76e3ad5"
+SRC_URI +=3D "git://github.com/docker/distribution;protocol=3Dhttps;nobr=
anch=3D1;tag=3Dv2.8.2;shallow=3D1;rev=3D7c354a4b40feeea21d7eeae4de91c8ff7=
951e672;name=3Dgit_3954c8b6_0;destsuffix=3Dvcs_cache/5963ff551a76f6e4574c=
31bfbaf16ab787fad1c87da7a097024b4d7c6159107b"
+SRC_URI +=3D "git://github.com/docker/go-units;protocol=3Dhttps;nobranch=
=3D1;tag=3Dv0.5.0;shallow=3D1;rev=3De682442797b36348f8e1f98defdbf32bac0b6=
c6f;name=3Dgit_35e0b052_0;destsuffix=3Dvcs_cache/2f970538f28b36d4a39663fa=
90033ec5c742ddd7774a86d94cc6c179e63a1c49"
+SRC_URI +=3D "git://github.com/davecgh/go-spew;protocol=3Dhttps;nobranch=
=3D1;tag=3Dv1.1.0;shallow=3D1;rev=3D346938d642f2ec3594ed81d874461961cd0fa=
a76;name=3Dgit_d9a489aa_0;destsuffix=3Dvcs_cache/5ce38ad71c2d3bc390b87154=
a89c53fd5ead19aed2bf005419db5c0b28ea9dfd"
+SRC_URI +=3D "git://github.com/davecgh/go-spew;protocol=3Dhttps;nobranch=
=3D1;tag=3Dv1.1.1;shallow=3D1;rev=3D8991bc29aa16c548c550c7ff78260e27b9ab7=
c73;name=3Dgit_d9a489aa_1;destsuffix=3Dvcs_cache/4c7d69cfe586f86079773ff4=
8d94f76d327c2914d8dfeffca9e34fd1146e5d5e"
+SRC_URI +=3D "git://github.com/cncf/xds;protocol=3Dhttps;branch=3Dmain;r=
ev=3D2ac532fd44436293585084f8d94c6bdb17835af0;name=3Dgit_02e4abb9_0;dests=
uffix=3Dvcs_cache/e0bdc15b1a7c1a8070f042c4642f13845c0a3597e8027bebaf15f8d=
169e221ab"
+SRC_URI +=3D "git://github.com/cncf/udpa;protocol=3Dhttps;branch=3Dmain;=
rev=3D269d4d468f6f798d803d140c3016ed6fc6b735c5;name=3Dgit_6dce3e52_0;dest=
suffix=3Dvcs_cache/2d4bb3719cd74b7802454af2a99a01288222b8d83502e76ab100cd=
853a9f4b62"
+SRC_URI +=3D "git://github.com/client9/misspell;protocol=3Dhttps;nobranc=
h=3D1;tag=3Dv0.3.4;shallow=3D1;rev=3Db90dc15cfd220ecf8bbc9043ecb928cef381=
f011;name=3Dgit_75d9c67f_0;destsuffix=3Dvcs_cache/124db3874e1d4102a9dc474=
78928c54062b3baec396eed15d1359e70ed21b796"
+SRC_URI +=3D "git://github.com/census-instrumentation/opencensus-proto;p=
rotocol=3Dhttps;nobranch=3D1;tag=3Dv0.2.1;shallow=3D1;rev=3Dd89fa54de5081=
11353cb0b06403c00569be780d8;name=3Dgit_67c76c7d_0;destsuffix=3Dvcs_cache/=
47f526897b6e692b88b3517f7ef7e68b617de38122f7782931e45d8d2be2fef6"
+SRC_URI +=3D "git://github.com/BurntSushi/toml;protocol=3Dhttps;nobranch=
=3D1;tag=3Dv0.3.1;shallow=3D1;rev=3D3012a1dbe2e4bd1391d42b32f0577cb7bbc7f=
005;name=3Dgit_ec7059c7_0;destsuffix=3Dvcs_cache/c7591feaba0db5f458f0e674=
5283c8246ea0f50af4eb4714a53ff88805ecd88a"
+SRC_URI +=3D "git://github.com/gogo/protobuf;protocol=3Dhttps;nobranch=3D=
1;tag=3Dv1.3.2;shallow=3D1;rev=3Db03c65ea87cdc3521ede29f62fe3ce239267c1bc=
;name=3Dgit_99185c7b_0;destsuffix=3Dvcs_cache/e07d7c0e03a0e2831dd973581be=
0944984030693bc73f0b67a64e53b4c690635"
+SRC_URI +=3D "git://github.com/moby/spdystream;protocol=3Dhttps;nobranch=
=3D1;tag=3Dv0.5.0;shallow=3D1;rev=3D77eb080123d208697674a07b74ceaf94c98be=
e8b;name=3Dgit_30522a60_0;destsuffix=3Dvcs_cache/d7500df0fff4308611e91e5e=
df74d69178b53dccca9230c03beecb0a26d56124"
+SRC_URI +=3D "git://github.com/moby/locker;protocol=3Dhttps;nobranch=3D1=
;tag=3Dv1.0.1;shallow=3D1;rev=3D281af2d563954745bea9d1487c965f24d30742fe;=
name=3Dgit_a03ea75a_0;destsuffix=3Dvcs_cache/5549df51df50be0334c0cca67abc=
7ed6c0bd4fceee3f7bb56eb917b56bfe8644"
+SRC_URI +=3D "git://github.com/moby/sys;protocol=3Dhttps;nobranch=3D1;ta=
g=3Dcapability/v0.4.0;shallow=3D1;rev=3D50e999a770172a519119e1c4fd4b6153b=
7dac90d;name=3Dgit_66165bb7_0;destsuffix=3Dvcs_cache/e67c1b1913863f71a44f=
b255bb4ceafcd322cbb0790a301c410f76acaf083f75"
+SRC_URI +=3D "git://github.com/moby/sys;protocol=3Dhttps;nobranch=3D1;ta=
g=3Duserns/v0.1.0;shallow=3D1;rev=3D54475191138bd297c627eb1a59e1e54b95395=
7f1;name=3Dgit_66165bb7_1;destsuffix=3Dvcs_cache/8ea1faceda9bb3618c7b96f0=
749fcc6b4672432eef27c1f25c4bf631513501f2"
+SRC_URI +=3D "git://github.com/moby/sys;protocol=3Dhttps;nobranch=3D1;ta=
g=3Duser/v0.4.0;shallow=3D1;rev=3D71f0c5ead442a11945a589a7aafd6ef5976fffc=
8;name=3Dgit_66165bb7_2;destsuffix=3Dvcs_cache/1ea4d88317a39a40b500e6a837=
0c6c5f6d53cf5486d16925f6374042d8bf9896"
+SRC_URI +=3D "git://github.com/moby/sys;protocol=3Dhttps;nobranch=3D1;ta=
g=3Dmountinfo/v0.7.2;shallow=3D1;rev=3Dcafbe42351600ca9b363e220722f66d96f=
6e71f4;name=3Dgit_66165bb7_3;destsuffix=3Dvcs_cache/c5c70dcea521c7e4cc66d=
0ca1ccdc1721b1a865780c1a1b9274ced410fa0553f"
+SRC_URI +=3D "git://github.com/google/go-containerregistry;protocol=3Dht=
tps;nobranch=3D1;tag=3Dv0.20.1;shallow=3D1;rev=3Dc3d1dcc932076c15b65b8b9a=
cfff1d47ded2ebf9;name=3Dgit_e4a968c9_0;destsuffix=3Dvcs_cache/a2844d6ba65=
e6b80271cad050f89b6c0158f173d5b155bfd7f8f4e93d826c21d"
+SRC_URI +=3D "git://github.com/google/deck;protocol=3Dhttps;branch=3Dmas=
ter;rev=3D105ad94aa8aec4c27766e92c4310b466f0852009;name=3Dgit_57663d5a_0;=
destsuffix=3Dvcs_cache/9c43c7ddfa82c3fc0dbcab5945f7f810fa68c290504895ba9a=
331c514051c140"
+SRC_URI +=3D "git://github.com/google/certtostore;protocol=3Dhttps;nobra=
nch=3D1;tag=3Dv1.0.6;shallow=3D1;rev=3Dee4ff6fd9d452e8aa7eb3249c00b272ecd=
454c2d;name=3Dgit_e7a3d490_0;destsuffix=3Dvcs_cache/03eab8e8fd9152de17904=
3ef32fd09e4375ad5a3b8e25efbeeba6b44d1ca9d4f"
+SRC_URI +=3D "git://github.com/google/uuid;protocol=3Dhttps;nobranch=3D1=
;tag=3Dv1.1.2;shallow=3D1;rev=3D0e4e31197428a347842d152773b4cace4645ca25;=
name=3Dgit_c3a7687c_0;destsuffix=3Dvcs_cache/192548bfd3acdce00ddcc9091abd=
663f637e675eb5470859ea5ca544d5150646"
+SRC_URI +=3D "git://github.com/google/uuid;protocol=3Dhttps;nobranch=3D1=
;tag=3Dv1.6.0;shallow=3D1;rev=3D0f11ee6918f41a04c201eceeadf612a377bc7fbc;=
name=3Dgit_c3a7687c_1;destsuffix=3Dvcs_cache/1743dd7863ebf20fb946ec26a052=
5a27c91536f2d01acf863b0a99566cd8f3e5"
+SRC_URI +=3D "git://github.com/google/go-cmp;protocol=3Dhttps;nobranch=3D=
1;tag=3Dv0.5.3;shallow=3D1;rev=3D0a3ecd384c2ae80de757e4b62138949ab721f02e=
;name=3Dgit_8726c33a_0;destsuffix=3Dvcs_cache/f0648a9cebe17ac6cb2e543c1b3=
c24b2c85c8b2bc09d2e2ba22ce58b2b89cdb0"
+SRC_URI +=3D "git://github.com/google/go-cmp;protocol=3Dhttps;nobranch=3D=
1;tag=3Dv0.3.1;shallow=3D1;rev=3D2d0692c2e9617365a95b295612ac0d4415ba4627=
;name=3Dgit_8726c33a_1;destsuffix=3Dvcs_cache/bbba6265e3e26d3a892583135cc=
fff338512124f01097cb15f8532f41f14d3f1"
+SRC_URI +=3D "git://github.com/google/go-cmp;protocol=3Dhttps;nobranch=3D=
1;tag=3Dv0.2.0;shallow=3D1;rev=3D3af367b6b30c263d47e8895973edcca9a49cf029=
;name=3Dgit_8726c33a_2;destsuffix=3Dvcs_cache/bb2851e042ef699bbc2df1ef8c7=
b0c754822560b89602db9ff6f6315b5afddf7"
+SRC_URI +=3D "git://github.com/google/go-cmp;protocol=3Dhttps;nobranch=3D=
1;tag=3Dv0.4.0;shallow=3D1;rev=3D5a6f75716e1203a923a78c9efb94089d857df0f6=
;name=3Dgit_8726c33a_3;destsuffix=3Dvcs_cache/04ff364bb494ac39b4a8c906ddd=
6c47ddef7d89071af49fc9d78eebd2ee4f937"
+SRC_URI +=3D "git://github.com/google/go-cmp;protocol=3Dhttps;nobranch=3D=
1;tag=3Dv0.3.0;shallow=3D1;rev=3D6f77996f0c42f7b84e5a2b252227263f93432e9b=
;name=3Dgit_8726c33a_4;destsuffix=3Dvcs_cache/ae58fd0d54f7194cd02ff68b960=
0f09892901604ebd985b881c9860505e91785"
+SRC_URI +=3D "git://github.com/google/go-cmp;protocol=3Dhttps;nobranch=3D=
1;tag=3Dv0.5.0;shallow=3D1;rev=3D77ae86f624cb174e21763cffcbbf070eb06cb016=
;name=3Dgit_8726c33a_5;destsuffix=3Dvcs_cache/06401ba5971b1b6dbf869860d7b=
89a3bf1fbcf3c04ffb585b80919dddb781ca6"
+SRC_URI +=3D "git://github.com/google/go-cmp;protocol=3Dhttps;nobranch=3D=
1;tag=3Dv0.7.0;shallow=3D1;rev=3D9b12f366a942ebc7254abc7f32ca05068b455fb7=
;name=3Dgit_8726c33a_6;destsuffix=3Dvcs_cache/460ed71bde70f3a932cad8d9044=
d3f12302bf8b6e95353bd17c44189712e2763"
+SRC_URI +=3D "git://github.com/opencontainers/selinux;protocol=3Dhttps;n=
obranch=3D1;tag=3Dv1.12.0;shallow=3D1;rev=3D996c4cffd3c5fb210e4ff01b4998a=
c73ff0031fa;name=3Dgit_49bf5caa_0;destsuffix=3Dvcs_cache/4335d93e7b91bac4=
d4e22725cfaafc1cae44ef37a037022ea852d084e488e42a"
+SRC_URI +=3D "git://github.com/opencontainers/runtime-tools;protocol=3Dh=
ttps;branch=3Dmaster;rev=3D0ea5ed0382a279b30530acccafaf070fefeddafd;name=3D=
git_b055e1ee_0;destsuffix=3Dvcs_cache/f53bb2252a6ed943b856ebf9ca177b616be=
13e0631422a2c5167b1eeada6cc21"
+SRC_URI +=3D "git://github.com/opencontainers/runc;protocol=3Dhttps;nobr=
anch=3D1;tag=3Dv1.2.3;shallow=3D1;rev=3D0d37cfd4b557771e555a184d5a78d0ed4=
bdb79a5;name=3Dgit_8f91da41_0;destsuffix=3Dvcs_cache/12690fc9d5ecc8fe915b=
6cb0164c724b2a0fed93540b9e523062cab10c0c2ba2"
+SRC_URI +=3D "git://github.com/opencontainers/runtime-spec;protocol=3Dht=
tps;nobranch=3D1;tag=3Dv1.2.1;shallow=3D1;rev=3D524fc0e1b8ab0180e2fc9abd3=
1837a0f4ed1fd6b;name=3Dgit_502d0543_0;destsuffix=3Dvcs_cache/527ad6550cd6=
54c758c3a90c33fba5de9598578a66be5e157153797cc1e49aa3"
+SRC_URI +=3D "git://github.com/opencontainers/go-digest;protocol=3Dhttps=
;nobranch=3D1;tag=3Dv1.0.0;shallow=3D1;rev=3Dea51bea511f75cfa3ef6098cc253=
c5c3609b037a;name=3Dgit_552be1ee_0;destsuffix=3Dvcs_cache/1a4d20c74c510ca=
00ecb86a3379c151579ed626508723e74a394480a71a0af24"
+SRC_URI +=3D "git://github.com/opencontainers/image-spec;protocol=3Dhttp=
s;nobranch=3D1;tag=3Dv1.1.1;shallow=3D1;rev=3D147f9c13cedb47a0c4d9a11a222=
961073d585877;name=3Dgit_a9e099ef_0;destsuffix=3Dvcs_cache/5bb7cbac46d5df=
774d087c364c00445553d3db253ca80dc7050c4e57832c118d"
+SRC_URI +=3D "git://github.com/sirupsen/logrus;protocol=3Dhttps;nobranch=
=3D1;tag=3Dv1.9.3;shallow=3D1;rev=3Dd40e25cd45ed9c6b2b66e6b97573a0413e4c2=
3bd;name=3Dgit_02061634_0;destsuffix=3Dvcs_cache/a1230aee5f8f1a866199cbec=
636d1525e00a9b13cf2fe0023dcf6b874c525014"
+SRC_URI +=3D "git://github.com/containerd/stargz-snapshotter;protocol=3D=
https;nobranch=3D1;tag=3Destargz/v0.14.3;shallow=3D1;rev=3D6ee6fa1a88df6e=
a098f6b7dddde29e33f09d5331;name=3Dgit_0c473532_0;destsuffix=3Dvcs_cache/c=
0a45b74bb21bc7e7c0163054aff213d8dc61e3fa18ff5547b732362f881d13a"
+SRC_URI +=3D "git://github.com/containerd/zfs;protocol=3Dhttps;nobranch=3D=
1;tag=3Dv2.0.0-rc.0;shallow=3D1;rev=3Dac25940eac8d55a66eb07b5444da0bd98ab=
03f2b;name=3Dgit_62ef0568_0;destsuffix=3Dvcs_cache/760d9b417b3649f7335a54=
37c1ddc3ce9a7d15632bcac73a7aabc3c145104a12"
+SRC_URI +=3D "git://github.com/containerd/protobuild;protocol=3Dhttps;no=
branch=3D1;tag=3Dv0.3.0;shallow=3D1;rev=3D168a8eac459f4c240ad54e1147f9160=
56efd4c46;name=3Dgit_d8d48ca8_0;destsuffix=3Dvcs_cache/7cfac99318ce6513d3=
f62c22baae310b7cc70562da7c000901e610a84fb83c70"
+SRC_URI +=3D "git://github.com/containerd/imgcrypt;protocol=3Dhttps;nobr=
anch=3D1;tag=3Dv2.0.1;shallow=3D1;rev=3Dc377ec98ff79ec9205eabf555ebd2ea78=
4738c6c;name=3Dgit_3f4049aa_0;destsuffix=3Dvcs_cache/cf07f49bde1cc9b1c042=
dfb7055d38c832cb69592e89521daa5ad46b367e047b"
+SRC_URI +=3D "git://github.com/containerd/otelttrpc;protocol=3Dhttps;nob=
ranch=3D1;tag=3Dv0.1.0;shallow=3D1;rev=3Dfa91cafe17adf59a0edc10650135dfd1=
dfb761c2;name=3Dgit_69c055ed_0;destsuffix=3Dvcs_cache/c27d4a7087a7f4624cd=
f40c161f9707dbb90cd2d71159840f7c7b610260e9f24"
+SRC_URI +=3D "git://github.com/containerd/nri;protocol=3Dhttps;nobranch=3D=
1;tag=3Dv0.10.0;shallow=3D1;rev=3Da2eea2bc19ada59eafdb1237a4720ef8ab11e5b=
1;name=3Dgit_523249c2_0;destsuffix=3Dvcs_cache/9e8aeba250dfc002831e46adac=
e86815de4667ce3a2125acdbc5818f536de05c"
+SRC_URI +=3D "git://github.com/containerd/go-runc;protocol=3Dhttps;nobra=
nch=3D1;tag=3Dv1.1.0;shallow=3D1;rev=3Ddf3c22d088ca919d1943efa8ae0cfc0514=
da0542;name=3Dgit_84c96084_0;destsuffix=3Dvcs_cache/9044e9e240020298712a5=
1a4db4736afc66d70b1870cf11cac73c0661be06842"
+SRC_URI +=3D "git://github.com/containerd/go-cni;protocol=3Dhttps;nobran=
ch=3D1;tag=3Dv1.1.13;shallow=3D1;rev=3D784f94e654944e41f86cf33ad49bfe0701=
4c2e7e;name=3Dgit_cab8b449_0;destsuffix=3Dvcs_cache/42aaa61d2bb4bd3a1eb27=
8daa53bed3b31e3af601d35dafceb8b7714333cef05"
+SRC_URI +=3D "git://github.com/containerd/fifo;protocol=3Dhttps;nobranch=
=3D1;tag=3Dv1.1.0;shallow=3D1;rev=3D151b205263c29d471e0d55c787d2ce9f5343f=
d46;name=3Dgit_6f3d1077_0;destsuffix=3Dvcs_cache/e4b0152cde11b075ce8a8a9f=
0db77d54abb72ee1bab1036ab0c157b678aade47"
+SRC_URI +=3D "git://github.com/containerd/console;protocol=3Dhttps;nobra=
nch=3D1;tag=3Dv1.0.5;shallow=3D1;rev=3Dc8d962180f543ac07c008ecc79a413406e=
a10c0b;name=3Dgit_7dc259a2_0;destsuffix=3Dvcs_cache/a38aca664db28f607862e=
39301d2fd06b3c58312662cbd189f451215c3eb9894"
+SRC_URI +=3D "git://github.com/containerd/btrfs;protocol=3Dhttps;nobranc=
h=3D1;tag=3Dv2.0.0;shallow=3D1;rev=3Df611cf12b33f43269574b2ad82bcb55e4d6f=
9982;name=3Dgit_afc7f4f6_0;destsuffix=3Dvcs_cache/8a2ee3ce7d871ae06962c07=
984197acdfd6035091884c9db0791378ac0229823"
+SRC_URI +=3D "git://github.com/containerd/plugin;protocol=3Dhttps;nobran=
ch=3D1;tag=3Dv1.0.0;shallow=3D1;rev=3D19cedbf730bb9ae1c106c4d4df8492bb3d3=
fb8fd;name=3Dgit_0f1fd608_0;destsuffix=3Dvcs_cache/f786b847c888d27ca5c517=
b566772c78216ed963d31d5119a32ebad7494855ea"
+SRC_URI +=3D "git://github.com/containerd/platforms;protocol=3Dhttps;nob=
ranch=3D1;tag=3Dv1.0.0-rc.2;shallow=3D1;rev=3D2e51fd9435bd985e1753954b24f=
4b0453f4e4767;name=3Dgit_96693f8e_0;destsuffix=3Dvcs_cache/a5b697e2dcecbe=
42edb518786dede1d257aecc63276621eb03e3917cae97e344"
+SRC_URI +=3D "git://github.com/containerd/cgroups;protocol=3Dhttps;nobra=
nch=3D1;tag=3Dv3.1.0;shallow=3D1;rev=3Dfa024e5d81b610f004f42857e696d94b89=
61475a;name=3Dgit_85a7d8f6_0;destsuffix=3Dvcs_cache/afcdc6b74bd9b0d30fcd8=
01d4175ef54783d125d29b7cf31da1bed7135dae03e"
+SRC_URI +=3D "git://github.com/containerd/fuse-overlayfs-snapshotter;pro=
tocol=3Dhttps;nobranch=3D1;tag=3Dv2.1.7;shallow=3D1;rev=3Dda57796c7d0a2b6=
08abf173651cf148706e33337;name=3Dgit_923d9d3e_0;destsuffix=3Dvcs_cache/eb=
d7034108ca2f7b1a5d3724f3248f21f9cf17f5ecf3db9b5c71ee2e6de56563"
+SRC_URI +=3D "git://github.com/containerd/typeurl;protocol=3Dhttps;nobra=
nch=3D1;tag=3Dv2.2.3;shallow=3D1;rev=3D5b047adad57d172afa9654c019fe65bf05=
40cc4d;name=3Dgit_94e812bb_0;destsuffix=3Dvcs_cache/60bc9255cadbea28631b3=
293cd629cbe0b9a9cffb987712231cdc4f9dc75a2cb"
+SRC_URI +=3D "git://github.com/containerd/errdefs;protocol=3Dhttps;nobra=
nch=3D1;tag=3Dpkg/v0.3.0;shallow=3D1;rev=3D4817405e4a3caeb7aee9dac68ed553=
39c59cb635;name=3Dgit_070120f7_0;destsuffix=3Dvcs_cache/d9d1c9949e837f392=
05605237b656e944c7d0cd69e48a906fabdb6bebe0edb66"
+SRC_URI +=3D "git://github.com/containerd/ttrpc;protocol=3Dhttps;nobranc=
h=3D1;tag=3Dv1.2.7;shallow=3D1;rev=3D3b8c8b75577584e412043afb7b561193a4a4=
7d2e;name=3Dgit_1deba031_0;destsuffix=3Dvcs_cache/89e0e59ec2637becf69ff86=
9326d460e7b3aa5c251d58a6d42981bc9c12360fd"
+SRC_URI +=3D "git://github.com/containerd/continuity;protocol=3Dhttps;no=
branch=3D1;tag=3Dv0.4.5;shallow=3D1;rev=3D44e2adf7e9cd87330f3ad656e7a006e=
f91ed8c1e;name=3Dgit_b4d76115_0;destsuffix=3Dvcs_cache/ef286b146362aa5da5=
8f9ef4e88323a32e1ea45eda78c6d484875972ce0a81e0"
+SRC_URI +=3D "git://github.com/containerd/log;protocol=3Dhttps;nobranch=3D=
1;tag=3Dv0.1.0;shallow=3D1;rev=3D0fc1e28871fdf2786e2cc51bbe4133db6547a199=
;name=3Dgit_b70b7359_0;destsuffix=3Dvcs_cache/697be36d9b8a0eb34f8591d0f69=
b6d596e1e9341b5944ebf81ddd334b1907bc6"
+SRC_URI +=3D "git://github.com/containerd/containerd;protocol=3Dhttps;no=
branch=3D1;tag=3Dv2.2.0;shallow=3D1;rev=3D1c4457e00facac03ce1d75f7b6777a7=
a851e5c41;name=3Dgit_c2fd43eb_0;destsuffix=3Dvcs_cache/003bc34c1dde3a2ee6=
7d971788503962fb4b2b4dd2f0c77c2b690f26457b75ca"
+SRC_URI +=3D "git://github.com/containerd/containerd;protocol=3Dhttps;no=
branch=3D1;tag=3Dapi/v1.10.0;shallow=3D1;rev=3D8b34ce391bd114e080892cccfa=
956ef3807c207c;name=3Dgit_c2fd43eb_1;destsuffix=3Dvcs_cache/4ae09c91c596d=
23f3127d6821ac6178aa6512e66eba4da3a39e7c94903e2407b"
+SRC_URI +=3D "git://github.com/coreos/go-systemd;protocol=3Dhttps;nobran=
ch=3D1;tag=3Dv22.6.0;shallow=3D1;rev=3D8214e15a7a799dc18f0ef8dd788b830f81=
5d7530;name=3Dgit_1f60ff15_0;destsuffix=3Dvcs_cache/cb3155042a873c409f7dd=
a7401561f3206a5dc4225d8ce9335fd9da1ee482c05"
+SRC_URI +=3D "git://github.com/golang/appengine;protocol=3Dhttps;nobranc=
h=3D1;tag=3Dv1.1.0;shallow=3D1;rev=3Db1f26356af11148e710935ed1ac8a7f5702c=
7612;name=3Dgit_aeb473be_0;destsuffix=3Dvcs_cache/002b5670204043ccd079efb=
6d63593281adeda7cdb3438553d5f59123714dd9d"
+SRC_URI +=3D "git://github.com/golang/appengine;protocol=3Dhttps;nobranc=
h=3D1;tag=3Dv1.4.0;shallow=3D1;rev=3De9657d882bb81064595ca3b56cbe2546bbab=
f7b1;name=3Dgit_aeb473be_1;destsuffix=3Dvcs_cache/6985551872e9385a78906b5=
11015e4428f8582eda7da3fa8b99f12fc9e94e0e3"
+SRC_URI +=3D "git://github.com/googleapis/go-genproto;protocol=3Dhttps;b=
ranch=3Dmain;rev=3D24fa4b261c55da65468f2abfdae2b024eef27dfb;name=3Dgit_46=
1a63b9_0;destsuffix=3Dvcs_cache/8c877fcc5f4a5bef6db5a87334d34f9165c6d6c86=
4a08e9fe01ad2e1269bb030"
+SRC_URI +=3D "git://github.com/googleapis/go-genproto;protocol=3Dhttps;b=
ranch=3Dmain;rev=3Da7a43d27e69bcb572fbfb88cf5bc494dcb440f76;name=3Dgit_46=
1a63b9_1;destsuffix=3Dvcs_cache/8d1ae8953d4e81e4a7b4b6ad849d7016ae871670c=
27f2ee0089c64c2e4294ddc"
+SRC_URI +=3D "git://github.com/googleapis/go-genproto;protocol=3Dhttps;b=
ranch=3Dmain;rev=3Dc66870c02cf823ceb633bcd05be3c7cda29976f4;name=3Dgit_46=
1a63b9_2;destsuffix=3Dvcs_cache/2e90a35366d1da1bf52aba5763ec05ba14e4ec064=
46cdfe1a754af830eb9fc4a"
+SRC_URI +=3D "git://github.com/googleapis/go-genproto;protocol=3Dhttps;b=
ranch=3Dmain;rev=3Dcb27e3aa201319f013ddb1872c3111662191a225;name=3Dgit_46=
1a63b9_3;destsuffix=3Dvcs_cache/f4e88ad01c32fa84f172d06a8fd34c47643c43e7c=
69ee97316a94e1a0ace3b25"
+SRC_URI +=3D "git://go.googlesource.com/protobuf;protocol=3Dhttps;nobran=
ch=3D1;tag=3Dv1.36.10;shallow=3D1;rev=3Df9fa50e26c0ffec610c509850484a5fde=
cdb26ec;name=3Dgit_a6c5d6b8_0;destsuffix=3Dvcs_cache/3436497d01a86cde43a5=
e76c997e02e0547f362e8f0246dcbb7680acad79157f"
+SRC_URI +=3D "git://github.com/protocolbuffers/protobuf-go;protocol=3Dht=
tps;nobranch=3D1;tag=3Dv1.21.0;shallow=3D1;rev=3D3b9eee12916ce611400f93d6=
c2fed2fc2911b0ad;name=3Dgit_5d5fe344_0;destsuffix=3Dvcs_cache/b66e2f94014=
f3dadd38321a8ae33347a24d4580a57d66c71189f792e6fbdccb2"
+SRC_URI +=3D "git://github.com/protocolbuffers/protobuf-go;protocol=3Dht=
tps;nobranch=3D1;tag=3Dv1.25.0;shallow=3D1;rev=3D3f7a61f89bb6813f89d981d1=
870ed68da0b3c3f1;name=3Dgit_5d5fe344_1;destsuffix=3Dvcs_cache/3d6aee3027d=
2f1fb2a147e8904f03ce6eb1828daf030dc46aaf1528caa0d21f7"
+SRC_URI +=3D "git://github.com/protocolbuffers/protobuf-go;protocol=3Dht=
tps;branch=3Dmaster;rev=3D4d8936d0db64b6e6de56ba714c942542cca031fb;name=3D=
git_5d5fe344_2;destsuffix=3Dvcs_cache/5ff0520fa4067b911a561ac5bd9b5c4aef3=
5ed0b28bc716a0d7503df6f292fba"
+SRC_URI +=3D "git://github.com/protocolbuffers/protobuf-go;protocol=3Dht=
tps;branch=3Dmaster;rev=3D81db48ad09ccc6ee1fcae434baa4bb1b7a7a7a72;name=3D=
git_5d5fe344_3;destsuffix=3Dvcs_cache/6672d6c61253550fee094c62b7113d620e0=
9975c4fdd6a2d3f730f829d3aa7b5"
+SRC_URI +=3D "git://github.com/protocolbuffers/protobuf-go;protocol=3Dht=
tps;nobranch=3D1;tag=3Dv1.22.0;shallow=3D1;rev=3D8b0d71ac935315b10385aaaf=
30175de0c74bbba6;name=3Dgit_5d5fe344_4;destsuffix=3Dvcs_cache/397e5b05f3f=
4e5369964001986d9c4c3e998f4f07ff952c7073f4a6eb41ed83e"
+SRC_URI +=3D "git://github.com/protocolbuffers/protobuf-go;protocol=3Dht=
tps;branch=3Dmaster;rev=3Dab0ca4ff8a60eb84ec53793ee6cfb4e7c0c67d17;name=3D=
git_5d5fe344_5;destsuffix=3Dvcs_cache/bc64bffea0101db18ce198fe50ccee1b34e=
de4bbe6df0daf4943785f88a2665f"
+SRC_URI +=3D "git://github.com/protocolbuffers/protobuf-go;protocol=3Dht=
tps;nobranch=3D1;tag=3Dv1.23.0;shallow=3D1;rev=3Dd165be301fb1e13390ad4532=
81ded24385fd8ebc;name=3Dgit_5d5fe344_6;destsuffix=3Dvcs_cache/fe9b8770004=
b8051ad2328d8bc677057a91d457f03b0a432dda814855d97d008"
+SRC_URI +=3D "git://github.com/protocolbuffers/protobuf-go;protocol=3Dht=
tps;branch=3Dmaster;rev=3De05f789c09678a21d72233703c0027e1958343e7;name=3D=
git_5d5fe344_7;destsuffix=3Dvcs_cache/5be79d49c339af2a47aec21e2a6c3827a85=
4579ce046e58eb12c45b13cc54dfb"
+SRC_URI +=3D "git://github.com/protocolbuffers/protobuf-go;protocol=3Dht=
tps;branch=3Dmaster;rev=3Dec00e32a8dfdf9c92bb2f5946450a42874aa9244;name=3D=
git_5d5fe344_8;destsuffix=3Dvcs_cache/11dd3abcdf0bca5a664e8bbb4cfe97a029b=
0429be1f3ffa36c3ff6291d482fe6"
+SRC_URI +=3D "git://github.com/grpc/grpc-go;protocol=3Dhttps;nobranch=3D=
1;tag=3Dv1.25.1;shallow=3D1;rev=3D1a3960e4bd028ac0cec0a2afd27d7d8e67c1151=
4;name=3Dgit_6bc32f05_0;destsuffix=3Dvcs_cache/418d54448e9be6e664bfa3e3e2=
514e15f092e4297963eed5c1e3c7e7e569c464"
+SRC_URI +=3D "git://github.com/grpc/grpc-go;protocol=3Dhttps;nobranch=3D=
1;tag=3Dv1.19.0;shallow=3D1;rev=3D2fdaae294f38ed9a121193c51ec99fecd3b13eb=
7;name=3Dgit_6bc32f05_1;destsuffix=3Dvcs_cache/a0c196f14d37fa5876674ce232=
fea42efebf6c35dc46d41f266e22b2c7e30959"
+SRC_URI +=3D "git://github.com/grpc/grpc-go;protocol=3Dhttps;nobranch=3D=
1;tag=3Dv1.33.2;shallow=3D1;rev=3D56d63285d528c0d33f9bf8c355139d91edc047d=
e;name=3Dgit_6bc32f05_2;destsuffix=3Dvcs_cache/9dd08885e1a8db43a8455d2fd3=
a42384ff1ed9a8f79e116dffcce781b4dee045"
+SRC_URI +=3D "git://github.com/grpc/grpc-go;protocol=3Dhttps;nobranch=3D=
1;tag=3Dv1.23.0;shallow=3D1;rev=3D6eaf6f47437a6b4e2153a190160ef39a92c7ece=
b;name=3Dgit_6bc32f05_3;destsuffix=3Dvcs_cache/ffbc3aa648503af50d3781760e=
b60394842a0f05e745dbb7f28b5246843e0675"
+SRC_URI +=3D "git://github.com/grpc/grpc-go;protocol=3Dhttps;nobranch=3D=
1;tag=3Dv1.27.0;shallow=3D1;rev=3Da89bee78ddf0f67f27c06b1b2b1b071c1840872=
4;name=3Dgit_6bc32f05_4;destsuffix=3Dvcs_cache/d33440dd79b6e7c93174f3dcb6=
fccb7ccfebd02a4405850443d56e62d285f44a"
+SRC_URI +=3D "git://github.com/grpc/grpc-go;protocol=3Dhttps;nobranch=3D=
1;tag=3Dv1.76.0;shallow=3D1;rev=3Dd96c2ef4f3339142d20a47797d8a5a4fae94860=
7;name=3Dgit_6bc32f05_5;destsuffix=3Dvcs_cache/0c7b828398bb55c8fc7b52129e=
4867f1f0efae601c9c27e2295d6fca0d979bfc"
+SRC_URI +=3D "git://github.com/grpc/grpc-go;protocol=3Dhttps;nobranch=3D=
1;tag=3Dcmd/protoc-gen-go-grpc/v1.5.1;shallow=3D1;rev=3Dec9dff77b186d5308=
955fe0fc50e3e4cbe187e2c;name=3Dgit_6bc32f05_6;destsuffix=3Dvcs_cache/ce5a=
862c22ded840bff7b7ec1016804cb0af284075ea09fb5fe73b9866532a3a"
+SRC_URI +=3D "git://go.googlesource.com/lint;protocol=3Dhttps;branch=3Dm=
aster;rev=3Dd0100b6bd8b389f0385611eb39152c4d7c3a7905;name=3Dgit_716d0082_=
0;destsuffix=3Dvcs_cache/1579e0152a59419ec03794703218d5fb2fa620626cecad2e=
79ddd1fdd861441d"
+SRC_URI +=3D "git://go.googlesource.com/xerrors;protocol=3Dhttps;branch=3D=
master;rev=3D1b5146add8981d58be77b16229c0ff0f8bebd8c1;name=3Dgit_e8cbb9fc=
_0;destsuffix=3Dvcs_cache/8c142112d3bf2046dde4cb3dda11db03c95a8ab51bfb424=
b4d31be45594f7e6a"
+SRC_URI +=3D "git://go.googlesource.com/xerrors;protocol=3Dhttps;branch=3D=
master;rev=3D5ec99f83aff198f5fbd629d6c8d8eb38a04218ca;name=3Dgit_e8cbb9fc=
_1;destsuffix=3Dvcs_cache/1a7eef0babb47828059471e537bef1e9023bf22cd1c23e5=
fcaf7523b68332e82"
+SRC_URI +=3D "git://go.googlesource.com/xerrors;protocol=3Dhttps;branch=3D=
master;rev=3D9bdfabe68543c54f90421aeb9a60ef8061b5b544;name=3Dgit_e8cbb9fc=
_2;destsuffix=3Dvcs_cache/a190c0bd506167cc1631eefeb81697d88fd666066c0d35a=
bb4f058915f9881cd"
+SRC_URI +=3D "git://go.googlesource.com/xerrors;protocol=3Dhttps;branch=3D=
master;rev=3Da985d3407aa71f30cf86696ee0a2f409709f22e1;name=3Dgit_e8cbb9fc=
_3;destsuffix=3Dvcs_cache/19bf66358270f1db6b287805895c6fc8385236e01234a96=
b3da1d15fe70245f7"
+SRC_URI +=3D "git://github.com/dominikh/go-tools;protocol=3Dhttps;branch=
=3Drelease.2019.1;rev=3Dc2f93a96b099cbbec1de36336ab049ffa620e6d7;name=3Dg=
it_f1a8947f_0;destsuffix=3Dvcs_cache/1c8623cf2c7ebfeee0aad3729998ea1016b9=
9ce59691f48e992f1fbd376fe06b"
+SRC_URI +=3D "git://github.com/dominikh/go-tools;protocol=3Dhttps;branch=
=3Dmaster;rev=3Dea95bdfd59fc14c1c9afa08716e0cd013eae4e12;name=3Dgit_f1a89=
47f_1;destsuffix=3Dvcs_cache/995bdd0e708de1678d46517c89bc37c3a96f080c46f8=
be3ca8451c42cf0fb77c"
diff --git a/recipes-containers/fuse-overlayfs-snapshotter/go-mod-hybrid-=
cache.inc b/recipes-containers/fuse-overlayfs-snapshotter/go-mod-hybrid-c=
ache.inc
new file mode 100644
index 000000000000..a7cb0c698549
--- /dev/null
+++ b/recipes-containers/fuse-overlayfs-snapshotter/go-mod-hybrid-cache.i=
nc
@@ -0,0 +1,34 @@
+# Generated by oe-go-mod-fetcher-hybrid.py
+# Metadata for git-fetched modules (VCS path)
+# Used by go-mod-vcs.bbclass to build module cache from git checkouts
+
+inherit go-mod-vcs
+
+# Module metadata for cache building (one module per line)
+GO_MODULE_CACHE_DATA =3D '[\
+{"module":"github.com/containerd/btrfs/v2","version":"v2.0.0","vcs_hash"=
:"8a2ee3ce7d871ae06962c07984197acdfd6035091884c9db0791378ac0229823","time=
stamp":"2023-02-10T01:01:25Z","subdir":"","vcs_ref":"refs/tags/v2.0.0"},\
+{"module":"github.com/containerd/cgroups/v3","version":"v3.1.0","vcs_has=
h":"afcdc6b74bd9b0d30fcd801d4175ef54783d125d29b7cf31da1bed7135dae03e","ti=
mestamp":"2025-10-27T22:43:47Z","subdir":"","vcs_ref":"refs/tags/v3.1.0"}=
,\
+{"module":"github.com/containerd/console","version":"v1.0.5","vcs_hash":=
"a38aca664db28f607862e39301d2fd06b3c58312662cbd189f451215c3eb9894","times=
tamp":"2025-05-20T06:25:07Z","subdir":"","vcs_ref":"refs/tags/v1.0.5"},\
+{"module":"github.com/containerd/containerd/api","version":"v1.10.0","vc=
s_hash":"4ae09c91c596d23f3127d6821ac6178aa6512e66eba4da3a39e7c94903e2407b=
","timestamp":"2025-11-05T15:11:32Z","subdir":"api","vcs_ref":"refs/tags/=
api/v1.10.0"},\
+{"module":"github.com/containerd/containerd/v2","version":"v2.2.0","vcs_=
hash":"003bc34c1dde3a2ee67d971788503962fb4b2b4dd2f0c77c2b690f26457b75ca",=
"timestamp":"2025-11-06T01:13:11Z","subdir":"","vcs_ref":"refs/tags/v2.2.=
0"},\
+{"module":"github.com/containerd/continuity","version":"v0.4.5","vcs_has=
h":"ef286b146362aa5da58f9ef4e88323a32e1ea45eda78c6d484875972ce0a81e0","ti=
mestamp":"2024-10-30T04:18:59Z","subdir":"","vcs_ref":"refs/tags/v0.4.5"}=
,\
+{"module":"github.com/containerd/errdefs","version":"v1.0.0","vcs_hash":=
"d9d1c9949e837f39205605237b656e944c7d0cd69e48a906fabdb6bebe0edb66","times=
tamp":"2024-10-08T13:10:09Z","subdir":"","vcs_ref":"refs/tags/v1.0.0"},\
+{"module":"github.com/containerd/errdefs/pkg","version":"v0.3.0","vcs_ha=
sh":"d9d1c9949e837f39205605237b656e944c7d0cd69e48a906fabdb6bebe0edb66","t=
imestamp":"2024-10-08T13:10:09Z","subdir":"pkg","vcs_ref":"refs/tags/pkg/=
v0.3.0"},\
+{"module":"github.com/containerd/fifo","version":"v1.1.0","vcs_hash":"e4=
b0152cde11b075ce8a8a9f0db77d54abb72ee1bab1036ab0c157b678aade47","timestam=
p":"2023-02-17T21:37:13Z","subdir":"","vcs_ref":"refs/tags/v1.1.0"},\
+{"module":"github.com/containerd/fuse-overlayfs-snapshotter/v2","version=
":"v2.1.7","vcs_hash":"ebd7034108ca2f7b1a5d3724f3248f21f9cf17f5ecf3db9b5c=
71ee2e6de56563","timestamp":"2025-11-06T01:42:49Z","subdir":"v2","vcs_ref=
":"refs/tags/v2.1.7"},\
+{"module":"github.com/containerd/go-cni","version":"v1.1.13","vcs_hash":=
"42aaa61d2bb4bd3a1eb278daa53bed3b31e3af601d35dafceb8b7714333cef05","times=
tamp":"2025-07-01T22:01:58Z","subdir":"","vcs_ref":"refs/tags/v1.1.13"},\
+{"module":"github.com/containerd/go-runc","version":"v1.1.0","vcs_hash":=
"9044e9e240020298712a51a4db4736afc66d70b1870cf11cac73c0661be06842","times=
tamp":"2023-05-17T04:55:20Z","subdir":"","vcs_ref":"refs/tags/v1.1.0"},\
+{"module":"github.com/containerd/imgcrypt/v2","version":"v2.0.1","vcs_ha=
sh":"cf07f49bde1cc9b1c042dfb7055d38c832cb69592e89521daa5ad46b367e047b","t=
imestamp":"2025-03-18T01:41:40Z","subdir":"","vcs_ref":"refs/tags/v2.0.1"=
},\
+{"module":"github.com/containerd/log","version":"v0.1.0","vcs_hash":"697=
be36d9b8a0eb34f8591d0f69b6d596e1e9341b5944ebf81ddd334b1907bc6","timestamp=
":"2023-09-09T00:27:15Z","subdir":"","vcs_ref":"refs/tags/v0.1.0"},\
+{"module":"github.com/containerd/nri","version":"v0.10.0","vcs_hash":"9e=
8aeba250dfc002831e46adace86815de4667ce3a2125acdbc5818f536de05c","timestam=
p":"2025-08-16T08:15:07Z","subdir":"","vcs_ref":"refs/tags/v0.10.0"},\
+{"module":"github.com/containerd/otelttrpc","version":"v0.1.0","vcs_hash=
":"c27d4a7087a7f4624cdf40c161f9707dbb90cd2d71159840f7c7b610260e9f24","tim=
estamp":"2025-01-09T19:17:17Z","subdir":"","vcs_ref":"refs/tags/v0.1.0"},=
\
+{"module":"github.com/containerd/platforms","version":"v1.0.0-rc.2","vcs=
_hash":"a5b697e2dcecbe42edb518786dede1d257aecc63276621eb03e3917cae97e344"=
,"timestamp":"2025-08-21T22:24:38Z","subdir":"","vcs_ref":"refs/tags/v1.0=
.0-rc.2"},\
+{"module":"github.com/containerd/plugin","version":"v1.0.0","vcs_hash":"=
f786b847c888d27ca5c517b566772c78216ed963d31d5119a32ebad7494855ea","timest=
amp":"2024-10-20T22:03:21Z","subdir":"","vcs_ref":"refs/tags/v1.0.0"},\
+{"module":"github.com/containerd/protobuild","version":"v0.3.0","vcs_has=
h":"7cfac99318ce6513d3f62c22baae310b7cc70562da7c000901e610a84fb83c70","ti=
mestamp":"2022-11-07T19:29:47Z","subdir":"","vcs_ref":"refs/tags/v0.3.0"}=
,\
+{"module":"github.com/containerd/stargz-snapshotter/estargz","version":"=
v0.14.3","vcs_hash":"c0a45b74bb21bc7e7c0163054aff213d8dc61e3fa18ff5547b73=
2362f881d13a","timestamp":"2023-03-08T08:28:23Z","subdir":"estargz","vcs_=
ref":"refs/tags/estargz/v0.14.3"},\
+{"module":"github.com/containerd/ttrpc","version":"v1.2.7","vcs_hash":"8=
9e0e59ec2637becf69ff869326d460e7b3aa5c251d58a6d42981bc9c12360fd","timesta=
mp":"2024-12-28T23:29:38Z","subdir":"","vcs_ref":"refs/tags/v1.2.7"},\
+{"module":"github.com/containerd/typeurl/v2","version":"v2.2.3","vcs_has=
h":"60bc9255cadbea28631b3293cd629cbe0b9a9cffb987712231cdc4f9dc75a2cb","ti=
mestamp":"2024-11-07T03:45:23Z","subdir":"","vcs_ref":"refs/tags/v2.2.3"}=
,\
+{"module":"github.com/containerd/zfs/v2","version":"v2.0.0-rc.0","vcs_ha=
sh":"760d9b417b3649f7335a5437c1ddc3ce9a7d15632bcac73a7aabc3c145104a12","t=
imestamp":"2024-10-24T13:31:35Z","subdir":"","vcs_ref":"refs/tags/v2.0.0-=
rc.0"},\
+{"module":"k8s.io/api","version":"v0.34.1","vcs_hash":"5c4bbd0617f6f594b=
275f1999f97eca8f79dbb30e908e7d6b5c7a80fd5b9b0d2","timestamp":"2025-09-10T=
04:39:36Z","subdir":"","vcs_ref":"refs/tags/v0.34.1"},\
+{"module":"k8s.io/apimachinery","version":"v0.34.1","vcs_hash":"9131e9eb=
e36078f01c5a5e8e9866300b853aa46fab527d00fc089d4c16938663","timestamp":"20=
25-08-16T07:57:26Z","subdir":"","vcs_ref":"refs/tags/v0.34.1"},\
+{"module":"k8s.io/client-go","version":"v0.34.1","vcs_hash":"25b2ca19570=
dcf36fcfa8a5388cc7647944fee1a9a445671e69704dbd6f452b5","timestamp":"2025-=
09-10T04:55:33Z","subdir":"","vcs_ref":"refs/tags/v0.34.1"}]'
diff --git a/recipes-containers/fuse-overlayfs-snapshotter/go-mod-hybrid-=
git.inc b/recipes-containers/fuse-overlayfs-snapshotter/go-mod-hybrid-git=
.inc
new file mode 100644
index 000000000000..97c99da59774
--- /dev/null
+++ b/recipes-containers/fuse-overlayfs-snapshotter/go-mod-hybrid-git.inc
@@ -0,0 +1,31 @@
+# Generated by oe-go-mod-fetcher-hybrid.py
+# Go modules fetched from git repositories (VCS path)
+#
+# These modules are fetched directly from their git repositories.
+# They provide full VCS provenance and allow easy SRCREV bumping.
+
+SRC_URI +=3D "git://github.com/containerd/btrfs;protocol=3Dhttps;nobranc=
h=3D1;tag=3Dv2.0.0;shallow=3D1;rev=3Df611cf12b33f43269574b2ad82bcb55e4d6f=
9982;name=3Dgit_afc7f4f6_0;destsuffix=3Dvcs_cache/8a2ee3ce7d871ae06962c07=
984197acdfd6035091884c9db0791378ac0229823"
+SRC_URI +=3D "git://github.com/containerd/cgroups;protocol=3Dhttps;nobra=
nch=3D1;tag=3Dv3.1.0;shallow=3D1;rev=3Dfa024e5d81b610f004f42857e696d94b89=
61475a;name=3Dgit_85a7d8f6_0;destsuffix=3Dvcs_cache/afcdc6b74bd9b0d30fcd8=
01d4175ef54783d125d29b7cf31da1bed7135dae03e"
+SRC_URI +=3D "git://github.com/containerd/console;protocol=3Dhttps;nobra=
nch=3D1;tag=3Dv1.0.5;shallow=3D1;rev=3Dc8d962180f543ac07c008ecc79a413406e=
a10c0b;name=3Dgit_7dc259a2_0;destsuffix=3Dvcs_cache/a38aca664db28f607862e=
39301d2fd06b3c58312662cbd189f451215c3eb9894"
+SRC_URI +=3D "git://github.com/containerd/containerd;protocol=3Dhttps;no=
branch=3D1;tag=3Dapi/v1.10.0;shallow=3D1;rev=3D8b34ce391bd114e080892cccfa=
956ef3807c207c;name=3Dgit_c2fd43eb_1;destsuffix=3Dvcs_cache/4ae09c91c596d=
23f3127d6821ac6178aa6512e66eba4da3a39e7c94903e2407b"
+SRC_URI +=3D "git://github.com/containerd/containerd;protocol=3Dhttps;no=
branch=3D1;tag=3Dv2.2.0;shallow=3D1;rev=3D1c4457e00facac03ce1d75f7b6777a7=
a851e5c41;name=3Dgit_c2fd43eb_0;destsuffix=3Dvcs_cache/003bc34c1dde3a2ee6=
7d971788503962fb4b2b4dd2f0c77c2b690f26457b75ca"
+SRC_URI +=3D "git://github.com/containerd/continuity;protocol=3Dhttps;no=
branch=3D1;tag=3Dv0.4.5;shallow=3D1;rev=3D44e2adf7e9cd87330f3ad656e7a006e=
f91ed8c1e;name=3Dgit_b4d76115_0;destsuffix=3Dvcs_cache/ef286b146362aa5da5=
8f9ef4e88323a32e1ea45eda78c6d484875972ce0a81e0"
+SRC_URI +=3D "git://github.com/containerd/errdefs;protocol=3Dhttps;nobra=
nch=3D1;tag=3Dpkg/v0.3.0;shallow=3D1;rev=3D4817405e4a3caeb7aee9dac68ed553=
39c59cb635;name=3Dgit_070120f7_0;destsuffix=3Dvcs_cache/d9d1c9949e837f392=
05605237b656e944c7d0cd69e48a906fabdb6bebe0edb66"
+SRC_URI +=3D "git://github.com/containerd/fifo;protocol=3Dhttps;nobranch=
=3D1;tag=3Dv1.1.0;shallow=3D1;rev=3D151b205263c29d471e0d55c787d2ce9f5343f=
d46;name=3Dgit_6f3d1077_0;destsuffix=3Dvcs_cache/e4b0152cde11b075ce8a8a9f=
0db77d54abb72ee1bab1036ab0c157b678aade47"
+SRC_URI +=3D "git://github.com/containerd/fuse-overlayfs-snapshotter;pro=
tocol=3Dhttps;nobranch=3D1;tag=3Dv2.1.7;shallow=3D1;rev=3Dda57796c7d0a2b6=
08abf173651cf148706e33337;name=3Dgit_923d9d3e_0;destsuffix=3Dvcs_cache/eb=
d7034108ca2f7b1a5d3724f3248f21f9cf17f5ecf3db9b5c71ee2e6de56563"
+SRC_URI +=3D "git://github.com/containerd/go-cni;protocol=3Dhttps;nobran=
ch=3D1;tag=3Dv1.1.13;shallow=3D1;rev=3D784f94e654944e41f86cf33ad49bfe0701=
4c2e7e;name=3Dgit_cab8b449_0;destsuffix=3Dvcs_cache/42aaa61d2bb4bd3a1eb27=
8daa53bed3b31e3af601d35dafceb8b7714333cef05"
+SRC_URI +=3D "git://github.com/containerd/go-runc;protocol=3Dhttps;nobra=
nch=3D1;tag=3Dv1.1.0;shallow=3D1;rev=3Ddf3c22d088ca919d1943efa8ae0cfc0514=
da0542;name=3Dgit_84c96084_0;destsuffix=3Dvcs_cache/9044e9e240020298712a5=
1a4db4736afc66d70b1870cf11cac73c0661be06842"
+SRC_URI +=3D "git://github.com/containerd/imgcrypt;protocol=3Dhttps;nobr=
anch=3D1;tag=3Dv2.0.1;shallow=3D1;rev=3Dc377ec98ff79ec9205eabf555ebd2ea78=
4738c6c;name=3Dgit_3f4049aa_0;destsuffix=3Dvcs_cache/cf07f49bde1cc9b1c042=
dfb7055d38c832cb69592e89521daa5ad46b367e047b"
+SRC_URI +=3D "git://github.com/containerd/log;protocol=3Dhttps;nobranch=3D=
1;tag=3Dv0.1.0;shallow=3D1;rev=3D0fc1e28871fdf2786e2cc51bbe4133db6547a199=
;name=3Dgit_b70b7359_0;destsuffix=3Dvcs_cache/697be36d9b8a0eb34f8591d0f69=
b6d596e1e9341b5944ebf81ddd334b1907bc6"
+SRC_URI +=3D "git://github.com/containerd/nri;protocol=3Dhttps;nobranch=3D=
1;tag=3Dv0.10.0;shallow=3D1;rev=3Da2eea2bc19ada59eafdb1237a4720ef8ab11e5b=
1;name=3Dgit_523249c2_0;destsuffix=3Dvcs_cache/9e8aeba250dfc002831e46adac=
e86815de4667ce3a2125acdbc5818f536de05c"
+SRC_URI +=3D "git://github.com/containerd/otelttrpc;protocol=3Dhttps;nob=
ranch=3D1;tag=3Dv0.1.0;shallow=3D1;rev=3Dfa91cafe17adf59a0edc10650135dfd1=
dfb761c2;name=3Dgit_69c055ed_0;destsuffix=3Dvcs_cache/c27d4a7087a7f4624cd=
f40c161f9707dbb90cd2d71159840f7c7b610260e9f24"
+SRC_URI +=3D "git://github.com/containerd/platforms;protocol=3Dhttps;nob=
ranch=3D1;tag=3Dv1.0.0-rc.2;shallow=3D1;rev=3D2e51fd9435bd985e1753954b24f=
4b0453f4e4767;name=3Dgit_96693f8e_0;destsuffix=3Dvcs_cache/a5b697e2dcecbe=
42edb518786dede1d257aecc63276621eb03e3917cae97e344"
+SRC_URI +=3D "git://github.com/containerd/plugin;protocol=3Dhttps;nobran=
ch=3D1;tag=3Dv1.0.0;shallow=3D1;rev=3D19cedbf730bb9ae1c106c4d4df8492bb3d3=
fb8fd;name=3Dgit_0f1fd608_0;destsuffix=3Dvcs_cache/f786b847c888d27ca5c517=
b566772c78216ed963d31d5119a32ebad7494855ea"
+SRC_URI +=3D "git://github.com/containerd/protobuild;protocol=3Dhttps;no=
branch=3D1;tag=3Dv0.3.0;shallow=3D1;rev=3D168a8eac459f4c240ad54e1147f9160=
56efd4c46;name=3Dgit_d8d48ca8_0;destsuffix=3Dvcs_cache/7cfac99318ce6513d3=
f62c22baae310b7cc70562da7c000901e610a84fb83c70"
+SRC_URI +=3D "git://github.com/containerd/stargz-snapshotter;protocol=3D=
https;nobranch=3D1;tag=3Destargz/v0.14.3;shallow=3D1;rev=3D6ee6fa1a88df6e=
a098f6b7dddde29e33f09d5331;name=3Dgit_0c473532_0;destsuffix=3Dvcs_cache/c=
0a45b74bb21bc7e7c0163054aff213d8dc61e3fa18ff5547b732362f881d13a"
+SRC_URI +=3D "git://github.com/containerd/ttrpc;protocol=3Dhttps;nobranc=
h=3D1;tag=3Dv1.2.7;shallow=3D1;rev=3D3b8c8b75577584e412043afb7b561193a4a4=
7d2e;name=3Dgit_1deba031_0;destsuffix=3Dvcs_cache/89e0e59ec2637becf69ff86=
9326d460e7b3aa5c251d58a6d42981bc9c12360fd"
+SRC_URI +=3D "git://github.com/containerd/typeurl;protocol=3Dhttps;nobra=
nch=3D1;tag=3Dv2.2.3;shallow=3D1;rev=3D5b047adad57d172afa9654c019fe65bf05=
40cc4d;name=3Dgit_94e812bb_0;destsuffix=3Dvcs_cache/60bc9255cadbea28631b3=
293cd629cbe0b9a9cffb987712231cdc4f9dc75a2cb"
+SRC_URI +=3D "git://github.com/containerd/zfs;protocol=3Dhttps;nobranch=3D=
1;tag=3Dv2.0.0-rc.0;shallow=3D1;rev=3Dac25940eac8d55a66eb07b5444da0bd98ab=
03f2b;name=3Dgit_62ef0568_0;destsuffix=3Dvcs_cache/760d9b417b3649f7335a54=
37c1ddc3ce9a7d15632bcac73a7aabc3c145104a12"
+SRC_URI +=3D "git://github.com/kubernetes/api;protocol=3Dhttps;nobranch=3D=
1;tag=3Dv0.34.1;shallow=3D1;rev=3D77c9e29b068e14d4bcca2d6a4c85b2cc9da5a92=
3;name=3Dgit_91745483_0;destsuffix=3Dvcs_cache/5c4bbd0617f6f594b275f1999f=
97eca8f79dbb30e908e7d6b5c7a80fd5b9b0d2"
+SRC_URI +=3D "git://github.com/kubernetes/apimachinery;protocol=3Dhttps;=
nobranch=3D1;tag=3Dv0.34.1;shallow=3D1;rev=3Db72d93d174332f952a8d431419fe=
ce5e6f044bcb;name=3Dgit_d6490ebc_0;destsuffix=3Dvcs_cache/9131e9ebe36078f=
01c5a5e8e9866300b853aa46fab527d00fc089d4c16938663"
+SRC_URI +=3D "git://github.com/kubernetes/client-go;protocol=3Dhttps;nob=
ranch=3D1;tag=3Dv0.34.1;shallow=3D1;rev=3Dd033c497ffef47be9b4f81abde5c3d9=
4dd78089a;name=3Dgit_0356f569_0;destsuffix=3Dvcs_cache/25b2ca19570dcf36fc=
fa8a5388cc7647944fee1a9a445671e69704dbd6f452b5"
diff --git a/recipes-containers/fuse-overlayfs-snapshotter/go-mod-hybrid-=
gomod.inc b/recipes-containers/fuse-overlayfs-snapshotter/go-mod-hybrid-g=
omod.inc
new file mode 100644
index 000000000000..8eb28c84d57d
--- /dev/null
+++ b/recipes-containers/fuse-overlayfs-snapshotter/go-mod-hybrid-gomod.i=
nc
@@ -0,0 +1,303 @@
+# Generated by oe-go-mod-fetcher-hybrid.py
+# Go modules fetched from proxy.golang.org (fast path)
+#
+# These modules are fetched as pre-built zip files from the Go proxy.
+# They do not provide VCS commit-level provenance but are much faster.
+
+inherit go-mod
+
+SRC_URI +=3D "gomod://cel.dev/expr;version=3Dv0.24.0;sha256sum=3D4456189=
315133136b72bfb40312d731c8957cce38a2807ac21d09f5158259bb7"
+SRC_URI +=3D "gomod://cloud.google.com/go;version=3Dv0.26.0;sha256sum=3D=
521f8c367396ff52b7e9c2203e32a714c995788b5d14a40e2bb829eb0a7878a7"
+SRC_URI +=3D "gomod://cloud.google.com/go/compute/metadata;version=3Dv0.=
7.0;sha256sum=3D89c19841bf87fe53034aed53505c527fe6674d3bf0f21c0e972374f94=
fb08eb4"
+SRC_URI +=3D "gomod://dario.cat/mergo;version=3Dv1.0.2;sha256sum=3D67d2e=
9d83ca57d3a8ce1a0e0e626a7c03753b3966b58b41b95e97ca4e7b2c640"
+SRC_URI +=3D "gomod://github.com/AdaLogics/go-fuzz-headers;version=3Dv0.=
0.0-20240806141605-e8a1dd7889d6;sha256sum=3D2fc1bca9461db8f106c8b73652d51=
ab2b7f8a2620b2d453ffcb813bbadf587b6"
+SRC_URI +=3D "gomod://github.com/BurntSushi/toml;version=3Dv0.3.1;sha256=
sum=3D815c6e594745f2d8842ff9a4b0569c6695e6cdfd5e07e5b3d98d06b72ca41e3c"
+SRC_URI +=3D "gomod://github.com/GoogleCloudPlatform/opentelemetry-opera=
tions-go/detectors/gcp;version=3Dv1.29.0;sha256sum=3Dbcb5b076f584381f80ea=
f566531db3317fdcca1ed56b0b0cf6d0c1bffd141945"
+SRC_URI +=3D "gomod://github.com/Microsoft/cosesign1go;version=3Dv1.4.0;=
sha256sum=3D5955ebf9ef98609a0abecae9c7d46006a5e8d876dbc15e2005cf866718721=
007"
+SRC_URI +=3D "gomod://github.com/Microsoft/didx509go;version=3Dv0.0.3;sh=
a256sum=3D46e101057a940f4dbd5d8e2c5276a0e5c62d2c820ef3b2d96caa791518b0840=
e"
+SRC_URI +=3D "gomod://github.com/Microsoft/go-winio;version=3Dv0.6.2;sha=
256sum=3Dcd007bdb877a578efde2780bf5dd2f57dd557b5b08c3614597b820d0369ebb0f=
"
+SRC_URI +=3D "gomod://github.com/Microsoft/hcsshim;version=3Dv0.14.0-rc.=
1;sha256sum=3Dc5201e908e6dabcfad1ea91f93a73dadaa53cc41f3284b915da1bd1d159=
73d89"
+SRC_URI +=3D "gomod://github.com/OneOfOne/xxhash;version=3Dv1.2.8;sha256=
sum=3D1dcee420896ecd5787e8e3bc67bdae262f5d189405c6e55d9dbc4698bbf47553"
+SRC_URI +=3D "gomod://github.com/StackExchange/wmi;version=3Dv0.0.0-2019=
0523213315-cbe66965904d;sha256sum=3D68f499ad4c3f45fc6c286fd2a5966e8e15c0f=
3abc1f96fbf4a979245df936e16"
+SRC_URI +=3D "gomod://github.com/agnivade/levenshtein;version=3Dv1.2.0;s=
ha256sum=3D8bd03e6210dda89343423cc5887d2d16fd669eb3d9c115aef5e3d50dff95b7=
ba"
+SRC_URI +=3D "gomod://github.com/akavel/rsrc;version=3Dv0.10.2;sha256sum=
=3D4a1f17e289dec94b49610f74b467c7e2053332e856a8766ec8c3e7c3d39af04f"
+SRC_URI +=3D "gomod://github.com/beorn7/perks;version=3Dv1.0.1;sha256sum=
=3D25bd9e2d94aca770e6dbc1f53725f84f6af4432f631d35dd2c46f96ef0512f1a"
+SRC_URI +=3D "gomod://github.com/blang/semver/v4;version=3Dv4.0.0;sha256=
sum=3D96a2bbe11960f3a3c16db0da822c69ce9ac4b738ee731a0476031bbb71987504"
+SRC_URI +=3D "gomod://github.com/cenkalti/backoff/v4;version=3Dv4.3.0;sh=
a256sum=3Def220b1ebf3bff4c46bbad5b2e123030e812b722b9e9dc88bc35956f9c622c2=
a"
+SRC_URI +=3D "gomod://github.com/census-instrumentation/opencensus-proto=
;version=3Dv0.2.1;sha256sum=3Db3c09f3e635d47b4138695a547d1f2c7138f382cbe5=
a8b5865b66a8e08233461"
+SRC_URI +=3D "gomod://github.com/cespare/xxhash/v2;version=3Dv2.3.0;sha2=
56sum=3D145a26cdc7c49db566017b807c4989ee7f7ddeb569423e9cb99f995fac3621d3"
+SRC_URI +=3D "gomod://github.com/checkpoint-restore/checkpointctl;versio=
n=3Dv1.4.0;sha256sum=3Da5a483923a7751ae70270337070e049e13ef6a26a6d013a4f1=
cb824e2b203f42"
+SRC_URI +=3D "gomod://github.com/checkpoint-restore/go-criu/v7;version=3D=
v7.2.0;sha256sum=3D6e88d29322c7665fdac2b5ed9c9a30b44fc2fb254e460241d9dee7=
1d564c5ac3"
+SRC_URI +=3D "gomod://github.com/cilium/ebpf;version=3Dv0.16.0;sha256sum=
=3D94f18289e55ece887579f7f3bd5117301c02a4413837fd6b5ff956962c8995cf"
+SRC_URI +=3D "gomod://github.com/client9/misspell;version=3Dv0.3.4;sha25=
6sum=3Da3af206372e131dd10a68ac470c66a1b18eaf51c6afacb55b2e2a06e39b90728"
+SRC_URI +=3D "gomod://github.com/cncf/udpa/go;version=3Dv0.0.0-201912090=
42840-269d4d468f6f;sha256sum=3Df2a2fee0b2024946ddd3b7ec5cd06a6d318cdb8421=
a8d5afff4c2fd69f1e74a7"
+SRC_URI +=3D "gomod://github.com/cncf/xds/go;version=3Dv0.0.0-2025050122=
5837-2ac532fd4443;sha256sum=3Dc7b36d6c805ab8718fa8700f69bee29c225f10258fd=
29315683b102398c013a8"
+SRC_URI +=3D "gomod://github.com/containernetworking/cni;version=3Dv1.3.=
0;sha256sum=3D7badb83e3b25468653c98f63f5d57ecfee92ef9022f203773de79fa777e=
445db"
+SRC_URI +=3D "gomod://github.com/containernetworking/plugins;version=3Dv=
1.8.0;sha256sum=3D836cc30b9327cbf24395bb40c3b971fe98ba65a02b0cfdbb1ab2494=
de1b736f1"
+SRC_URI +=3D "gomod://github.com/containers/ocicrypt;version=3Dv1.2.1;sh=
a256sum=3D9b36e2235a5009b5e2efcb1374a55ca156c5798d68d09dca25b238e23386018=
3"
+SRC_URI +=3D "gomod://github.com/coreos/go-systemd/v22;version=3Dv22.6.0=
;sha256sum=3D7759d251cb9c2f020d8b7b5fa075653cb11cad4861e3e194bf3484267bba=
bc2f"
+SRC_URI +=3D "gomod://github.com/cpuguy83/go-md2man/v2;version=3Dv2.0.7;=
sha256sum=3D9ad5f2cbc644c0bb648a9b182d6b70f92e7ac4dfab5cf0ef746bbeef944fd=
a59"
+SRC_URI +=3D "gomod://github.com/davecgh/go-spew;version=3Dv1.1.0;sha256=
sum=3D0b5a691aeb8b6af31bd2bb640973ea7e8bf1ed9bc5889da220bf44dc06d9692c"
+SRC_URI +=3D "gomod://github.com/davecgh/go-spew;version=3Dv1.1.1;sha256=
sum=3D6b44a843951f371b7010c754ecc3cabefe815d5ced1c5b9409fb2d697e8a890d"
+SRC_URI +=3D "gomod://github.com/decred/dcrd/dcrec/secp256k1/v4;version=3D=
v4.2.0;sha256sum=3D9b3594cedab7e820108cd9f2f7f17a9edf60345baf91f7e1bd2984=
13dba44c63"
+SRC_URI +=3D "gomod://github.com/distribution/reference;version=3Dv0.6.0=
;sha256sum=3D08232852a7a908263599777daab50e4306bd877e2467df03620636749612=
2bcc"
+SRC_URI +=3D "gomod://github.com/docker/cli;version=3Dv24.0.0+incompatib=
le;sha256sum=3Dae4a846af0ca50680db06bba10a25ae732ce976feeefc641d30f76900f=
21df4d"
+SRC_URI +=3D "gomod://github.com/docker/distribution;version=3Dv2.8.2+in=
compatible;sha256sum=3D9e0a17bbcaa1419232cd44e3a79209be26d9ccfa079e32e0e9=
999c81c0991477"
+SRC_URI +=3D "gomod://github.com/docker/docker;version=3Dv24.0.0+incompa=
tible;sha256sum=3D1fb430a6674bbb58c6a53d6ec6571ac3a40c59eba7223bf539b3a57=
2fe703181"
+SRC_URI +=3D "gomod://github.com/docker/docker-credential-helpers;versio=
n=3Dv0.7.0;sha256sum=3D590d8e508408951109c1763683560d6858aea3a598cf906df0=
9115a019d2192e"
+SRC_URI +=3D "gomod://github.com/docker/go-events;version=3Dv0.0.0-20190=
806004212-e31b211e4f1c;sha256sum=3D0f654eb0e7e07c237a229935ea3488728ddb5b=
082af2918b64452a1129dccae3"
+SRC_URI +=3D "gomod://github.com/docker/go-metrics;version=3Dv0.0.1;sha2=
56sum=3D4efab3706215f5b2d29ba823d3991fd6e2f81c02ce45ef0c73c019ebc90e020b"
+SRC_URI +=3D "gomod://github.com/docker/go-units;version=3Dv0.5.0;sha256=
sum=3D039d53ebe64af1aefa0be94ce42c621a17a3052c58ad15e5b3f357529beeaff6"
+SRC_URI +=3D "gomod://github.com/emicklei/go-restful/v3;version=3Dv3.13.=
0;sha256sum=3D06bd60484b324de0b8e4366d4ed326db2e1dc730459b46e19a5306a1084=
39c77"
+SRC_URI +=3D "gomod://github.com/envoyproxy/go-control-plane;version=3Dv=
0.9.0;sha256sum=3D07b3a43081c9e1cdccb95c657cba7f483d5099f9ce07b5e3f3e28ce=
557687521"
+SRC_URI +=3D "gomod://github.com/envoyproxy/go-control-plane;version=3Dv=
0.9.1-0.20191026205805-5f8ba28d4473;sha256sum=3D987cbf98b1745b0dfb30c3688=
fa7633b44de92aed63360755857af738b49f2a6"
+SRC_URI +=3D "gomod://github.com/envoyproxy/go-control-plane;version=3Dv=
0.9.4;sha256sum=3D5f8dcc4ce2f584b0c8daa163d34d90506bbdc0fd5b349f5cfc20e1a=
83ac89892"
+SRC_URI +=3D "gomod://github.com/envoyproxy/go-control-plane;version=3Dv=
0.13.4;sha256sum=3Da5952b5ef963bd493d3667a5cab35f723d4e26c7727c1fb6486cb8=
6f91e8a10e"
+SRC_URI +=3D "gomod://github.com/envoyproxy/go-control-plane/envoy;versi=
on=3Dv1.32.4;sha256sum=3D6baebcc1f441672ade0dacb4ca553a3d857f915590ca07bb=
e79314ddf62e6fae"
+SRC_URI +=3D "gomod://github.com/envoyproxy/go-control-plane/ratelimit;v=
ersion=3Dv0.1.0;sha256sum=3D1165c3cf1efb096a04a3d65b345f3780adce78f126583=
f7b98465c413a440766"
+SRC_URI +=3D "gomod://github.com/envoyproxy/protoc-gen-validate;version=3D=
v0.1.0;sha256sum=3Dec5261f3bbc426d71e2be4c76063ba12460c5d27845d630763e9e9=
11ec4768af"
+SRC_URI +=3D "gomod://github.com/envoyproxy/protoc-gen-validate;version=3D=
v1.2.1;sha256sum=3Dad9d2639aff17db6be291069c5463c46ed8ac37a0c6c1b57fae546=
5c5effb567"
+SRC_URI +=3D "gomod://github.com/felixge/httpsnoop;version=3Dv1.0.4;sha2=
56sum=3D75aa471311265e9860df0e523400b4650ed0c1a33262786a421f07226792e494"
+SRC_URI +=3D "gomod://github.com/fsnotify/fsnotify;version=3Dv1.9.0;sha2=
56sum=3D94e64824b23591b7aa504e3321d5ec3f57de88f4d49882eaefbbf6820dab746e"
+SRC_URI +=3D "gomod://github.com/fxamacker/cbor/v2;version=3Dv2.9.0;sha2=
56sum=3D5b0ec6424bd522aeeeab30cbdcad6f40bf976a9a2ddf125ab27b97826140d97a"
+SRC_URI +=3D "gomod://github.com/go-ini/ini;version=3Dv1.67.0;sha256sum=3D=
d77fe1b537b2e6db4040bd518b4755979006d5af7e82ae035aa2bc5d40c0ff55"
+SRC_URI +=3D "gomod://github.com/go-jose/go-jose/v4;version=3Dv4.1.2;sha=
256sum=3Df4e51bba50a0566ef2fafdb476750e8574004b2c47508053b86c6ec2e0e1d40e=
"
+SRC_URI +=3D "gomod://github.com/go-logr/logr;version=3Dv1.2.2;sha256sum=
=3D3d8ad5428394dcea7ecd1e9b9750011341e9043412326f53138677f9eac84567"
+SRC_URI +=3D "gomod://github.com/go-logr/logr;version=3Dv1.4.3;sha256sum=
=3D523d7a3587fe73f61ef41c8bc627f7d7f38de8104d46278154b307e60770ad70"
+SRC_URI +=3D "gomod://github.com/go-logr/stdr;version=3Dv1.2.2;sha256sum=
=3D9dd6893bf700198485ae699640b49bc1efbc6c73b37cb5792a0476e1fd8f7fef"
+SRC_URI +=3D "gomod://github.com/go-ole/go-ole;version=3Dv1.2.6;sha256su=
m=3D95b192df81ca16f0fb7d2d98ff6596d70256d73e49e899c55fabd511fd6768ef"
+SRC_URI +=3D "gomod://github.com/gobwas/glob;version=3Dv0.2.3;sha256sum=3D=
0cfe486cd63d45ed4cb5863ff1cbd14b15e4b9380dcbf80ff26991b4049f4fdf"
+SRC_URI +=3D "gomod://github.com/goccy/go-json;version=3Dv0.10.2;sha256s=
um=3Ded9043ee01cc46557c74bcecc625db37ffe3a5c7af219f390a287f44a40c2520"
+SRC_URI +=3D "gomod://github.com/godbus/dbus/v5;version=3Dv5.1.0;sha256s=
um=3D03dfa8e71089a6f477310d15c4d3a036d82d028532881b50fee254358e782ad9"
+SRC_URI +=3D "gomod://github.com/gogo/protobuf;version=3Dv1.3.2;sha256su=
m=3Ddd2b73f163c8183941626360196c8f844addd95423d341a0412e1b22d0104ff7"
+SRC_URI +=3D "gomod://github.com/golang/glog;version=3Dv0.0.0-2016012623=
5308-23def4e6c14b;sha256sum=3D36b3c522c8102dfe74ca96e474c4c361750bf2bb85b=
c3cefe4f074c07d6825a9"
+SRC_URI +=3D "gomod://github.com/golang/glog;version=3Dv1.2.5;sha256sum=3D=
99f5736dc4fd976a0691361b57ed853cb459070ba4c42ace6e3f5ebd0d154f8e"
+SRC_URI +=3D "gomod://github.com/golang/groupcache;version=3Dv0.0.0-2020=
0121045136-8c9f03a8e57e;sha256sum=3D5d3a47edd7d97bbaf8685ddb3271fdc9f4790=
134998b39016e5d63eca6d99599"
+SRC_URI +=3D "gomod://github.com/golang/groupcache;version=3Dv0.0.0-2024=
1129210726-2c02b8208cf8;sha256sum=3D163367355442a630b12b0b452892cd98e99fc=
fdf7e40b68d358be73479cc1c23"
+SRC_URI +=3D "gomod://github.com/golang/mock;version=3Dv1.1.1;sha256sum=3D=
636fd21575ebdfbebd53045802a40c780fdab33c6130cea9279346898286f1ca"
+SRC_URI +=3D "gomod://github.com/golang/protobuf;version=3Dv1.2.0;sha256=
sum=3D7574e650f6f12186def8b31b0e8d980ccb88a6a365b99fbf36515f6e7b99fd09"
+SRC_URI +=3D "gomod://github.com/golang/protobuf;version=3Dv1.3.2;sha256=
sum=3Da004ba3acb85e012cb9e468e1d445a81cfeeb4b4db7e9802f30aa500a8341851"
+SRC_URI +=3D "gomod://github.com/golang/protobuf;version=3Dv1.4.0;sha256=
sum=3D718145f374825807a6b98ecb07bc740d6963ea86c34367a5dd82ce9f1fe55228"
+SRC_URI +=3D "gomod://github.com/golang/protobuf;version=3Dv1.4.0-rc.1;s=
ha256sum=3D5768acb1c537e22dc9d19e1694edfe2261d8e271bb7d9ff7c479c6f3bb3c2d=
39"
+SRC_URI +=3D "gomod://github.com/golang/protobuf;version=3Dv1.4.0-rc.2;s=
ha256sum=3D7ac5b5a69daee19aa3e6cd26a0157f17c7fe0d9e16dae84899b2f883a7e1b5=
27"
+SRC_URI +=3D "gomod://github.com/golang/protobuf;version=3Dv1.4.1;sha256=
sum=3Deee338347183b65fba80ed6c594cb9dc4cda41372ea2bbc35ece75c5d347798a"
+SRC_URI +=3D "gomod://github.com/golang/protobuf;version=3Dv1.4.3;sha256=
sum=3D5d4104aa08835547303e79e348f5401e4acf8eb89b257c7bcc59a37a501f4532"
+SRC_URI +=3D "gomod://github.com/golang/protobuf;version=3Dv1.5.4;sha256=
sum=3D9a2f43d3eac8ceda506ebbeb4f229254b87235ce90346692a0e233614182190b"
+SRC_URI +=3D "gomod://github.com/google/certtostore;version=3Dv1.0.6;sha=
256sum=3D3c63648be1e9310760545f27f023889967b638ce095697a71b0d4668adbc5e2e=
"
+SRC_URI +=3D "gomod://github.com/google/deck;version=3Dv0.0.0-2023010422=
1208-105ad94aa8ae;sha256sum=3D2c19caf0916f6fb02b6c7de4de36d70bc60cab8926e=
e66012b6d56a3abd76b6a"
+SRC_URI +=3D "gomod://github.com/google/go-cmp;version=3Dv0.7.0;sha256su=
m=3D64a9ce046f2c320e3783fba0d1f4a15f8a18f0b009b67bf27f7630919db3f539"
+SRC_URI +=3D "gomod://github.com/google/go-cmp;version=3Dv0.2.0;sha256su=
m=3D44649293cf714bcee800c9164ef6dcc7314e9ad98c49bba3da3dfad611edd955"
+SRC_URI +=3D "gomod://github.com/google/go-cmp;version=3Dv0.3.0;sha256su=
m=3D129f65af6e54abc08a9b867ef48e5fb69ef560fa67e540067a8cfaefc6977626"
+SRC_URI +=3D "gomod://github.com/google/go-cmp;version=3Dv0.3.1;sha256su=
m=3D9470974fd55112e338aec4fddba69378fa7ec081082dbbe8116361c296a13dca"
+SRC_URI +=3D "gomod://github.com/google/go-cmp;version=3Dv0.4.0;sha256su=
m=3D01fa1bb1f0e3e27d3685cb0aab442873dbc2abd9ed77ccb99279a3aaf3a09e04"
+SRC_URI +=3D "gomod://github.com/google/go-cmp;version=3Dv0.5.0;sha256su=
m=3Da91fbc1ae431e8b71d420b1e9591ba4bfec3c1d2a8f1d71c3e59b0da29bcfaf4"
+SRC_URI +=3D "gomod://github.com/google/go-cmp;version=3Dv0.5.3;sha256su=
m=3Db79a3e524b930a68cc546a4eb60bbaf586bc3b983eec4cbb462ae135173623a3"
+SRC_URI +=3D "gomod://github.com/google/go-containerregistry;version=3Dv=
0.20.1;sha256sum=3D6a981f24fd52237c4173a10ffffa0bbe28cbba0c3f303e6dd729bc=
8703330782"
+SRC_URI +=3D "gomod://github.com/google/uuid;version=3Dv1.1.2;sha256sum=3D=
5d52fee1f44cf85dbba03f1bd6098a15a131e32c0e45839b352d69aceb7babfc"
+SRC_URI +=3D "gomod://github.com/google/uuid;version=3Dv1.6.0;sha256sum=3D=
d0f02f377217f42702e259684e06441edbf5140dddcc34ba9bea56038b38a6ed"
+SRC_URI +=3D "gomod://github.com/gorilla/mux;version=3Dv1.8.1;sha256sum=3D=
728243623caa67f64e4a0b6c59dde3f762918d9e729266167ba46d8df56c193a"
+SRC_URI +=3D "gomod://github.com/gorilla/websocket;version=3Dv1.5.4-0.20=
250319132907-e064f32e3674;sha256sum=3D81809e9741b37f386c8d28c9c6a23511f4a=
2465fd024a690a4c44a439e32e832"
+SRC_URI +=3D "gomod://github.com/grpc-ecosystem/go-grpc-middleware/provi=
ders/prometheus;version=3Dv1.1.0;sha256sum=3D8a0bfef1332e102be67d5599bd7c=
006bebf5f0823f2a9d11aa5cf22a74dbafb4"
+SRC_URI +=3D "gomod://github.com/grpc-ecosystem/go-grpc-middleware/v2;ve=
rsion=3Dv2.1.0;sha256sum=3D77e8fb88b8089ff917f6d409984c1d90f825d8e3dc996a=
0d68113493e32c96b8"
+SRC_URI +=3D "gomod://github.com/grpc-ecosystem/grpc-gateway/v2;version=3D=
v2.26.1;sha256sum=3D047b0ea3c08a71be099a31c6bb5b3bba01a073d79ebfd9facc5f0=
7bfb5d9a7f6"
+SRC_URI +=3D "gomod://github.com/hashicorp/errwrap;version=3Dv1.1.0;sha2=
56sum=3D209ae99bc039443e28e4d6bb66517d1756d9468b7578d31f1b63a28103d8e18c"
+SRC_URI +=3D "gomod://github.com/inconshreveable/mousetrap;version=3Dv1.=
1.0;sha256sum=3D526674de624d7db108cfe7653ef110ccdfd97bc850262542248155679=
28ed243"
+SRC_URI +=3D "gomod://github.com/intel/goresctrl;version=3Dv0.10.0;sha25=
6sum=3D8e5c0fc4254f765833f451c9b29d808714f5419e049d36f4c8adc1362d6c604f"
+SRC_URI +=3D "gomod://github.com/josephspurrier/goversioninfo;version=3D=
v1.5.0;sha256sum=3D3043f44bbf797c66acac3aebefc2ce11b37a95954c0ffb117e69e9=
ca9566d3b5"
+SRC_URI +=3D "gomod://github.com/json-iterator/go;version=3Dv1.1.12;sha2=
56sum=3Dd001ea57081afd0e378467c8f4a9b6a51259996bb8bb763f78107eaf12f99501"
+SRC_URI +=3D "gomod://github.com/kisielk/errcheck;version=3Dv1.5.0;sha25=
6sum=3De15bd181a3f384da89fed079dc4ec4d1f431fc20db758fdbe4abb38d7ddee06b"
+SRC_URI +=3D "gomod://github.com/kisielk/gotool;version=3Dv1.0.0;sha256s=
um=3D089dbba6e3aa09944fdb40d72acc86694e8bdde01cfc0f40fe0248309eb80a3f"
+SRC_URI +=3D "gomod://github.com/klauspost/compress;version=3Dv1.18.1;sh=
a256sum=3D9f233a4929ef02a58da534cd7c91e170548b90f5a69e221829531e9588e4da2=
3"
+SRC_URI +=3D "gomod://github.com/knqyf263/go-plugin;version=3Dv0.9.0;sha=
256sum=3Def80e801ff7ed5fc5ebf0a78423a39b876fee0d3df6dc69056277eb1238475e0=
"
+SRC_URI +=3D "gomod://github.com/kr/pretty;version=3Dv0.3.1;sha256sum=3D=
ecf5a4af24826c3ad758ce06410ca08e2d58e4d95053be3b9dde2e14852c0cdc"
+SRC_URI +=3D "gomod://github.com/kr/text;version=3Dv0.2.0;sha256sum=3D36=
8eb318f91a5b67be905c47032ab5c31a1d49a97848b1011a0d0a2122b30ba4"
+SRC_URI +=3D "gomod://github.com/lestrrat-go/backoff/v2;version=3Dv2.0.8=
;sha256sum=3Df5ded39eec777b7de879eb04204aa4b322683dabb22137862b09cb464f5b=
c617"
+SRC_URI +=3D "gomod://github.com/lestrrat-go/blackmagic;version=3Dv1.0.2=
;sha256sum=3D2baa5f21e1db4781a11d0ba2fbe8e71323c78875034da61687d80f47ae9c=
78ce"
+SRC_URI +=3D "gomod://github.com/lestrrat-go/httpcc;version=3Dv1.0.1;sha=
256sum=3Dd75132f805ea5cf6275d9af02a5ff3c116ad92ac7fc28e2a22b8fd2e029a3f4c=
"
+SRC_URI +=3D "gomod://github.com/lestrrat-go/iter;version=3Dv1.0.2;sha25=
6sum=3D991bf0aee428fc1a2c01d548e2c7996dc26871dd0b359c062dfc07b1fb137572"
+SRC_URI +=3D "gomod://github.com/lestrrat-go/jwx;version=3Dv1.2.29;sha25=
6sum=3D8c7c4c2b281be17af7ea7bb033383bf972c1064c673a2e7c0de67319eec85d3e"
+SRC_URI +=3D "gomod://github.com/lestrrat-go/option;version=3Dv1.0.1;sha=
256sum=3D3e5614e160680053e07e4970e825e694c2a917741e735ab4d435a396b739ae78=
"
+SRC_URI +=3D "gomod://github.com/linuxkit/virtsock;version=3Dv0.0.0-2020=
1010232012-f8cee7dfc7a3;sha256sum=3De299ce8b7d58f3cc0e375936a80527ea115e2=
eedbf8a9251d90de298db2b5dd3"
+SRC_URI +=3D "gomod://github.com/mattn/go-shellwords;version=3Dv1.0.12;s=
ha256sum=3D6d35c3edc92e47a06988788d683c1ad389719b55ef19d5a7f239ab4708b6da=
11"
+SRC_URI +=3D "gomod://github.com/mdlayher/socket;version=3Dv0.5.1;sha256=
sum=3Df0f07bdd9811f8571c7864cf5e0f06d85cfb3edbb254d6094a31e7f1d427e2a2"
+SRC_URI +=3D "gomod://github.com/mdlayher/vsock;version=3Dv1.2.1;sha256s=
um=3Dcd25f9f33aa4fb945502351caeeed6994e1f34824cc826ca2daa1b21c45bc0d1"
+SRC_URI +=3D "gomod://github.com/miekg/pkcs11;version=3Dv1.1.1;sha256sum=
=3D81cfc2922f7d5c59dc1e688d6247ec8dc35246d646ab27088847a232570c76e6"
+SRC_URI +=3D "gomod://github.com/mistifyio/go-zfs/v3;version=3Dv3.0.1;sh=
a256sum=3D32ad6d8e2b2dbe8cb73a8be96e93eb4947cb23bbdf7328ed7533cbb87495e0f=
8"
+SRC_URI +=3D "gomod://github.com/mitchellh/go-homedir;version=3Dv1.1.0;s=
ha256sum=3Dfffec361fc7e776bb71433560c285ee2982d2c140b8f5bfba0db6033c0ade1=
84"
+SRC_URI +=3D "gomod://github.com/moby/locker;version=3Dv1.0.1;sha256sum=3D=
f07361346d12a24e168db7fb2f21281883bee6060f1aedf7507bccf20c4a793f"
+SRC_URI +=3D "gomod://github.com/moby/spdystream;version=3Dv0.5.0;sha256=
sum=3D0919457a3bba34fb4ee5eff1645830648e26ea9757f27b293f1f7bb9f1ec65a2"
+SRC_URI +=3D "gomod://github.com/moby/sys/capability;version=3Dv0.4.0;sh=
a256sum=3D3502bba106a402fd440d1d4e8eb5ca741da4d70a674e8313725838ec8e22b44=
c"
+SRC_URI +=3D "gomod://github.com/moby/sys/mountinfo;version=3Dv0.7.2;sha=
256sum=3D94f79687bc3b72ca4cc60fafda851454fefc0ef04bdb4499e8c7c2b2e231b5d3=
"
+SRC_URI +=3D "gomod://github.com/moby/sys/sequential;version=3Dv0.6.0;sh=
a256sum=3D7870e47447a7e81a360d5d323bb9d52aaa951cbe70c267bea46b19ff1ed48ba=
b"
+SRC_URI +=3D "gomod://github.com/moby/sys/signal;version=3Dv0.7.1;sha256=
sum=3D8c3853bc4ba4f283f7fccde5c548e93c3613db46f5209394a60cdbbc3eaf4f42"
+SRC_URI +=3D "gomod://github.com/moby/sys/symlink;version=3Dv0.3.0;sha25=
6sum=3Dc0036c97c9b7b7a246468165a968fedd974691161b083f1e7e99bafc58e57451"
+SRC_URI +=3D "gomod://github.com/moby/sys/user;version=3Dv0.4.0;sha256su=
m=3D4b96521752263905b26acd41c982be7bfb73d45243d070707e3cdd57f9fb3a91"
+SRC_URI +=3D "gomod://github.com/moby/sys/userns;version=3Dv0.1.0;sha256=
sum=3D24c102bcc418dedc378fbcaa53b10251b35042f2e86bf088f773250064fe3080"
+SRC_URI +=3D "gomod://github.com/modern-go/concurrent;version=3Dv0.0.0-2=
0180306012644-bacd9c7ef1dd;sha256sum=3D91ef49599bec459869d94ff3dec128871a=
b66bd2dfa61041f1e1169f9b4a8073"
+SRC_URI +=3D "gomod://github.com/modern-go/reflect2;version=3Dv1.0.3-0.2=
0250322232337-35a7c28c31ee;sha256sum=3D49f3fb0f76b1b98b52b5e6e8eab2a48454=
eab33904b937625941c28138a7fea4"
+SRC_URI +=3D "gomod://github.com/munnerz/goautoneg;version=3Dv0.0.0-2019=
1010083416-a7dc8b61c822;sha256sum=3D3d7ce17916779890be02ea6b3dd6345c3c30c=
1df502ad9d8b5b9b310e636afd9"
+SRC_URI +=3D "gomod://github.com/mxk/go-flowrate;version=3Dv0.0.0-201404=
19014527-cca7078d478f;sha256sum=3Dbd0701ef9115469a661c07a3e9c2e572114126e=
b2d098b01eda34ebf62548492"
+SRC_URI +=3D "gomod://github.com/open-policy-agent/opa;version=3Dv0.70.0=
;sha256sum=3D08e535333937b88a21096a8cfabf928513f6565c3b199c662c62e167837e=
71b2"
+SRC_URI +=3D "gomod://github.com/opencontainers/go-digest;version=3Dv1.0=
.0;sha256sum=3D615efb31ff6cd71035b8aa38c3659d8b4da46f3cd92ac807cb50449adf=
e37c86"
+SRC_URI +=3D "gomod://github.com/opencontainers/image-spec;version=3Dv1.=
1.1;sha256sum=3D3a32eeb459719172947c20be78b5b7293c6ea84f4039184e846f6b676=
bc19574"
+SRC_URI +=3D "gomod://github.com/opencontainers/runc;version=3Dv1.2.3;sh=
a256sum=3D534e44408718106ee713bf342e84f782fc9aa00ff0cdfb2372e452ba1c71ca4=
0"
+SRC_URI +=3D "gomod://github.com/opencontainers/runtime-spec;version=3Dv=
1.2.1;sha256sum=3D847dfbbec37aef7d1e14caebacb0ea036ecd22fa84bca96a0da3dfe=
bfc16ef31"
+SRC_URI +=3D "gomod://github.com/opencontainers/runtime-tools;version=3D=
v0.9.1-0.20250523060157-0ea5ed0382a2;sha256sum=3D6128d4734ad019b6e856fc28=
13a05d3b8d94bc7facbd3e324fababc024d756e9"
+SRC_URI +=3D "gomod://github.com/opencontainers/selinux;version=3Dv1.12.=
0;sha256sum=3Ddd7f55f0302d69a221e5db8e80d2c3d4d2c9088d111ebe4074e1fdc5400=
9541a"
+SRC_URI +=3D "gomod://github.com/pelletier/go-toml;version=3Dv1.9.5;sha2=
56sum=3Dde3dcda660cc800cd86d03273a25956d67f416e8fcbe4d2001a2cb4a01e6ac60"
+SRC_URI +=3D "gomod://github.com/pelletier/go-toml/v2;version=3Dv2.2.4;s=
ha256sum=3D82162be7b85077f3be49bfe0f1e01f308b9c9554c72a980a22a34432f94885=
f0"
+SRC_URI +=3D "gomod://github.com/petermattis/goid;version=3Dv0.0.0-20240=
813172612-4fcff4a6cae7;sha256sum=3D3f47ab8e5713c36ec5b4295956a5ef012a192b=
c19198ae1b6591408c061e97ab"
+SRC_URI +=3D "gomod://github.com/pkg/errors;version=3Dv0.9.1;sha256sum=3D=
d4c36b8bcd0616290a3913215e0f53b931bd6e00670596f2960df1b44af2bd07"
+SRC_URI +=3D "gomod://github.com/planetscale/vtprotobuf;version=3Dv0.6.1=
-0.20240319094008-0393e58bdf10;sha256sum=3D6fdbac53c6ace58d732be8ec29c1aa=
e928639eb12960cc4c52a9f7a25395ca05"
+SRC_URI +=3D "gomod://github.com/pmezard/go-difflib;version=3Dv1.0.0;sha=
256sum=3Dde04cecc1a4b8d53e4357051026794bcbc54f2e6a260cfac508ce69d5d6457a0=
"
+SRC_URI +=3D "gomod://github.com/pmezard/go-difflib;version=3Dv1.0.1-0.2=
0181226105442-5d4384ee4fb2;sha256sum=3D24ff45e356f638a53bd0c89fff961fbeae=
cfdb0dc5e482ceed0a2230e0e5f3b7"
+SRC_URI +=3D "gomod://github.com/prometheus/client_golang;version=3Dv1.2=
3.2;sha256sum=3Ddfcc6c52ad09e3d0dca2e9f41de7f8d1c0dde7baae4b867353d112918=
a1511de"
+SRC_URI +=3D "gomod://github.com/prometheus/client_model;version=3Dv0.0.=
0-20190812154241-14fe0d1b01d4;sha256sum=3D5d4719be47f4f69ab5bf36a04c75eb0=
78a0f69b43a335f400c2d688ac9e61795"
+SRC_URI +=3D "gomod://github.com/prometheus/client_model;version=3Dv0.6.=
2;sha256sum=3D67017b19f220c6ab91ecfdd10a93824e2a8b09fcb6390054dbdc49df335=
4a9ca"
+SRC_URI +=3D "gomod://github.com/prometheus/common;version=3Dv0.66.1;sha=
256sum=3D05d9e8e5c289209245dc22a7d07812b1b72472c67f372b5579dfabc3774e17b4=
"
+SRC_URI +=3D "gomod://github.com/prometheus/procfs;version=3Dv0.16.1;sha=
256sum=3De4b74815566cbf5aa372d23e1de32f16ac5c3c4c80bc94a31fdee60a1de6074a=
"
+SRC_URI +=3D "gomod://github.com/rcrowley/go-metrics;version=3Dv0.0.0-20=
200313005456-10cdbea86bc0;sha256sum=3Da5c502a44d80cb5e977e6f0d5a62b12f31a=
fbdefbfc4fb2ea41f1ee412f2c00d"
+SRC_URI +=3D "gomod://github.com/rogpeppe/go-internal;version=3Dv1.13.1;=
sha256sum=3Dcc0746bf67c2d5d536d305db9f7c5cbe8ffa84928fd90262fb447685db0f1=
bc2"
+SRC_URI +=3D "gomod://github.com/russross/blackfriday;version=3Dv1.6.0;s=
ha256sum=3D8dbd018a896577afef870d49adc9a7cbdcef54f6edd97dcbbe1b53e7cd6d66=
d4"
+SRC_URI +=3D "gomod://github.com/russross/blackfriday/v2;version=3Dv2.1.=
0;sha256sum=3D7852750d58a053ce38b01f2c203208817564f552ebf371b2b630081d700=
4c6ae"
+SRC_URI +=3D "gomod://github.com/santhosh-tekuri/jsonschema/v5;version=3D=
v5.3.1;sha256sum=3D6c953c3751cca3003d0e7f6d775c7c3b2e4b1eeb1fa2e8d68786ea=
d53b083094"
+SRC_URI +=3D "gomod://github.com/sasha-s/go-deadlock;version=3Dv0.3.5;sh=
a256sum=3Db927f67dd9a6dc183bac7249c019775e689aee67dc52bfa53354137139d722a=
1"
+SRC_URI +=3D "gomod://github.com/sirupsen/logrus;version=3Dv1.9.3;sha256=
sum=3D4501f4e6b858bfdd997671fcdd2f647a3178b29b6b4d1344caa7c07517121dd0"
+SRC_URI +=3D "gomod://github.com/smallstep/pkcs7;version=3Dv0.1.1;sha256=
sum=3Dbc9cd16c7d8306edc4a7b0ca0d841236e6f9e7481ec6ccc5c460a86468cd7b42"
+SRC_URI +=3D "gomod://github.com/spf13/cobra;version=3Dv1.8.1;sha256sum=3D=
bf27a276f87257c93bc057309df30265a19beefc3d5fc887cbd8fc99ad35466a"
+SRC_URI +=3D "gomod://github.com/spf13/pflag;version=3Dv1.0.6;sha256sum=3D=
d8dac1115c17fa667a93d50f34ddf37648eeb6b92446f429c6120777aa839678"
+SRC_URI +=3D "gomod://github.com/spiffe/go-spiffe/v2;version=3Dv2.5.0;sh=
a256sum=3D3b96ee2cef9a550ec779125216a03225fff44d3d702d51b6ef21e2202d2517d=
6"
+SRC_URI +=3D "gomod://github.com/stefanberger/go-pkcs11uri;version=3Dv0.=
0.0-20230803200340-78284954bff6;sha256sum=3D5c5bca74afcdf246740b246cdf6de=
4244ff25e70f3ca2f31f0c1783e94777bb1"
+SRC_URI +=3D "gomod://github.com/stretchr/objx;version=3Dv0.1.0;sha256su=
m=3D1fa10dab404ed7fc8ed2a033f8784187d5df3513ced3841ce39e46d37850eb1d"
+SRC_URI +=3D "gomod://github.com/stretchr/objx;version=3Dv0.4.0;sha256su=
m=3Dfb5c74373b4385e57e900b2a9ddec7ba1eda2c0d93fab4d307c15097dcaa0765"
+SRC_URI +=3D "gomod://github.com/stretchr/objx;version=3Dv0.5.0;sha256su=
m=3D1a00b3bb5ad41cb72634ace06b7eb7df857404d77a7cab4e401a7c729561fe4c"
+SRC_URI +=3D "gomod://github.com/stretchr/objx;version=3Dv0.5.2;sha256su=
m=3D3c22c1d1c4c4024eb16a12f0187775640bf35d51b0a06649febc7797119451c0"
+SRC_URI +=3D "gomod://github.com/stretchr/testify;version=3Dv1.11.1;sha2=
56sum=3Db7325b561ead5304b72b9f32aebc871ff49b3823667d530a49fd6c8f3adfc96e"
+SRC_URI +=3D "gomod://github.com/stretchr/testify;version=3Dv1.7.0;sha25=
6sum=3D5a46ccebeff510df3e2f6d3842ee79d3f68d0e7b1554cd6ee93390d68b6c6b34"
+SRC_URI +=3D "gomod://github.com/stretchr/testify;version=3Dv1.7.1;sha25=
6sum=3Dd78938d7c60cb8cb6810f7fd5c2f7f7ff62091e483ca3610af69c3920011dc44"
+SRC_URI +=3D "gomod://github.com/stretchr/testify;version=3Dv1.8.0;sha25=
6sum=3Dd880adf449449120b459a2220f539c69648fd797ded5b745cf3add60ec84081e"
+SRC_URI +=3D "gomod://github.com/stretchr/testify;version=3Dv1.8.1;sha25=
6sum=3D36f64e4f229f87672ef8de1c756648c4165e76abd034362517578397e824856c"
+SRC_URI +=3D "gomod://github.com/tchap/go-patricia/v2;version=3Dv2.3.3;s=
ha256sum=3D37591393b0ea113849eacbc292886ea6978798a596164510c5834c2edc3740=
67"
+SRC_URI +=3D "gomod://github.com/tetratelabs/wazero;version=3Dv1.9.0;sha=
256sum=3Dcaa5349be0eeac1d14b0faee72e5a9b2de198374e064fb9158e39d1d891217b7=
"
+SRC_URI +=3D "gomod://github.com/urfave/cli;version=3Dv1.22.15;sha256sum=
=3Dfa4d7be9a9686fa42d94d11d1045d2e5eab9141098fb0020f488cfbcf374dee9"
+SRC_URI +=3D "gomod://github.com/urfave/cli/v2;version=3Dv2.27.7;sha256s=
um=3Da9a4175ab5d550f093f716e8971a5c8539aa738675a210f6321cfb5905f0488a"
+SRC_URI +=3D "gomod://github.com/vbatts/tar-split;version=3Dv0.11.3;sha2=
56sum=3D3a6f0a6ac2e6bc1836ea027062b7a78378c1dec23418dc941a6dab29d39fa968"
+SRC_URI +=3D "gomod://github.com/veraison/go-cose;version=3Dv1.1.0;sha25=
6sum=3Dc4f17015205d03b6b849465102cf154214f1d0484f770043c4c7d25f65f0dbdf"
+SRC_URI +=3D "gomod://github.com/vishvananda/netlink;version=3Dv1.3.1;sh=
a256sum=3D213c83dcc66cbeca2b83eca59d08649fa5ea96f463a8c014e8d6b6d5e601887=
e"
+SRC_URI +=3D "gomod://github.com/vishvananda/netns;version=3Dv0.0.5;sha2=
56sum=3D07804b88c922c2a6780efe392ffef9d126eac584384eb3eb17bcadd34cfa9422"
+SRC_URI +=3D "gomod://github.com/x448/float16;version=3Dv0.8.4;sha256sum=
=3D73b24a41037ea999ab66851e3798a0973dbb1f214925915b01f0820f7b2f1500"
+SRC_URI +=3D "gomod://github.com/xeipuuv/gojsonpointer;version=3Dv0.0.0-=
20190905194746-02993c407bfb;sha256sum=3D11b54f0bc358b09261075c3e15cd14d57=
102f3ab1ba88c345c53eab6aaf228de"
+SRC_URI +=3D "gomod://github.com/xeipuuv/gojsonreference;version=3Dv0.0.=
0-20180127040603-bd5ef7bd5415;sha256sum=3D7ec98f4df894413f4dc58c8df330ca8=
b24ff425b05a8e1074c3028c99f7e45e7"
+SRC_URI +=3D "gomod://github.com/xrash/smetrics;version=3Dv0.0.0-2024052=
1201337-686a1a2994c1;sha256sum=3D6061d9a61e863c9b8a4ed3e34b00d6784dae4ca7=
ec64a0e6f0e5c4bb8574328d"
+SRC_URI +=3D "gomod://github.com/yashtewari/glob-intersection;version=3D=
v0.2.0;sha256sum=3Dbc999bc9a3bcce0ed7c06180320d2236a5c32aa61def5a7c79963f=
aa6bcf2fd0"
+SRC_URI +=3D "gomod://github.com/yuin/goldmark;version=3Dv1.1.27;sha256s=
um=3Ded37f29dd392d8b532daf4e3391a917a2cc21c5a281756f7fcd00c17976c38a7"
+SRC_URI +=3D "gomod://github.com/yuin/goldmark;version=3Dv1.2.1;sha256su=
m=3De07c8cb16aa0b42dc9eaf0f922e25e330af3a39d8e8404c8c6e04bba406aa7b2"
+SRC_URI +=3D "gomod://github.com/zeebo/errs;version=3Dv1.4.0;sha256sum=3D=
5b7fb5cbe6bbd36933e8c98572f85121994e9842aefc90986f8d3a192cb69257"
+SRC_URI +=3D "gomod://go.etcd.io/bbolt;version=3Dv1.4.3;sha256sum=3D3110=
374ed5e6984200e6360b6488312803fb41516fff556b350d2a1abaa5ecb5"
+SRC_URI +=3D "gomod://go.etcd.io/gofail;version=3Dv0.2.0;sha256sum=3D136=
c5e74ee835b126de670d9e462fa83c48d3ca5fa0f4c51fda10ec6995764ec"
+SRC_URI +=3D "gomod://go.opencensus.io;version=3Dv0.24.0;sha256sum=3D203=
a767d7f8e7c1ebe5588220ad168d1e15b14ae70a636de7ca9a4a88a7e0d0c"
+SRC_URI +=3D "gomod://go.opentelemetry.io/auto/sdk;version=3Dv1.1.0;sha2=
56sum=3D006d3a5a7292d11f093ce65fcd5a15d15fb7bd11d0e066503f91bd64c4bffe2c"
+SRC_URI +=3D "gomod://go.opentelemetry.io/contrib/detectors/gcp;version=3D=
v1.36.0;sha256sum=3D67e381df5c7e78edda7b773ebdef6e5dad42486e87eec838329ad=
e6919985119"
+SRC_URI +=3D "gomod://go.opentelemetry.io/contrib/instrumentation/google=
.golang.org/grpc/otelgrpc;version=3Dv0.60.0;sha256sum=3D98e86c034717a2e69=
b5137bfb2a7ee213f5b2220ecb28c42c6effd428eac691d"
+SRC_URI +=3D "gomod://go.opentelemetry.io/contrib/instrumentation/net/ht=
tp/otelhttp;version=3Dv0.60.0;sha256sum=3D0192a852a8c6b4fccd55a0400bda162=
a83a4935102ebdec5fcf56ef1e7d94a51"
+SRC_URI +=3D "gomod://go.opentelemetry.io/otel;version=3Dv1.37.0;sha256s=
um=3D04ca68e693cdb8b4409ef8eec9eaf035128dd78c52275e465d95e1a604b08a61"
+SRC_URI +=3D "gomod://go.opentelemetry.io/otel/exporters/otlp/otlptrace;=
version=3Dv1.35.0;sha256sum=3Ddb519585625f502747d89335029a52f00e028ee6c0e=
05f60563a26f72e4d034b"
+SRC_URI +=3D "gomod://go.opentelemetry.io/otel/exporters/otlp/otlptrace/=
otlptracegrpc;version=3Dv1.35.0;sha256sum=3D2536a755aa735ea360843a9f954da=
3896c1e33dc99c0c4a00f1bd0310fad153c"
+SRC_URI +=3D "gomod://go.opentelemetry.io/otel/exporters/otlp/otlptrace/=
otlptracehttp;version=3Dv1.35.0;sha256sum=3D531ae83045ba11e395b87a36d4d2a=
8c5672557e4b400ce9226614c70dbcedc09"
+SRC_URI +=3D "gomod://go.opentelemetry.io/otel/metric;version=3Dv1.37.0;=
sha256sum=3D9ddd1ea623ee64d23c269590b7b6df7d369b43388bc495d5c4343a939f4a2=
9bd"
+SRC_URI +=3D "gomod://go.opentelemetry.io/otel/sdk;version=3Dv1.37.0;sha=
256sum=3D268f0baa1e9855633a0ace9ea3e95e1cb4c545f51062a4581586f54b1712c853=
"
+SRC_URI +=3D "gomod://go.opentelemetry.io/otel/sdk/metric;version=3Dv1.3=
7.0;sha256sum=3D0c0bad1feb6d7a611d5277537d0db736478a39282b1cd1d2b904a856a=
ba99079"
+SRC_URI +=3D "gomod://go.opentelemetry.io/otel/trace;version=3Dv1.37.0;s=
ha256sum=3D1b473d9aee628902b4597925e282f8db8ebf123f70a76b8fc7939592132b02=
86"
+SRC_URI +=3D "gomod://go.opentelemetry.io/proto/otlp;version=3Dv1.5.0;sh=
a256sum=3Def551fb4e54a41f7e58c7f451c8546b6dd7ac298a632e7c31ca12100e852324=
e"
+SRC_URI +=3D "gomod://go.uber.org/goleak;version=3Dv1.3.0;sha256sum=3D70=
edef0ce7d830d992f024e527fd3452069b884f94a27787a718bd68dd620702"
+SRC_URI +=3D "gomod://go.uber.org/mock;version=3Dv0.5.0;sha256sum=3D2ac4=
83710c9e6641baf6c9a4d692912d36967a5ebf1e38d47340507d4b882345"
+SRC_URI +=3D "gomod://go.yaml.in/yaml/v2;version=3Dv2.4.2;sha256sum=3Ded=
63e181cbb5a991c104639b0e6d48d45fd951f22b47d4c5d1a36156d8ed06ee"
+SRC_URI +=3D "gomod://golang.org/x/crypto;version=3Dv0.41.0;sha256sum=3D=
7da981b09d79d021f79ea2953637a85e3c72e43fc88b6a3230e7976fbbeec2de"
+SRC_URI +=3D "gomod://golang.org/x/exp;version=3Dv0.0.0-20241108190413-2=
d47ceb2692f;sha256sum=3D7d91ad19149e6a15a46ec3bd52d2e57e9392397135aff1d38=
2c9ca6b80b2038d"
+SRC_URI +=3D "gomod://golang.org/x/lint;version=3Dv0.0.0-20190313153728-=
d0100b6bd8b3;sha256sum=3D5c7bb9792bdc4ec4cf1af525cf9998f8a958daf6495852c9=
a7dbb71738f2f10a"
+SRC_URI +=3D "gomod://golang.org/x/mod;version=3Dv0.29.0;sha256sum=3D7c7=
36672c72aa571b65c1106bbb2a64e587dd4265a18f0059c990f95c5117962"
+SRC_URI +=3D "gomod://golang.org/x/mod;version=3Dv0.2.0;sha256sum=3D0903=
f5c7fceebffde791f39210a210fab59d8d0b8c7f4c492793549a846552f5"
+SRC_URI +=3D "gomod://golang.org/x/mod;version=3Dv0.3.0;sha256sum=3D0b12=
5ae21eba0eec0d857cd0641d9fc7f07168575f062c0e1df1bac02bec044f"
+SRC_URI +=3D "gomod://golang.org/x/net;version=3Dv0.43.0;sha256sum=3D24d=
4f49b7e781763942533d5a5acc49ebd054e05c50bf4402b264695ef8d10c5"
+SRC_URI +=3D "gomod://golang.org/x/net;version=3Dv0.0.0-20180724234803-3=
673e40ba225;sha256sum=3D3deab917e990147cf32de48186783997890c75eefc209e85d=
f515d83c3408253"
+SRC_URI +=3D "gomod://golang.org/x/net;version=3Dv0.0.0-20180826012351-8=
a410e7b638d;sha256sum=3D0015e0b5e124847e5d2ce892c8772eee5f6da51c0e0939c25=
874c6381c725aca"
+SRC_URI +=3D "gomod://golang.org/x/net;version=3Dv0.0.0-20190213061140-3=
a22650c66bd;sha256sum=3D6722d233d5a04aebfa439e4d701c6c993b636e84376229c9a=
c226d913367a643"
+SRC_URI +=3D "gomod://golang.org/x/net;version=3Dv0.0.0-20190311183353-d=
8887717615a;sha256sum=3Dcb722f1469739a62f6b3cd0cf836894d714bbfcd278740499=
fea8a343401efae"
+SRC_URI +=3D "gomod://golang.org/x/net;version=3Dv0.0.0-20190404232315-e=
b5bcb51f2a3;sha256sum=3D3be13704bcdb3eb79a25459f6116bd627bc90589176a9c849=
5b58a38c320ec0f"
+SRC_URI +=3D "gomod://golang.org/x/net;version=3Dv0.0.0-20190620200207-3=
b0461eec859;sha256sum=3D8b437b88ece68e61336150fbdd2a4c0e8d80f143bcdc86ce4=
ef047c4c93f3caa"
+SRC_URI +=3D "gomod://golang.org/x/net;version=3Dv0.0.0-20200226121028-0=
de0cce0169b;sha256sum=3Dcf00229a0ab910e519d829fd9192aa77e7e7a486d06ba2311=
f681965001589dd"
+SRC_URI +=3D "gomod://golang.org/x/net;version=3Dv0.0.0-20201021035429-f=
5854403a974;sha256sum=3D079b484fd6bef7305d6ca5a2e0b86869042459c6b18535873=
015f193380a4b18"
+SRC_URI +=3D "gomod://golang.org/x/net;version=3Dv0.0.0-20201110031124-6=
9a78807bb2b;sha256sum=3De677156c98b7cd691d93e2e39382a058cf1ed780c7792d3d7=
8f2e891ee910385"
+SRC_URI +=3D "gomod://golang.org/x/oauth2;version=3Dv0.30.0;sha256sum=3D=
1e1028d0b190948f0cd44229bfa298440cb2481f601f992e12424bc6fa1f183c"
+SRC_URI +=3D "gomod://golang.org/x/oauth2;version=3Dv0.0.0-2018082121233=
3-d2e6202438be;sha256sum=3D6f7ae824c20cd42f73198677c583303e75d9d307680a30=
5d06ace2165106088e"
+SRC_URI +=3D "gomod://golang.org/x/sync;version=3Dv0.17.0;sha256sum=3Dc5=
dcfd32e223edc7a003a51a166a81759a4beccb9a91eb85385b4d67a1c820c6"
+SRC_URI +=3D "gomod://golang.org/x/sync;version=3Dv0.0.0-20180314180146-=
1d60e4601c6f;sha256sum=3D7aa0e816b3ecae3535411b3ca9ea6a46530a9da2e6d160a4=
20da331e55e159ba"
+SRC_URI +=3D "gomod://golang.org/x/sync;version=3Dv0.0.0-20181108010431-=
42b317875d0f;sha256sum=3Dd5076321ff392792568bb8ec9e582778a602aeebf3d27c6a=
b99f148ead0bf1b3"
+SRC_URI +=3D "gomod://golang.org/x/sync;version=3Dv0.0.0-20190423024810-=
112230192c58;sha256sum=3Ddc105c2b4d6c7ab48e54946ce2f624e8d1f5d47270eff1e8=
8fed06cc65f91fb4"
+SRC_URI +=3D "gomod://golang.org/x/sync;version=3Dv0.0.0-20190911185100-=
cd5d95a43a6e;sha256sum=3D9c63fe51b0c533b258d3acc30d9319fe78679ce1a051109c=
9dea3105b93e2eef"
+SRC_URI +=3D "gomod://golang.org/x/sync;version=3Dv0.0.0-20201020160332-=
67f06af15bc9;sha256sum=3Da62c30f9e46c28636239041d7bfa1583a24378bc408554ec=
0670196cbac9858e"
+SRC_URI +=3D "gomod://golang.org/x/sys;version=3Dv0.37.0;sha256sum=3D6c8=
7bb94ec328b6d6234ad02cf2813225fe3bd5f8929fe85775ca06e01cfcc78"
+SRC_URI +=3D "gomod://golang.org/x/sys;version=3Dv0.0.0-20180830151530-4=
9385e6e1522;sha256sum=3Db7963549a36b5cf8eff7849afb9a85ff1957b4dd66d60628b=
26457e1b230d8d2"
+SRC_URI +=3D "gomod://golang.org/x/sys;version=3Dv0.0.0-20190215142949-d=
0b11bdaac8a;sha256sum=3Dd6bf74e7bc64e245a75dd666e62160a8446242b1cde4e66b2=
e5f93399950a97f"
+SRC_URI +=3D "gomod://golang.org/x/sys;version=3Dv0.0.0-20190412213103-9=
7732733099d;sha256sum=3D4c8da803e35ab98f8621b26998717976415c9ccd17ada7183=
933974be40c7edb"
+SRC_URI +=3D "gomod://golang.org/x/sys;version=3Dv0.0.0-20200930185726-f=
dedc70b468f;sha256sum=3D8f2ee97b1515c27788a17a8e9f88c9d1a4aa62380a1d9a210=
a53460a8503c00d"
+SRC_URI +=3D "gomod://golang.org/x/sys;version=3Dv0.0.0-20220715151400-c=
0bba94af5f8;sha256sum=3D3b180937216e93559f16b6076d09baf54a5707378f11b867b=
6eb914c56b09b91"
+SRC_URI +=3D "gomod://golang.org/x/term;version=3Dv0.34.0;sha256sum=3D22=
281cbf30560433d57de8d72c1151f9cac2917795dc6e9f694f7a525bb5309c"
+SRC_URI +=3D "gomod://golang.org/x/text;version=3Dv0.28.0;sha256sum=3D46=
259e1416ae7ec6adf1867c5f9fab32af0476a148e3c95f1dfbb134f4acf48d"
+SRC_URI +=3D "gomod://golang.org/x/text;version=3Dv0.3.0;sha256sum=3Dea3=
068395503d3c7ef8ce16a286f75c8c93882c25a66c2aa6c8e2ad4da7a9ae0"
+SRC_URI +=3D "gomod://golang.org/x/text;version=3Dv0.3.3;sha256sum=3D8a8=
96da346baf94ab4f24b0e396df0b79393c93aa05c50ef07cddd561a1ff8d7"
+SRC_URI +=3D "gomod://golang.org/x/time;version=3Dv0.14.0;sha256sum=3D0e=
2d2e47d107859130c7088346966d99a14ec0f7a42290c4acc0e2cc568e7a81"
+SRC_URI +=3D "gomod://golang.org/x/tools;version=3Dv0.35.0;sha256sum=3D6=
d2391d8a9a89e54c79cdeaf5e776dfc079838c90c3ac49e97fd91cf20606e9a"
+SRC_URI +=3D "gomod://golang.org/x/tools;version=3Dv0.0.0-20180917221912=
-90fa682c2a6e;sha256sum=3D6673fe06662fcbee5f246f12af8ed860328bf08fd016fd4=
90987cd76acb1b4fe"
+SRC_URI +=3D "gomod://golang.org/x/tools;version=3Dv0.0.0-20190114222345=
-bf090417da8b;sha256sum=3D632297964704bdd84ad4a55d64037dab44c9f6389d63831=
7e4372a4d34ff3e61"
+SRC_URI +=3D "gomod://golang.org/x/tools;version=3Dv0.0.0-20190226205152=
-f727befe758c;sha256sum=3D98396254d01f2afb7a0403fe1cf1f9aab5623d39a9f7a13=
5e323ad15d6cdf8ec"
+SRC_URI +=3D "gomod://golang.org/x/tools;version=3Dv0.0.0-20190311212946=
-11955173bddd;sha256sum=3Df8bd32c243e3403de6a54cac944fa96e20d411af308159a=
a682c2848100bbf09"
+SRC_URI +=3D "gomod://golang.org/x/tools;version=3Dv0.0.0-20190524140312=
-2c0ae7006135;sha256sum=3D86687e8cd5adccf8809ba031e59146d0c89047b6267aacc=
785ffc20b0ce6b735"
+SRC_URI +=3D "gomod://golang.org/x/tools;version=3Dv0.0.0-20191119224855=
-298f0cb1881e;sha256sum=3D092e06323d7a55880ee4387905ebf35a021fffdf2b7f72d=
80fb3c36e48668651"
+SRC_URI +=3D "gomod://golang.org/x/tools;version=3Dv0.0.0-20200619180055=
-7c47624df98f;sha256sum=3D9d537dcdb68b2c06db15a0e712b2c52ed1a57555cb64260=
8da891164f33f3fe4"
+SRC_URI +=3D "gomod://golang.org/x/tools;version=3Dv0.0.0-20210106214847=
-113979e3529a;sha256sum=3D8baa1d9f9ac7455f2070cd542bbd3a6eeab6e8c9028a1b8=
3905e9b47712f08d1"
+SRC_URI +=3D "gomod://golang.org/x/xerrors;version=3Dv0.0.0-202008041841=
01-5ec99f83aff1;sha256sum=3D380aaa3368ae165628bb487cf4e695a55c1420072b8b7=
a6f59c122f6a23bb255"
+SRC_URI +=3D "gomod://golang.org/x/xerrors;version=3Dv0.0.0-201907171851=
22-a985d3407aa7;sha256sum=3Dc4e9f063cfed546c90f00a9657deac4f915a8994f8cbe=
6dbd3f18e79eb8302cf"
+SRC_URI +=3D "gomod://golang.org/x/xerrors;version=3Dv0.0.0-201910111414=
10-1b5146add898;sha256sum=3D5059c7b7e95f139b8c42d9001972fa5fa688b3581ef94=
6c912c1dbc52415ff16"
+SRC_URI +=3D "gomod://golang.org/x/xerrors;version=3Dv0.0.0-201912041905=
36-9bdfabe68543;sha256sum=3Da93010abd3c4f483710c37fb87511a776942f709b4c18=
20a28d099d448680390"
+SRC_URI +=3D "gomod://gonum.org/v1/gonum;version=3Dv0.16.0;sha256sum=3De=
e1800f8323d1edd76d6864d67a5d00c79f9a3d56afea46f6a3e7f1328e5d790"
+SRC_URI +=3D "gomod://google.golang.org/appengine;version=3Dv1.1.0;sha25=
6sum=3De7f626f7992b73bb83a9464b86a7689878198b2b3bc0ee6d04bd64c4138e3753"
+SRC_URI +=3D "gomod://google.golang.org/appengine;version=3Dv1.4.0;sha25=
6sum=3Dd4dba839844a92bd9355812a53f086ff3301aa8f59b29a3e2f799d27be8db71f"
+SRC_URI +=3D "gomod://google.golang.org/genproto;version=3Dv0.0.0-201808=
17151627-c66870c02cf8;sha256sum=3D46c86d623a6699bf5787e01d225e890a38224d7=
49df4e0444872eedfd49b0d4f"
+SRC_URI +=3D "gomod://google.golang.org/genproto;version=3Dv0.0.0-201908=
19201941-24fa4b261c55;sha256sum=3D5c9553dc489088d74b494857a6f7aad4db33c16=
8bb818345234d2e62b77561a7"
+SRC_URI +=3D "gomod://google.golang.org/genproto;version=3Dv0.0.0-202005=
26211855-cb27e3aa2013;sha256sum=3D50336913c7325576ed9c3587fdcacd39094013a=
f95c8c11736f335969136527d"
+SRC_URI +=3D "gomod://google.golang.org/genproto/googleapis/api;version=3D=
v0.0.0-20250804133106-a7a43d27e69b;sha256sum=3D5429c5df2c69f6839c67bbb1b6=
9a39da7f18f62766ba9e5e77ee73656753b4d4"
+SRC_URI +=3D "gomod://google.golang.org/genproto/googleapis/rpc;version=3D=
v0.0.0-20250804133106-a7a43d27e69b;sha256sum=3D2c36a97cf38030423215c35a30=
d22f084a300f51273817fd222b9c0c04fabb49"
+SRC_URI +=3D "gomod://google.golang.org/grpc;version=3Dv1.76.0;sha256sum=
=3Db32b6055dfc7a8f8fa2be55104931dc3012ba4e564623cf7c74ac911e264513c"
+SRC_URI +=3D "gomod://google.golang.org/grpc;version=3Dv1.19.0;sha256sum=
=3Db13e2bd92390136a39391460fa55526aadce985cd4a949bd8417b50035e18bba"
+SRC_URI +=3D "gomod://google.golang.org/grpc;version=3Dv1.23.0;sha256sum=
=3D78fe066557a014f328f695df561a0f026b9c8fa704be8bc5d424409f3bc89064"
+SRC_URI +=3D "gomod://google.golang.org/grpc;version=3Dv1.25.1;sha256sum=
=3D25a1d2be6469855d2837ee785850e458a4ff2aad85946c32731533968158472b"
+SRC_URI +=3D "gomod://google.golang.org/grpc;version=3Dv1.27.0;sha256sum=
=3D25cc1b8e154b7f68bc51d5ab79cf52fd210bfecb71b71a856c2fe4b4213d40ca"
+SRC_URI +=3D "gomod://google.golang.org/grpc;version=3Dv1.33.2;sha256sum=
=3D9911e6cc53e6a5925dac467c6c27920ed0d7150c3fa07f6a9c4a6736c2fc2b4c"
+SRC_URI +=3D "gomod://google.golang.org/grpc/cmd/protoc-gen-go-grpc;vers=
ion=3Dv1.5.1;sha256sum=3D997320e3e21562ef67d72888c0b1506d1c2a0255baac7227=
a9b191a15627a8b2"
+SRC_URI +=3D "gomod://google.golang.org/protobuf;version=3Dv1.36.10;sha2=
56sum=3D9265fbe7d073ca8571f1a9c4b8e8f20b244c35ad913346892d688e58fe4b1f22"
+SRC_URI +=3D "gomod://google.golang.org/protobuf;version=3Dv0.0.0-202001=
09180630-ec00e32a8dfd;sha256sum=3D8c4b0bb3b48bcf679da429e3e33474ff66168ac=
40ef22ceca786069c2b17537b"
+SRC_URI +=3D "gomod://google.golang.org/protobuf;version=3Dv0.0.0-202002=
21191635-4d8936d0db64;sha256sum=3Dec9cdd4f84e2a5c89a40bee563e1d116efce353=
1eb13cf639f26636540d5b96b"
+SRC_URI +=3D "gomod://google.golang.org/protobuf;version=3Dv0.0.0-202002=
28230310-ab0ca4ff8a60;sha256sum=3D43e210e17c195c7f993d49d0e061d53fe5cbe52=
23bab9ca1428e0a93e41e1999"
+SRC_URI +=3D "gomod://google.golang.org/protobuf;version=3Dv1.20.1-0.202=
00309200217-e05f789c0967;sha256sum=3D14485d268826098c97386a1c21a0a80ae05e=
efccc2f2667bb1b8cc5df9ded968"
+SRC_URI +=3D "gomod://google.golang.org/protobuf;version=3Dv1.21.0;sha25=
6sum=3Dbd723a12fa1c78ef3c75965fa8211460c25253ef0cb491295748a71c865efc85"
+SRC_URI +=3D "gomod://google.golang.org/protobuf;version=3Dv1.22.0;sha25=
6sum=3D52757d6a9b7b8b2006668030846f69cfa39241cc4ec4991c57e6266c9949a239"
+SRC_URI +=3D "gomod://google.golang.org/protobuf;version=3Dv1.23.0;sha25=
6sum=3Dfc6051d85af8d7551d2160d76db30ff66e1bc9f520d4df6d9484e266ddf6d4f0"
+SRC_URI +=3D "gomod://google.golang.org/protobuf;version=3Dv1.23.1-0.202=
00526195155-81db48ad09cc;sha256sum=3D0874d821bddd32dc00a540cbcfec67a058c6=
a8aae8da723d3e51baad726030ea"
+SRC_URI +=3D "gomod://google.golang.org/protobuf;version=3Dv1.25.0;sha25=
6sum=3D204f72cf4d80eaf1892d4b4fe4e34dc9db283eb8fdb36902f871bf3eaa29aff9"
+SRC_URI +=3D "gomod://gopkg.in/check.v1;version=3Dv0.0.0-20161208181325-=
20d25e280405;sha256sum=3D4e1817f964ca34e545b81afda0325a5e89cf58de2e413d82=
07c0afddd0fdc15c"
+SRC_URI +=3D "gomod://gopkg.in/check.v1;version=3Dv1.0.0-20201130134442-=
10cb98267c6c;sha256sum=3Df555684e5c5dacc2850dddb345fef1b8f93f546b72685589=
789da6d2b062710e"
+SRC_URI +=3D "gomod://gopkg.in/inf.v0;version=3Dv0.9.1;sha256sum=3D08aba=
c18c95cc43b725d4925f63309398d618beab68b4669659b61255e5374a0"
+SRC_URI +=3D "gomod://gopkg.in/yaml.v3;version=3Dv3.0.0-20200313102051-9=
f266ea9e77c;sha256sum=3Dacf19ccb4fca983b234a39ef032faf9ab70e759680673bb3d=
ff077e77fee20fe"
+SRC_URI +=3D "gomod://gopkg.in/yaml.v3;version=3Dv3.0.1;sha256sum=3Daab8=
fbc4e6300ea08e6afe1caea18a21c90c79f489f52c53e2f20431f1a9a015"
+SRC_URI +=3D "gomod://honnef.co/go/tools;version=3Dv0.0.0-20190523083050=
-ea95bdfd59fc;sha256sum=3Deeaa82700e96ac5e803d7a9c32363332504beff8fbb1202=
492b4d43d5a5e7360"
+SRC_URI +=3D "gomod://honnef.co/go/tools;version=3Dv0.0.0-20190102054323=
-c2f93a96b099;sha256sum=3D9860f8a4cb535ae4ebdec509422f4f1c543b540104464bb=
4873d9e02e80d8c54"
+SRC_URI +=3D "gomod://k8s.io/cri-api;version=3Dv0.34.1;sha256sum=3D575f0=
4bf04c09e2f1442a881113536a4411066a1cfd075751f77826603ec00ef"
+SRC_URI +=3D "gomod://k8s.io/klog/v2;version=3Dv2.130.1;sha256sum=3D262b=
961175bbe8cf6ecf227d06303df2eb47bfb890e19d516846422f7d406cb9"
+SRC_URI +=3D "gomod://k8s.io/utils;version=3Dv0.0.0-20250604170112-4c0f3=
b243397;sha256sum=3D3687c33444d57ee4b35e7e7e6baa2627096057dd4d2819a82ac73=
d3823bced28"
+SRC_URI +=3D "gomod://sigs.k8s.io/json;version=3Dv0.0.0-20241014173422-c=
fa47c3a1cc8;sha256sum=3D4a5cb30c1b7406bd9684b3dbe118308cb565ba57157f7242b=
06a4815fbc24ed7"
+SRC_URI +=3D "gomod://sigs.k8s.io/randfill;version=3Dv1.0.0;sha256sum=3D=
31dbbfc44ce12f78f1b68d6bbeed8526aa73c53243353d44d50b2532c828f5f1"
+SRC_URI +=3D "gomod://sigs.k8s.io/structured-merge-diff/v6;version=3Dv6.=
3.0;sha256sum=3Dbcb0e662e31cfbd06b4cb52eb59eef6f0da101bce5aedca7dbce1f78c=
34d637a"
+SRC_URI +=3D "gomod://sigs.k8s.io/yaml;version=3Dv1.6.0;sha256sum=3Dcf88=
648a471581817b00a42ee8d24fd73eb0e3503998cf46d8e63787e11e5052"
+SRC_URI +=3D "gomod://tags.cncf.io/container-device-interface;version=3D=
v1.0.1;sha256sum=3D7fa76151f62f9afe72b5fe8caa6e0d1b2bbede65047d1c9080957f=
858eb88d32"
+SRC_URI +=3D "gomod://tags.cncf.io/container-device-interface/specs-go;v=
ersion=3Dv1.0.0;sha256sum=3D61d634151ae879323697dc8ae58de4a7514131758815c=
15547b787c22be9ff64"
diff --git a/recipes-containers/fuse-overlayfs-snapshotter/go-mod-license=
s.inc b/recipes-containers/fuse-overlayfs-snapshotter/go-mod-licenses.inc
new file mode 100644
index 000000000000..341ebff1192b
--- /dev/null
+++ b/recipes-containers/fuse-overlayfs-snapshotter/go-mod-licenses.inc
@@ -0,0 +1,50 @@
+# Generated by oe-go-mod-fetcher.py v3.0.0
+#
+# Do not modify by hand. Regenerate with:
+#   bitbake <recipe> -c discover_and_generate
+
+LICENSE +=3D "AND Apache-2.0 AND MIT"
+
+LIC_FILES_CHKSUM +=3D "\
+    file://pkg/mod/github.com/containerd/btrfs/v2@v2.0.0/LICENSE;md5=3De=
3fc50a88d0a364313df4b21ef20c29e;spdx=3DApache-2.0 \
+    file://pkg/mod/github.com/containerd/cgroups/v3@v3.1.0/LICENSE;md5=3D=
86d3f3a95c324c9479bd8986968f4327;spdx=3DApache-2.0 \
+    file://pkg/mod/github.com/containerd/console@v1.0.5/LICENSE;md5=3D12=
69f40c0d099c21a871163984590d89;spdx=3DUnknown \
+    file://pkg/mod/github.com/containerd/containerd/api@v1.10.0/LICENSE;=
md5=3D1269f40c0d099c21a871163984590d89;spdx=3DUnknown \
+    file://pkg/mod/github.com/containerd/containerd/v2@v2.2.0/LICENSE;md=
5=3D1269f40c0d099c21a871163984590d89;spdx=3DUnknown \
+    file://pkg/mod/github.com/containerd/continuity@v0.4.5/LICENSE;md5=3D=
1269f40c0d099c21a871163984590d89;spdx=3DUnknown \
+    file://pkg/mod/github.com/containerd/errdefs/pkg@v0.3.0/LICENSE;md5=3D=
1269f40c0d099c21a871163984590d89;spdx=3DUnknown \
+    file://pkg/mod/github.com/containerd/errdefs@v1.0.0/LICENSE;md5=3D12=
69f40c0d099c21a871163984590d89;spdx=3DUnknown \
+    file://pkg/mod/github.com/containerd/fifo@v1.1.0/LICENSE;md5=3D86d3f=
3a95c324c9479bd8986968f4327;spdx=3DApache-2.0 \
+    file://pkg/mod/github.com/containerd/go-cni@v1.1.13/LICENSE;md5=3D86=
d3f3a95c324c9479bd8986968f4327;spdx=3DApache-2.0 \
+    file://pkg/mod/github.com/containerd/go-runc@v1.1.0/LICENSE;md5=3D86=
d3f3a95c324c9479bd8986968f4327;spdx=3DApache-2.0 \
+    file://pkg/mod/github.com/containerd/imgcrypt/v2@v2.0.1/LICENSE;md5=3D=
1269f40c0d099c21a871163984590d89;spdx=3DUnknown \
+    file://pkg/mod/github.com/containerd/log@v0.1.0/LICENSE;md5=3D1269f4=
0c0d099c21a871163984590d89;spdx=3DUnknown \
+    file://pkg/mod/github.com/containerd/nri@v0.10.0/LICENSE;md5=3D86d3f=
3a95c324c9479bd8986968f4327;spdx=3DApache-2.0 \
+    file://pkg/mod/github.com/containerd/otelttrpc@v0.1.0/LICENSE;md5=3D=
86d3f3a95c324c9479bd8986968f4327;spdx=3DApache-2.0 \
+    file://pkg/mod/github.com/containerd/platforms@v1.0.0-rc.2/LICENSE;m=
d5=3D1269f40c0d099c21a871163984590d89;spdx=3DUnknown \
+    file://pkg/mod/github.com/containerd/plugin@v1.0.0/LICENSE;md5=3D126=
9f40c0d099c21a871163984590d89;spdx=3DUnknown \
+    file://pkg/mod/github.com/containerd/protobuild@v0.3.0/LICENSE;md5=3D=
e3fc50a88d0a364313df4b21ef20c29e;spdx=3DApache-2.0 \
+    file://pkg/mod/github.com/containerd/stargz-snapshotter/estargz@v0.1=
4.3/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0 \
+    file://pkg/mod/github.com/containerd/ttrpc@v1.2.7/LICENSE;md5=3D86d3=
f3a95c324c9479bd8986968f4327;spdx=3DApache-2.0 \
+    file://pkg/mod/github.com/containerd/typeurl/v2@v2.2.3/LICENSE;md5=3D=
1269f40c0d099c21a871163984590d89;spdx=3DUnknown \
+    file://pkg/mod/github.com/containerd/zfs/v2@v2.0.0-rc.0/LICENSE;md5=3D=
3b83ef96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0 \
+    file://pkg/mod/github.com/coreos/go-systemd/v22@v22.6.0/LICENSE;md5=3D=
19cbd64715b51267a47bf3750cc6a8a5;spdx=3DUnknown \
+    file://pkg/mod/github.com/gogo/protobuf@v1.3.2/LICENSE;md5=3D38be95f=
95200434dc208e2ee3dab5081;spdx=3DUnknown \
+    file://pkg/mod/github.com/google/go-cmp@v0.7.0/LICENSE;md5=3D4ac66f7=
dea41d8d116cb7fb28aeff2ab;spdx=3DUnknown \
+    file://pkg/mod/github.com/moby/sys/mountinfo@v0.7.2/LICENSE;md5=3D3b=
83ef96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0 \
+    file://pkg/mod/github.com/moby/sys/userns@v0.1.0/LICENSE;md5=3D3b83e=
f96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0 \
+    file://pkg/mod/github.com/opencontainers/go-digest@v1.0.0/LICENSE;md=
5=3D2d6fc0e85c3f118af64c85a78d56d3cf;spdx=3DUnknown \
+    file://pkg/mod/github.com/opencontainers/image-spec@v1.1.1/LICENSE;m=
d5=3D27ef03aa2da6e424307f102e8b42621d;spdx=3DUnknown \
+    file://pkg/mod/github.com/sirupsen/logrus@v1.9.3/LICENSE;md5=3D8dadf=
ef729c08ec4e631c4f6fc5d43a0;spdx=3DMIT \
+    file://pkg/mod/go.etcd.io/bbolt@v1.4.3/LICENSE;md5=3D13b2a308eefa10d=
841e3bf2467dbe07a;spdx=3DMIT \
+    file://pkg/mod/golang.org/x/net@v0.43.0/LICENSE;md5=3D7998cb338f82d1=
5c0eff93b7004d272a;spdx=3DUnknown \
+    file://pkg/mod/golang.org/x/sync@v0.17.0/LICENSE;md5=3D7998cb338f82d=
15c0eff93b7004d272a;spdx=3DUnknown \
+    file://pkg/mod/golang.org/x/sys@v0.37.0/LICENSE;md5=3D7998cb338f82d1=
5c0eff93b7004d272a;spdx=3DUnknown \
+    file://pkg/mod/golang.org/x/text@v0.28.0/LICENSE;md5=3D7998cb338f82d=
15c0eff93b7004d272a;spdx=3DUnknown \
+    file://pkg/mod/google.golang.org/genproto/googleapis/rpc@v0.0.0-2025=
0804133106-a7a43d27e69b/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57;sp=
dx=3DApache-2.0 \
+    file://pkg/mod/google.golang.org/grpc@v1.76.0/LICENSE;md5=3D3b83ef96=
387f14655fc854ddc3c6bd57;spdx=3DApache-2.0 \
+    file://pkg/mod/google.golang.org/protobuf@v1.36.10/LICENSE;md5=3D02d=
4002e9171d41a8fad93aa7faf3956;spdx=3DUnknown \
+    file://pkg/mod/k8s.io/api@v0.34.1/LICENSE;md5=3D3b83ef96387f14655fc8=
54ddc3c6bd57;spdx=3DApache-2.0 \
+    file://pkg/mod/k8s.io/apimachinery@v0.34.1/LICENSE;md5=3D3b83ef96387=
f14655fc854ddc3c6bd57;spdx=3DApache-2.0 \
+    file://pkg/mod/k8s.io/client-go@v0.34.1/LICENSE;md5=3D3b83ef96387f14=
655fc854ddc3c6bd57;spdx=3DApache-2.0 \
+"
--=20
2.55.0


