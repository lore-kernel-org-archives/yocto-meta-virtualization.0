Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.10223.1602762458587220476
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 15 Oct 2020 04:47:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com header.s=axis-central1 header.b=Kgsjh5an;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: joakim.roubert@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=12648; q=dns/txt; s=axis-central1;
  t=1602762458; x=1634298458;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=NkZasTbObg5KyIZsNUtQeg+Jy9eMcbF84FYeceSR5JI=;
  b=Kgsjh5anV1yjnF0N0l+vFd0dqyvm6nu+9rSshtjIRag98wYVqFzNHAx0
   hvrP2L5dspdiXWNc8J69NXx26oDGHTk7WOGyMgoAMYEjAzMd043uUp8CR
   qJIVpFSQ2h1gRqUExPNJNGt+Eloo/4PkDkSz5PKrJW+OiJYzwSRjT4SXm
   hLn6aRDfGv5jgCJNSWkG/h/GUKeBoCJYzt2xIILZMai60dkynMro7WUrA
   nNIeCGS5e/rDLulRTNLOphUEei+vbROBtZO8JjleiIUAFF88eWg2l/pfJ
   /xYFk9jdl1omMCk2ROXVxykCpi98oMlx/rc+Zz1mnwF7tjIOQI60CNGfW
   A==;
IronPort-SDR: mDNR+fR7lYAdicQkdJZh1GTkrQELBgP02dLM4R+q0PadU7RKK03bsIazs77Y9MAmkzj/ur78zZ
 WTgwIUV/z9Fpj+5y08uZ/2Mb5dkKyvVw8C+RQ/UjXkAHe4NxNrqsZjgDYSiEVn80zwXqTsZsIR
 8rFJLGa/B0dF6c7ylcLXChIjfKtkBfv6epRVm7E/PR8qc1QsdmvGWehBTlY1gT7rLltwekzDOr
 x4ka7sph00ZjUkeXFvQDlQkdOXfSuaIwvgJVwnamfqsJybNlpJpTe5UDdbYmVooppx3HDBjQ1o
 fzk=
X-IronPort-AV: E=Sophos;i="5.77,378,1596492000"; 
   d="scan'208";a="14037204"
Subject: [meta-virtualization][PATCH v4] Adding k3s recipe
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
References: <20200821205529.29901-1-erik.jansson@axis.com>
 <6adf1052-aa13-b890-606e-119d70eab618@axis.com>
 <CADkTA4Mkpo9S92Pfqd_eDYiyt+3zopP9p97JF3yct2TWuc3kNQ@mail.gmail.com>
 <c13a622a-5d4c-d87e-f901-673bec12fe33@axis.com>
 <CADkTA4MArixWsydAc1YdwCvyiPHx36nqcigpLf=j_Fw6NudnRQ@mail.gmail.com>
 <ae269803-37c4-d72a-d19e-097a093baa60@axis.com>
 <CADkTA4NbKfrK0CwQz7P5ecGCgL_d_0CZnuROoVTL=iLWJ6kvMw@mail.gmail.com>
 <8943d000-4ce1-164b-eb8e-2bedfaca2981@axis.com>
 <CADkTA4PNMnRJ3iZu0TvsK+8S_MMySNxx-=fk7rFuCCOStcRdWw@mail.gmail.com>
 <16380B0CA000AB98.28124@lists.yoctoproject.org>
 <c381ef59-ef51-840e-626e-ddb3e5706757@axis.com>
 <CADkTA4PMkHjKHmb0iwR1+xcu660xBGOBTQH0+exqfGL-VNhdAg@mail.gmail.com>
 <1639818C3E50A226.8589@lists.yoctoproject.org>
 <1639D7B9311FC65C.18704@lists.yoctoproject.org>
 <cb7cddae-6fbc-1307-618a-0c99e88f8070@axis.com>
 <CADkTA4On-SF-80JAPQ0-Q=uAi2xZ7=BqHhVupaaXNEtCdP9rcw@mail.gmail.com>
