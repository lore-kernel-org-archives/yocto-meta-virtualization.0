Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 561E1E007F8
	for <meta-virtualization@yoctoproject.org>;
	Wed, 18 Dec 2013 10:11:25 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rBIIBONF007087
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 18 Dec 2013 10:11:24 -0800 (PST)
Received: from yow-masselst-d1.wrs.com (128.224.146.23) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.347.0; Wed, 18 Dec 2013 10:11:24 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Wed, 18 Dec 2013 13:11:30 -0500
Message-ID: <1387390290-22365-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 1.8.3.2
MIME-Version: 1.0
X-Originating-IP: [128.224.146.23]
Cc: meta-virtualization@yoctoproject.org
Subject: [PATCH] lxc: add missing inherit
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
X-List-Received-Date: Wed, 18 Dec 2013 18:11:28 -0000
Content-Type: text/plain

lxc's configure script makes use of pkg-config so we need to inherit
pkgconfig or else we may see an error like

./configure: line 5315: syntax error near unexpected token `PYTHONDEV,'
./configure: line 5315: `      PKG_CHECK_MODULES(PYTHONDEV, python3 >= \
                     3.2,,AC_MSG_ERROR([You must install python3-dev]))'

during configure.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 recipes-containers/lxc/lxc_0.9.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/lxc/lxc_0.9.0.bb b/recipes-containers/lxc/lxc_0.9.0.bb
index 8f7736b..fbb35de 100644
--- a/recipes-containers/lxc/lxc_0.9.0.bb
+++ b/recipes-containers/lxc/lxc_0.9.0.bb
@@ -41,7 +41,7 @@ PACKAGECONFIG[doc] = "--enable-doc,--disable-doc,,"
 PACKAGECONFIG[rpath] = "--enable-rpath,--disable-rpath,,"
 PACKAGECONFIG[apparmour] = "--enable-apparmor,--disable-apparmor,apparmor,apparmor"
 
-inherit autotools
+inherit autotools pkgconfig
 
 FILES_${PN}-doc = "${mandir} ${infodir}"
 # For LXC the docdir only contains example configuration files and should be included in the lxc package
-- 
1.8.3.2


