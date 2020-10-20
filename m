Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web09.4298.1603192486356812128
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 20 Oct 2020 04:14:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com header.s=axis-central1 header.b=jZpBYHKr;
 spf=fail (domain: axis.com, ip: 198.145.29.25, mailfrom: joakim.roubert@axis.com)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
	by mail.yoctoproject.org (Postfix) with ESMTPS id C86D738C06E0
	for <meta-virtualization@yoctoproject.org>; Tue, 20 Oct 2020 04:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=12601; q=dns/txt; s=axis-central1;
  t=1603192485; x=1634728485;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5uxsZSVcJIE6hEqZJvP/IwrknexlK3u7DeMcc6Qw5SU=;
  b=jZpBYHKrxuyUsOCYNGmIixcicHrCfNWbXKo2PZSXaz5V5ndnSd7WxPyC
   zYTc0Efa0YoZDuGHF4XfbgzgwCvjFGPyZgcwlXCTnrPGaZd3IbULMdUAs
   pUNp177U0XePJn2nSfAsV47cpfp50oXu5yEbY6hNkd9O1sveKGSENRe0w
   0IQ2T3JAa2nQ4x3OVaYIg3UbKqR4Oeqf1ikqvnC+Y3/dqzOjxq04pG/NU
   douE9jU8vBZvSPlHfu/H5XCfaIos+h9a4uJkjSNOsAE4kEOMmEcSmbzkf
   ZrCf6HwVe3GAU6UF2w7CT7pOpvFsPy/0MJ//z/Ew03P5b4UH9z5Tsw/kl
   Q==;
IronPort-SDR: ssK8ahGWGjDKuD2FaFVQsfyJ9aRNjgO6r0zv4TN88sdjZwuSl9zOGOf0iAQoHD6glL8SXDqT33
 Am+F+Ob4kP94ym6UpBkCR7E8PFlBXn0bAGpQFNFpi+JeHyhWKM3epC58nqwCwsszu2lUwN3zDh
 RNB0KpKqUfXAqgsVE1UGBVTVQXNhCEE2/+beWBsmXV4/OZOD2gRFxoihiwEguMEmKZeW8fvuo6
 3Wdv53QHRW0cbkf+V7RLpe1CviYXwhQwx8kstTWC6QgG90aAF0G6AhqeGkhepXye+lu1Cdd0xD
 cmg=
X-IronPort-AV: E=Sophos;i="5.77,396,1596492000"; 
   d="scan'208";a="14207940"
From: "Joakim Roubert" <joakim.roubert@axis.com>
To: <meta-virtualization@yoctoproject.org>
CC: Joakim Roubert <joakimr@axis.com>
Subject: [meta-virtualization][PATCH v5] Adding k3s recipe
Date: Tue, 20 Oct 2020 13:14:34 +0200
Message-ID: <20201020111434.17993-1-joakimr@axis.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <CADkTA4NUDHVRiSRHoUU=Ci8of0_J5C+pM7MVwOSopQ9F_yBTBw@mail.gmail.com>
References: <CADkTA4NUDHVRiSRHoUU=Ci8of0_J5C+pM7MVwOSopQ9F_yBTBw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Change-Id: Id1c52727593bc5ea8d0cd2de192faa44304d7a45
Signed-off-by: Joakim Roubert <joakimr@axis.com>
---
 recipes-containers/k3s/README.md              |  30 +++++
 ...01-Finding-host-local-in-usr-libexec.patch |  27 +++++
 .../k3s/k3s/cni-containerd-net.conf           |  24 ++++
 recipes-containers/k3s/k3s/k3s-agent          | 103 ++++++++++++++++++
 recipes-containers/k3s/k3s/k3s-agent.service  |  26 +++++
 recipes-containers/k3s/k3s/k3s-clean          |  30 +++++
 recipes-containers/k3s/k3s/k3s.service        |  27 +++++
 recipes-containers/k3s/k3s_git.bb             |  75 +++++++++++++
 8 files changed, 342 insertions(+)
 create mode 100644 recipes-containers/k3s/README.md
 create mode 100644 recipes-containers/k3s/k3s/0001-Finding-host-local-in=
