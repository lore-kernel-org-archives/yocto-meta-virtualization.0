Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EA825E00DAF; Wed, 21 Aug 2019 22:45:06 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3E6DCE00D33
	for <meta-virtualization@yoctoproject.org>;
	Wed, 21 Aug 2019 22:45:05 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.64,415,1559491200"; d="scan'208";a="74048149"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 22 Aug 2019 13:45:03 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 0F6A24CE0455
	for <meta-virtualization@yoctoproject.org>;
	Thu, 22 Aug 2019 13:45:03 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 22 Aug 2019 13:45:07 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 22 Aug 2019 13:44:29 +0800
Message-ID: <20190822054429.19873-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 0F6A24CE0455.ABA3C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Subject: [PATCH] python-pyyaml: upgrade 3.11 -> 5.1.2
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
X-List-Received-Date: Thu, 22 Aug 2019 05:45:07 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/{python-pyyaml_3.11.bb => python-pyyaml_5.1.2.bb}        | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename recipes-devtools/python/{python-pyyaml_3.11.bb => python-pyyaml_5.1.2.bb} (81%)

diff --git a/recipes-devtools/python/python-pyyaml_3.11.bb b/recipes-devtools/python/python-pyyaml_5.1.2.bb
similarity index 81%
rename from recipes-devtools/python/python-pyyaml_3.11.bb
rename to recipes-devtools/python/python-pyyaml_5.1.2.bb
index ecb1719..711675b 100644
--- a/recipes-devtools/python/python-pyyaml_3.11.bb
+++ b/recipes-devtools/python/python-pyyaml_5.1.2.bb
@@ -15,13 +15,13 @@ DESCRIPTION = "\
   "
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=6015f088759b10e0bc2bf64898d4ae17"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a76b4c69bfcf82313bbdc0393b04438a"
 
 SRCNAME = "PyYAML"
 SRC_URI = "http://pyyaml.org/download/pyyaml/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "f50e08ef0fe55178479d3a618efe21db"
-SRC_URI[sha256sum] = "c36c938a872e5ff494938b33b14aaa156cb439ec67548fcab3535bb78b0846e8"
+SRC_URI[md5sum] = "20f87ab421b0271dbf371dc5c1cddb5c"
+SRC_URI[sha256sum] = "01adf0b6c6f61bd11af6e10ca52b7d4057dd0be0343eb9283c878cf3af56aee4"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
2.7.4




