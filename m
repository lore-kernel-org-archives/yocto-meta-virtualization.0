Return-Path: <hongl.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4AE47E00D08; Tue, 29 Jan 2019 16:43:13 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [183.91.158.132 listed in list.dnswl.org]
X-Greylist: delayed 63 seconds by postgrey-1.32 at yocto-www;
	Tue, 29 Jan 2019 16:43:12 PST
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 83D20E00D08
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 Jan 2019 16:43:12 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.56,538,1539619200"; d="scan'208";a="53161395"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 30 Jan 2019 08:42:07 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 6DC144C4BB91
	for <meta-virtualization@yoctoproject.org>;
	Wed, 30 Jan 2019 08:42:04 +0800 (CST)
Received: from localhost.localdomain (10.167.225.47) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.408.0; Wed, 30 Jan 2019 08:42:10 +0800
From: Hong Liu <hongl.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 30 Jan 2019 08:42:48 +0800
Message-ID: <20190130004249.20870-3-hongl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190130004249.20870-1-hongl.fnst@cn.fujitsu.com>
References: <20190130004249.20870-1-hongl.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.47]
X-yoursite-MailScanner-ID: 6DC144C4BB91.A0CCE
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: hongl.fnst@cn.fujitsu.com
Subject: [PATCH] [meta-cloud-services][patch]:python-waitress:upgrade to 1.2.0
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
X-List-Received-Date: Wed, 30 Jan 2019 00:43:13 -0000
Content-Type: text/plain

1.Upgrade python-waitress from 1.1.0 to 1.2.0.

Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
---
 .../{python-waitress_1.1.0.bb => python-waitress_1.2.0.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-waitress_1.1.0.bb => python-waitress_1.2.0.bb} (62%)

diff --git a/meta-openstack/recipes-devtools/python/python-waitress_1.1.0.bb b/meta-openstack/recipes-devtools/python/python-waitress_1.2.0.bb
similarity index 62%
rename from meta-openstack/recipes-devtools/python/python-waitress_1.1.0.bb
rename to meta-openstack/recipes-devtools/python/python-waitress_1.2.0.bb
index 5636420..e516d2b 100644
--- a/meta-openstack/recipes-devtools/python/python-waitress_1.1.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-waitress_1.2.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "ZPL-2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=78ccb3640dc841e1baecb3e27a6966b2"
 
-SRC_URI[md5sum] = "0f1eb7fdfdbf2e6d18decbda1733045c"
-SRC_URI[sha256sum] = "d33cd3d62426c0f1b3cd84ee3d65779c7003aae3fc060dee60524d10a57f05a9"
+SRC_URI[md5sum] = "8c5492d3c1a2e0cd80780175686dbb0f"
+SRC_URI[sha256sum] = "e624c829656ffc99b33d661072b2814885ae92835cf835ee8ab283ddb7c915b9"
 
 inherit setuptools pypi
-- 
2.17.2




