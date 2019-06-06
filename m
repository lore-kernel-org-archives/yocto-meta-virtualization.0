Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8593BE00D77; Wed,  5 Jun 2019 19:30:23 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 60BDBE00D74
	for <meta-virtualization@yoctoproject.org>;
	Wed,  5 Jun 2019 19:30:21 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.60,557,1549900800"; d="scan'208";a="66161649"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 06 Jun 2019 10:30:16 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 420194CDCCAE
	for <meta-virtualization@yoctoproject.org>;
	Thu,  6 Jun 2019 10:30:13 +0800 (CST)
Received: from localhost.localdomain (10.167.226.46) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 6 Jun 2019 10:30:16 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 6 Jun 2019 10:31:27 +0800
Message-ID: <20190606023127.16101-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.46]
X-yoursite-MailScanner-ID: 420194CDCCAE.AB312
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Subject: [PATCH] python-osprofiler: upgrade 1.5.0 -> 2.8.0
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
X-List-Received-Date: Thu, 06 Jun 2019 02:30:23 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from python-osprofiler_1.5.0.bb to python-osprofiler_2.8.0.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 ...{python-osprofiler_1.5.0.bb => python-osprofiler_2.8.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-osprofiler_1.5.0.bb => python-osprofiler_2.8.0.bb} (83%)

diff --git a/meta-openstack/recipes-devtools/python/python-osprofiler_1.5.0.bb b/meta-openstack/recipes-devtools/python/python-osprofiler_2.8.0.bb
similarity index 83%
rename from meta-openstack/recipes-devtools/python/python-osprofiler_1.5.0.bb
rename to meta-openstack/recipes-devtools/python/python-osprofiler_2.8.0.bb
index efb38a0..c33c52b 100644
--- a/meta-openstack/recipes-devtools/python/python-osprofiler_1.5.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-osprofiler_2.8.0.bb
@@ -4,8 +4,8 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=19cbd64715b51267a47bf3750cc6a8a5"
 
-SRC_URI[md5sum] = "6762b5420fd95646a26c4eaca1af9e64"
-SRC_URI[sha256sum] = "aee63cfd888e6049ea82535ce458ce4844b4ac893dcb18060eda24192505627e"
+SRC_URI[md5sum] = "c48561c6c6d2112d5b06d5c4af581790"
+SRC_URI[sha256sum] = "56f8717c1c30193706ea6f9959f5f289edee910f90ebd763db38cfbd9c1c90d4"
 
 inherit setuptools pypi
 
-- 
2.20.1




