Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8A490E00D89; Thu,  8 Aug 2019 19:58:45 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CF079E00C87
	for <meta-virtualization@yoctoproject.org>;
	Thu,  8 Aug 2019 19:58:44 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.64,363,1559491200"; d="scan'208";a="73272235"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 09 Aug 2019 10:58:42 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 128794CDFCF5
	for <meta-virtualization@yoctoproject.org>;
	Fri,  9 Aug 2019 10:58:44 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 9 Aug 2019 10:58:44 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Fri, 9 Aug 2019 10:58:01 +0800
Message-ID: <20190809025801.24125-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 128794CDFCF5.AE2D6
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Subject: [PATCH] python-manilaclient: upgrade 1.4.0 -> 1.27.0
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
X-List-Received-Date: Fri, 09 Aug 2019 02:58:45 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-openstack/recipes-devtools/python/python-manilaclient_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-openstack/recipes-devtools/python/python-manilaclient_git.bb b/meta-openstack/recipes-devtools/python/python-manilaclient_git.bb
index d547717..f733d56 100644
--- a/meta-openstack/recipes-devtools/python/python-manilaclient_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-manilaclient_git.bb
@@ -33,8 +33,8 @@ RDEPENDS_${PN} +=" \
 SRCNAME = "manilaclient"
 SRC_URI = "git://github.com/openstack/${BPN}.git;branch=master"
 
-PV = "1.4.0+git${SRCPV}"
-SRCREV = "0bbd2144f701df3408b1435b16611c2ba3c22221"
+PV = "1.27.0+git${SRCPV}"
+SRCREV = "07564879ae4bdcb73e856b3aedcb79e4420fa7eb"
 S = "${WORKDIR}/git"
 
 inherit setuptools rmargparse
-- 
2.7.4




