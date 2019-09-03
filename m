Return-Path: <yuanc.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6E055E00C81; Mon,  2 Sep 2019 20:11:11 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AFD53E00BF8
	for <meta-virtualization@yoctoproject.org>;
	Mon,  2 Sep 2019 20:11:10 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.64,461,1559491200"; d="scan'208";a="74739129"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 03 Sep 2019 11:10:56 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 29E814CDE64D
	for <meta-virtualization@yoctoproject.org>;
	Tue,  3 Sep 2019 11:10:55 +0800 (CST)
Received: from localhost.localdomain (10.167.225.21) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Tue, 3 Sep 2019 11:10:58 +0800
From: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 3 Sep 2019 12:10:34 +0900
Message-ID: <20190903031034.32194-1-yuanc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
X-Originating-IP: [10.167.225.21]
X-yoursite-MailScanner-ID: 29E814CDE64D.A0092
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yuanc.fnst@cn.fujitsu.com
Subject: [PATCH] python-troveclient: upgrade 2.18.0 -> 2.19.0
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
X-List-Received-Date: Tue, 03 Sep 2019 03:11:11 -0000
Content-Type: text/plain

Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-troveclient_git.bb         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-openstack/recipes-devtools/python/python-troveclient_git.bb b/meta-openstack/recipes-devtools/python/python-troveclient_git.bb
index a86fa7f..637cf9b 100644
--- a/meta-openstack/recipes-devtools/python/python-troveclient_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-troveclient_git.bb
@@ -10,8 +10,8 @@ SRC_URI = "\
 	git://github.com/openstack/python-troveclient.git;branch=master \
 	"
 
-PV = "2.18.0+git${SRCPV}"
-SRCREV = "50ac153dc53881dbb066723d77ad13092e9d15ac"
+PV = "2.19.0+git${SRCPV}"
+SRCREV = "855ca07481afbb90c6276a4ebbeb0d659b058197"
 S = "${WORKDIR}/git"
 
 inherit setuptools hosts default_configs rmargparse
-- 
2.17.1




