Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1169FE00D9D; Tue, 13 Aug 2019 18:54:50 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 720A4E00C81
	for <meta-virtualization@yoctoproject.org>;
	Tue, 13 Aug 2019 18:54:48 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.64,382,1559491200"; d="scan'208";a="73608095"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 14 Aug 2019 09:54:45 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id EFA184CE0332
	for <meta-virtualization@yoctoproject.org>;
	Wed, 14 Aug 2019 09:54:45 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 14 Aug 2019 09:54:53 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 14 Aug 2019 09:54:08 +0800
Message-ID: <20190814015408.15372-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: EFA184CE0332.AB432
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Subject: [PATCH] python-barbicanclient: upgrade 4.5.2 -> 4.8.1
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
X-List-Received-Date: Wed, 14 Aug 2019 01:54:50 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Yuan Chao <yuanc.fnst@cn.fujitsu.com>

Unable to find version 4.8.1 in branch stable/pike.
Change branch to master.

Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
---
 meta-openstack/recipes-devtools/python/python-barbicanclient_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-openstack/recipes-devtools/python/python-barbicanclient_git.bb b/meta-openstack/recipes-devtools/python/python-barbicanclient_git.bb
index 2d57158..3c5043b 100644
--- a/meta-openstack/recipes-devtools/python/python-barbicanclient_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-barbicanclient_git.bb
@@ -5,11 +5,11 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e031cff4528978748f9cc064c6e6fa73"
 
 SRC_URI = "\
-	git://github.com/openstack/python-barbicanclient.git;branch=stable/pike \
+	git://github.com/openstack/python-barbicanclient.git \
 	"
 
-PV = "4.5.2+git${SRCPV}"
-SRCREV = "775de93a612db866bb39ba6828f3e7bd1aa3c9f5"
+PV = "4.8.1+git${SRCPV}"
+SRCREV = "1b282358166fe4c1d4dea896bd336b2850584f56"
 S = "${WORKDIR}/git"
 
 inherit setuptools
-- 
2.7.4




