Return-Path: <hongl.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B6D6BE0079D; Tue,  4 Sep 2018 02:34:27 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C6787E00754
	for <meta-virtualization@yoctoproject.org>;
	Tue,  4 Sep 2018 02:34:26 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="44439406"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 04 Sep 2018 17:34:24 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id D35E34B6EC75
	for <meta-virtualization@yoctoproject.org>;
	Tue,  4 Sep 2018 17:34:24 +0800 (CST)
Received: from localhost.local (10.167.225.78) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.408.0; Tue, 4 Sep 2018 17:34:23 +0800
From: Hong Liu <hongl.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 4 Sep 2018 17:34:19 +0800
Message-ID: <20180904093420.30989-1-hongl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.14.3
MIME-Version: 1.0
X-Originating-IP: [10.167.225.78]
X-yoursite-MailScanner-ID: D35E34B6EC75.A89A0
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: hongl.fnst@cn.fujitsu.com
Subject: [PATCH]=[meta-cloud-services][patch][python-sphinx:1.7.6:1.7.8]
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
X-List-Received-Date: Tue, 04 Sep 2018 09:34:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Upgrade python-sphinx from 1.7.6 to 1.7.8.

Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
---
 .../python/{python-sphinx_1.7.6.bb => python-sphinx_1.7.8.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename recipes-devtools/python/{python-sphinx_1.7.6.bb => python-sphinx_1.7.8.bb} (63%)

diff --git a/recipes-devtools/python/python-sphinx_1.7.6.bb b/recipes-devtools/python/python-sphinx_1.7.8.bb
similarity index 63%
rename from recipes-devtools/python/python-sphinx_1.7.6.bb
rename to recipes-devtools/python/python-sphinx_1.7.8.bb
index 0200c9e..23fa3fe 100644
--- a/recipes-devtools/python/python-sphinx_1.7.6.bb
+++ b/recipes-devtools/python/python-sphinx_1.7.8.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=89cbefcd0a80481e8b26a9a7d25be749"
 
 PYPI_PACKAGE = "Sphinx"
 
-SRC_URI[md5sum] = "8fbd77d80c8e0966964751ab31a0204a"
-SRC_URI[sha256sum] = "217ad9ece2156ed9f8af12b5d2c82a499ddf2c70a33c5f81864a08d8c67b9efc"
+SRC_URI[md5sum] = "7dfb075d8bd6a53b652bce1e4394c6a1"
+SRC_URI[sha256sum] = "a07050845cc9a2f4026a6035cc8ed795a5ce7be6528bbc82032385c10807dfe7"
 
 inherit setuptools pypi
-- 
2.7.4




