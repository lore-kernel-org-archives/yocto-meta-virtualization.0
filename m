Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 47874E004D8; Fri, 10 Feb 2017 07:44:39 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E2F53E004D8
	for <meta-virtualization@yoctoproject.org>;
	Fri, 10 Feb 2017 07:44:37 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v1AFiauv026375
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Fri, 10 Feb 2017 07:44:36 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 10 Feb 2017 07:44:35 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Fri, 10 Feb 2017 10:44:27 -0500
Message-ID: <1486741468-4476-2-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1486741468-4476-1-git-send-email-mark.asselstine@windriver.com>
References: <1486741468-4476-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [PATCH 1/2] containerd: uprev to version required by docker 1.13.0
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
X-List-Received-Date: Fri, 10 Feb 2017 15:44:39 -0000
Content-Type: text/plain

Docker defines required dependency versions in its vendor.conf
file. These can also be validated by running 'docker info' on the
running system. In order to avoid issues, such as the current one
where docker can't run containers, we need to ensure we match these
versions. Uprev containerd to the version defined in docker's
vendor.conf file.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 recipes-containers/containerd/containerd_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-containers/containerd/containerd_git.bb b/recipes-containers/containerd/containerd_git.bb
index 5b94dde..67011a3 100644
--- a/recipes-containers/containerd/containerd_git.bb
+++ b/recipes-containers/containerd/containerd_git.bb
@@ -4,9 +4,9 @@ DESCRIPTION = "containerd is a daemon to control runC, built for performance and
                containerd leverages runC's advanced features such as seccomp and user namespace \
                support as well as checkpoint and restore for cloning and live migration of containers."
 
-SRCREV = "0ac3cd1be170d180b2baed755e8f0da547ceb267"
+SRCREV = "03e5862ec0d8d3b3f750e19fca3ee367e13c090e"
 SRC_URI = "\
-	git://github.com/docker/containerd.git;nobranch=1 \
+	git://github.com/docker/containerd.git;branch=docker-1.13.x \
 	"
 
 # Apache-2.0 for containerd
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.code;md5=aadc30f9c14d876ded7bedc0afd2d3d7"
 
 S = "${WORKDIR}/git"
 
-CONTAINERD_VERSION = "0.2.2"
+CONTAINERD_VERSION = "0.2.3"
 PV = "${CONTAINERD_VERSION}+git${SRCREV}"
 
 DEPENDS = "go-cross-${TARGET_ARCH} \
-- 
2.7.4


