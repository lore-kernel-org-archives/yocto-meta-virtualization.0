Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web12.142282.1598043583248380949
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 21 Aug 2020 13:59:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=DFmWdmY5;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: erik.jansson@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=11275; q=dns/txt; s=axis-central1;
  t=1598043583; x=1629579583;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=0YI8oLtqGsCN4Hdvfw2vZtWld+4xcJnRBgN/+IE+mVg=;
  b=DFmWdmY5j5Mn+V4sDj54DVnj3EYZODjJM7dExyV1KRw3hTxAFhL/VnPk
   ZVqR1Uhtc58NDV3arG8TmNvUPSiP7eeTpPrN/DDs5OyRLrgjKKrCs+LqD
   tHKoPtJP3kwCZ21HspwsE3dHWsbKW72I31z7rbFXlWPCTQyge6a851hoN
   sUpvQVZgP/30R6GVEi/Z0lkjt580FBrpXEvJa7tpx1rCkK9TILjowhdpN
   /dcOgul9FIj8x+iJ4itn9RpwN6s/Rz4GWomdTLcpD1hR9CtToORpA4iTy
   NxejA1ilatV/GGBfvIFxNojL6u1piO3qHn1x9+kEPz9BTnvHZr+k6nict
   Q==;
IronPort-SDR: F2S7c3yCxcb5pRytstgLG6/mgQ/xijdZklwTp8SgriFYcIqQ31Ah5u+WiXhunnEirjPIS2Xl6q
 RtJfnvBas3Wa5NnqWUMNtjF0FW25ZGFjhhjd4G06mZU7VgS/PevhS51zopWwZ7eB0b4+yiEb0I
 5uY1e/sTCUPDBv1Z++XkxvC1pViGNbYzGHRHEWiaU+uYG+47hYaahneZSv3XaRsvdnVM80D5PK
 rD79Xv/Sg8Om/EQDcW4PDyPd0Hico3HQvbtlo9EsMXNlSniHrdGaiFoJvObvE7gxHQ25zejXeW
 mq8=
X-IronPort-AV: E=Sophos;i="5.76,338,1592863200"; 
   d="scan'208";a="11747119"
From: "Erik Jansson" <erik.jansson@axis.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: <joakim.roubert@axis.com>, Erik Jansson <erik.jansson@axis.com>
Subject: [meta-virtualization][PATCH] Adding k3s recipe
Date: Fri, 21 Aug 2020 22:59:36 +0200
Message-ID: <20200821205936.30561-1-erik.jansson@axis.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Return-Path: erikja@axis.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Erik Jansson <erik.jansson@axis.com>
---
 ...1-Updating-bin-location-to-not-local.patch | 25 +++++
 ...02-Finding-host-local-in-usr-libexec.patch | 25 +++++
 recipes-containers/k3s/k3s/agent.service      | 23 +++++
 .../k3s/k3s/cni-containerd-net.conf           | 24 +++++
 recipes-containers/k3s/k3s/k3s-agent          | 99 +++++++++++++++++++
 recipes-containers/k3s/k3s/k3s-clean          | 24 +++++
 recipes-containers/k3s/k3s/server.service     | 21 ++++
 recipes-containers/k3s/k3s_git.bb             | 74 ++++++++++++++
 8 files changed, 315 insertions(+)
 create mode 100644 recipes-containers/k3s/k3s/0001-Updating-bin-location-to-not-local.patch
 create mode 100644 recipes-containers/k3s/k3s/0002-Finding-host-local-in-usr-libexec.patch
 create mode 100644 recipes-containers/k3s/k3s/agent.service
 create mode 100644 recipes-containers/k3s/k3s/cni-containerd-net.conf
 create mode 100755 recipes-containers/k3s/k3s/k3s-agent
 create mode 100644 recipes-containers/k3s/k3s/k3s-clean
 create mode 100644 recipes-containers/k3s/k3s/server.service
 create mode 100644 recipes-containers/k3s/k3s_git.bb

