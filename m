Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 94EF0E00A4F; Tue, 16 Jun 2015 02:03:20 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: *
X-Spam-Status: No, score=1.6 required=5.0 tests=BAYES_00,RDNS_NONE,
	TVD_SPACE_RATIO,TVD_SPACE_RATIO_MINFP autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
	*  0.0 TVD_SPACE_RATIO TVD_SPACE_RATIO
	*  2.7 TVD_SPACE_RATIO_MINFP TVD_SPACE_RATIO_MINFP
X-Greylist: delayed 66 seconds by postgrey-1.32 at yocto-www;
	Tue, 16 Jun 2015 02:03:18 PDT
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A79F3E009E6
	for <meta-virtualization@yoctoproject.org>;
	Tue, 16 Jun 2015 02:03:18 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.13,622,1427731200"; d="scan'208";a="97129119"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 16 Jun 2015 17:06:21 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t5G90Z5Y025487
	for <meta-virtualization@yoctoproject.org>;
	Tue, 16 Jun 2015 17:00:35 +0800
Received: from localhost.localdomain (10.167.226.85) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Tue, 16 Jun 2015 17:02:18 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 16 Jun 2015 17:01:58 +0800
Message-ID: <1434445318-2437-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.85]
Subject: [PATCH] python-setuptools-git: add native support
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
X-List-Received-Date: Tue, 16 Jun 2015 09:03:20 -0000
Content-Type: text/plain

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 meta-openstack/recipes-devtools/python/python-setuptools-git_1.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-openstack/recipes-devtools/python/python-setuptools-git_1.1.bb b/meta-openstack/recipes-devtools/python/python-setuptools-git_1.1.bb
index 9447744..61408c3 100644
--- a/meta-openstack/recipes-devtools/python/python-setuptools-git_1.1.bb
+++ b/meta-openstack/recipes-devtools/python/python-setuptools-git_1.1.bb
@@ -19,3 +19,4 @@ inherit setuptools
 do_install_append() {
 	rm -f ${D}${libdir}/python*/site-packages/site.py*
 }
+BBCLASSEXTEND = "native"
-- 
1.8.4.2


