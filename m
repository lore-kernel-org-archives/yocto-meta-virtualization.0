Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 318BCE00D04; Fri,  3 Nov 2017 23:57:24 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=BAYES_00, DATE_IN_FUTURE_06_12
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 1.9 DATE_IN_FUTURE_06_12 Date: is 6 to 12 hours after
	Received: date
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BCAF4E00D1E
	for <meta-virtualization@yoctoproject.org>;
	Fri,  3 Nov 2017 23:57:20 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="29892834"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 04 Nov 2017 14:56:16 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 9D93A48089C1
	for <meta-virtualization@yoctoproject.org>;
	Sat,  4 Nov 2017 14:56:16 +0800 (CST)
Received: from localhost.localdomain (10.167.225.116) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Sat, 4 Nov 2017 14:56:15 +0800
From: zhengrq <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Sat, 4 Nov 2017 23:52:08 +0800
Message-ID: <1509810728-19704-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.116]
X-yoursite-MailScanner-ID: 9D93A48089C1.A82B0
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
Subject: [meta-cloud-services][PATCH]python-heatclient: upgrade to 1.9.0
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
X-List-Received-Date: Sat, 04 Nov 2017 06:57:24 -0000
Content-Type: text/plain

Upgrade python-heatclient from 0.6.0 to 1.9.0.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 meta-openstack/recipes-devtools/python/python-heatclient_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-openstack/recipes-devtools/python/python-heatclient_git.bb b/meta-openstack/recipes-devtools/python/python-heatclient_git.bb
index 26d86be..6653b37 100644
--- a/meta-openstack/recipes-devtools/python/python-heatclient_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-heatclient_git.bb
@@ -28,8 +28,8 @@ SRCNAME = "heatclient"
 
 SRC_URI = "git://github.com/openstack/python-heatclient.git;branch=master"
 
-PV = "0.6.0+git${SRCPV}"
-SRCREV = "7cca8394b8ab2f4dccb982ae789b1b2985627115"
+PV = "1.9.0+git${SRCPV}"
+SRCREV = "b80166d848dd26718cfe0627bfec22774213616b"
 S = "${WORKDIR}/git"
 
 inherit setuptools
-- 
2.7.4




