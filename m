Return-Path: <Qi.Chen@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 64843E00C81; Sun,  4 Aug 2019 23:02:49 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [192.103.53.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 11BAFE003C1
	for <meta-virtualization@yoctoproject.org>;
	Sun,  4 Aug 2019 23:02:49 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x7562S2f028341
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Sun, 4 Aug 2019 23:02:38 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Sun, 4 Aug 2019 23:02:17 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 5 Aug 2019 14:01:43 +0800
Message-ID: <20190805060143.24108-4-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190805060143.24108-1-Qi.Chen@windriver.com>
References: <20190805060143.24108-1-Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] runc-opencontainers: respect GOBUILDFLAGS
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
X-List-Received-Date: Mon, 05 Aug 2019 06:02:49 -0000
Content-Type: text/plain

Include patch to respect GOBUILDFLAGS to avoid compilation failure
on mips archs.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-containers/runc/runc-opencontainers_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-containers/runc/runc-opencontainers_git.bb b/recipes-containers/runc/runc-opencontainers_git.bb
index 76ab794..e51758c 100644
--- a/recipes-containers/runc/runc-opencontainers_git.bb
+++ b/recipes-containers/runc/runc-opencontainers_git.bb
@@ -3,5 +3,6 @@ include runc.inc
 SRCREV = "652297c7c7e6c94e8d064ad5916c32891a6fd388"
 SRC_URI = " \
     git://github.com/opencontainers/runc;branch=master \
+    file://0001-Makefile-respect-GOBUILDFLAGS.patch \
     "
 RUNC_VERSION = "1.0.0-rc8"
-- 
2.17.1


