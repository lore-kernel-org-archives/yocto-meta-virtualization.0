Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A0490E00D51; Sun, 15 Sep 2019 23:37:23 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 30632E00D33
	for <meta-virtualization@yoctoproject.org>;
	Sun, 15 Sep 2019 23:37:21 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.64,510,1559491200"; d="scan'208";a="75511041"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 16 Sep 2019 14:37:20 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 1D87F4CE14FB
	for <meta-virtualization@yoctoproject.org>;
	Mon, 16 Sep 2019 14:37:02 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 16 Sep 2019 14:37:30 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 16 Sep 2019 14:37:09 +0800
Message-ID: <20190916063709.5662-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 1D87F4CE14FB.A9F8E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Subject: [PATCH] python-troveclient: upgrade 2.19.0 -> 3.0.0
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
X-List-Received-Date: Mon, 16 Sep 2019 06:37:23 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-openstack/recipes-devtools/python/python-troveclient_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-openstack/recipes-devtools/python/python-troveclient_git.bb b/meta-openstack/recipes-devtools/python/python-troveclient_git.bb
index 637cf9b..e19ab4b 100644
--- a/meta-openstack/recipes-devtools/python/python-troveclient_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-troveclient_git.bb
@@ -10,8 +10,8 @@ SRC_URI = "\
 	git://github.com/openstack/python-troveclient.git;branch=master \
 	"
 
-PV = "2.19.0+git${SRCPV}"
-SRCREV = "855ca07481afbb90c6276a4ebbeb0d659b058197"
+PV = "3.0.0+git${SRCPV}"
+SRCREV = "960843de8142db6e61cc4d148a51f55862acbba0"
 S = "${WORKDIR}/git"
 
 inherit setuptools hosts default_configs rmargparse
-- 
2.7.4




