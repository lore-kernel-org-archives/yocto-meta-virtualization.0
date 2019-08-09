Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 72614E00D74; Thu,  8 Aug 2019 22:54:20 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [183.91.158.132 listed in list.dnswl.org]
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F1468E00CD7
	for <meta-virtualization@yoctoproject.org>;
	Thu,  8 Aug 2019 22:54:18 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.64,364,1559491200"; d="scan'208";a="73286727"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 09 Aug 2019 13:54:17 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id C30C54CDE641
	for <meta-virtualization@yoctoproject.org>;
	Fri,  9 Aug 2019 13:54:15 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 9 Aug 2019 13:54:15 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Fri, 9 Aug 2019 13:53:33 +0800
Message-ID: <20190809055333.25459-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: C30C54CDE641.A9650
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Subject: [PATCH] lxc: upgrade 3.1.0 -> 3.2.1
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
X-List-Received-Date: Fri, 09 Aug 2019 05:54:20 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Yuan Chao <yuanc.fnst@cn.fujitsu.com>

Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
---
 recipes-containers/lxc/{lxc_3.1.0.bb => lxc_3.2.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename recipes-containers/lxc/{lxc_3.1.0.bb => lxc_3.2.1.bb} (97%)

diff --git a/recipes-containers/lxc/lxc_3.1.0.bb b/recipes-containers/lxc/lxc_3.2.1.bb
similarity index 97%
rename from recipes-containers/lxc/lxc_3.1.0.bb
rename to recipes-containers/lxc/lxc_3.2.1.bb
index 977583f..585ab8f 100644
--- a/recipes-containers/lxc/lxc_3.1.0.bb
+++ b/recipes-containers/lxc/lxc_3.2.1.bb
@@ -47,8 +47,8 @@ SRC_URI = "http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
 	file://lxc-net \
 	"
 
-SRC_URI[md5sum] = "e83e302a801494276f3772e687a3b8b0"
-SRC_URI[sha256sum] = "4d8772c25baeaea2c37a954902b88c05d1454c91c887cb6a0997258cfac3fdc5"
+SRC_URI[md5sum] = "4886c8d1c8e221fe526eefcb47857b85"
+SRC_URI[sha256sum] = "5f903986a4b17d607eea28c0aa56bf1e76e8707747b1aa07d31680338b1cc3d4"
 
 S = "${WORKDIR}/${BPN}-${PV}"
 
-- 
2.7.4