diff --git a/recipes-containers/k3s/k3s/0001-Updating-bin-location-to-not-local.patch b/recipes-containers/k3s/k3s/0001-Updating-bin-location-to-not-local.patch
new file mode 100644
index 0000000..9876f61
--- /dev/null
+++ b/recipes-containers/k3s/k3s/0001-Updating-bin-location-to-not-local.patch
@@ -0,0 +1,25 @@
+From f007ddd1eb43f43e5b596ef31df91e4ae689ba8b Mon Sep 17 00:00:00 2001
+From: Erik Jansson <erikja@axis.com>
+Date: Mon, 14 Oct 2019 09:57:52 +0200
+Subject: [PATCH] Updating bin location to not local
+
+---
+ k3s.service | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/k3s.service b/k3s.service
+index 94abfb771a..e93a28138f 100644
+--- a/k3s.service
++++ b/k3s.service
+@@ -6,7 +6,7 @@ After=network-online.target
+ [Service]
+ Type=notify
+ EnvironmentFile=/etc/systemd/system/k3s.service.env
+-ExecStart=/usr/local/bin/k3s server
++ExecStart=/usr/bin/k3s server
+ KillMode=process
+ Delegate=yes
+ LimitNOFILE=infinity
+-- 
+2.11.0
+
diff --git a/recipes-containers/k3s/k3s/0002-Finding-host-local-in-usr-libexec.patch b/recipes-containers/k3s/k3s/0002-Finding-host-local-in-usr-libexec.patch
new file mode 100644
index 0000000..9fc81e0
--- /dev/null
+++ b/recipes-containers/k3s/k3s/0002-Finding-host-local-in-usr-libexec.patch
@@ -0,0 +1,25 @@
+From 4faf68d68c97cfd10947e1152f711acc59f39647 Mon Sep 17 00:00:00 2001
+From: Erik Jansson <erikja@axis.com>
+Date: Wed, 16 Oct 2019 15:07:48 +0200
+Subject: [PATCH] Finding host-local in /usr/libexec
+
+---
+ pkg/agent/config/config.go | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pkg/agent/config/config.go b/pkg/agent/config/config.go
+index b4296f360a..6af9dab895 100644
+--- a/pkg/agent/config/config.go
++++ b/pkg/agent/config/config.go
+@@ -308,7 +308,7 @@ func get(envInfo *cmds.Agent) (*config.Node, error) {
+ 		return nil, err
+ 	}
+ 
+-	hostLocal, err := exec.LookPath("host-local")
++	hostLocal, err := exec.LookPath("/usr/libexec/cni/host-local")
+ 	if err != nil {
+ 		return nil, errors.Wrapf(err, "failed to find host-local")
+ 	}
+-- 
+2.11.0
+
diff --git a/recipes-containers/k3s/k3s/agent.service b/recipes-containers/k3s/k3s/agent.service
new file mode 100644
index 0000000..80bfe40
--- /dev/null
+++ b/recipes-containers/k3s/k3s/agent.service
@@ -0,0 +1,23 @@
+[Unit]
+Description=Lightweight Kubernetes Agent
+Documentation=https://k3s.io
+Requires=containerd.service
+After=containerd.service
+
+[Service]
+Type=notify
+ExecStart=/usr/bin/k3s agent
+ExecStopPost=/usr/bin/k3s-clean
+KillMode=control-group
+Delegate=yes
+LimitNOFILE=infinity
+LimitNPROC=infinity
+LimitCORE=infinity
+TasksMax=infinity
+TimeoutStartSec=0
+TimeoutStopSec=5
+Restart=always
+RestartSec=5s
+
+[Install]
+WantedBy=multi-user.target
\ No newline at end of file
diff --git a/recipes-containers/k3s/k3s/cni-containerd-net.conf b/recipes-containers/k3s/k3s/cni-containerd-net.conf
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
diff --git a/recipes-containers/k3s/k3s/k3s-agent b/recipes-containers/k3s/k3s/k3s-agent
new file mode 100755
index 0000000..c6cab05
--- /dev/null
+++ b/recipes-containers/k3s/k3s/k3s-agent
@@ -0,0 +1,99 @@
+#!/bin/sh -eu
+
+ENV_CONF=/etc/systemd/system/k3s-agent.service.d/10-env.conf
+
+usage() {
+	echo "
+USAGE:
+    ${0##*/} [OPTIONS]
+OPTIONS:
+    --token value, -t value             Token to use for authentication [\$K3S_TOKEN]
+    --token-file value                  Token file to use for authentication [\$K3S_TOKEN_FILE]
+    --server value, -s value            Server to connect to [\$K3S_URL]
+    --node-name value                   Node name [\$K3S_NODE_NAME]
+    --resolv-conf value                 Kubelet resolv.conf file [\$K3S_RESOLV_CONF]
+    --cluster-secret value              Shared secret used to bootstrap a cluster [\$K3S_CLUSTER_SECRET]
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
+			VAR_NAME=K3S_TOKEN
+			;;
+		s)
+			VAR_NAME=K3S_URL
+			;;
+		-)
+			[ $# -ge $OPTIND ] || {
+				usage
+				exit 1
+			}
+			opt=$OPTARG
+			eval OPTARG='$'$OPTIND
+			OPTIND=$(($OPTIND + 1))
+			case $opt in
+				token)
+					VAR_NAME=K3S_TOKEN
+					;;
+				token-file)
+					VAR_NAME=K3S_TOKEN_FILE
+					;;
+				server)
+					VAR_NAME=K3S_URL
+					;;
+				node-name)
+					VAR_NAME=K3S_NODE_NAME
+					;;
+				resolv-conf)
+					VAR_NAME=K3S_RESOLV_CONF
+					;;
+				cluster-secret)
+					VAR_NAME=K3S_CLUSTER_SECRET
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
+    echo Environment=$VAR_NAME=$OPTARG >> $ENV_CONF
+done
+
+chmod 0644 $ENV_CONF
+rm -rf /var/lib/rancher/k3s/agent
+systemctl daemon-reload
+systemctl restart k3s-agent
+systemctl enable k3s-agent.service
diff --git a/recipes-containers/k3s/k3s/k3s-clean b/recipes-containers/k3s/k3s/k3s-clean
new file mode 100644
index 0000000..b726637
--- /dev/null
+++ b/recipes-containers/k3s/k3s/k3s-clean
@@ -0,0 +1,24 @@
+#!/bin/sh -eu
+do_unmount() {
+	[ $# -eq 2 ] || return
+	local mounts=
+	while read ignore mount ignore; do
+		case $mount in
+			$1/*|$2/*)
+				mounts="$mount $mounts"
+				;;
+		esac
+	done </proc/self/mounts
+	[ -z "$mounts" ] || umount $mounts
+}
+
+do_unmount /run/k3s /var/lib/rancher/k3s
+
+ip link show | grep 'master cni0' | while read ignore iface ignore; do
+    iface=${iface%%@*}
+    [ -z "$iface" ] || ip link delete $iface
+done
+
+ip link delete cni0
+ip link delete flannel.1
+rm -rf /var/lib/cni/
\ No newline at end of file
diff --git a/recipes-containers/k3s/k3s/server.service b/recipes-containers/k3s/k3s/server.service
new file mode 100644
index 0000000..02b5446
--- /dev/null
+++ b/recipes-containers/k3s/k3s/server.service
@@ -0,0 +1,21 @@
+[Unit]
+Description=Lightweight Kubernetes
+Documentation=https://k3s.io
+Requires=containerd.service
+After=containerd.service
+
+[Service]
+Type=notify
+ExecStart=/usr/bin/k3s server
+KillMode=process
+Delegate=yes
+LimitNOFILE=infinity
+LimitNPROC=infinity
+LimitCORE=infinity
+TasksMax=infinity
+TimeoutStartSec=0
+Restart=always
+RestartSec=5s
+
+[Install]
+WantedBy=multi-user.target
\ No newline at end of file
diff --git a/recipes-containers/k3s/k3s_git.bb b/recipes-containers/k3s/k3s_git.bb
new file mode 100644
index 0000000..5052613
--- /dev/null
+++ b/recipes-containers/k3s/k3s_git.bb
@@ -0,0 +1,74 @@
+SUMMARY = "Production-Grade Container Scheduling and Management"
+DESCRIPTION = "Lightweight Kubernetes, intended to be a fully compliant Kubernetes."
+HOMEPAGE = "https://k3s.io/"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://${S}/src/import/LICENSE;md5=2ee41112a44fe7014dce33e26468ba93"
+PV = "v1.18.6+k3s1-dirty"
+
+SRC_URI = "git://github.com/rancher/k3s.git;branch=release-1.18;name=k3s \
+           file://agent.service \
+           file://server.service \
+           file://k3s-agent \
+           file://k3s-clean \
+           file://cni-containerd-net.conf \
+           file://0001-Updating-bin-location-to-not-local.patch;patchdir=src/import \
+           file://0002-Finding-host-local-in-usr-libexec.patch;patchdir=src/import \
+          "
+SRC_URI[k3s.md5sum] = "363d3a08dc0b72ba6e6577964f6e94a5"
+SRCREV_k3s = "6f56fa1d68a5a48b8b6fdefa8eb7ead2015a4b3a"
+
+inherit go
+inherit goarch
+inherit systemd
+
+PACKAGECONFIG = ""
+PACKAGECONFIG[upx] = ",,upx-native"
+GO_IMPORT = "import"
+GO_BUILD_LDFLAGS = "-X github.com/rancher/k3s/pkg/version.Version=${PV} \
+                    -X github.com/rancher/k3s/pkg/version.GitCommit=${@d.getVar('SRCREV_k3s', d, 1)[:8]} \
+                    -w -s \
+                   "
+
+do_compile() {
+        export GOPATH="${S}/src/import/.gopath:${S}/src/import/vendor:${STAGING_DIR_TARGET}/${prefix}/local/go"
+        export CGO_ENABLED="1"
+        export GOFLAGS="-mod=vendor"
+        cd ${S}/src/import
+        ${GO} build -tags providerless -ldflags "${GO_BUILD_LDFLAGS}" -o ./dist/artifacts/k3s ./cmd/server/main.go
+        # Use UPX if it is enabled (and thus exists) to compress binary
+        if command -v upx > /dev/null 2>&1; then
+                upx -9 ./dist/artifacts/k3s
+        fi
+}
+do_install() {
+        install -d "${D}${bindir}"
+        install -m 755 "${S}/src/import/dist/artifacts/k3s" "${D}${bindir}"
+        ln -sr "${D}/${bindir}/k3s" "${D}${bindir}/crictl"
+        ln -sr "${D}/${bindir}/k3s" "${D}${bindir}/ctr"
+        ln -sr "${D}/${bindir}/k3s" "${D}${bindir}/kubectl"
+        if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+                install -D -m 0644 "${WORKDIR}/server.service" "${D}${systemd_system_unitdir}/k3s.service"
+                install -D -m 0644 "${WORKDIR}/agent.service" "${D}${systemd_system_unitdir}/k3s-agent.service"
+                install -m 755 "${WORKDIR}/k3s-agent" "${D}${bindir}"
+        fi
+        install -m 755 "${WORKDIR}/k3s-clean" "${D}${bindir}"
+        install -D -m 0644 "${WORKDIR}/cni-containerd-net.conf" "${D}/${sysconfdir}/cni/net.d/10-containerd-net.conf"
+}
+
+PACKAGES =+ "${PN}-server ${PN}-agent"
+
+SYSTEMD_PACKAGES = "${@bb.utils.contains('DISTRO_FEATURES','systemd','${PN}-server ${PN}-agent','',d)}"
+SYSTEMD_SERVICE_${PN}-server = "${@bb.utils.contains('DISTRO_FEATURES','systemd','k3s.service','',d)}"
+SYSTEMD_SERVICE_${PN}-agent = "${@bb.utils.contains('DISTRO_FEATURES','systemd','k3s-agent.service','',d)}"
+SYSTEMD_AUTO_ENABLE_${PN}-agent = "disable"
+
+FILES_${PN}-agent = "${bindir}/k3s-agent"
+
+RDEPENDS_${PN} = "cni conntrack-tools coreutils findutils ipset virtual/containerd"
+RDEPENDS_${PN}-server = "${PN}"
+RDEPENDS_${PN}-agent = "${PN}"
+
+RCONFLICTS_${PN} = "kubectl"
+
+INHIBIT_PACKAGE_STRIP = "1"
+INSANE_SKIP_${PN} += "ldflags already-stripped"
-- 
2.20.1