From: "Joakim Roubert" <joakim.roubert@axis.com>
Message-ID: <e3c93914-5d9c-ba75-5570-9097aa71f4d7@axis.com>
Date: Thu, 15 Oct 2020 13:47:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <CADkTA4On-SF-80JAPQ0-Q=uAi2xZ7=BqHhVupaaXNEtCdP9rcw@mail.gmail.com>
Return-Path: joakim.roubert@axis.com
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: XBOX02.axis.com (10.0.5.16) To XBOX03.axis.com (10.0.5.17)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



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
  create mode 100644 
recipes-containers/k3s/k3s/0001-Finding-host-local-in-usr-libexec.patch
  create mode 100644 recipes-containers/k3s/k3s/cni-containerd-net.conf
  create mode 100755 recipes-containers/k3s/k3s/k3s-agent
  create mode 100644 recipes-containers/k3s/k3s/k3s-agent.service
  create mode 100755 recipes-containers/k3s/k3s/k3s-clean
  create mode 100644 recipes-containers/k3s/k3s/k3s.service
  create mode 100644 recipes-containers/k3s/k3s_git.bb

diff --git a/recipes-containers/k3s/README.md 
b/recipes-containers/k3s/README.md
new file mode 100644
index 0000000..3fe5ccd
--- /dev/null
+++ b/recipes-containers/k3s/README.md
@@ -0,0 +1,30 @@
+# k3s: Lightweight Kubernetes
+
+Rancher's [k3s](https://k3s.io/), available under
+[Apache License 2.0](https://www.apache.org/licenses/LICENSE-2.0), provides
+lightweight Kubernetes suitable for small/edge devices. There are use cases
+where the
+[installation procedures provided by 
Rancher](https://rancher.com/docs/k3s/latest/en/installation/)
+are not ideal but a bitbake-built version is what is needed. And only a few
+mods to the [k3s source code](https://github.com/rancher/k3s) is needed to
+accomplish that.
+
+## CNI
+
+By default, K3s will run with flannel as the CNI, using VXLAN as the 
default
+backend. It is both possible to change the flannel backend and to 
change from
+flannel to another CNI.
+
+Please see 
<https://rancher.com/docs/k3s/latest/en/installation/network-options/>
+for further k3s networking details.
+
+## Configure and run a k3s agent
+
+The convenience script `k3s-agent` can be used to set up a k3s agent 
(service):
+
+```shell
+k3s-agent -t <token> -s https://<master>:6443
+```
+
+(Here `<token>` is found in `/var/lib/rancher/k3s/server/node-token` at the
+k3s master.)
diff --git 
a/recipes-containers/k3s/k3s/0001-Finding-host-local-in-usr-libexec.patch b/recipes-containers/k3s/k3s/0001-Finding-host-local-in-usr-libexec.patch
new file mode 100644
index 0000000..8205d73
--- /dev/null
+++ 
b/recipes-containers/k3s/k3s/0001-Finding-host-local-in-usr-libexec.patch
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
diff --git a/recipes-containers/k3s/k3s/cni-containerd-net.conf 
b/recipes-containers/k3s/k3s/cni-containerd-net.conf
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
diff --git a/recipes-containers/k3s/k3s/k3s-agent 
b/recipes-containers/k3s/k3s/k3s-agent
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
+ENV_CONF=/etc/systemd/system/k3s-agent.service.d/10-env.conf
+
+usage() {
+	echo "
+USAGE:
+    ${0##*/} [OPTIONS]
+OPTIONS:
+    --token value, -t value             Token to use for authentication 
[\$K3S_TOKEN]
+    --token-file value                  Token file to use for 
authentication [\$K3S_TOKEN_FILE]
+    --server value, -s value            Server to connect to [\$K3S_URL]
+    --node-name value                   Node name [\$K3S_NODE_NAME]
+    --resolv-conf value                 Kubelet resolv.conf file 
[\$K3S_RESOLV_CONF]
+    --cluster-secret value              Shared secret used to bootstrap 
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
diff --git a/recipes-containers/k3s/k3s/k3s-agent.service 
b/recipes-containers/k3s/k3s/k3s-agent.service
new file mode 100644
index 0000000..9f9016d
--- /dev/null
+++ b/recipes-containers/k3s/k3s/k3s-agent.service
@@ -0,0 +1,26 @@
+# Derived from the k3s install.sh's create_systemd_service_file() function
+[Unit]
+Description=Lightweight Kubernetes Agent
+Documentation=https://k3s.io
+Requires=containerd.service
+After=containerd.service
+
+[Install]
+WantedBy=multi-user.target
+
+[Service]
+Type=notify
+KillMode=control-group
+Delegate=yes
+LimitNOFILE=infinity
+LimitNPROC=infinity
+LimitCORE=infinity
+TasksMax=infinity
+TimeoutStartSec=0
+Restart=always
+RestartSec=5s
+ExecStartPre=-/sbin/modprobe br_netfilter
+ExecStartPre=-/sbin/modprobe overlay
+ExecStart=/usr/local/bin/k3s agent
+ExecStopPost=/usr/local/bin/k3s-clean
+
diff --git a/recipes-containers/k3s/k3s/k3s-clean 
b/recipes-containers/k3s/k3s/k3s-clean
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
+# The lines below come from install.sh's create_killall() function:
+ip link show 2>/dev/null | grep 'master cni0' | while read ignore iface 
ignore; do
+    iface=${iface%%@*}
+    [ -z "$iface" ] || ip link delete $iface
+done
+
+ip link delete cni0
+ip link delete flannel.1
+rm -rf /var/lib/cni/
diff --git a/recipes-containers/k3s/k3s/k3s.service 
b/recipes-containers/k3s/k3s/k3s.service
new file mode 100644
index 0000000..34c7a80
--- /dev/null
+++ b/recipes-containers/k3s/k3s/k3s.service
@@ -0,0 +1,27 @@
+# Derived from the k3s install.sh's create_systemd_service_file() function
+[Unit]
+Description=Lightweight Kubernetes
+Documentation=https://k3s.io
+Requires=containerd.service
+After=containerd.service
+
+[Install]
+WantedBy=multi-user.target
+
+[Service]
+Type=notify
+KillMode=process
+Delegate=yes
+# Having non-zero Limit*s causes performance problems due to accounting 
overhead
+# in the kernel. We recommend using cgroups to do container-local 
accounting.
+LimitNOFILE=1048576
+LimitNPROC=infinity
+LimitCORE=infinity
+TasksMax=infinity
+TimeoutStartSec=0
+Restart=always
+RestartSec=5s
+ExecStartPre=-/sbin/modprobe br_netfilter
+ExecStartPre=-/sbin/modprobe overlay
+ExecStart=/usr/local/bin/k3s server
+
diff --git a/recipes-containers/k3s/k3s_git.bb 
b/recipes-containers/k3s/k3s_git.bb
new file mode 100644
index 0000000..cfc2c64
--- /dev/null
+++ b/recipes-containers/k3s/k3s_git.bb
@@ -0,0 +1,75 @@
+SUMMARY = "Production-Grade Container Scheduling and Management"
+DESCRIPTION = "Lightweight Kubernetes, intended to be a fully compliant 
Kubernetes."
+HOMEPAGE = "https://k3s.io/"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = 
"file://${S}/src/import/LICENSE;md5=2ee41112a44fe7014dce33e26468ba93"
+PV = "v1.18.9+k3s1-dirty"
+
+SRC_URI = "git://github.com/rancher/k3s.git;branch=release-1.18;name=k3s \
+           file://k3s.service \
+           file://k3s-agent.service \
+           file://k3s-agent \
+           file://k3s-clean \
+           file://cni-containerd-net.conf \
+ 
file://0001-Finding-host-local-in-usr-libexec.patch;patchdir=src/import \
+          "
+SRC_URI[k3s.md5sum] = "363d3a08dc0b72ba6e6577964f6e94a5"
+SRCREV_k3s = "630bebf94b9dce6b8cd3d402644ed023b3af8f90"
+
+inherit go
+inherit goarch
+inherit systemd
+
+PACKAGECONFIG = ""
+PACKAGECONFIG[upx] = ",,upx-native"
+GO_IMPORT = "import"
+GO_BUILD_LDFLAGS = "-X github.com/rancher/k3s/pkg/version.Version=${PV} \
+                    -X 
github.com/rancher/k3s/pkg/version.GitCommit=${@d.getVar('SRCREV_k3s', 
d, 1)[:8]} \
+                    -w -s \
+                   "
+BIN_PREFIX ?= "${exec_prefix}/local"
+
+do_compile() {
+        export 
GOPATH="${S}/src/import/.gopath:${S}/src/import/vendor:${STAGING_DIR_TARGET}/${prefix}/local/go"
+        export CGO_ENABLED="1"
+        export GOFLAGS="-mod=vendor"
+        cd ${S}/src/import
+        ${GO} build -tags providerless -ldflags "${GO_BUILD_LDFLAGS}" 
-o ./dist/artifacts/k3s ./cmd/server/main.go
+        # Use UPX if it is enabled (and thus exists) to compress binary
+        if command -v upx > /dev/null 2>&1; then
+                upx -9 ./dist/artifacts/k3s
+        fi
+}
+do_install() {
+        install -d "${D}${BIN_PREFIX}/bin"
+        install -m 755 "${S}/src/import/dist/artifacts/k3s" 
"${D}${BIN_PREFIX}/bin"
+        ln -sr "${D}/${BIN_PREFIX}/bin/k3s" "${D}${BIN_PREFIX}/bin/crictl"
+        ln -sr "${D}/${BIN_PREFIX}/bin/k3s" "${D}${BIN_PREFIX}/bin/ctr"
+        ln -sr "${D}/${BIN_PREFIX}/bin/k3s" "${D}${BIN_PREFIX}/bin/kubectl"
+        install -m 755 "${WORKDIR}/k3s-clean" "${D}${BIN_PREFIX}/bin"
+        install -D -m 0644 "${WORKDIR}/cni-containerd-net.conf" 
"${D}/${sysconfdir}/cni/net.d/10-containerd-net.conf"
+        if 
${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+                install -D -m 0644 "${WORKDIR}/k3s.service" 
"${D}${systemd_system_unitdir}/k3s.service"
+                install -D -m 0644 "${WORKDIR}/k3s-agent.service" 
"${D}${systemd_system_unitdir}/k3s-agent.service"
+                sed -i 
"s#\(Exec\)\(.*\)=\(.*\)\(k3s\)#\1\2=${BIN_PREFIX}/bin/\4#g" 
"${D}${systemd_system_unitdir}/k3s.service" 
"${D}${systemd_system_unitdir}/k3s-agent.service"
+                install -m 755 "${WORKDIR}/k3s-agent" 
"${D}${BIN_PREFIX}/bin"
+        fi
+}
+
+PACKAGES =+ "${PN}-server ${PN}-agent"
+
+SYSTEMD_PACKAGES = 
"${@bb.utils.contains('DISTRO_FEATURES','systemd','${PN}-server 
${PN}-agent','',d)}"
+SYSTEMD_SERVICE_${PN}-server = 
"${@bb.utils.contains('DISTRO_FEATURES','systemd','k3s.service','',d)}"
+SYSTEMD_SERVICE_${PN}-agent = 
"${@bb.utils.contains('DISTRO_FEATURES','systemd','k3s-agent.service','',d)}"
+SYSTEMD_AUTO_ENABLE_${PN}-agent = "disable"
+
+FILES_${PN}-agent = "${BIN_PREFIX}/bin/k3s-agent"
+
+RDEPENDS_${PN} = "cni conntrack-tools coreutils findutils iproute2 
ipset virtual/containerd"
+RDEPENDS_${PN}-server = "${PN}"
+RDEPENDS_${PN}-agent = "${PN}"
+
+RCONFLICTS_${PN} = "kubectl"
+
+INHIBIT_PACKAGE_STRIP = "1"
+INSANE_SKIP_${PN} += "ldflags already-stripped"
-- 
2.20.1


