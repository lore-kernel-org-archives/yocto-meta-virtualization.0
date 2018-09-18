Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0266EE00BB3; Tue, 18 Sep 2018 13:29:08 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [192.103.53.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 47345E0095C
	for <meta-virtualization@yoctoproject.org>;
	Tue, 18 Sep 2018 13:28:52 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w8IKSVq3017438
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 18 Sep 2018 13:28:41 -0700
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Tue, 18 Sep 2018 13:28:21 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 18 Sep 2018 16:27:31 -0400
Message-ID: <1537302451-32569-7-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1537302451-32569-1-git-send-email-mark.asselstine@windriver.com>
References: <1537302451-32569-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Subject: [m-c-s][PATCH 6/6] consul-migrate: update to use go.bbclass
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
X-List-Received-Date: Tue, 18 Sep 2018 20:29:08 -0000
Content-Type: text/plain

We do not want meta-cloud-services to depend on meta-overc so we
switch to use the go.bbclass which is now part of oe-core/yocto. We
also capture all the licenses for all source packages which are
included in consul-migrate and adjust paths to account for the
different handling of go.bbclass vs. golang.bbclass.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 recipes-connectivity/consul/consul-migrate_git.bb | 36 ++++++++++++-----------
 1 file changed, 19 insertions(+), 17 deletions(-)

diff --git a/recipes-connectivity/consul/consul-migrate_git.bb b/recipes-connectivity/consul/consul-migrate_git.bb
index 935d663..8419cb8 100644
--- a/recipes-connectivity/consul/consul-migrate_git.bb
+++ b/recipes-connectivity/consul/consul-migrate_git.bb
@@ -1,12 +1,14 @@
 SUMMARY = "Provides data migration for Consul server nodes"
 HOMEPAGE = "https://github.com/hashicorp/consul-migrate"
-LICENSE = "MPL-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=b278a92d2c1509760384428817710378"
+LICENSE = "BSD & MPL-2.0 & MIT"
+LIC_FILES_CHKSUM = "file://src/github.com/hashicorp/consul-migrate/LICENSE;md5=b278a92d2c1509760384428817710378"
 
-PKG_NAME = "github.com/hashicorp/consul-migrate"
-SRC_URI = "git://${PKG_NAME}.git"
+GO_IMPORT = "github.com/hashicorp/consul-migrate"
+SRC_URI = "git://${GO_IMPORT}.git"
 SRCREV = "678fb10cdeae25ab309e99e655148f0bf65f9710"
 
+S = "${WORKDIR}/git"
+
 SRCREV_raft = "057b893fd996696719e98b6c44649ea14968c811"
 SRCREV_go-metrics = "f303b03b91d770a11a39677f1d3b55da4002bbcb"
 SRCREV_raft-boltdb = "d1e82c1ec3f15ee991f7cc7ffd5b67ff6f5bbaee"
@@ -25,18 +27,18 @@ SRC_URI += " \
    git://github.com/hashicorp/go-msgpack;name=go-msgpack;destsuffix=git/src/github.com/hashicorp/go-msgpack \
 "
 
-inherit golang
-
-SYSROOT_PREPROCESS_FUNCS += "consul_migrate_sysroot_preprocess"
+inherit go
 
-export GOROOT="${STAGING_DIR_NATIVE}/${nonarch_libdir}/${HOST_SYS}/go"
+# GO packages shouldn't rely on external libs, but this one will
+# not build without this.
+LDFLAGS += "-lpthread"
 
-consul_migrate_sysroot_preprocess () {
-    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
-    cp -a ${D}${prefix}/local/go/src/${PKG_NAME} ${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
-    install -d ${SYSROOT_DESTDIR}${prefix}/bin
-    cp -a ${D}${prefix}/bin/* ${SYSROOT_DESTDIR}${prefix}/bin/
-}
-
-CLEANBROKEN = "1"
-INSANE_SKIP_${PN} = "ldflags"
+GO_INSTALL_FILTEROUT = " \
+   github.com/hashicorp/raft \
+   github.com/armon/go-metrics \
+   github.com/hashicorp/raft-boltdb \
+   github.com/hashicorp/raft-mdb \
+   github.com/armon/gomdb \
+   github.com/boltdb/bolt \
+   github.com/hashicorp/go-msgpack \
+"
-- 
2.7.4


