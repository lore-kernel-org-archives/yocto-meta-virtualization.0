Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E914DE00A01; Thu,  6 Aug 2015 01:13:13 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C5C37E009D9
	for <meta-virtualization@yoctoproject.org>;
	Thu,  6 Aug 2015 01:12:52 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="99335481"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 06 Aug 2015 16:16:19 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t768AuxF006957
	for <meta-virtualization@yoctoproject.org>;
	Thu, 6 Aug 2015 16:10:56 +0800
Received: from localhost.localdomain (10.167.226.92) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Thu, 6 Aug 2015 16:12:50 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 6 Aug 2015 16:12:02 +0800
Message-ID: <1438848725-1643-9-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1438848725-1643-1-git-send-email-lixin.fnst@cn.fujitsu.com>
References: <1438848725-1643-1-git-send-email-lixin.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.92]
Subject: [meta-cloud-services][PATCH 08/11] python-oslo.config: upgrade 1.11.0 -> 1.14.0
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
X-List-Received-Date: Thu, 06 Aug 2015 08:13:14 -0000
Content-Type: text/plain

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 .../{python-oslo.config_1.11.0.bb => python-oslo.config_1.14.0.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-oslo.config_1.11.0.bb => python-oslo.config_1.14.0.bb} (79%)

diff --git a/meta-openstack/recipes-devtools/python/python-oslo.config_1.11.0.bb b/meta-openstack/recipes-devtools/python/python-oslo.config_1.14.0.bb
similarity index 79%
rename from meta-openstack/recipes-devtools/python/python-oslo.config_1.11.0.bb
rename to meta-openstack/recipes-devtools/python/python-oslo.config_1.14.0.bb
index 3f25df1..fd4f9fe 100644
--- a/meta-openstack/recipes-devtools/python/python-oslo.config_1.11.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-oslo.config_1.14.0.bb
@@ -8,8 +8,8 @@ SRCNAME = "oslo.config"
 
 SRC_URI = "https://pypi.python.org/packages/source/o/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "f2e8c995a9452ef6a02c7270561cadcb"
-SRC_URI[sha256sum] = "a5f61075b16e9155cc4e5aceab98f6e47d85bccaeb3739e364e151a9af0bc1ed"
+SRC_URI[md5sum] = "1ef0fb7c6ec5c8bdb0e0340a2e404967"
+SRC_URI[sha256sum] = "0f9b5a12dae4f26aa8a82e71523a20ce183269b56722ccf3fd2149b1bba7d46a"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
1.8.4.2


