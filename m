Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EC94AE00CB9; Wed,  3 Feb 2016 17:42:11 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 78115E00C97
	for <meta-virtualization@yoctoproject.org>;
	Wed,  3 Feb 2016 17:41:58 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u141fw1p000299
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 3 Feb 2016 17:41:58 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 3 Feb 2016 17:41:57 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Wed, 3 Feb 2016 20:41:07 -0500
Message-ID: <1454550104-7065-13-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1454550104-7065-1-git-send-email-mark.asselstine@windriver.com>
References: <1454550104-7065-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [m-c-s][PATCH 12/49] python-oslo.service: update dependencies
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
X-List-Received-Date: Thu, 04 Feb 2016 01:42:12 -0000
Content-Type: text/plain

From: Mark Asselstine <asselsm@gmail.com>

Update dependencies based on the package's required.txt.

Signed-off-by: Mark Asselstine <asselsm@gmail.com>
---
 .../recipes-devtools/python/python-oslo.service_git.bb     | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/meta-openstack/recipes-devtools/python/python-oslo.service_git.bb b/meta-openstack/recipes-devtools/python/python-oslo.service_git.bb
index 56384bc..379bff3 100644
--- a/meta-openstack/recipes-devtools/python/python-oslo.service_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-oslo.service_git.bb
@@ -21,4 +21,18 @@ DEPENDS += " \
 
 RDEPENDS_${PN} += " \
         python-pbr \
+        python-babel \
+        python-webob \
+        python-eventlet \
+        python-greenlet \
+        python-monotonic \
+        python-oslo.utils \
+        python-oslo.concurrency \
+        python-oslo.config \
+        python-oslo.log \
+        python-six \
+        python-oslo.i18n \
+        python-pastedeploy \
+        python-paste \
+        python-routes \
         "
-- 
2.1.4


