Return-Path: <pascal.bach@siemens.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9B23DE00873; Fri,  6 Apr 2018 06:42:18 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.35.17.2 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 606B9E005A9
	for <meta-virtualization@yoctoproject.org>;
	Fri,  6 Apr 2018 06:42:16 -0700 (PDT)
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id w36DgFGr007896
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Fri, 6 Apr 2018 15:42:15 +0200
Received: from dev.vm6.ccp.siemens.com (MD1FZU9C.ad001.siemens.net
	[139.16.79.111])
	by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id w36DgFlS008609;
	Fri, 6 Apr 2018 15:42:15 +0200
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id C533210D5951;
	Fri,  6 Apr 2018 15:42:14 +0200 (CEST)
From: Pascal Bach <pascal.bach@siemens.com>
To: meta-virtualization@yoctoproject.org
Date: Fri,  6 Apr 2018 15:41:55 +0200
Message-Id: <20180406134156.21533-1-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/2] docker-proxy: add recipe for docker-proxy
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
X-List-Received-Date: Fri, 06 Apr 2018 13:42:18 -0000

Before docker-proxy was built as part of the docker-recipe but there
in some situations when built for x86_64 under x86_64 it incorrectly
linked against host libraries.
This puts it into a separate recipe that makes use the go.bbclass to build
the binary properly.

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 recipes-containers/docker/docker-proxy_git.bb | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 recipes-containers/docker/docker-proxy_git.bb

diff --git a/recipes-containers/docker/docker-proxy_git.bb b/recipes-containers/docker/docker-proxy_git.bb
new file mode 100644
index 0000000..4271e58
--- /dev/null
+++ b/recipes-containers/docker/docker-proxy_git.bb
@@ -0,0 +1,21 @@
+DESCRIPTION = "Docker proxy binary to forward traffic between host and containers"
+HOMEPAGE = "https://github.com/docker/libnetwork"
+
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://src/github.com/docker/libnetwork/LICENSE;md5=d2794c0df5b907fdace235a619d80314"
+
+SRC_URI = "git://${GO_IMPORT}"
+SRCREV = "4cb38c2987c236dce03c868d99b57b1e28a4b81c"
+
+GO_IMPORT = "github.com/docker/libnetwork"
+GO_INSTALL = "${GO_IMPORT}/cmd/proxy"
+
+DOCKER_VERSION = "18.03.0"
+PV = "${DOCKER_VERSION}+git${SRCREV}"
+
+inherit go
+
+# The binary is expected to be called docker-proxy
+do_install_append() {
+    mv ${D}${bindir}/proxy ${D}${bindir}/${BPN}
+}
-- 
2.11.0


