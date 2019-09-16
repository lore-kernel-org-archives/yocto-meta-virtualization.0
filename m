Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9F06EE00D33; Sun, 15 Sep 2019 20:56:02 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E3661E00CEE
	for <meta-virtualization@yoctoproject.org>;
	Sun, 15 Sep 2019 20:56:01 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.64,510,1559491200"; d="scan'208";a="75504944"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 16 Sep 2019 11:56:00 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 6EF644CE14EA
	for <meta-virtualization@yoctoproject.org>;
	Mon, 16 Sep 2019 11:55:43 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 16 Sep 2019 11:56:05 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 16 Sep 2019 11:55:49 +0800
Message-ID: <20190916035549.3440-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 6EF644CE14EA.AAA67
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Subject: [PATCH] python-barbicanclient: upgrade 4.8.1 -> 4.9.0
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
X-List-Received-Date: Mon, 16 Sep 2019 03:56:02 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-openstack/recipes-devtools/python/python-barbicanclient_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-openstack/recipes-devtools/python/python-barbicanclient_git.bb b/meta-openstack/recipes-devtools/python/python-barbicanclient_git.bb
index 3c5043b..a4bcdea 100644
--- a/meta-openstack/recipes-devtools/python/python-barbicanclient_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-barbicanclient_git.bb
@@ -8,8 +8,8 @@ SRC_URI = "\
 	git://github.com/openstack/python-barbicanclient.git \
 	"
 
-PV = "4.8.1+git${SRCPV}"
-SRCREV = "1b282358166fe4c1d4dea896bd336b2850584f56"
+PV = "4.9.0+git${SRCPV}"
+SRCREV = "9c0e02d367b86eb5bdebda4e0ff1434d70db5f61"
 S = "${WORKDIR}/git"
 
 inherit setuptools
-- 
2.7.4




