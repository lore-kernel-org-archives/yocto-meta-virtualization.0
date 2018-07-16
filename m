Return-Path: <hongl.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 19211E01647; Mon, 16 Jul 2018 02:37:19 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [183.91.158.132 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 64C6CE015CB
	for <meta-virtualization@yoctoproject.org>;
	Mon, 16 Jul 2018 02:37:14 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="42282888"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 16 Jul 2018 17:37:05 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 6A2334B66C05
	for <meta-virtualization@yoctoproject.org>;
	Mon, 16 Jul 2018 17:37:06 +0800 (CST)
Received: from localhost.local (10.167.225.78) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.399.0; Mon, 16 Jul 2018 17:37:07 +0800
From: Hong Liu <hongl.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 16 Jul 2018 17:36:31 +0800
Message-ID: <20180716093631.27024-4-hongl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180716093631.27024-1-hongl.fnst@cn.fujitsu.com>
References: <20180716093631.27024-1-hongl.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.78]
X-yoursite-MailScanner-ID: 6A2334B66C05.AB88F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: hongl.fnst@cn.fujitsu.com
Subject: [PATCH] [meta-cloud-services][patch]:python-kombu:4.1.0 -> 4.2.0
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
X-List-Received-Date: Mon, 16 Jul 2018 09:37:19 -0000
Content-Type: text/plain

Upgrade python-kombu from 4.1.0 to 4.2.0.

Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
---
 .../python/{python-kombu_4.1.0.bb => python-kombu_4.2.0.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-kombu_4.1.0.bb => python-kombu_4.2.0.bb} (70%)

diff --git a/meta-openstack/recipes-devtools/python/python-kombu_4.1.0.bb b/meta-openstack/recipes-devtools/python/python-kombu_4.2.0.bb
similarity index 70%
rename from meta-openstack/recipes-devtools/python/python-kombu_4.1.0.bb
rename to meta-openstack/recipes-devtools/python/python-kombu_4.2.0.bb
index 8d44426..47cb5bf 100644
--- a/meta-openstack/recipes-devtools/python/python-kombu_4.1.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-kombu_4.2.0.bb
@@ -4,8 +4,8 @@ SECTION = "devel/python"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=daea7c168428449fbee05e644df929f4"
 
-SRC_URI[md5sum] = "2fb2be9fec0e6514231bba23a3779439"
-SRC_URI[sha256sum] = "4249d9dd9dbf1fcec471d1c2def20653c9310dd1a217272d77e4844f9d5273cb"
+SRC_URI[md5sum] = "cb7e668936cd5ffc3232b72a2a4f931f"
+SRC_URI[sha256sum] = "d601c47312833c0f6f4aaf037f293b2627398d4cf8526e6ba0360287294ee1fb"
 
 inherit setuptools pypi
 
-- 
2.7.4




