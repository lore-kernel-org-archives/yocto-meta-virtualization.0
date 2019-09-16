Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AC811E00D4E; Sun, 15 Sep 2019 23:26:14 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 09933E00D33
	for <meta-virtualization@yoctoproject.org>;
	Sun, 15 Sep 2019 23:26:13 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.64,510,1559491200"; d="scan'208";a="75510425"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 16 Sep 2019 14:26:12 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id EA6C84CE14F5
	for <meta-virtualization@yoctoproject.org>;
	Mon, 16 Sep 2019 14:25:38 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 16 Sep 2019 14:26:05 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 16 Sep 2019 14:25:45 +0800
Message-ID: <20190916062545.5489-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: EA6C84CE14F5.AA23E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Subject: [PATCH] python-osprpfiler: upgrade 2.8.1 -> 2.8.2
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
X-List-Received-Date: Mon, 16 Sep 2019 06:26:14 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/{python-osprofiler_2.8.1.bb => python-osprofiler_2.8.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-osprofiler_2.8.1.bb => python-osprofiler_2.8.2.bb} (83%)

diff --git a/meta-openstack/recipes-devtools/python/python-osprofiler_2.8.1.bb b/meta-openstack/recipes-devtools/python/python-osprofiler_2.8.2.bb
similarity index 83%
rename from meta-openstack/recipes-devtools/python/python-osprofiler_2.8.1.bb
rename to meta-openstack/recipes-devtools/python/python-osprofiler_2.8.2.bb
index b299709..408bbdb 100644
--- a/meta-openstack/recipes-devtools/python/python-osprofiler_2.8.1.bb
+++ b/meta-openstack/recipes-devtools/python/python-osprofiler_2.8.2.bb
@@ -4,8 +4,8 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=19cbd64715b51267a47bf3750cc6a8a5"
 
-SRC_URI[md5sum] = "ec8ef752caf49591941fba063ca40fb4"
-SRC_URI[sha256sum] = "ee6d8a40daa3909b7c594378986b8c93ec2561dd8c329bad0aa54d4795c8fa57"
+SRC_URI[md5sum] = "b192bdcbf201101a97d163d7ec6f4783"
+SRC_URI[sha256sum] = "525b2becd692e3c6ed77a6fdf8a9ad8a52127f18e48a3abc1264c16d7fc5208a"
 
 inherit setuptools pypi
 
-- 
2.7.4




