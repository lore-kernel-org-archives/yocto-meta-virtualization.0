Return-Path: <Zhe.He@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C7B1EE00BDC; Wed, 21 Jun 2017 22:31:56 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6A4A2E00BBD
	for <meta-virtualization@yoctoproject.org>;
	Wed, 21 Jun 2017 22:31:53 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v5M5VqiN004463
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 21 Jun 2017 22:31:53 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Wed, 21 Jun 2017 22:31:52 -0700
From: <zhe.he@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 22 Jun 2017 13:25:08 +0800
Message-ID: <1498109109-12828-1-git-send-email-zhe.he@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH] criu: add libbsd rdepends
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
X-List-Received-Date: Thu, 22 Jun 2017 05:31:56 -0000
Content-Type: text/plain

From: He Zhe <zhe.he@windriver.com>

Fix the following QA warning:
QA Issue: criu rdepends on libbsd, but it isn't a build dependency? [build-deps]

This had been fixed by 1fd94d853545b55173b1f0e2cf683a5d21f8cd7b,
but then was overwritten by b9b7ece0cd52966467035fb71ad9ba472bf24b88

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 recipes-containers/criu/criu_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/criu/criu_git.bb b/recipes-containers/criu/criu_git.bb
index 21dee2b..29f136a 100644
--- a/recipes-containers/criu/criu_git.bb
+++ b/recipes-containers/criu/criu_git.bb
@@ -27,7 +27,7 @@ SRC_URI = "git://github.com/xemul/criu.git;protocol=git \
 
 COMPATIBLE_HOST = "(x86_64|arm|aarch64).*-linux"
 
-DEPENDS += "libnl libcap protobuf-c-native protobuf-c util-linux-native"
+DEPENDS += "libnl libcap protobuf-c-native protobuf-c util-linux-native libbsd"
 
 S = "${WORKDIR}/git"
 
-- 
2.8.1


