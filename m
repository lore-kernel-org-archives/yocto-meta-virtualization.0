Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 97708E007FC
	for <meta-virtualization@yoctoproject.org>;
	Wed, 18 Dec 2013 12:42:46 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rBIKgkUY006746
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 18 Dec 2013 12:42:46 -0800 (PST)
Received: from yow-masselst-d1.wrs.com (128.224.146.23) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.347.0; Wed, 18 Dec 2013 12:42:45 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Wed, 18 Dec 2013 15:42:02 -0500
Message-ID: <1387399322-4509-2-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1387399322-4509-1-git-send-email-mark.asselstine@windriver.com>
References: <1387399322-4509-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.146.23]
Cc: meta-virtualization@yoctoproject.org
Subject: [PATCH] libvirt: add missing inherit
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
X-List-Received-Date: Wed, 18 Dec 2013 20:42:49 -0000
Content-Type: text/plain

libvirt's configure script makes use of pkg-config so we need to inherit
pkgconfig or else we may see an error like

./configure: line 55867: syntax error near unexpected token `AVAHI,'
./configure: line 55867: `    PKG_CHECK_MODULES(AVAHI, avahi-client >= 0.6.0,'

during configure.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 recipes-extended/libvirt/libvirt_1.2.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/libvirt/libvirt_1.2.0.bb b/recipes-extended/libvirt/libvirt_1.2.0.bb
index 80f06a2..f574ec5 100644
--- a/recipes-extended/libvirt/libvirt_1.2.0.bb
+++ b/recipes-extended/libvirt/libvirt_1.2.0.bb
@@ -27,7 +27,7 @@ SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.gz \
 SRC_URI[md5sum] = "f74f78059def4e68d69b975ad6e6c3e2"
 SRC_URI[sha256sum] = "a8e578ae7861db2ac5f454073293d2ef3229fd3f6c4f9029101763244db22ddd"
 
-inherit autotools gettext update-rc.d
+inherit autotools gettext update-rc.d pkgconfig
 
 CACHED_CONFIGUREVARS += "\
 ac_cv_path_XMLLINT=/usr/bin/xmllint \
-- 
1.8.3.2


