Return-Path: <hongl.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3D88FE00B6F; Tue, 11 Sep 2018 02:29:43 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A987BE00B23
	for <meta-virtualization@yoctoproject.org>;
	Tue, 11 Sep 2018 02:29:41 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="44773845"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 11 Sep 2018 17:29:37 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id AB0F44B6EC99
	for <meta-virtualization@yoctoproject.org>;
	Tue, 11 Sep 2018 17:29:37 +0800 (CST)
Received: from localhost.local (10.167.225.78) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.408.0; Tue, 11 Sep 2018 17:29:37 +0800
From: Hong Liu <hongl.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 11 Sep 2018 17:29:16 +0800
Message-ID: <20180911092917.25868-3-hongl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180911092917.25868-1-hongl.fnst@cn.fujitsu.com>
References: <20180911092917.25868-1-hongl.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.78]
X-yoursite-MailScanner-ID: AB0F44B6EC99.AB834
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: hongl.fnst@cn.fujitsu.com
Subject: =?UTF-8?B?W1BBVENIXSBbbWV0YS1jbG91ZC1zZXJ2aWNlc11bcGF0Y2hd77yacHl0aG9uLW1veDM6MC4yNS4wLT4wLjI2LjA=?=
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
X-List-Received-Date: Tue, 11 Sep 2018 09:29:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Upgrade python-mox3 from 0.25.0 to 0.26.0.

Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
---
 .../python/{python-mox3_0.25.0.bb => python-mox3_0.26.0.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-mox3_0.25.0.bb => python-mox3_0.26.0.bb} (75%)

diff --git a/meta-openstack/recipes-devtools/python/python-mox3_0.25.0.bb b/meta-openstack/recipes-devtools/python/python-mox3_0.26.0.bb
similarity index 75%
rename from meta-openstack/recipes-devtools/python/python-mox3_0.25.0.bb
rename to meta-openstack/recipes-devtools/python/python-mox3_0.26.0.bb
index 062fc7c..73de2b3 100644
--- a/meta-openstack/recipes-devtools/python/python-mox3_0.25.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-mox3_0.26.0.bb
@@ -4,8 +4,8 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://COPYING.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[md5sum] = "77bb9a6a57187b708d822bad05c51e0e"
-SRC_URI[sha256sum] = "b7476f7a2dfe4d7ad743e3cbbf04ade624b3a208a0042f3f8b2ae7b00559543a"
+SRC_URI[md5sum] = "c05b14ecb25d040f00b0d5ef3b370e20"
+SRC_URI[sha256sum] = "b13c0b8459d6fb0688f9a4e70feeec43fa2cca05b727fc01156789596e083bb1"
 
 inherit setuptools pypi
 
-- 
2.7.4




