Return-Path: <Zhe.He@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 35715E00F9E; Sun, 22 May 2016 20:15:48 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0D5FBE00E04
	for <meta-virtualization@yoctoproject.org>;
	Sun, 22 May 2016 20:15:43 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u4N3FfjR028421
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Sun, 22 May 2016 20:15:41 -0700
Received: from PEK-ZHE-D1.wrs.com (128.224.162.234) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 22 May 2016 20:15:41 -0700
From: <zhe.he@windriver.com>
To: <bruce.ashfield@gmail.com>
Date: Mon, 23 May 2016 11:15:43 +0800
Message-ID: <1463973343-4258-1-git-send-email-zhe.he@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [PATCH] protobuf: Add RDEPENDS for ptest
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
X-List-Received-Date: Mon, 23 May 2016 03:15:48 -0000
Content-Type: text/plain

From: He Zhe <zhe.he@windriver.com>

This patch adds bash and python to ptest's RDEPENDS to avoid the following
warning:
"WARNING: QA Issue: /usr/lib64/protobuf/ptest/run-ptest_protobuf-ptest contained
in package protobuf-ptest requires /bin/bash, but no providers found in its
RDEPENDS [file-rdeps]"

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 recipes-devtools/protobuf/protobuf_2.5.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-devtools/protobuf/protobuf_2.5.0.bb b/recipes-devtools/protobuf/protobuf_2.5.0.bb
index e1c7254..23b74a7 100644
--- a/recipes-devtools/protobuf/protobuf_2.5.0.bb
+++ b/recipes-devtools/protobuf/protobuf_2.5.0.bb
@@ -22,6 +22,7 @@ EXTRA_OECONF += " --with-protoc=${STAGING_BINDIR_NATIVE}/protoc"
 inherit autotools setuptools ptest
 
 DEPENDS += "protobuf-native"
+RDEPENDS_${PN}-ptest = "bash python"
 
 PYTHON_SRC_DIR="python"
 TEST_SRC_DIR="examples"
-- 
1.9.1


