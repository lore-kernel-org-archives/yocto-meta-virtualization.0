Return-Path: <cjp256@gmail.com>
Received: from mail-ie0-f179.google.com (mail-ie0-f179.google.com
	[209.85.223.179])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BB85DE01683
	for <meta-virtualization@yoctoproject.org>;
	Sun,  6 Oct 2013 14:22:54 -0700 (PDT)
Received: by mail-ie0-f179.google.com with SMTP id e14so13357425iej.24
	for <meta-virtualization@yoctoproject.org>;
	Sun, 06 Oct 2013 14:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ZVlEUszV4ONWCm1gwcgdZy3g9tx+taT3yN9N2zVxYXg=;
	b=ffjjbERe0+R+PDGnFRUkBhi5o59TMOtImXoWYV/vZ4N9IR3xDyD63lnMB+PUMSiL3I
	VuOf1Q0uGzQOHraB97UvlvugD5BN/je2ZV6pm6lUcEZyh7ILWLRDrHykna65v8MSrbzO
	NTnThQ4FkJtmG0QRtoOXS5RAFjWI/vP4z06GvTEt5JDZ8MXarPy2B9Z4wu/Mpi3C9921
	93Bp7/yZVhZGhw7Gc4UJhQtZ34mPU6pX+R9u2fZbI0L4EH3csA4dt4Zjwf9rfr/ZZhtu
	dqKc7og8UpKzJkGjBPaFckKk8pPSpb6Ed/p0Pu3zrjWGQmhCZJVo3Cx3PFgKzi9scdlG
	f0Qg==
X-Received: by 10.50.20.99 with SMTP id m3mr14280625ige.54.1381094573608;
	Sun, 06 Oct 2013 14:22:53 -0700 (PDT)
Received: from hatchery.local (cpe-74-71-215-22.twcny.res.rr.com.
	[74.71.215.22])
	by mx.google.com with ESMTPSA id i3sm22631061igh.0.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 06 Oct 2013 14:22:52 -0700 (PDT)
From: Chris Patterson <cjp256@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Sun,  6 Oct 2013 17:22:15 -0400
Message-Id: <1381094537-11576-3-git-send-email-cjp256@gmail.com>
X-Mailer: git-send-email 1.8.4.rc3
In-Reply-To: <1381094537-11576-1-git-send-email-cjp256@gmail.com>
References: <1381094537-11576-1-git-send-email-cjp256@gmail.com>
Subject: [PATCH] xen: Add sdl support by including dependency for libsdl.
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
X-List-Received-Date: Sun, 06 Oct 2013 21:22:54 -0000

Signed-off-by: Chris Patterson <cjp256@gmail.com>
---
 recipes-extended/xen/xen_4.3.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-extended/xen/xen_4.3.0.bb b/recipes-extended/xen/xen_4.3.0.bb
index 233be99..9cbd2ac 100644
--- a/recipes-extended/xen/xen_4.3.0.bb
+++ b/recipes-extended/xen/xen_4.3.0.bb
@@ -17,13 +17,13 @@ COMPATIBLE_HOST = '(x86_64.*).*-linux'
 
 inherit autotools gettext setuptools update-rc.d
 
-DEPENDS = "util-linux util-linux-native file-native zlib ncurses openssl bison-native flex-native gettext dev86-native iasl-native pciutils virtual/libgl virtual/libsdl bridge-utils iproute2 procps yajl pixman python python-setuptools-native xz xz-native"
+DEPENDS = "util-linux util-linux-native file-native zlib ncurses openssl bison-native flex-native gettext dev86-native iasl-native pciutils virtual/libgl virtual/libsdl bridge-utils iproute2 procps yajl pixman python python-setuptools-native xz xz-native libsdl"
 
 # inherit setuptools adds python to RDEPENDS, override it
 RDEPENDS_${PN} = ""
 
 RDEPENDS_${PN}-base = "\
-    libgcc udev bash perl xz \
+    libgcc libsdl udev bash perl xz \
     ${PN}-blktap \
     ${PN}-console \
     ${PN}-libblktapctl \
-- 
1.8.4.rc3


