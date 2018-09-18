Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2D536E00971; Tue, 18 Sep 2018 13:28:03 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0B8E1E00971
	for <meta-virtualization@yoctoproject.org>;
	Tue, 18 Sep 2018 13:28:01 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w8IKRwYg001127
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 18 Sep 2018 13:27:58 -0700 (PDT)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Tue, 18 Sep 2018 13:27:57 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 18 Sep 2018 16:27:27 -0400
Message-ID: <1537302451-32569-3-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1537302451-32569-1-git-send-email-mark.asselstine@windriver.com>
References: <1537302451-32569-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Subject: [m-c-s][PATCH 2/6] consul: consule-migrate: move from meta-overc
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
X-List-Received-Date: Tue, 18 Sep 2018 20:28:03 -0000
Content-Type: text/plain

After several requests to make the consul recipe available outside of
meta-overc and the OverC framework we are moving the consul recipes
here. These are a copy from meta-overc (HEAD 6afe8d2c12ac).

NOTE that not all the DEPENDS have been copied as we will follow this
commit with work to make use of SRC_URIs for dependencies. See the
associated commit(s) which will follow this one.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 recipes-connectivity/consul/consul-migrate_git.bb  | 26 +++++++++
 recipes-connectivity/consul/consul_git.bb          | 67 ++++++++++++++++++++++
 ...prepared_query-make-compatible-with-go1.5.patch | 31 ++++++++++
 recipes-connectivity/consul/files/consul.service   | 12 ++++
 4 files changed, 136 insertions(+)
 create mode 100644 recipes-connectivity/consul/consul-migrate_git.bb
 create mode 100644 recipes-connectivity/consul/consul_git.bb
 create mode 100644 recipes-connectivity/consul/files/0001-prepared_query-make-compatible-with-go1.5.patch
 create mode 100644 recipes-connectivity/consul/files/consul.service

