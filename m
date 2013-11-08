Return-Path: <cjp256@gmail.com>
Received: from mail-ie0-f174.google.com (mail-ie0-f174.google.com
	[209.85.223.174])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B2B32E01830
	for <meta-virtualization@yoctoproject.org>;
	Thu,  7 Nov 2013 20:02:29 -0800 (PST)
Received: by mail-ie0-f174.google.com with SMTP id qd12so2436741ieb.5
	for <meta-virtualization@yoctoproject.org>;
	Thu, 07 Nov 2013 20:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=bHwJz1+vreUEZknoiLl1FlSY13o0QGVE7q+ShnWKUo8=;
	b=EtXz2lpB8WABau5/3fFl+2W0XWZPwYJuLz5051Ulx45hqgj34HCn50KalJcxaCgq5f
	owsM1XSLiwpzRWVhKs2JnAmOfAWgmiXfVDe35+yccKRLHMXL8ZaIFBVK+iSz2bAXbZGU
	pEnosvqNulvfwtpnbD+A5sZUMNYCWKFKsbIbghwtuWpGLcX1eVLjKM0ttNUOM3WwA0lW
	K9FoDKf3f77YtOaKLH83Cpv3GUoz/jKGTfpLre6z2H16+466xWILhxvKZQXT3C+c8QS9
	EcApe0JKzFWJw7/rHwXHzWWY2BOsKLTMUACxee9xNbHyefcqmh55R7AfQDwKsm6mcSrh
	sM2w==
X-Received: by 10.50.26.70 with SMTP id j6mr709181igg.24.1383883349359;
	Thu, 07 Nov 2013 20:02:29 -0800 (PST)
Received: from hatchery.local (cpe-74-71-215-22.twcny.res.rr.com.
	[74.71.215.22])
	by mx.google.com with ESMTPSA id hv5sm1230089igb.9.2013.11.07.20.02.27
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Nov 2013 20:02:28 -0800 (PST)
From: Chris Patterson <cjp256@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Thu,  7 Nov 2013 23:01:07 -0500
Message-Id: <1383883267-31992-11-git-send-email-cjp256@gmail.com>
X-Mailer: git-send-email 1.8.4.rc3
In-Reply-To: <1383883267-31992-1-git-send-email-cjp256@gmail.com>
References: <1383883267-31992-1-git-send-email-cjp256@gmail.com>
Subject: [PATCH v2 10/10] xen: add xen_git recipe.
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
X-List-Received-Date: Fri, 08 Nov 2013 04:02:29 -0000

Added recipe for xen unstable from git repository.

Moved now empty xen-flask and xen-libblktap packages from
required dependencies from xen.inc into xen_4.3.1.bb.

Signed-off-by: Chris Patterson <cjp256@gmail.com>
---
 recipes-extended/xen/xen.inc      |  2 --
 recipes-extended/xen/xen_4.3.1.bb |  5 +++++
 recipes-extended/xen/xen_git.bb   | 18 ++++++++++++++++++
 3 files changed, 23 insertions(+), 2 deletions(-)
 create mode 100644 recipes-extended/xen/xen_git.bb

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index fff3dc1..9d43814 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -35,9 +35,7 @@ RDEPENDS_${PN}-base = "\
     ${PN}-libvhd \
     ${PN}-libxenstat \
     ${PN}-libxenstore \
-    ${PN}-libblktap \
     ${PN}-libfsimage \
-    ${PN}-flask \
     ${PN}-fsimage \
     ${PN}-hvmloader \
     ${PN}-scripts-block \
diff --git a/recipes-extended/xen/xen_4.3.1.bb b/recipes-extended/xen/xen_4.3.1.bb
index 46563ce..2c9806b 100644
--- a/recipes-extended/xen/xen_4.3.1.bb
+++ b/recipes-extended/xen/xen_4.3.1.bb
@@ -10,6 +10,11 @@ SRC_URI[sha256sum] = "3b5b7cc508b1739753585b5c25635471cdcef680e8770a78bf6ef9333d
 
 S = "${WORKDIR}/xen-${PV}"
 
+RDEPENDS_${PN}-base += "\
+    ${PN}-libblktap \
+    ${PN}-flask \
+    "
+
 do_configure_prepend() {
     # fixup qemu-xen-traditional pciutils check hardcoded to test /usr/include/pci
     sed -i 's/\/usr\/include\/pci/$(STAGING_INCDIR)\/pci/g' ${S}/tools/qemu-xen-traditional/xen-hooks.mak
diff --git a/recipes-extended/xen/xen_git.bb b/recipes-extended/xen/xen_git.bb
new file mode 100644
index 0000000..f333157
--- /dev/null
+++ b/recipes-extended/xen/xen_git.bb
@@ -0,0 +1,18 @@
+require xen.inc
+
+SRCREV = "68bd172e6fa565899c846eb72755c8ffd8562c8a"
+
+PV = "4.4.0+git${SRCPV}"
+
+S = "${WORKDIR}/git"
+
+SRC_URI = " \
+    git://xenbits.xen.org/xen.git \
+    "
+
+DEFAULT_PREFERENCE = "-1"
+
+PACKAGES += "${PN}-xen-mfndump"
+
+FILES_${PN}-xen-mfndump = "${sbindir}/xen-mfndump"
+
-- 
1.8.4.rc3


