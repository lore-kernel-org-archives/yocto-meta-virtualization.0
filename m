Return-Path: <yuanc.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9C85DE00D89; Tue, 17 Sep 2019 02:49:13 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B44C6E00D59
	for <meta-virtualization@yoctoproject.org>;
	Tue, 17 Sep 2019 02:49:12 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.64,515,1559491200"; d="scan'208";a="75578962"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 17 Sep 2019 17:49:10 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 358E64CE032B
	for <meta-virtualization@yoctoproject.org>;
	Tue, 17 Sep 2019 17:48:50 +0800 (CST)
Received: from localhost.localdomain (10.167.225.21) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Tue, 17 Sep 2019 17:49:11 +0800
From: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 17 Sep 2019 18:48:46 +0900
Message-ID: <20190917094846.64815-1-yuanc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
X-Originating-IP: [10.167.225.21]
X-yoursite-MailScanner-ID: 358E64CE032B.AF0D8
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yuanc.fnst@cn.fujitsu.com
Subject: [PATCH] python-manilaclient: upgrade 1.28.0 -> 1.29.0
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
X-List-Received-Date: Tue, 17 Sep 2019 09:49:13 -0000
Content-Type: text/plain

Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-manilaclient_git.bb        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-openstack/recipes-devtools/python/python-manilaclient_git.bb b/meta-openstack/recipes-devtools/python/python-manilaclient_git.bb
index a64c4d4..6984a9e 100644
--- a/meta-openstack/recipes-devtools/python/python-manilaclient_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-manilaclient_git.bb
@@ -33,8 +33,8 @@ RDEPENDS_${PN} +=" \
 SRCNAME = "manilaclient"
 SRC_URI = "git://github.com/openstack/${BPN}.git;branch=master"
 
-PV = "1.28.0+git${SRCPV}"
-SRCREV = "3e3dfb1d5a401fb0e0003c6fab0a41bd3479b7c8"
+PV = "1.29.0+git${SRCPV}"
+SRCREV = "1b2cafb008bee70242b68a03212bcc575df683b9"
 S = "${WORKDIR}/git"
 
 inherit setuptools rmargparse
-- 
2.17.1