diff --git a/recipes-connectivity/consul/consul-migrate_git.bb b/recipes-connectivity/consul/consul-migrate_git.bb
new file mode 100644
index 0000000..4cc53b2
--- /dev/null
+++ b/recipes-connectivity/consul/consul-migrate_git.bb
@@ -0,0 +1,26 @@
+SUMMARY = "Provides data migration for Consul server nodes"
+HOMEPAGE = "https://github.com/hashicorp/consul-migrate"
+LICENSE = "MPL-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b278a92d2c1509760384428817710378"
+
+DEPENDS += "raft raft-boltdb raft-mdb"
+
+PKG_NAME = "github.com/hashicorp/consul-migrate"
+SRC_URI = "git://${PKG_NAME}.git"
+SRCREV = "678fb10cdeae25ab309e99e655148f0bf65f9710"
+
+inherit golang
+
+SYSROOT_PREPROCESS_FUNCS += "consul_migrate_sysroot_preprocess"
+
+export GOROOT="${STAGING_DIR_NATIVE}/${nonarch_libdir}/${HOST_SYS}/go"
+
+consul_migrate_sysroot_preprocess () {
+    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
+    cp -a ${D}${prefix}/local/go/src/${PKG_NAME} ${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
+    install -d ${SYSROOT_DESTDIR}${prefix}/bin
+    cp -a ${D}${prefix}/bin/* ${SYSROOT_DESTDIR}${prefix}/bin/
+}
+
+CLEANBROKEN = "1"
+INSANE_SKIP_${PN} = "ldflags"
diff --git a/recipes-connectivity/consul/consul_git.bb b/recipes-connectivity/consul/consul_git.bb
new file mode 100644
index 0000000..bcfb5aa
--- /dev/null
+++ b/recipes-connectivity/consul/consul_git.bb
@@ -0,0 +1,67 @@
+DESCRIPTION = "A tool for discovering and configuring services in your infrastructure"
+HOMEPAGE = "https://www.consul.io/"
+LICENSE = "MPL-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b278a92d2c1509760384428817710378"
+
+DEPENDS += "circbuf \
+    consul-migrate \
+    go-checkpoint \
+    go-msgpack \
+    go-metrics \
+    go-bindata \
+    go-sys \
+    go-syslog \
+    dockerclient \
+    logutils \
+    memberlist \
+    raft \
+    raft-boltdb \
+    scada-client \
+    serf-go \
+    yamux \
+    muxado \
+    dns \
+    cli \
+    mapstructure \
+    copystructure \
+    reflectwalk \
+    columnize \
+    go-radix \
+    golang-lru \
+    hashicorp-hil \
+    hashicorp-hcl \
+    hashicorp-go-cleanhttp \
+    hashicorp-go-memdb \
+    hashicorp-go-reap \
+    hashicorp-go-uuid \
+    net-rpc-msgpackrpc \
+    "
+
+PKG_NAME = "github.com/hashicorp/consul"
+SRC_URI = "git://${PKG_NAME}.git \
+           file://consul.service \
+           file://0001-prepared_query-make-compatible-with-go1.5.patch \
+          "
+SRCREV = "f97afda8e15046b41d951bf3b4220372c45df7ab"
+
+CCACHE = ""
+
+inherit systemd golang
+
+INSANE_SKIP_${PN} += "ldflags"
+
+SYSTEMD_SERVICE_${PN} = "consul.service"
+SYSTEMD_AUTO_ENABLE_${PN} = "enable"
+
+export GOROOT="${STAGING_DIR_NATIVE}/${nonarch_libdir}/${HOST_SYS}/go"
+
+#Stops go from installing and testing the package
+do_configure(){
+}
+
+do_install_append() {
+    install -d ${D}/${systemd_unitdir}/system
+    cp ${WORKDIR}/consul.service ${D}/${systemd_unitdir}/system
+}
+
+FILES_${PN} += "${systemd_unitdir}/system"
diff --git a/recipes-connectivity/consul/files/0001-prepared_query-make-compatible-with-go1.5.patch b/recipes-connectivity/consul/files/0001-prepared_query-make-compatible-with-go1.5.patch
new file mode 100644
index 0000000..a66e1dc
--- /dev/null
+++ b/recipes-connectivity/consul/files/0001-prepared_query-make-compatible-with-go1.5.patch
@@ -0,0 +1,31 @@
+From fb11d9e31788c912f94faf8b188278d54dc9a8f1 Mon Sep 17 00:00:00 2001
+From: Bruce Ashfield <bruce.ashfield@windriver.com>
+Date: Wed, 20 Apr 2016 16:34:50 -0400
+Subject: [PATCH] prepared_query: make compatible with go1.5
+
+The copying of a regex is only in go 1.6. We can take the chance of
+lock contention, so we drop the copy and use the regex directly.
+
+Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
+---
+ consul/prepared_query/template.go | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/consul/prepared_query/template.go b/consul/prepared_query/template.go
+index 984f0bcf9cc6..1c61910c1526 100644
+--- a/consul/prepared_query/template.go
++++ b/consul/prepared_query/template.go
+@@ -116,8 +116,8 @@ func (ct *CompiledTemplate) Render(name string) (*structs.PreparedQuery, error)
+ 	// from multiple goroutines.
+ 	var matches []string
+ 	if ct.re != nil {
+-		re := ct.re.Copy()
+-		matches = re.FindStringSubmatch(name)
++		// re := ct.re.Copy()
++		matches = ct.re.FindStringSubmatch(name)
+ 	}
+ 
+ 	// Create a safe match function that can't fail at run time. It will
+-- 
+2.4.0.53.g8440f74
+
diff --git a/recipes-connectivity/consul/files/consul.service b/recipes-connectivity/consul/files/consul.service
new file mode 100644
index 0000000..c9494e3
--- /dev/null
+++ b/recipes-connectivity/consul/files/consul.service
@@ -0,0 +1,12 @@
+[Unit]
+Description=Launch Consul Cluster
+
+[Service]
+Restart=on-failure
+RestartSec=45
+ExecStartPre=/bin/sh -c 'echo -ne \'{"data_dir":\"/var/consul","server":true,"bootstrap_expect":1,\' > /tmp/consul.conf'
+ExecStartPre=/bin/sh -c 'echo -ne \'"bind_addr":"\'$(ifconfig br0 | awk \'/inet addr/{print substr($2,6)}\')\'"}\' >> /tmp/consul.conf'
+ExecStart=/usr/bin/consul agent -config-file=/tmp/consul.conf
+
+[Install]
+WantedBy=multi-user.target
-- 
2.7.4


