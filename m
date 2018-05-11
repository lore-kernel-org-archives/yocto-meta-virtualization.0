Return-Path: <leimaohui@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 63AC2E00CA6; Sun, 20 May 2018 18:56:10 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	RCVD_IN_DNSWL_NONE autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [183.91.158.132 listed in list.dnswl.org]
	* 3.4 DATE_IN_PAST_96_XX Date: is 96 hours or more before Received:
	date * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 042DFE00CA1
	for <meta-virtualization@yoctoproject.org>;
	Sun, 20 May 2018 18:56:07 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="40140973"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 21 May 2018 09:56:05 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 876154D0EFE1
	for <meta-virtualization@yoctoproject.org>;
	Mon, 21 May 2018 09:56:00 +0800 (CST)
Received: from localhost.localdomain (10.167.225.27) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.399.0; Mon, 21 May 2018 09:56:02 +0800
From: Lei Maohui <leimaohui@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Fri, 11 May 2018 10:03:08 -0700
Message-ID: <1526058191-56109-6-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1526058191-56109-1-git-send-email-leimaohui@cn.fujitsu.com>
References: <1526058191-56109-1-git-send-email-leimaohui@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.27]
X-yoursite-MailScanner-ID: 876154D0EFE1.AED71
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: leimaohui@cn.fujitsu.com
Subject: [oe-virtualization][meta-cloud-services][PATCH 5/8] python-oslo.concurrency: Fix build error as following:
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
X-List-Received-Date: Mon, 21 May 2018 01:56:10 -0000
Content-Type: text/plain

"distutils.errors.DistutilsError: Could not find suitable distribution for Requirement.parse('pbr>=2.0.0')"

Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-oslo.concurrency_git.bb           | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-openstack/recipes-devtools/python/python-oslo.concurrency_git.bb b/meta-openstack/recipes-devtools/python/python-oslo.concurrency_git.bb
index 16ebc89..fe095d0 100644
--- a/meta-openstack/recipes-devtools/python/python-oslo.concurrency_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-oslo.concurrency_git.bb
@@ -21,6 +21,11 @@ DEPENDS += " \
         python-pbr \
         "
 
+# Satisfy setup.py 'setup_requires'
+DEPENDS += " \
+        python-pbr-native \
+        "
+
 # RDEPENDS_default: 
 RDEPENDS_${PN} += " \
         python-pbr \
-- 
1.9.1




