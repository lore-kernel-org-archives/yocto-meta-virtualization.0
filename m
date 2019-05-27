Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B3642E00C36; Sun, 26 May 2019 18:39:28 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4BA78E008E3
	for <meta-virtualization@yoctoproject.org>;
	Sun, 26 May 2019 18:39:27 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.60,517,1549900800"; d="scan'208";a="64731314"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 27 May 2019 09:39:25 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id A85CC4CDB924
	for <meta-virtualization@yoctoproject.org>;
	Mon, 27 May 2019 09:39:27 +0800 (CST)
Received: from localhost.local (10.167.225.84) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 27 May 2019 09:39:32 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 27 May 2019 09:40:27 +0800
Message-ID: <20190527014027.22879-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.84]
X-yoursite-MailScanner-ID: A85CC4CDB924.A9F92
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Subject: [PATCH] python-httplib2:upgrade 0.11.3 -> 0.12.3
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
X-List-Received-Date: Mon, 27 May 2019 01:39:28 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from python-httplib2_0.11.3.bb to python-httplib2_0.12.3.bb.

-License-Update: Update the information of package.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 ...{python-httplib2_0.11.3.bb => python-httplib2_0.12.3.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-httplib2_0.11.3.bb => python-httplib2_0.12.3.bb} (59%)

diff --git a/meta-openstack/recipes-devtools/python/python-httplib2_0.11.3.bb b/meta-openstack/recipes-devtools/python/python-httplib2_0.12.3.bb
similarity index 59%
rename from meta-openstack/recipes-devtools/python/python-httplib2_0.11.3.bb
rename to meta-openstack/recipes-devtools/python/python-httplib2_0.12.3.bb
index f59aa5b..a1a518f 100644
--- a/meta-openstack/recipes-devtools/python/python-httplib2_0.11.3.bb
+++ b/meta-openstack/recipes-devtools/python/python-httplib2_0.12.3.bb
@@ -2,10 +2,10 @@ DESCRIPTION = "A comprehensive HTTP client library"
 HOMEPAGE = "https://code.google.com/p/httplib2/"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=4d159ceca4925adea3407818d4a87968"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=ad87b270277b5f40e2a281d9f7dde584"
 
-SRC_URI[md5sum] = "9aa3e074da9a235cd675dd65e1fbcf39"
-SRC_URI[sha256sum] = "e71daed9a0e6373642db61166fa70beecc9bf04383477f84671348c02a04cbdf"
+SRC_URI[md5sum] = "f78ce222216865271f2672e6941174d5"
+SRC_URI[sha256sum] = "a18121c7c72a56689efbf1aef990139ad940fee1e64c6f2458831736cd593600"
 
 inherit setuptools pypi
 
-- 
2.20.1




