Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 39B60E00D48; Wed, 29 May 2019 20:41:37 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 89D29E00D45
	for <meta-virtualization@yoctoproject.org>;
	Wed, 29 May 2019 20:41:36 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.60,529,1549900800"; d="scan'208";a="65160747"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 30 May 2019 11:41:35 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 23F1A4CDBF70
	for <meta-virtualization@yoctoproject.org>;
	Thu, 30 May 2019 11:41:34 +0800 (CST)
Received: from localhost.localdomain (10.167.226.46) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 30 May 2019 11:41:39 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 30 May 2019 11:42:46 +0800
Message-ID: <20190530034246.6644-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.46]
X-yoursite-MailScanner-ID: 23F1A4CDBF70.A9D4E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Subject: [PATCH] python-statsd: upgrade 3.2.1 -> 3.3.0
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
X-List-Received-Date: Thu, 30 May 2019 03:41:37 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from python-statsd_3.2.1.bb to python-statsd_3.3.0.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/{python-statsd_3.2.1.bb => python-statsd_3.3.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-statsd_3.2.1.bb => python-statsd_3.3.0.bb} (65%)

diff --git a/meta-openstack/recipes-devtools/python/python-statsd_3.2.1.bb b/meta-openstack/recipes-devtools/python/python-statsd_3.3.0.bb
similarity index 65%
rename from meta-openstack/recipes-devtools/python/python-statsd_3.2.1.bb
rename to meta-openstack/recipes-devtools/python/python-statsd_3.3.0.bb
index 4faaa60..7400129 100644
--- a/meta-openstack/recipes-devtools/python/python-statsd_3.2.1.bb
+++ b/meta-openstack/recipes-devtools/python/python-statsd_3.3.0.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=4d8aa8ac1dc54b8aee4054bd5e5c61bd"
 
 inherit pypi
 
-SRC_URI[md5sum] = "d819e2375030f543522012046e6e36e9"
-SRC_URI[sha256sum] = "3fa92bf0192af926f7a0d9be031fe3fd0fbaa1992d42cf2f07e68f76ac18288e"
+SRC_URI[md5sum] = "b397ccf880f37cf099e775907ebf7a46"
+SRC_URI[sha256sum] = "e3e6db4c246f7c59003e51c9720a51a7f39a396541cb9b147ff4b14d15b5dd1f"
 
 inherit setuptools
 
-- 
2.20.1




