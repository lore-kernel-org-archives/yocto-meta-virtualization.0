Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web09.249.1576100533637490753
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 11 Dec 2019 13:42:13 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: linux.intel.com, ip: 192.55.52.115, mailfrom: timothy.t.orling@linux.intel.com)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 11 Dec 2019 13:42:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,303,1571727600"; 
   d="scan'208";a="220545063"
Received: from wrath.jf.intel.com ([10.54.31.24])
  by fmsmga001.fm.intel.com with ESMTP; 11 Dec 2019 13:42:07 -0800
From: "Tim Orling" <timothy.t.orling@linux.intel.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Tim Orling <timothy.t.orling@linux.intel.com>
Subject: [meta-virtualization][m-c-s][PATCH] hashicorp-serf: add recipe for 0.8.5
Date: Wed, 11 Dec 2019 13:42:02 -0800
Message-Id: <20191211214202.19210-1-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Serf is a decentralized solution for service discovery and orchestration that
is lightweight, highly available, and fault tolerant.

Vendor licenses are included in serf-vendor-licenses.inc, to make
the main recipe shorter/easier to read.

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 .../serf/hashicorp-serf_0.8.5.bb              | 32 +++++++++++++++++++
 .../serf/serf-vendor-licenses.inc             | 32 +++++++++++++++++++
 2 files changed, 64 insertions(+)
 create mode 100644 recipes-connectivity/serf/hashicorp-serf_0.8.5.bb
 create mode 100644 recipes-connectivity/serf/serf-vendor-licenses.inc

