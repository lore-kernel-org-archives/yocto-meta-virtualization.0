Return-Path: <Jianchuan.Wang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 60336E00349; Tue,  1 Dec 2015 22:09:54 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A3480E00321
	for <meta-virtualization@yoctoproject.org>;
	Tue,  1 Dec 2015 22:09:52 -0800 (PST)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tB269pB0021009
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 1 Dec 2015 22:09:51 -0800
Received: from PEK-JWANG7-D1.wrs.com (128.224.162.210) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Tue, 1 Dec 2015 22:09:51 -0800
From: <jianchuan.wang@windriver.com>
To: <bruce.ashfield@windriver.com>, <meta-virtualization@yoctoproject.org>
Date: Wed, 2 Dec 2015 14:09:35 +0800
Message-ID: <1449036575-9369-1-git-send-email-jianchuan.wang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] protobuf-c: Inherit pkgconfig
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
X-List-Received-Date: Wed, 02 Dec 2015 06:09:54 -0000
Content-Type: text/plain

From: Jianchuan Wang <jianchuan.wang@windriver.com>

Finding the libprotobuf.* incorrectly if the host have pkgconfig

Signed-off-by: Jianchuan Wang <jianchuan.wang@windriver.com>
---
 recipes-containers/criu/protobuf-c_1.1.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/criu/protobuf-c_1.1.1.bb b/recipes-containers/criu/protobuf-c_1.1.1.bb
index 2800f12..0d03ebe 100644
--- a/recipes-containers/criu/protobuf-c_1.1.1.bb
+++ b/recipes-containers/criu/protobuf-c_1.1.1.bb
@@ -15,7 +15,7 @@ SRC_URI[sha256sum] = "09c5bb187b7a8e86bc0ff860f7df86370be9e8661cdb99c1072dcdab07
 SRC_URI = "https://github.com/protobuf-c/protobuf-c/releases/download/v1.1.1/protobuf-c-1.1.1.tar.gz "
 SRC_URI_append_class-target ="file://0001-protobuf-c-Remove-the-rules-which-depend-on-the-nati.patch"
 
-inherit autotools
+inherit autotools pkgconfig
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
1.9.1


