Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 57CBBE00BD6; Fri, 20 Jan 2017 00:22:59 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CFC98E00B6C
	for <meta-virtualization@yoctoproject.org>;
	Fri, 20 Jan 2017 00:22:55 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="14947008"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 20 Jan 2017 16:22:54 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 73A0247B1502
	for <meta-virtualization@yoctoproject.org>;
	Fri, 20 Jan 2017 16:22:54 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Fri, 20 Jan 2017 16:22:55 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Fri, 20 Jan 2017 16:22:35 +0800
Message-ID: <1484900555-1364-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: 73A0247B1502.A3F48
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
Subject: [meta-cloud-services] [PATCH] python-swiftclient: 2.4.0 -> 3.2.0
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
X-List-Received-Date: Fri, 20 Jan 2017 08:22:59 -0000
Content-Type: text/plain

Upgrade python-swiftclient from 2.4.0 to 3.2.0.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 meta-openstack/recipes-devtools/python/python-swiftclient_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-openstack/recipes-devtools/python/python-swiftclient_git.bb b/meta-openstack/recipes-devtools/python/python-swiftclient_git.bb
index 5f423c4..2d5f83b 100644
--- a/meta-openstack/recipes-devtools/python/python-swiftclient_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-swiftclient_git.bb
@@ -9,8 +9,8 @@ SRCNAME = "swiftclient"
 
 SRC_URI = "git://github.com/openstack/python-swiftclient.git;branch=master"
 
-PV = "2.4.0+git${SRCPV}"
-SRCREV = "c9f79e641c6906e95095f3e0e505f9bd3f715bc2"
+PV = "3.2.0+git${SRCPV}"
+SRCREV = "5a620f83e88d1b52e013cedff4bc266bcf3c292a"
 S = "${WORKDIR}/git"
 
 inherit setuptools python-dir
-- 
2.7.4




