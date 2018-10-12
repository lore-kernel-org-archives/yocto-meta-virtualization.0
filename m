Return-Path: <Mingli.Yu@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EDB88E00B6C; Fri, 12 Oct 2018 01:17:09 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8852FE00AC8
	for <meta-virtualization@yoctoproject.org>;
	Fri, 12 Oct 2018 01:17:09 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w9C8FqMM023352
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 12 Oct 2018 01:16:03 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Fri, 12 Oct 2018 01:15:18 -0700
From: <mingli.yu@windriver.com>
To: <bruce.ashfield@gmail.com>, <meta-virtualization@yoctoproject.org>
Date: Fri, 12 Oct 2018 16:15:15 +0800
Message-ID: <1539332115-342326-2-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1539332115-342326-1-git-send-email-mingli.yu@windriver.com>
References: <1539332115-342326-1-git-send-email-mingli.yu@windriver.com>
MIME-Version: 1.0
Subject: [meta-cloud-services][PATCH v2 2/2] librdmacm: Update SRC_URI
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
X-List-Received-Date: Fri, 12 Oct 2018 08:17:10 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

Update SRC_URI for librdmacm as the
previous one is invalid.

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 recipes-extended/librdmacm/librdmacm_1.0.17.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/librdmacm/librdmacm_1.0.17.bb b/recipes-extended/librdmacm/librdmacm_1.0.17.bb
index 40cacdc..0ece665 100644
--- a/recipes-extended/librdmacm/librdmacm_1.0.17.bb
+++ b/recipes-extended/librdmacm/librdmacm_1.0.17.bb
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=39cc3044d68741f9005da73e9b92db95"
 DEPENDS = "virtual/libibverbs"
 
 # Repo is at http://git.openfabrics.org/git?p=~shefty/librdmacm.git
-SRC_URI = "http://www.openfabrics.org/downloads/rdmacm/${BPN}-${PV}.tar.gz \
+SRC_URI = "https://www.openfabrics.org/downloads/rdmacm/${BPN}-${PV}.tar.gz \
            file://librdmacm-needs-libdl.patch"
 
 SRC_URI[md5sum] = "da6fad887e9c24cb01b74b75f8449cb1"
-- 
2.7.4


