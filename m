Return-Path: <hongl.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CFC5DE00B47; Tue, 18 Sep 2018 02:36:42 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [183.91.158.132 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0462EE00B45
	for <meta-virtualization@yoctoproject.org>;
	Tue, 18 Sep 2018 02:36:41 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="45056879"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 18 Sep 2018 17:36:38 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 726EE4B6EC90
	for <meta-virtualization@yoctoproject.org>;
	Tue, 18 Sep 2018 17:36:38 +0800 (CST)
Received: from localhost.local (10.167.225.78) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.408.0; Tue, 18 Sep 2018 17:36:37 +0800
From: Hong Liu <hongl.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 18 Sep 2018 17:36:31 +0800
Message-ID: <20180918093631.1253-3-hongl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180918093631.1253-1-hongl.fnst@cn.fujitsu.com>
References: <20180918093631.1253-1-hongl.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.78]
X-yoursite-MailScanner-ID: 726EE4B6EC90.A1393
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: hongl.fnst@cn.fujitsu.com
Subject: [PATCH] [meta-cloud-services][patch]:python-swiftclient:3.5.0->3.6.0
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
X-List-Received-Date: Tue, 18 Sep 2018 09:36:42 -0000
Content-Type: text/plain

Upgrade python-swiftclient from 3.5.0 to 3.6.0.

Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
---
 meta-openstack/recipes-devtools/python/python-swiftclient_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-openstack/recipes-devtools/python/python-swiftclient_git.bb b/meta-openstack/recipes-devtools/python/python-swiftclient_git.bb
index f668155..0ee9680 100644
--- a/meta-openstack/recipes-devtools/python/python-swiftclient_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-swiftclient_git.bb
@@ -9,8 +9,8 @@ SRCNAME = "swiftclient"
 
 SRC_URI = "git://github.com/openstack/python-swiftclient.git;branch=master"
 
-PV = "3.5.0+git${SRCPV}"
-SRCREV = "b91651eba09ed43903c55f24e3a1a52aefeea75f"
+PV = "3.6.0+git${SRCPV}"
+SRCREV = "1cf074f4da62b7a42f88aef3c8571e7b6e850823"
 S = "${WORKDIR}/git"
 
 inherit setuptools python-dir
-- 
2.7.4




