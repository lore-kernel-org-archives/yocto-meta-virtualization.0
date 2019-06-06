Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id ECE5DE00D30; Wed,  5 Jun 2019 18:34:37 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [183.91.158.132 listed in list.dnswl.org]
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C8D7BE00994
	for <meta-virtualization@yoctoproject.org>;
	Wed,  5 Jun 2019 18:34:36 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.60,557,1549900800"; d="scan'208";a="66154574"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 06 Jun 2019 09:34:34 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id D00A74CDB2ED
	for <meta-virtualization@yoctoproject.org>;
	Thu,  6 Jun 2019 09:34:30 +0800 (CST)
Received: from localhost.localdomain (10.167.226.46) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 6 Jun 2019 09:34:31 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 6 Jun 2019 09:35:43 +0800
Message-ID: <20190606013543.19090-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.46]
X-yoursite-MailScanner-ID: D00A74CDB2ED.AAD55
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Subject: [PATCH] python-kombu: upgrade 4.5.0 -> 4.6.0
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
X-List-Received-Date: Thu, 06 Jun 2019 01:34:38 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from python-kombu_4.5.0.bb to python-kombu_4.6.0.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/{python-kombu_4.5.0.bb => python-kombu_4.6.0.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-kombu_4.5.0.bb => python-kombu_4.6.0.bb} (70%)

diff --git a/meta-openstack/recipes-devtools/python/python-kombu_4.5.0.bb b/meta-openstack/recipes-devtools/python/python-kombu_4.6.0.bb
similarity index 70%
rename from meta-openstack/recipes-devtools/python/python-kombu_4.5.0.bb
rename to meta-openstack/recipes-devtools/python/python-kombu_4.6.0.bb
index 6db89cc..8cd6825 100644
--- a/meta-openstack/recipes-devtools/python/python-kombu_4.5.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-kombu_4.6.0.bb
@@ -4,8 +4,8 @@ SECTION = "devel/python"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=daea7c168428449fbee05e644df929f4"
 
-SRC_URI[md5sum] = "6a9f0d07ec3f8b784e9358d04a4709c3"
-SRC_URI[sha256sum] = "389ba09e03b15b55b1a7371a441c894fd8121d174f5583bbbca032b9ea8c9edd"
+SRC_URI[md5sum] = "3543525c1bfaa74260cbf9a6e47dad2f"
+SRC_URI[sha256sum] = "27345bb569eb6bb583bca27dfc0ef181ca6c59c40c6e203cecaa0aeca84360be"
 
 inherit setuptools pypi
 
-- 
2.20.1




