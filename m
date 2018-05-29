Return-Path: <hongl.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6DBBEE00C1B; Tue, 29 May 2018 04:01:30 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [183.91.158.132 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D22D9E00AE4
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 May 2018 04:01:28 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="40529795"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 29 May 2018 19:01:27 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id A06EA4B40414
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 May 2018 19:01:24 +0800 (CST)
Received: from localhost.localdomain (10.167.226.122) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.399.0; Tue, 29 May 2018 19:01:28 +0800
From: Hong Liu <hongl.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 29 May 2018 19:00:34 +0800
Message-ID: <20180529110036.32285-5-hongl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180529110036.32285-1-hongl.fnst@cn.fujitsu.com>
References: <20180529110036.32285-1-hongl.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.122]
X-yoursite-MailScanner-ID: A06EA4B40414.AE10C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: hongl.fnst@cn.fujitsu.com
Subject: [PATCH] [meta-cloud-services][PATCH] python-oslo.log: 3.30.0 -> 3.38.1
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
X-List-Received-Date: Tue, 29 May 2018 11:01:30 -0000
Content-Type: text/plain

Upgrade python-oslo.log from 3.30.0 to 3.38.1.

Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
---
 meta-openstack/recipes-devtools/python/python-oslo.log_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-openstack/recipes-devtools/python/python-oslo.log_git.bb b/meta-openstack/recipes-devtools/python/python-oslo.log_git.bb
index d6ca0ee..da7106f 100644
--- a/meta-openstack/recipes-devtools/python/python-oslo.log_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-oslo.log_git.bb
@@ -5,10 +5,10 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
 
 SRCNAME = "oslo.log"
-SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/pike"
+SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=master"
 
-PV = "3.30.0+git${SRCPV}"
-SRCREV = "ad776e84b51223b85b7dfa85a7e77bb2f3848f4b"
+PV = "3.38.1+git${SRCPV}"
+SRCREV = "89bbb3fb79ecfa45ed41afee86900131b3e37dc6"
 S = "${WORKDIR}/git"
 
 inherit setuptools
-- 
2.7.4




