Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9C96AE00CE9; Thu, 22 Mar 2018 20:30:07 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [183.91.158.132 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BB26EE00C66
	for <meta-virtualization@yoctoproject.org>;
	Thu, 22 Mar 2018 20:30:05 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="38089879"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 23 Mar 2018 11:28:59 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 2931E48AE76A
	for <meta-virtualization@yoctoproject.org>;
	Fri, 23 Mar 2018 11:28:55 +0800 (CST)
Received: from localhost.localdomain (10.167.225.125) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Fri, 23 Mar 2018 11:28:54 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Fri, 23 Mar 2018 11:28:55 +0800
Message-ID: <1521775736-38102-6-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1521775736-38102-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1521775736-38102-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.125]
X-yoursite-MailScanner-ID: 2931E48AE76A.A6CD0
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
Subject: [meta-cloud-services][PATCH] python-repoze.lru: 0.6 -> 0.7
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
X-List-Received-Date: Fri, 23 Mar 2018 03:30:07 -0000
Content-Type: text/plain

Upgrade python-repoze.lru from 0.6 to 0.7.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../python/{python-repoze.lru_0.6.bb => python-repoze.lru_0.7.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-repoze.lru_0.6.bb => python-repoze.lru_0.7.bb} (77%)

diff --git a/meta-openstack/recipes-devtools/python/python-repoze.lru_0.6.bb b/meta-openstack/recipes-devtools/python/python-repoze.lru_0.7.bb
similarity index 77%
rename from meta-openstack/recipes-devtools/python/python-repoze.lru_0.6.bb
rename to meta-openstack/recipes-devtools/python/python-repoze.lru_0.7.bb
index 3a169b0..264a1cb 100644
--- a/meta-openstack/recipes-devtools/python/python-repoze.lru_0.6.bb
+++ b/meta-openstack/recipes-devtools/python/python-repoze.lru_0.7.bb
@@ -8,7 +8,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-Modification-copyright"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2c33cdbc6bc9ae6e5d64152fdb754292"
 
-SRC_URI[md5sum] = "2c3b64b17a8e18b405f55d46173e14dd"
-SRC_URI[sha256sum] = "0f7a323bf716d3cb6cb3910cd4fccbee0b3d3793322738566ecce163b01bbd31"
+SRC_URI[md5sum] = "c08cc030387e0b1fc53c5c7d964b35e2"
+SRC_URI[sha256sum] = "0429a75e19380e4ed50c0694e26ac8819b4ea7851ee1fc7583c8572db80aff77"
 
 inherit setuptools pypi
-- 
2.7.4




