Return-Path: <leimaohui@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AE800E009C2; Fri, 17 Apr 2015 00:58:12 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EB1EAE0085D
	for <meta-virtualization@yoctoproject.org>;
	Fri, 17 Apr 2015 00:58:08 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="90825424"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 17 Apr 2015 15:54:16 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t3H7utIi021446
	for <meta-virtualization@yoctoproject.org>;
	Fri, 17 Apr 2015 15:56:55 +0800
Received: from localhost.localdomain (10.167.226.48) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 17 Apr 2015 15:58:10 +0800
From: Lei Maohui <leimaohui@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Fri, 17 Apr 2015 15:58:01 +0800
Message-ID: <1429257481-45153-1-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.48]
Subject: [PATCH v2] python-psycopg2_2.5: The license should be LGPLv3+
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
X-List-Received-Date: Fri, 17 Apr 2015 07:58:12 -0000
Content-Type: text/plain

Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
---
 meta-openstack/recipes-devtools/python/python-psycopg2_2.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-openstack/recipes-devtools/python/python-psycopg2_2.5.bb b/meta-openstack/recipes-devtools/python/python-psycopg2_2.5.bb
index c93e62b..e1b7c02 100644
--- a/meta-openstack/recipes-devtools/python/python-psycopg2_2.5.bb
+++ b/meta-openstack/recipes-devtools/python/python-psycopg2_2.5.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Python-PostgreSQL Database Adapter"
 HOMEPAGE = "http://initd.org/psycopg/"
 SECTION = "devel/python"
-LICENSE = "GPLv2"
+LICENSE = "LGPLv3+"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2c9872d13fa571e7ba6de95055da1fe2"
 DEPENDS = "postgresql"
 
-- 
1.8.4.2


