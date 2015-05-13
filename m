Return-Path: <Jackie.Huang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B750AE00A01; Wed, 13 May 2015 00:25:03 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E061EE00820
	for <meta-virtualization@yoctoproject.org>;
	Wed, 13 May 2015 00:24:46 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t4D7Ok3e006036
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 13 May 2015 00:24:46 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Wed, 13 May 2015 00:24:46 -0700
From: <jackie.huang@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 13 May 2015 15:24:32 +0800
Message-ID: <ec6bbf5283bc93fdee15e17b37fd3a3479a510f2.1431501591.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1431501591.git.jackie.huang@windriver.com>
References: <cover.1431501591.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 09/11] python-pyscss: add missing rdepends on python-enum
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
X-List-Received-Date: Wed, 13 May 2015 07:25:03 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Add missing rdepends on python-enum or it fails with:
  File "/usr/lib64/python2.7/site-packages/scss/compiler.py", line 7, in <module>
    from enum import Enum
  ImportError: No module named enum

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-openstack/recipes-devtools/python/python-pyscss_1.3.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-openstack/recipes-devtools/python/python-pyscss_1.3.4.bb b/meta-openstack/recipes-devtools/python/python-pyscss_1.3.4.bb
index f26352a..72ea639 100644
--- a/meta-openstack/recipes-devtools/python/python-pyscss_1.3.4.bb
+++ b/meta-openstack/recipes-devtools/python/python-pyscss_1.3.4.bb
@@ -25,6 +25,7 @@ DEPENDS += " \
 
 # RDEPENDS_default: 
 RDEPENDS_${PN} += " \
+        python-enum \
         "
 
 CLEANBROKEN = "1"
-- 
1.9.1


