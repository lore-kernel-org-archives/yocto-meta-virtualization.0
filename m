Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D6BFEE00B33; Mon, 23 Sep 2019 23:39:54 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2B2FDE00805
	for <meta-virtualization@yoctoproject.org>;
	Mon, 23 Sep 2019 23:39:52 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.64,542,1559491200"; d="scan'208";a="75924019"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 24 Sep 2019 14:39:50 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 9A4744CDFCE9
	for <meta-virtualization@yoctoproject.org>;
	Tue, 24 Sep 2019 14:39:50 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Tue, 24 Sep 2019 14:39:51 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 24 Sep 2019 14:39:45 +0800
Message-ID: <20190924063945.7907-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 9A4744CDFCE9.AB78F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Subject: [PATCH] python-saharaclient: upgrade 0.8.0 -> 2.3.0
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
X-List-Received-Date: Tue, 24 Sep 2019 06:39:55 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-openstack/recipes-devtools/python/python-saharaclient_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-openstack/recipes-devtools/python/python-saharaclient_git.bb b/meta-openstack/recipes-devtools/python/python-saharaclient_git.bb
index 170d460..0d571c9 100644
--- a/meta-openstack/recipes-devtools/python/python-saharaclient_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-saharaclient_git.bb
@@ -22,8 +22,8 @@ SRCNAME = "saharaclient"
 
 SRC_URI = "git://github.com/openstack/python-saharaclient.git;branch=master"
 
-PV = "0.8.0+git${SRCPV}"
-SRCREV = "319ceb6acf55382218dcd971367613aecb3e4afc"
+PV = "2.3.0+git${SRCPV}"
+SRCREV = "3107b452467537f4eef3d9ecfb5e35d110d19662"
 S = "${WORKDIR}/git"
 
 inherit setuptools
-- 
2.7.4




