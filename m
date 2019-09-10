Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 51F0BE00DFA; Mon,  9 Sep 2019 19:00:01 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3F3EAE00DCE
	for <meta-virtualization@yoctoproject.org>;
	Mon,  9 Sep 2019 18:59:45 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.64,487,1559491200"; d="scan'208";a="75193097"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 10 Sep 2019 09:59:43 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 412D84CE14E1
	for <meta-virtualization@yoctoproject.org>;
	Tue, 10 Sep 2019 09:59:35 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Tue, 10 Sep 2019 09:59:44 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 10 Sep 2019 09:59:11 +0800
Message-ID: <20190910015911.21816-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 412D84CE14E1.A914C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Subject: [PATCH] python-zaqarclient: upgrade 1.11.0 -> 1.12.0
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
X-List-Received-Date: Tue, 10 Sep 2019 02:00:01 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-openstack/recipes-devtools/python/python-zaqarclient_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-openstack/recipes-devtools/python/python-zaqarclient_git.bb b/meta-openstack/recipes-devtools/python/python-zaqarclient_git.bb
index e6f92f7..699d380 100644
--- a/meta-openstack/recipes-devtools/python/python-zaqarclient_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-zaqarclient_git.bb
@@ -30,8 +30,8 @@ RDEPENDS_${PN} +=" \
 SRCNAME = "zaqarclient"
 SRC_URI = "git://github.com/openstack/${BPN}.git"
 
-PV = "1.11.0+git${SRCPV}"
-SRCREV = "13e90a0ab5e296fb8cf21d09c666c06ed47a84c0"
+PV = "1.12.0+git${SRCPV}"
+SRCREV = "9038bf6ba93c24c9a61447dfcb14e436f1267066"
 S = "${WORKDIR}/git"
 
 inherit setuptools
-- 
2.7.4




