Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5EDB2E007AD
	for <meta-virtualization@yoctoproject.org>;
	Wed, 18 Dec 2013 13:38:49 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rBILcmgR015758
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 18 Dec 2013 13:38:48 -0800 (PST)
Received: from yow-masselst-d1.wrs.com (128.224.146.23) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.347.0; Wed, 18 Dec 2013 13:38:48 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Wed, 18 Dec 2013 16:36:52 -0500
Message-ID: <1387402612-16479-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 1.8.3.2
MIME-Version: 1.0
X-Originating-IP: [128.224.146.23]
Cc: meta-virtualization@yoctoproject.org
Subject: [PATCH] irqbalance: add missing inherit
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
X-List-Received-Date: Wed, 18 Dec 2013 21:38:49 -0000
Content-Type: text/plain

irqblance's configure script makes use of pkg-config so we need to inherit
pkgconfig or else we may see an error like

./configure: line 12460: syntax error near unexpected token `GLIB,'
./configure: line 12460: `  PKG_CHECK_MODULES(GLIB, glib-2.0 >= 2.28)'

during configure.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
Bruce,

One last one. This one was lurking so I didn't spot it along with
the others. I am confident this will be the last commit related
to pkgconfig.

Mark

 recipes-extended/irqbalance/irqbalance.inc | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/recipes-extended/irqbalance/irqbalance.inc b/recipes-extended/irqbalance/irqbalance.inc
index 789cc9b..c20840d 100644
--- a/recipes-extended/irqbalance/irqbalance.inc
+++ b/recipes-extended/irqbalance/irqbalance.inc
@@ -18,8 +18,7 @@ DEPENDS = "glib-2.0"
 INITSCRIPT_NAME = "irqbalanced"
 INITSCRIPT_PARAMS = "defaults"
 
-inherit autotools
-inherit update-rc.d
+inherit autotools update-rc.d pkgconfig
 
 EXTRA_OECONF = "--program-transform-name= \
 	       "
-- 
1.8.3.2


