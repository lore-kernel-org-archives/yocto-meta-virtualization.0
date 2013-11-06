Return-Path: <cjp256@gmail.com>
Received: from mail-ie0-f174.google.com (mail-ie0-f174.google.com
	[209.85.223.174])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 12300E017DA
	for <meta-virtualization@yoctoproject.org>;
	Tue,  5 Nov 2013 19:10:06 -0800 (PST)
Received: by mail-ie0-f174.google.com with SMTP id qd12so16555289ieb.33
	for <meta-virtualization@yoctoproject.org>;
	Tue, 05 Nov 2013 19:10:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=vDfw0UbMwNskaAvvgrYpvT89Nzx1a+YBrAkQP0lO2qY=;
	b=qJMZPdM+tTG0OdX6sR2ZsrOWoMDjN+cXVW8RLRQNSHsy/eQf6dfS73IKL4rYwGygvD
	8KbxdLmRWvxoDwOJf2ac+inODRF/upLY+Vup/muABm0q0KxnuIqGXD+NjBZqO66y43Wc
	3yyqoCebHoSCQcqMLsz5JL4YGJPnzXDdKPRQFtpyYIXfzd+m+9q7LJrxeZIHuBqQPNzH
	q9moNkTH6Dmcrui3w1cpS1FQpqBO9Q/KiIXvt/R/MMDYQh2Nfqd8W67hFWzrOoTgyJki
	PkFR/MGDquN7gwqcuhkzHJF670uuLaT6C8wedsWvNn3EsuqcsbvMjz1cvOMhapqbcrtS
	WBWQ==
X-Received: by 10.43.57.79 with SMTP id wf15mr631867icb.14.1383707406551;
	Tue, 05 Nov 2013 19:10:06 -0800 (PST)
Received: from hatchery.local (cpe-74-71-215-22.twcny.res.rr.com.
	[74.71.215.22])
	by mx.google.com with ESMTPSA id v2sm5533825igz.3.2013.11.05.19.10.04
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Nov 2013 19:10:05 -0800 (PST)
From: Chris Patterson <cjp256@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Tue,  5 Nov 2013 22:09:02 -0500
Message-Id: <1383707342-3827-4-git-send-email-cjp256@gmail.com>
X-Mailer: git-send-email 1.8.4.rc3
In-Reply-To: <1383707342-3827-1-git-send-email-cjp256@gmail.com>
References: <1383707342-3827-1-git-send-email-cjp256@gmail.com>
Subject: [PATCH 4/4] xen: upgrade to 4.3.1
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
X-List-Received-Date: Wed, 06 Nov 2013 03:10:07 -0000

Changelog available at:
http://xenproject.org/downloads/xen-archives/supported-xen-43-series/xen-431.html

Signed-off-by: Chris Patterson <cjp256@gmail.com>
---
 recipes-extended/xen/{xen_4.3.0.bb => xen_4.3.1.bb} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename recipes-extended/xen/{xen_4.3.0.bb => xen_4.3.1.bb} (99%)

diff --git a/recipes-extended/xen/xen_4.3.0.bb b/recipes-extended/xen/xen_4.3.1.bb
similarity index 99%
rename from recipes-extended/xen/xen_4.3.0.bb
rename to recipes-extended/xen/xen_4.3.1.bb
index f1067bc..6985624 100644
--- a/recipes-extended/xen/xen_4.3.0.bb
+++ b/recipes-extended/xen/xen_4.3.1.bb
@@ -11,8 +11,8 @@ SRC_URI = " \
     file://flask-avoid-installing-policy-file-as-boot.patch \
     "
 
-SRC_URI[md5sum] = "7b18cfb58f1ac2ce39cf35a1867f0c0a"
-SRC_URI[sha256sum] = "e1e9faabe4886e2227aacdbde74410653b233d66642ca1972a860cbec6439961"
+SRC_URI[md5sum] = "7616b8704e1ab89c81f011f0e3703bc8"
+SRC_URI[sha256sum] = "3b5b7cc508b1739753585b5c25635471cdcef680e8770a78bf6ef9333d26a9fd"
 
 S = "${WORKDIR}/xen-${PV}"
 
@@ -215,11 +215,11 @@ FILES_${PN}-libfsimage-dev = "${libdir}/libfsimage.so"
 FILES_${PN}-fsimage = "${libdir}/fs/*/*fsimage.so"
 
 FILES_${PN}-hypervisor = "\
-    /boot/xen-4.3.0.gz \
+    /boot/xen-4.3.1.gz \
     /boot/xen-4.3.gz \
     /boot/xen-4.gz \
     /boot/xen.gz \
-    /boot/xen-syms-4.3.0 \
+    /boot/xen-syms-4.3.1 \
     "
 
 FILES_${PN}-base = "\
-- 
1.8.4.rc3


