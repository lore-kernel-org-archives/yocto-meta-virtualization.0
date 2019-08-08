Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5D3A2E00DA9; Wed,  7 Aug 2019 23:32:05 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 70E86E00BD5
	for <meta-virtualization@yoctoproject.org>;
	Wed,  7 Aug 2019 23:32:04 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.64,360,1559491200"; d="scan'208";a="73203623"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 08 Aug 2019 14:32:02 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 2B5B84CE030E
	for <meta-virtualization@yoctoproject.org>;
	Thu,  8 Aug 2019 14:32:05 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 8 Aug 2019 14:32:05 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 8 Aug 2019 14:31:22 +0800
Message-ID: <20190808063122.11211-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 2B5B84CE030E.A98A2
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Subject: [PATCH] python-warlock: upgrade 1.3.0 -> 1.3.3
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
X-List-Received-Date: Thu, 08 Aug 2019 06:32:05 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Yuan Chao <yuanc.fnst@cn.fujitsu.com>

Remove 1.2.0.bb file.

Upgrade 1.3.0 -> 1.3.3
Name of LICENSE file changed LICENSE.txt -> LICENSE

Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-warlock_1.2.0.bb | 21 ---------------------
 ...hon-warlock_1.3.0.bb => python-warlock_1.3.3.bb} |  6 +++---
 2 files changed, 3 insertions(+), 24 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-warlock_1.2.0.bb
 rename meta-openstack/recipes-devtools/python/{python-warlock_1.3.0.bb => python-warlock_1.3.3.bb} (57%)

diff --git a/meta-openstack/recipes-devtools/python/python-warlock_1.2.0.bb b/meta-openstack/recipes-devtools/python/python-warlock_1.2.0.bb
deleted file mode 100644
index 0839983..0000000
--- a/meta-openstack/recipes-devtools/python/python-warlock_1.2.0.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-DESCRIPTION = "Build self-validating python objects using JSON schemas"
-HOMEPAGE = "http://github.com/bcwaldon/warlock"
-SECTION = "devel/python"
-LICENSE = "Apache-2"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
-
-DEPENDS += " \
-        python-jsonschema \
-        python-jsonpatch \
-        "
-
-SRC_URI[md5sum] = "8389225c589ada11a9094abc5d9053df"
-SRC_URI[sha256sum] = "7c0d17891e14cf77e13a598edecc9f4682a5bc8a219dc84c139c5ba02789ef5a"
-
-inherit setuptools pypi
-
-RDEPENDS_${PN} += " \
-        python-jsonschema \
-        python-jsonpatch \
-        python-six \
-        "
diff --git a/meta-openstack/recipes-devtools/python/python-warlock_1.3.0.bb b/meta-openstack/recipes-devtools/python/python-warlock_1.3.3.bb
similarity index 57%
rename from meta-openstack/recipes-devtools/python/python-warlock_1.3.0.bb
rename to meta-openstack/recipes-devtools/python/python-warlock_1.3.3.bb
index a62cbd8..c2c694b 100644
--- a/meta-openstack/recipes-devtools/python/python-warlock_1.3.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-warlock_1.3.3.bb
@@ -2,12 +2,12 @@ DESCRIPTION = "Build self-validating python objects using JSON schemas"
 HOMEPAGE = "http://github.com/bcwaldon/warlock"
 SECTION = "devel/python"
 LICENSE = "Apache-2"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 DEPENDS += "python-jsonschema python-jsonpatch"
 
-SRC_URI[md5sum] = "61cc809a3af2c76288f4dd26a003932d"
-SRC_URI[sha256sum] = "d7403f728fce67ee2f22f3d7fa09c9de0bc95c3e7bcf6005b9c1962b77976a06"
+SRC_URI[md5sum] = "746aba989d97762948e5fca6601f283f"
+SRC_URI[sha256sum] = "a093c4d04b42b7907f69086e476a766b7639dca50d95edc83aef6aeab9db2090"
 
 inherit setuptools pypi
 
-- 
2.7.4




