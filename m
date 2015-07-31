Return-Path: <leimaohui@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 365A8E00B59; Fri, 31 Jul 2015 01:39:01 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 065E2E00B1A
	for <meta-virtualization@yoctoproject.org>;
	Fri, 31 Jul 2015 01:38:55 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="99115570"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 31 Jul 2015 16:42:27 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t6V8b28s003777
	for <meta-virtualization@yoctoproject.org>;
	Fri, 31 Jul 2015 16:37:02 +0800
Received: from localhost.localdomain (10.167.226.26) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 31 Jul 2015 16:38:54 +0800
From: Lei Maohui <leimaohui@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Fri, 31 Jul 2015 16:38:13 +0800
Message-ID: <1438331894-19319-1-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.26]
Subject: [PATCH] python-testscenarios: upgrade 0.4 -> 0.5.0
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
X-List-Received-Date: Fri, 31 Jul 2015 08:39:01 -0000
Content-Type: text/plain

Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
---
 .../{python-testscenarios_0.4.bb => python-testscenarios_0.5.0.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-testscenarios_0.4.bb => python-testscenarios_0.5.0.bb} (76%)

diff --git a/meta-openstack/recipes-devtools/python/python-testscenarios_0.4.bb b/meta-openstack/recipes-devtools/python/python-testscenarios_0.5.0.bb
similarity index 76%
rename from meta-openstack/recipes-devtools/python/python-testscenarios_0.4.bb
rename to meta-openstack/recipes-devtools/python/python-testscenarios_0.5.0.bb
index fe652b2..34c241b 100644
--- a/meta-openstack/recipes-devtools/python/python-testscenarios_0.4.bb
+++ b/meta-openstack/recipes-devtools/python/python-testscenarios_0.5.0.bb
@@ -9,8 +9,8 @@ PR = "r0"
 SRCNAME = "testscenarios"
 SRC_URI = "https://pypi.python.org/packages/source/t/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "433cb8cd4d444b0deded3787240ee586"
-SRC_URI[sha256sum] = "4feeee84f7fd8a6258fc00671e1521f80cb68d2fec1e2908b3ab52bcf396e198"
+SRC_URI[md5sum] = "859073d9e7b049aee2e6704c51f6001a"
+SRC_URI[sha256sum] = "c257cb6b90ea7e6f8fef3158121d430543412c9a87df30b5dde6ec8b9b57a2b6"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
1.8.4.2


