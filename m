Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 31E2AE00D8C; Wed, 15 May 2019 03:53:02 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 847DBE00CAB
	for <meta-virtualization@yoctoproject.org>;
	Wed, 15 May 2019 03:53:01 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.60,472,1549900800"; d="scan'208";a="63146996"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 15 May 2019 18:52:59 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 6C9314CE1647
	for <meta-virtualization@yoctoproject.org>;
	Wed, 15 May 2019 16:24:32 +0800 (CST)
Received: from localhost.local (10.167.225.84) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 15 May 2019 16:24:31 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 15 May 2019 16:25:29 +0800
Message-ID: <20190515082529.10274-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.84]
X-yoursite-MailScanner-ID: 6C9314CE1647.A8F64
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Subject: [PATCH] python-contextlib2:upgrade 0.4.0 -> 0.5.5
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
X-List-Received-Date: Wed, 15 May 2019 10:53:02 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from python-contextlib2_0.4.0.bb to
python-contextlib2_0.5.5.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 ...ython-contextlib2_0.4.0.bb => python-contextlib2_0.5.5.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-contextlib2_0.4.0.bb => python-contextlib2_0.5.5.bb} (70%)

diff --git a/meta-openstack/recipes-devtools/python/python-contextlib2_0.4.0.bb b/meta-openstack/recipes-devtools/python/python-contextlib2_0.5.5.bb
similarity index 70%
rename from meta-openstack/recipes-devtools/python/python-contextlib2_0.4.0.bb
rename to meta-openstack/recipes-devtools/python/python-contextlib2_0.5.5.bb
index 960238d..af9270e 100644
--- a/meta-openstack/recipes-devtools/python/python-contextlib2_0.4.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-contextlib2_0.5.5.bb
@@ -4,8 +4,8 @@ SECTION = "devel/python"
 LICENSE = "PSF"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=43d1c7827e8fad6454b553caf0e1d734"
 
-SRC_URI[md5sum] = "ea687207db25f65552061db4a2c6727d"
-SRC_URI[sha256sum] = "55a5dc78f7a742a0e756645134ffb39bbe11da0fea2bc0f7070d40dac208b732"
+SRC_URI[md5sum] = "95fe420941ebc64951cd9d89edc41870"
+SRC_URI[sha256sum] = "509f9419ee91cdd00ba34443217d5ca51f5a364a404e1dce9e8979cea969ca48"
 
 inherit setuptools pypi
 
-- 
2.20.1




