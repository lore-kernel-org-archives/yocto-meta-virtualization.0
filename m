Return-Path: <Zhe.He@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DBA9EE00BDC; Wed, 21 Jun 2017 22:31:55 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4FF09E00BD0
	for <meta-virtualization@yoctoproject.org>;
	Wed, 21 Jun 2017 22:31:54 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v5M5VsH3013908
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 21 Jun 2017 22:31:54 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Wed, 21 Jun 2017 22:31:53 -0700
From: <zhe.he@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 22 Jun 2017 13:25:09 +0800
Message-ID: <1498109109-12828-2-git-send-email-zhe.he@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1498109109-12828-1-git-send-email-zhe.he@windriver.com>
References: <1498109109-12828-1-git-send-email-zhe.he@windriver.com>
MIME-Version: 1.0
Subject: [PATCH] criu: add bash rdepends
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
X-List-Received-Date: Thu, 22 Jun 2017 05:31:55 -0000
Content-Type: text/plain

From: He Zhe <zhe.he@windriver.com>

Fix the following QA warning:
QA Issue: /usr/libexec/criu/scripts/systemd-autofs-restart.sh contained
in package criu requires /bin/bash, but no providers found in
RDEPENDS_criu? [file-rdeps]

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 recipes-containers/criu/criu_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-containers/criu/criu_git.bb b/recipes-containers/criu/criu_git.bb
index 29f136a..849a832 100644
--- a/recipes-containers/criu/criu_git.bb
+++ b/recipes-containers/criu/criu_git.bb
@@ -28,6 +28,7 @@ SRC_URI = "git://github.com/xemul/criu.git;protocol=git \
 COMPATIBLE_HOST = "(x86_64|arm|aarch64).*-linux"
 
 DEPENDS += "libnl libcap protobuf-c-native protobuf-c util-linux-native libbsd"
+RDEPENDS_${PN} = "bash"
 
 S = "${WORKDIR}/git"
 
-- 
2.8.1


