Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 42704E009EC; Thu,  6 Aug 2015 01:13:14 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E9899E009EC
	for <meta-virtualization@yoctoproject.org>;
	Thu,  6 Aug 2015 01:12:54 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="99335483"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 06 Aug 2015 16:16:21 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t768AwOe006961
	for <meta-virtualization@yoctoproject.org>;
	Thu, 6 Aug 2015 16:10:58 +0800
Received: from localhost.localdomain (10.167.226.92) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Thu, 6 Aug 2015 16:12:52 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 6 Aug 2015 16:12:03 +0800
Message-ID: <1438848725-1643-10-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1438848725-1643-1-git-send-email-lixin.fnst@cn.fujitsu.com>
References: <1438848725-1643-1-git-send-email-lixin.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.92]
Subject: [meta-cloud-services][PATCH 09/11] python-paste: upgrade 2.0.1 -> 2.0.2
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
 .../python/{python-paste_2.0.1.bb => python-paste_2.0.2.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-paste_2.0.1.bb => python-paste_2.0.2.bb} (73%)

diff --git a/meta-openstack/recipes-devtools/python/python-paste_2.0.1.bb b/meta-openstack/recipes-devtools/python/python-paste_2.0.2.bb
similarity index 73%
rename from meta-openstack/recipes-devtools/python/python-paste_2.0.1.bb
rename to meta-openstack/recipes-devtools/python/python-paste_2.0.2.bb
index 946d1f4..0833612 100644
--- a/meta-openstack/recipes-devtools/python/python-paste_2.0.1.bb
+++ b/meta-openstack/recipes-devtools/python/python-paste_2.0.2.bb
@@ -8,8 +8,8 @@ SRCNAME = "Paste"
 
 SRC_URI = "https://pypi.python.org/packages/source/P/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "5aa1890d20e6f93b46e855aa1e17ba27"
-SRC_URI[sha256sum] = "28383e843cb46a9375a90da6e2ec5fcd7704ed9f3f3b5e954928beb52b0e5b41"
+SRC_URI[md5sum] = "4bfc8a7eaf858f6309d2ac0f40fc951c"
+SRC_URI[sha256sum] = "adac3ac893a2dac6b8ffd49901377dd6819e05be3436b374d698641071daba99"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
1.8.4.2


