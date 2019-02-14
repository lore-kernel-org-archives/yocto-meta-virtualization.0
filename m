Return-Path: <hongl.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1EE94E00BAF; Wed, 13 Feb 2019 22:47:10 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [183.91.158.132 listed in list.dnswl.org]
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5F0D5E00B81
	for <meta-virtualization@yoctoproject.org>;
	Wed, 13 Feb 2019 22:47:08 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.58,367,1544457600"; d="scan'208";a="54316142"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 14 Feb 2019 14:47:07 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 7B4354C4BCD7
	for <meta-virtualization@yoctoproject.org>;
	Thu, 14 Feb 2019 14:47:07 +0800 (CST)
Received: from localhost.localdomain (10.167.225.47) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.408.0; Thu, 14 Feb 2019 14:47:17 +0800
From: Hong Liu <hongl.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 14 Feb 2019 14:48:09 +0800
Message-ID: <20190214064809.20897-1-hongl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
X-Originating-IP: [10.167.225.47]
X-yoursite-MailScanner-ID: 7B4354C4BCD7.AD1BB
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: hongl.fnst@cn.fujitsu.com
Subject: [PATCH] [meta-cloud-services][patch]:python-kombu:upgrade to 4.3.0
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
X-List-Received-Date: Thu, 14 Feb 2019 06:47:10 -0000
Content-Type: text/plain

Upgrade python-kombu from 4.2.0 to 4.3.0

Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
---
 .../python/{python-kombu_4.2.0.bb => python-kombu_4.3.0.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-kombu_4.2.0.bb => python-kombu_4.3.0.bb} (70%)

diff --git a/meta-openstack/recipes-devtools/python/python-kombu_4.2.0.bb b/meta-openstack/recipes-devtools/python/python-kombu_4.3.0.bb
similarity index 70%
rename from meta-openstack/recipes-devtools/python/python-kombu_4.2.0.bb
rename to meta-openstack/recipes-devtools/python/python-kombu_4.3.0.bb
index 47cb5bf..fbbe06a 100644
--- a/meta-openstack/recipes-devtools/python/python-kombu_4.2.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-kombu_4.3.0.bb
@@ -4,8 +4,8 @@ SECTION = "devel/python"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=daea7c168428449fbee05e644df929f4"
 
-SRC_URI[md5sum] = "cb7e668936cd5ffc3232b72a2a4f931f"
-SRC_URI[sha256sum] = "d601c47312833c0f6f4aaf037f293b2627398d4cf8526e6ba0360287294ee1fb"
+SRC_URI[md5sum] = "db169da20da23dc7be78681498600ef6"
+SRC_URI[sha256sum] = "529df9e0ecc0bad9fc2b376c3ce4796c41b482cf697b78b71aea6ebe7ca353c8"
 
 inherit setuptools pypi
 
-- 
2.17.2




