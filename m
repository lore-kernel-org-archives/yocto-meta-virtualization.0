Return-Path: <Yang.Shi@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E5D62E016D1
	for <meta-virtualization@yoctoproject.org>;
	Thu, 17 Oct 2013 12:34:39 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9HJYbp3013896
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Thu, 17 Oct 2013 12:34:37 -0700 (PDT)
Received: from localhost.localdomain (147.11.152.86) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Thu, 17 Oct 2013 12:34:37 -0700
From: Yang Shi <yang.shi@windriver.com>
To: <bruce.ashfield@windriver.com>, <meta-virtualization@yoctoproject.org>
Date: Thu, 17 Oct 2013 12:29:24 -0700
Message-ID: <1382038164-21363-1-git-send-email-yang.shi@windriver.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
Cc: yang.shi@windriver.com
Subject: [PATCH] libvirt: Fix wrong depend for libxl
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
X-List-Received-Date: Thu, 17 Oct 2013 19:34:40 -0000
Content-Type: text/plain

xen is not the right dependancy for --with-libxl/--without-libxl, replace
it to libxl.

Signed-off-by: Yang Shi <yang.shi@windriver.com>
---
 recipes-extended/libvirt/libvirt_1.1.2.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes-extended/libvirt/libvirt_1.1.2.bb b/recipes-extended/libvirt/libvirt_1.1.2.bb
index 819072d..ca34b3c 100644
--- a/recipes-extended/libvirt/libvirt_1.1.2.bb
+++ b/recipes-extended/libvirt/libvirt_1.1.2.bb
@@ -131,7 +131,7 @@ PACKAGECONFIG[qemu] = "--with-qemu,--without-qemu,qemu,"
 PACKAGECONFIG[yajl] = "--with-yajl,--without-yajl,yajl,yajl"
 PACKAGECONFIG[xen] = "--with-xen,--without-xen,xen,"
 PACKAGECONFIG[xenapi] = "--with-xenapi,--without-xenapi,,"
-PACKAGECONFIG[libxl] = "--with-libxl=${STAGING_DIR_TARGET}/lib,--without-libxl,xen,"
+PACKAGECONFIG[libxl] = "--with-libxl=${STAGING_DIR_TARGET}/lib,--without-libxl,libxl,"
 PACKAGECONFIG[xen-inotify] = "--with-xen-inotify,--without-xen-inotify,xen,"
 PACKAGECONFIG[uml] = "--with-uml, --without-uml,,"
 PACKAGECONFIG[openvz] = "--with-openvz,--without-openvz,,"
-- 
1.7.5.4


