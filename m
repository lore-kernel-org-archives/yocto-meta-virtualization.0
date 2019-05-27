Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9363EE00C43; Sun, 26 May 2019 20:29:01 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BA2A9E00C02
	for <meta-virtualization@yoctoproject.org>;
	Sun, 26 May 2019 20:29:00 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.60,517,1549900800"; d="scan'208";a="64745106"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 27 May 2019 11:28:59 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 9828A4CDCEB9
	for <meta-virtualization@yoctoproject.org>;
	Mon, 27 May 2019 11:29:01 +0800 (CST)
Received: from localhost.local (10.167.225.84) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 27 May 2019 11:29:06 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 27 May 2019 11:30:01 +0800
Message-ID: <20190527033001.27124-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.84]
X-yoursite-MailScanner-ID: 9828A4CDCEB9.AAC2A
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Subject: [PATCH] python-keystoneauth1:upgrade 3.2.0 -> 3.14.0
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
X-List-Received-Date: Mon, 27 May 2019 03:29:01 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from python-keystoneauth1_3.2.0.bb to python-keystoneauth1_3.14.0.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 ...-keystoneauth1_3.2.0.bb => python-keystoneauth1_3.14.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-keystoneauth1_3.2.0.bb => python-keystoneauth1_3.14.0.bb} (79%)

diff --git a/meta-openstack/recipes-devtools/python/python-keystoneauth1_3.2.0.bb b/meta-openstack/recipes-devtools/python/python-keystoneauth1_3.14.0.bb
similarity index 79%
rename from meta-openstack/recipes-devtools/python/python-keystoneauth1_3.2.0.bb
rename to meta-openstack/recipes-devtools/python/python-keystoneauth1_3.14.0.bb
index 6466056..e53f922 100644
--- a/meta-openstack/recipes-devtools/python/python-keystoneauth1_3.2.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-keystoneauth1_3.14.0.bb
@@ -4,8 +4,8 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=96f840d59b245a1c817fbcb901afc574"
 
-SRC_URI[md5sum] = "d3f93a071551a753218fd50d9f680ee6"
-SRC_URI[sha256sum] = "768036ee66372df2ad56716b8be4965cef9a59a01647992919516defb282e365"
+SRC_URI[md5sum] = "ada9836933f5aa6bd35faf01c314e81d"
+SRC_URI[sha256sum] = "b14f363d02142177c968cfffeb9eb37113682c03ac3c65d483424e203dd602c3"
 
 inherit setuptools pypi
 
-- 
2.20.1