diff --git a/recipes-connectivity/serf/hashicorp-serf_0.8.5.bb b/recipes-connectivity/serf/hashicorp-serf_0.8.5.bb
new file mode 100644
index 0000000..0b1517b
--- /dev/null
+++ b/recipes-connectivity/serf/hashicorp-serf_0.8.5.bb
@@ -0,0 +1,32 @@
+SUMMARY = "Decentralized Cluster Membership, Failure Detection, and Orchestration." 
+DESCRIPTION = "Serf is a decentralized solution for service discovery and \
+orchestration that is lightweight, highly available, and fault tolerant.\
+\
+Serf runs on Linux, Mac OS X, and Windows. An efficient and lightweight gossip \
+protocol is used to communicate with other nodes. Serf can detect node failures \
+and notify the rest of the cluster. An event system is built on top of Serf, \
+letting you use Serf's gossip protocol to propagate events such as deploys, \
+configuration changes, etc. Serf is completely masterless with no single point \
+of failure."
+HOMEPAGE = "https://www.serf.io/"
+SECTION = "network"
+
+LICENSE = "Apache-2.0 & BSD-3-Clause & MIT & MPL-2.0"
+LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/LICENSE;md5=b278a92d2c1509760384428817710378"
+
+require serf-vendor-licenses.inc
+
+GO_IMPORT = "github.com/hashicorp/serf"
+SRC_URI = "git://${GO_IMPORT}.git;protocol=https"
+
+PV = "0.8.5+git${SRCPV}"
+SRCREV = "1d3fdf93bbe5002c5023da50402368a817488691"
+
+S = "${WORKDIR}/git"
+
+inherit go
+
+RDEPENDS_${PN}-dev += "bash make"
+
+# Apache serf in oe-core is a completely different beast
+RCONFLICTS_${PN} = "serf"
diff --git a/recipes-connectivity/serf/serf-vendor-licenses.inc b/recipes-connectivity/serf/serf-vendor-licenses.inc
new file mode 100644
index 0000000..df8665a
--- /dev/null
+++ b/recipes-connectivity/serf/serf-vendor-licenses.inc
@@ -0,0 +1,32 @@
+LIC_FILES_CHKSUM += "\
+    file://src/${GO_IMPORT}/vendor/golang.org/x/crypto/LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707 \
+    file://src/${GO_IMPORT}/vendor/golang.org/x/sys/LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707 \
+    file://src/${GO_IMPORT}/vendor/golang.org/x/net/LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707 \
+    file://src/${GO_IMPORT}/vendor/github.com/google/btree/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57 \
+    file://src/${GO_IMPORT}/vendor/github.com/mitchellh/cli/LICENSE;md5=b278a92d2c1509760384428817710378 \
+    file://src/${GO_IMPORT}/vendor/github.com/mitchellh/mapstructure/LICENSE;md5=3f7765c3d4f58e1f84c4313cecf0f5bd \
+    file://src/${GO_IMPORT}/vendor/github.com/sean-/seed/LICENSE;md5=ae6a5709472e0833798453b9fa793364 \
+    file://src/${GO_IMPORT}/vendor/github.com/ryanuber/columnize/COPYING;md5=4b1989be3dc78e86f2c54cf3b03db7c9 \
+    file://src/${GO_IMPORT}/vendor/github.com/fatih/color/LICENSE.md;md5=316e6d590bdcde7993fb175662c0dd5a \
+    file://src/${GO_IMPORT}/vendor/github.com/posener/complete/LICENSE.txt;md5=6778be8533804ed9e25f746e2f0ba0ee \
+    file://src/${GO_IMPORT}/vendor/github.com/mattn/go-colorable/LICENSE;md5=24ce168f90aec2456a73de1839037245 \
+    file://src/${GO_IMPORT}/vendor/github.com/mattn/go-isatty/LICENSE;md5=f509beadd5a11227c27b5d2ad6c9f2c6 \
+    file://src/${GO_IMPORT}/vendor/github.com/miekg/dns/LICENSE;md5=147353de6868a20caa562d26eab7b3c5 \
+    file://src/${GO_IMPORT}/vendor/github.com/miekg/dns/COPYRIGHT;md5=2ba6b7bd91e16af46a856eca87db2504 \
+    file://src/${GO_IMPORT}/vendor/github.com/hashicorp/golang-lru/LICENSE;md5=f27a50d2e878867827842f2c60e30bfc \
+    file://src/${GO_IMPORT}/vendor/github.com/hashicorp/go-multierror/LICENSE;md5=d44fdeb607e2d2614db9464dbedd4094 \
+    file://src/${GO_IMPORT}/vendor/github.com/hashicorp/go-sockaddr/LICENSE;md5=9741c346eef56131163e13b9db1241b3 \
+    file://src/${GO_IMPORT}/vendor/github.com/hashicorp/errwrap/LICENSE;md5=b278a92d2c1509760384428817710378 \
+    file://src/${GO_IMPORT}/vendor/github.com/hashicorp/go-immutable-radix/LICENSE;md5=65d26fcc2f35ea6a181ac777e42db1ea \
+    file://src/${GO_IMPORT}/vendor/github.com/hashicorp/go-msgpack/LICENSE;md5=3f4c936a1236aa7f17ca2a0b0ce4bfdd \
+    file://src/${GO_IMPORT}/vendor/github.com/hashicorp/go-syslog/LICENSE;md5=cb04212e101fbbd028f325e04ad45778 \
+    file://src/${GO_IMPORT}/vendor/github.com/hashicorp/mdns/LICENSE;md5=cb04212e101fbbd028f325e04ad45778 \
+    file://src/${GO_IMPORT}/vendor/github.com/hashicorp/go.net/LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707 \
+    file://src/${GO_IMPORT}/vendor/github.com/hashicorp/memberlist/LICENSE;md5=b278a92d2c1509760384428817710378 \
+    file://src/${GO_IMPORT}/vendor/github.com/hashicorp/logutils/LICENSE;md5=b278a92d2c1509760384428817710378 \
+    file://src/${GO_IMPORT}/vendor/github.com/armon/go-metrics/LICENSE;md5=d2d77030c0183e3d1e66d26dc1f243be \
+    file://src/${GO_IMPORT}/vendor/github.com/armon/go-radix/LICENSE;md5=cb04212e101fbbd028f325e04ad45778 \
+    file://src/${GO_IMPORT}/vendor/github.com/armon/circbuf/LICENSE;md5=d2d77030c0183e3d1e66d26dc1f243be \
+    file://src/${GO_IMPORT}/vendor/github.com/bgentry/speakeasy/LICENSE;md5=adf5a740fe07eb2aa1ac54aafe2d41f2 \
+    file://src/${GO_IMPORT}/vendor/github.com/bgentry/speakeasy/LICENSE_WINDOWS;md5=b563ae7163bca24b2c0ed1486f8c944c \
+    "
-- 
2.24.0

