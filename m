Return-Path: <Zhe.He@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DC7DCE0089B; Wed, 19 Oct 2016 20:08:28 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 58884E0080D
	for <meta-virtualization@yoctoproject.org>;
	Wed, 19 Oct 2016 20:08:26 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u9K38Qsk013923
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 19 Oct 2016 20:08:26 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Wed, 19 Oct 2016 20:08:25 -0700
From: <zhe.he@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 20 Oct 2016 10:49:18 +0800
Message-ID: <20161020024918.32049-2-zhe.he@windriver.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20161020024918.32049-1-zhe.he@windriver.com>
References: <20161020024918.32049-1-zhe.he@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] protobuf: ptest: Fix QA file-rdep warning
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
X-List-Received-Date: Thu, 20 Oct 2016 03:08:28 -0000
Content-Type: text/plain

From: He Zhe <zhe.he@windriver.com>

Add bash to ptest's RDEPENDS

"WARNING: QA Issue: /usr/lib64/protobuf/ptest/run-ptest_protobuf-ptest
contained in package protobuf-ptest requires /bin/bash, but no
providers found in its RDEPENDS [file-rdeps]"

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 recipes-devtools/protobuf/protobuf_3.0.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-devtools/protobuf/protobuf_3.0.0.bb b/recipes-devtools/protobuf/protobuf_3.0.0.bb
index 0445ae4..fd81fe7 100644
--- a/recipes-devtools/protobuf/protobuf_3.0.0.bb
+++ b/recipes-devtools/protobuf/protobuf_3.0.0.bb
@@ -24,6 +24,7 @@ EXTRA_OECONF += " --with-protoc=${STAGING_BINDIR_NATIVE}/protoc"
 inherit autotools setuptools ptest
 
 DEPENDS += "protobuf-native"
+RDEPENDS_${PN}-ptest = "bash"
 
 PYTHON_SRC_DIR="python"
 TEST_SRC_DIR="examples"
-- 
2.8.3


