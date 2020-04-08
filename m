Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web12.11649.1586353494764578877
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 08 Apr 2020 06:44:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: trevor.gamblin@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 038Dirva012016
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 8 Apr 2020 06:44:53 -0700 (PDT)
Received: from yow-tgamblin-fedora2.wrs.com (128.224.56.206) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
 14.3.487.0; Wed, 8 Apr 2020 06:44:53 -0700
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-openstack][PATCH] python3-debtcollector: add python3-wrapt to RDEPENDS
Date: Wed, 8 Apr 2020 09:44:52 -0400
Message-ID: <20200408134452.777522-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add python3-wrapt to RDEPENDS, as debtcollector requires it
for some functionality:

|root@qemux86-64:~# python3
|Python 3.7.6 (default, Apr  6 2020, 18:11:01)
|[GCC 9.2.0] on linux
|Type "help", "copyright", "credits" or "license" for more information.
|>>> from debtcollector import removals
|Traceback (most recent call last):
|  File "<stdin>", line 1, in <module>
|  File "/usr/lib64/python3.7/site-packages/debtcollector/removals.py", line 19, in <module>
|    import wrapt
|ModuleNotFoundError: No module named 'wrapt'
|>>>

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 meta-openstack/recipes-devtools/python/python-debtcollector.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-openstack/recipes-devtools/python/python-debtcollector.inc b/meta-openstack/recipes-devtools/python/python-debtcollector.inc
index d519bfd..f8b5e43 100644
--- a/meta-openstack/recipes-devtools/python/python-debtcollector.inc
+++ b/meta-openstack/recipes-devtools/python/python-debtcollector.inc
@@ -22,4 +22,5 @@ DEPENDS += " \
 # RDEPENDS_default:
 RDEPENDS_${PN} += " \
         ${PYTHON_PN}-pbr \
+        ${PYTHON_PN}-wrapt \
         "
-- 
2.25.1

