Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CD3E5E00D59; Tue, 13 Aug 2019 00:51:19 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [183.91.158.132 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 454BDE00927
	for <meta-virtualization@yoctoproject.org>;
	Tue, 13 Aug 2019 00:51:17 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.64,380,1559491200"; d="scan'208";a="73572745"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 13 Aug 2019 15:51:15 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id C7A624CE0326
	for <meta-virtualization@yoctoproject.org>;
	Tue, 13 Aug 2019 15:51:14 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Tue, 13 Aug 2019 15:51:12 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 13 Aug 2019 15:50:33 +0800
Message-ID: <20190813075033.7866-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: C7A624CE0326.A9C62
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Subject: [PATCH] python-zaqarclient: upgrade 0.7.0 -> 1.11.0
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
X-List-Received-Date: Tue, 13 Aug 2019 07:51:19 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Yuan Chao <yuanc.fnst@cn.fujitsu.com>

Unable to find version 1.11.0 in branch stable/pike.
Change branch to master.

Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
---
 meta-openstack/recipes-devtools/python/python-zaqarclient_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-openstack/recipes-devtools/python/python-zaqarclient_git.bb b/meta-openstack/recipes-devtools/python/python-zaqarclient_git.bb
index d3d24ea..e6f92f7 100644
--- a/meta-openstack/recipes-devtools/python/python-zaqarclient_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-zaqarclient_git.bb
@@ -28,10 +28,10 @@ RDEPENDS_${PN} +=" \
 	"
 	
 SRCNAME = "zaqarclient"
-SRC_URI = "git://github.com/openstack/${BPN}.git;branch=stable/pike"
+SRC_URI = "git://github.com/openstack/${BPN}.git"
 
-PV = "0.7.0+git${SRCPV}"
-SRCREV = "a1c2de74c56c6ddb11dc6aec78e8c438629ca8e8"
+PV = "1.11.0+git${SRCPV}"
+SRCREV = "13e90a0ab5e296fb8cf21d09c666c06ed47a84c0"
 S = "${WORKDIR}/git"
 
 inherit setuptools
-- 
2.7.4




