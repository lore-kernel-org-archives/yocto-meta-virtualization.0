Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F069BE00D99; Mon, 26 Aug 2019 23:56:55 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
	TVD_SPACE_RATIO autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [183.91.158.132 listed in list.dnswl.org]
	*  0.0 TVD_SPACE_RATIO TVD_SPACE_RATIO
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2DA00E00C11
	for <meta-virtualization@yoctoproject.org>;
	Mon, 26 Aug 2019 23:56:54 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.64,436,1559491200"; d="scan'208";a="74330989"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 27 Aug 2019 14:56:53 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id DFE954CE086D
	for <meta-virtualization@yoctoproject.org>;
	Tue, 27 Aug 2019 14:56:43 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Tue, 27 Aug 2019 14:56:57 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 27 Aug 2019 14:56:39 +0800
Message-ID: <1566888999-4023-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-yoursite-MailScanner-ID: DFE954CE086D.A9B5F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
Subject: [PATCH] python-oslo.i18n: upgrade 3.20.0 -> 3.23.1
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
X-List-Received-Date: Tue, 27 Aug 2019 06:56:56 -0000
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../{python-oslo.i18n_3.20.0.bb => python-oslo.i18n_3.23.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-openstack/recipes-devtools/python/{python-oslo.i18n_3.20.0.bb => python-oslo.i18n_3.23.1.bb} (92%)

diff --git a/meta-openstack/recipes-devtools/python/python-oslo.i18n_3.20.0.bb b/meta-openstack/recipes-devtools/python/python-oslo.i18n_3.23.1.bb
similarity index 92%
rename from meta-openstack/recipes-devtools/python/python-oslo.i18n_3.20.0.bb
rename to meta-openstack/recipes-devtools/python/python-oslo.i18n_3.23.1.bb
index 76a8b53..1910532 100644
--- a/meta-openstack/recipes-devtools/python/python-oslo.i18n_3.20.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-oslo.i18n_3.23.1.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "Apache-2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
 
-SRCREV = "172e20b10981069c36b0f42377e5b4fbe22a9864"
+SRCREV = "20bbee510b9714075b7f48f7c3968d7e2bd21a8a"
 
 SRCNAME = "oslo.i18n"
 SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=master"
-- 
2.17.1




