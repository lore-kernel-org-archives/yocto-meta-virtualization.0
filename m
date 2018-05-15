Return-Path: <leimaohui@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 414EFE00929; Thu, 24 May 2018 18:48:35 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9BA4DE007DA
	for <meta-virtualization@yoctoproject.org>;
	Thu, 24 May 2018 18:48:34 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="40347816"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 25 May 2018 09:48:33 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id EF62A4B40409
	for <meta-virtualization@yoctoproject.org>;
	Fri, 25 May 2018 09:48:28 +0800 (CST)
Received: from localhost.localdomain (10.167.225.27) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.399.0; Fri, 25 May 2018 09:48:30 +0800
From: Lei Maohui <leimaohui@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 15 May 2018 09:55:49 -0700
Message-ID: <1526403350-11091-8-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1526403350-11091-1-git-send-email-leimaohui@cn.fujitsu.com>
References: <1526403350-11091-1-git-send-email-leimaohui@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.27]
X-yoursite-MailScanner-ID: EF62A4B40409.AED2E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: leimaohui@cn.fujitsu.com
Subject: [PATCH 7/8] python-tenacity: Fix build error as following:
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
X-List-Received-Date: Fri, 25 May 2018 01:48:35 -0000
Content-Type: text/plain

"distutils.errors.DistutilsError: Could not find suitable distribution for Requirement.parse('pbr>=2.0.0')"

Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
---
 meta-openstack/recipes-devtools/python/python-tenacity_4.5.0.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-openstack/recipes-devtools/python/python-tenacity_4.5.0.bb b/meta-openstack/recipes-devtools/python/python-tenacity_4.5.0.bb
index e48a95b..ffb3258 100644
--- a/meta-openstack/recipes-devtools/python/python-tenacity_4.5.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-tenacity_4.5.0.bb
@@ -11,6 +11,11 @@ SRC_URI[sha256sum] = "e5eb0009d7fef345ffd27e43122ec288418b460952aeefde60df8e62c3
 
 inherit setuptools
 
+# Satisfy setup.py 'setup_requires'
+DEPENDS += " \
+        python-pbr-native \
+        "
+
 RDEPENDS_${PN} += " \
         python-six \
         python-futures \
-- 
1.9.1