-usr-libexec.patch
 create mode 100644 recipes-containers/k3s/k3s/cni-containerd-net.conf
 create mode 100755 recipes-containers/k3s/k3s/k3s-agent
 create mode 100644 recipes-containers/k3s/k3s/k3s-agent.service
 create mode 100755 recipes-containers/k3s/k3s/k3s-clean
 create mode 100644 recipes-containers/k3s/k3s/k3s.service
 create mode 100644 recipes-containers/k3s/k3s_git.bb

diff --git a/recipes-containers/k3s/README.md b/recipes-containers/k3s/RE=
ADME.md
new file mode 100644
index 0000000..3fe5ccd
--- /dev/null
+++ b/recipes-containers/k3s/README.md
@@ -0,0 +1,30 @@
+# k3s: Lightweight Kubernetes
+
+Rancher's [k3s](https://k3s.io/), available under
+[Apache License 2.0](https://www.apache.org/licenses/LICENSE-2.0), provi=
des
+lightweight Kubernetes suitable for small/edge devices. There are use ca=
ses
+where the
+[installation procedures provided by Rancher](https://rancher.com/docs/k=
3s/latest/en/installation/)
+are not ideal but a bitbake-built version is what is needed. And only a =
few
+mods to the [k3s source code](https://github.com/rancher/k3s) is needed =
to
+accomplish that.
+
+## CNI
+
+By default, K3s will run with flannel as the CNI, using VXLAN as the def=
ault
+backend. It is both possible to change the flannel backend and to change=
 from
+flannel to another CNI.
+
+Please see <https://rancher.com/docs/k3s/latest/en/installation/network-=
options/>
+for further k3s networking details.
+
+## Configure and run a k3s agent
+
+The convenience script `k3s-agent` can be used to set up a k3s agent (se=
rvice):
+
+```shell
+k3s-agent -t <token> -s https://<master>:6443
+```
+
+(Here `<token>` is found in `/var/lib/rancher/k3s/server/node-token` at =
the
+k3s master.)
diff --git a/recipes-containers/k3s/k3s/0001-Finding-host-local-in-usr-li=
bexec.patch b/recipes-containers/k3s/k3s/0001-Finding-host-local-in-usr-l=
ibexec.patch
new file mode 100644
index 0000000..8205d73
--- /dev/null
+++ b/recipes-containers/k3s/k3s/0001-Finding-host-local-in-usr-libexec.p=
atch
@@ -0,0 +1,27 @@
+From 4faf68d68c97cfd10947e1152f711acc59f39647 Mon Sep 17 00:00:00 2001
+From: Erik Jansson <erikja@axis.com>
+Date: Wed, 16 Oct 2019 15:07:48 +0200
+Subject: [PATCH] Finding host-local in /usr/libexec
+
+Upstream-status: Inappropriate [embedded specific]
+Signed-off-by: <erikja@axis.com>
+---
+ pkg/agent/config/config.go | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pkg/agent/config/config.go b/pkg/agent/config/config.go
+index b4296f360a..6af9dab895 100644
+--- a/pkg/agent/config/config.go
++++ b/pkg/agent/config/config.go
+@@ -308,7 +308,7 @@ func get(envInfo *cmds.Agent) (*config.Node, error) =
{
+ 		return nil, err
+ 	}
+=20
+-	hostLocal, err :=3D exec.LookPath("host-local")
++	hostLocal, err :=3D exec.LookPath("/usr/libexec/cni/host-local")
+ 	if err !=3D nil {
+ 		return nil, errors.Wrapf(err, "failed to find host-local")
+ 	}
+--=20
+2.11.0
+
diff --git a/recipes-containers/k3s/k3s/cni-containerd-net.conf b/recipes=
-containers/k3s/k3s/cni-containerd-net.conf
new file mode 100644
index 0000000..ca434d6
--- /dev/null
+++ b/recipes-containers/k3s/k3s/cni-containerd-net.conf
@@ -0,0 +1,24 @@
+{
+  "cniVersion": "0.4.0",
+  "name": "containerd-net",
+  "plugins": [
+    {
+      "type": "bridge",
+      "bridge": "cni0",
+      "isGateway": true,
+      "ipMasq": true,
+      "promiscMode": true,
+      "ipam": {
+        "type": "host-local",
+        "subnet": "10.88.0.0/16",
+        "routes": [
+          { "dst": "0.0.0.0/0" }
+        ]
+      }
+    },
+    {
+      "type": "portmap",
+      "capabilities": {"portMappings": true}
+    }
+  ]
+}
diff --git a/recipes-containers/k3s/k3s/k3s-agent b/recipes-containers/k3=
s/k3s/k3s-agent
new file mode 100755
index 0000000..b6c6cb6
--- /dev/null
+++ b/recipes-containers/k3s/k3s/k3s-agent
@@ -0,0 +1,103 @@
+#!/bin/sh -eu
+#
+# Copyright (C) 2020 Axis Communications AB
+#
+# SPDX-License-Identifier: Apache-2.0
+
+ENV_CONF=3D/etc/systemd/system/k3s-agent.service.d/10-env.conf
+
+usage() {
+	echo "
+USAGE:
+    ${0##*/} [OPTIONS]
+OPTIONS:
+    --token value, -t value             Token to use for authentication =
[\$K3S_TOKEN]
+    --token-file value                  Token file to use for authentica=
tion [\$K3S_TOKEN_FILE]
+    --server value, -s value            Server to connect to [\$K3S_URL]
+    --node-name value                   Node name [\$K3S_NODE_NAME]
+    --resolv-conf value                 Kubelet resolv.conf file [\$K3S_=
RESOLV_CONF]
+    --cluster-secret value              Shared secret used to bootstrap =
a cluster [\$K3S_CLUSTER_SECRET]
+    -h                                  print this
+"
+}
+
+[ $# -gt 0 ] || {
+	usage
+	exit
+}
+
+case $1 in
+	-*)
+		;;
+	*)
+		usage
+		exit 1
+		;;
+esac
+
+rm -f $ENV_CONF
+mkdir -p ${ENV_CONF%/*}
+echo [Service] > $ENV_CONF
+
+while getopts "t:s:-:h" opt; do
+	case $opt in
+		h)
+			usage
+			exit
+			;;
+		t)
+			VAR_NAME=3DK3S_TOKEN
+			;;
+		s)
+			VAR_NAME=3DK3S_URL
+			;;
+		-)
+			[ $# -ge $OPTIND ] || {
+				usage
+				exit 1
+			}
+			opt=3D$OPTARG
+			eval OPTARG=3D'$'$OPTIND
+			OPTIND=3D$(($OPTIND + 1))
+			case $opt in
+				token)
+					VAR_NAME=3DK3S_TOKEN
+					;;
+				token-file)
+					VAR_NAME=3DK3S_TOKEN_FILE
+					;;
+				server)
+					VAR_NAME=3DK3S_URL
+					;;
+				node-name)
+					VAR_NAME=3DK3S_NODE_NAME
+					;;
+				resolv-conf)
+					VAR_NAME=3DK3S_RESOLV_CONF
+					;;
+				cluster-secret)
+					VAR_NAME=3DK3S_CLUSTER_SECRET
+					;;
+				help)
+					usage
+					exit
+					;;
+				*)
+					usage
+					exit 1
+					;;
+			esac
+			;;
+		*)
+			usage
+			exit 1
+			;;
+	esac
+    echo Environment=3D$VAR_NAME=3D$OPTARG >> $ENV_CONF
+done
+
+chmod 0644 $ENV_CONF
+rm -rf /var/lib/rancher/k3s/agent
+systemctl daemon-reload
+systemctl restart k3s-agent
+systemctl enable k3s-agent.service
diff --git a/recipes-containers/k3s/k3s/k3s-agent.service b/recipes-conta=
iners/k3s/k3s/k3s-agent.service
new file mode 100644
index 0000000..9f9016d
--- /dev/null
+++ b/recipes-containers/k3s/k3s/k3s-agent.service
@@ -0,0 +1,26 @@
+# Derived from the k3s install.sh's create_systemd_service_file() functi=
on
+[Unit]
+Description=3DLightweight Kubernetes Agent
+Documentation=3Dhttps://k3s.io
+Requires=3Dcontainerd.service
+After=3Dcontainerd.service
+
+[Install]
+WantedBy=3Dmulti-user.target
+
+[Service]
+Type=3Dnotify
+KillMode=3Dcontrol-group
+Delegate=3Dyes
+LimitNOFILE=3Dinfinity
+LimitNPROC=3Dinfinity
+LimitCORE=3Dinfinity
+TasksMax=3Dinfinity
+TimeoutStartSec=3D0
+Restart=3Dalways
+RestartSec=3D5s
+ExecStartPre=3D-/sbin/modprobe br_netfilter
+ExecStartPre=3D-/sbin/modprobe overlay
+ExecStart=3D/usr/local/bin/k3s agent
+ExecStopPost=3D/usr/local/bin/k3s-clean
+
diff --git a/recipes-containers/k3s/k3s/k3s-clean b/recipes-containers/k3=
s/k3s/k3s-clean
new file mode 100755
index 0000000..8eca918
--- /dev/null
+++ b/recipes-containers/k3s/k3s/k3s-clean
@@ -0,0 +1,30 @@
+#!/bin/sh -eu
+#
+# Copyright (C) 2020 Axis Communications AB
+#
+# SPDX-License-Identifier: Apache-2.0
+
+do_unmount() {
+	[ $# -eq 2 ] || return
+	local mounts=3D
+	while read ignore mount ignore; do
+		case $mount in
+			$1/*|$2/*)
+				mounts=3D"$mount $mounts"
+				;;
+		esac
+	done </proc/self/mounts
+	[ -z "$mounts" ] || umount $mounts
+}
+
+do_unmount /run/k3s /var/lib/rancher/k3s
+
+# The lines below come from install.sh's create_killall() function:
+ip link show 2>/dev/null | grep 'master cni0' | while read ignore iface =
ignore; do
+    iface=3D${iface%%@*}
+    [ -z "$iface" ] || ip link delete $iface
+done
+
+ip link delete cni0
+ip link delete flannel.1
+rm -rf /var/lib/cni/
diff --git a/recipes-containers/k3s/k3s/k3s.service b/recipes-containers/=
k3s/k3s/k3s.service
new file mode 100644
index 0000000..34c7a80
--- /dev/null
+++ b/recipes-containers/k3s/k3s/k3s.service
@@ -0,0 +1,27 @@
+# Derived from the k3s install.sh's create_systemd_service_file() functi=
on
+[Unit]
+Description=3DLightweight Kubernetes
+Documentation=3Dhttps://k3s.io
+Requires=3Dcontainerd.service
+After=3Dcontainerd.service
+
+[Install]
+WantedBy=3Dmulti-user.target
+
+[Service]
+Type=3Dnotify
+KillMode=3Dprocess
+Delegate=3Dyes
+# Having non-zero Limit*s causes performance problems due to accounting =
overhead
+# in the kernel. We recommend using cgroups to do container-local accoun=
ting.
+LimitNOFILE=3D1048576
+LimitNPROC=3Dinfinity
+LimitCORE=3Dinfinity
+TasksMax=3Dinfinity
+TimeoutStartSec=3D0
+Restart=3Dalways
+RestartSec=3D5s
+ExecStartPre=3D-/sbin/modprobe br_netfilter
+ExecStartPre=3D-/sbin/modprobe overlay
+ExecStart=3D/usr/local/bin/k3s server
+
diff --git a/recipes-containers/k3s/k3s_git.bb b/recipes-containers/k3s/k=
3s_git.bb
new file mode 100644
index 0000000..cfc2c64
--- /dev/null
+++ b/recipes-containers/k3s/k3s_git.bb
@@ -0,0 +1,75 @@
+SUMMARY =3D "Production-Grade Container Scheduling and Management"
+DESCRIPTION =3D "Lightweight Kubernetes, intended to be a fully complian=
t Kubernetes."
+HOMEPAGE =3D "https://k3s.io/"
+LICENSE =3D "Apache-2.0"
+LIC_FILES_CHKSUM =3D "file://${S}/src/import/LICENSE;md5=3D2ee41112a44fe=
7014dce33e26468ba93"
+PV =3D "v1.18.9+k3s1-dirty"
+
+SRC_URI =3D "git://github.com/rancher/k3s.git;branch=3Drelease-1.18;name=
=3Dk3s \
+           file://k3s.service \
+           file://k3s-agent.service \
+           file://k3s-agent \
+           file://k3s-clean \
+           file://cni-containerd-net.conf \
+           file://0001-Finding-host-local-in-usr-libexec.patch;patchdir=3D=
src/import \
+          "
+SRC_URI[k3s.md5sum] =3D "363d3a08dc0b72ba6e6577964f6e94a5"
+SRCREV_k3s =3D "630bebf94b9dce6b8cd3d402644ed023b3af8f90"
+
+inherit go
+inherit goarch
+inherit systemd
+
+PACKAGECONFIG =3D ""
+PACKAGECONFIG[upx] =3D ",,upx-native"
+GO_IMPORT =3D "import"
+GO_BUILD_LDFLAGS =3D "-X github.com/rancher/k3s/pkg/version.Version=3D${=
PV} \
+                    -X github.com/rancher/k3s/pkg/version.GitCommit=3D${=
@d.getVar('SRCREV_k3s', d, 1)[:8]} \
+                    -w -s \
+                   "
+BIN_PREFIX ?=3D "${exec_prefix}/local"
+
+do_compile() {
+        export GOPATH=3D"${S}/src/import/.gopath:${S}/src/import/vendor:=
${STAGING_DIR_TARGET}/${prefix}/local/go"
+        export CGO_ENABLED=3D"1"
+        export GOFLAGS=3D"-mod=3Dvendor"
+        cd ${S}/src/import
+        ${GO} build -tags providerless -ldflags "${GO_BUILD_LDFLAGS}" -o=
 ./dist/artifacts/k3s ./cmd/server/main.go
+        # Use UPX if it is enabled (and thus exists) to compress binary
+        if command -v upx > /dev/null 2>&1; then
+                upx -9 ./dist/artifacts/k3s
+        fi
+}
+do_install() {
+        install -d "${D}${BIN_PREFIX}/bin"
+        install -m 755 "${S}/src/import/dist/artifacts/k3s" "${D}${BIN_P=
REFIX}/bin"
+        ln -sr "${D}/${BIN_PREFIX}/bin/k3s" "${D}${BIN_PREFIX}/bin/crict=
l"
+        ln -sr "${D}/${BIN_PREFIX}/bin/k3s" "${D}${BIN_PREFIX}/bin/ctr"
+        ln -sr "${D}/${BIN_PREFIX}/bin/k3s" "${D}${BIN_PREFIX}/bin/kubec=
tl"
+        install -m 755 "${WORKDIR}/k3s-clean" "${D}${BIN_PREFIX}/bin"
+        install -D -m 0644 "${WORKDIR}/cni-containerd-net.conf" "${D}/${=
sysconfdir}/cni/net.d/10-containerd-net.conf"
+        if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','fals=
e',d)}; then
+                install -D -m 0644 "${WORKDIR}/k3s.service" "${D}${syste=
md_system_unitdir}/k3s.service"
+                install -D -m 0644 "${WORKDIR}/k3s-agent.service" "${D}$=
{systemd_system_unitdir}/k3s-agent.service"
+                sed -i "s#\(Exec\)\(.*\)=3D\(.*\)\(k3s\)#\1\2=3D${BIN_PR=
EFIX}/bin/\4#g" "${D}${systemd_system_unitdir}/k3s.service" "${D}${system=
d_system_unitdir}/k3s-agent.service"
+                install -m 755 "${WORKDIR}/k3s-agent" "${D}${BIN_PREFIX}=
/bin"
+        fi
+}
+
+PACKAGES =3D+ "${PN}-server ${PN}-agent"
+
+SYSTEMD_PACKAGES =3D "${@bb.utils.contains('DISTRO_FEATURES','systemd','=
${PN}-server ${PN}-agent','',d)}"
+SYSTEMD_SERVICE_${PN}-server =3D "${@bb.utils.contains('DISTRO_FEATURES'=
,'systemd','k3s.service','',d)}"
+SYSTEMD_SERVICE_${PN}-agent =3D "${@bb.utils.contains('DISTRO_FEATURES',=
'systemd','k3s-agent.service','',d)}"
+SYSTEMD_AUTO_ENABLE_${PN}-agent =3D "disable"
+
+FILES_${PN}-agent =3D "${BIN_PREFIX}/bin/k3s-agent"
+
+RDEPENDS_${PN} =3D "cni conntrack-tools coreutils findutils iproute2 ips=
et virtual/containerd"
+RDEPENDS_${PN}-server =3D "${PN}"
+RDEPENDS_${PN}-agent =3D "${PN}"
+
+RCONFLICTS_${PN} =3D "kubectl"
+
+INHIBIT_PACKAGE_STRIP =3D "1"
+INSANE_SKIP_${PN} +=3D "ldflags already-stripped"
--=20
2.20.1

