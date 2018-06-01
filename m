Return-Path: <leimaohui@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8C4FEE01E19; Sun, 10 Jun 2018 23:22:31 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	RCVD_IN_DNSWL_LOW autolearn=no version=3.3.1
X-Spam-HAM-Report: * 3.4 DATE_IN_PAST_96_XX Date: is 96 hours or more before
	Received: date
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [183.91.158.132 listed in list.dnswl.org]
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B941DE01E15
	for <meta-virtualization@yoctoproject.org>;
	Sun, 10 Jun 2018 23:22:30 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="40934722"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 11 Jun 2018 14:22:27 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id A0D674B41E96
	for <meta-virtualization@yoctoproject.org>;
	Mon, 11 Jun 2018 14:22:25 +0800 (CST)
Received: from localhost.localdomain (10.167.225.27) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.399.0; Mon, 11 Jun 2018 14:22:28 +0800
From: Lei Maohui <leimaohui@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 31 May 2018 18:26:02 -0700
Message-ID: <1527816362-29658-1-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.27]
X-yoursite-MailScanner-ID: A0D674B41E96.AF0D4
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: leimaohui@cn.fujitsu.com
Subject: [oe-virtualization][meta-cloud-services][PATCH] python-saharaclient: Fix build error as following:
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
X-List-Received-Date: Mon, 11 Jun 2018 06:22:31 -0000
Content-Type: text/plain

"distutils.errors.DistutilsError: Could not find suitable distribution for Requirement.parse('pbr>=2.0.0')"

Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
---
 meta-openstack/recipes-devtools/python/python-saharaclient_git.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-openstack/recipes-devtools/python/python-saharaclient_git.bb b/meta-openstack/recipes-devtools/python/python-saharaclient_git.bb
index 0ec262c..1ce3a85 100644
--- a/meta-openstack/recipes-devtools/python/python-saharaclient_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-saharaclient_git.bb
@@ -14,6 +14,11 @@ DEPENDS += " \
         python-pbr-native \
         "
 
+# Satisfy setup.py 'setup_requires'
+DEPENDS += " \
+        python-pbr-native \
+"
+
 RDEPENDS_${PN} += " \
 	python-pbr \
 	"
-- 
1.9.1




