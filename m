Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E2337E00B8F; Tue, 24 Sep 2019 00:30:08 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3F01AE00961
	for <meta-virtualization@yoctoproject.org>;
	Tue, 24 Sep 2019 00:30:04 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.64,543,1559491200"; d="scan'208";a="75926540"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 24 Sep 2019 15:30:01 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 3D4AE4CDFCE9
	for <meta-virtualization@yoctoproject.org>;
	Tue, 24 Sep 2019 15:30:00 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Tue, 24 Sep 2019 15:30:00 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 24 Sep 2019 15:29:55 +0800
Message-ID: <20190924072955.8513-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 3D4AE4CDFCE9.AA889
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Subject: [PATCH] python-arrow: upgrade 0.12.0 -> 0.15.2
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
X-List-Received-Date: Tue, 24 Sep 2019 07:30:09 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/{python-arrow_0.12.0.bb => python-arrow_0.15.2.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-arrow_0.12.0.bb => python-arrow_0.15.2.bb} (71%)

diff --git a/meta-openstack/recipes-devtools/python/python-arrow_0.12.0.bb b/meta-openstack/recipes-devtools/python/python-arrow_0.15.2.bb
similarity index 71%
rename from meta-openstack/recipes-devtools/python/python-arrow_0.12.0.bb
rename to meta-openstack/recipes-devtools/python/python-arrow_0.15.2.bb
index 46a4021..d2d0616 100644
--- a/meta-openstack/recipes-devtools/python/python-arrow_0.12.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-arrow_0.15.2.bb
@@ -4,8 +4,8 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=458d41a4064e4dc109666cfd941a29e4"
 
-SRC_URI[md5sum] = "fafb41dadf2134688797bf1102eebeb6"
-SRC_URI[sha256sum] = "a15ecfddf334316e3ac8695e48c15d1be0d6038603b33043930dcf0e675c86ee"
+SRC_URI[md5sum] = "554f18b0e23182ee0e8cb2a882d2f607"
+SRC_URI[sha256sum] = "10257c5daba1a88db34afa284823382f4963feca7733b9107956bed041aff24f"
 
 inherit setuptools pypi
 
-- 
2.7.4




