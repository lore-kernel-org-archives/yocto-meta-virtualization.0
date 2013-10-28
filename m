Return-Path: <flihp@twobit.us>
Received: from smtp.twobit.us (unknown [38.83.192.235])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6BA9AE017A0
	for <meta-virtualization@yoctoproject.org>;
	Mon, 28 Oct 2013 15:10:49 -0700 (PDT)
Received: from c-76-24-20-220.hsd1.ma.comcast.net ([76.24.20.220]
	helo=localhost)
	by smtp.twobit.us with esmtpsa (TLS1.2:DHE_RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <flihp@twobit.us>)
	id 1Vav1L-00057I-Jx; Mon, 28 Oct 2013 22:10:48 +0000
Received: from flihp by localhost with local (Exim 4.80)
	(envelope-from <flihp@longhaul.twobit.us>)
	id 1Vav1S-0000na-Kr; Mon, 28 Oct 2013 22:10:54 +0000
From: Philip Tricca <flihp@twobit.us>
To: meta-virtualization@yoctoproject.org
Date: Mon, 28 Oct 2013 22:10:49 +0000
Message-Id: <1382998249-3028-3-git-send-email-flihp@twobit.us>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1382998249-3028-1-git-send-email-flihp@twobit.us>
References: <y>
 <1382998249-3028-1-git-send-email-flihp@twobit.us>
X-SA-Exim-Connect-IP: 76.24.20.220
X-SA-Exim-Mail-From: flihp@twobit.us
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on smtp.twobit.us
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED autolearn=ham
	version=3.3.2
X-SA-Exim-Version: 4.2.1 (built Mon, 26 Dec 2011 16:24:06 +0000)
X-SA-Exim-Scanned: Yes (on smtp.twobit.us)
Subject: [PATCH 2/2] Use PACKAGECONFIG to deal with XSM policy.
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
X-List-Received-Date: Mon, 28 Oct 2013 22:10:49 -0000


Signed-off-by: Philip Tricca <flihp@twobit.us>
---
 recipes-extended/xen/xen_4.3.0.bb |    8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/recipes-extended/xen/xen_4.3.0.bb b/recipes-extended/xen/xen_4.3.0.bb
index 7a0e408..09c25aa 100644
--- a/recipes-extended/xen/xen_4.3.0.bb
+++ b/recipes-extended/xen/xen_4.3.0.bb
@@ -20,7 +20,12 @@ COMPATIBLE_HOST = '(x86_64.*).*-linux'
 
 inherit autotools gettext setuptools update-rc.d
 
-DEPENDS = "util-linux util-linux-native file-native zlib ncurses openssl bison-native flex-native gettext dev86-native iasl-native pciutils virtual/libgl virtual/libsdl bridge-utils iproute2 procps yajl pixman python python-setuptools-native xz xz-native libsdl ${@base_contains('DISTRO_FEATURES', 'xsm', 'checkpolicy-native', '', d )}"
+PACKAGECONFIG ??= " \
+    xsm \
+"
+PACKAGECONFIG[xsm] = "--enable-xsmpolicy,--disable-xsmpolicy,checkpolicy-native,"
+
+DEPENDS = "util-linux util-linux-native file-native zlib ncurses openssl bison-native flex-native gettext dev86-native iasl-native pciutils virtual/libgl virtual/libsdl bridge-utils iproute2 procps yajl pixman python python-setuptools-native xz xz-native libsdl"
 
 # inherit setuptools adds python to RDEPENDS, override it
 RDEPENDS_${PN} = ""
@@ -571,7 +576,6 @@ EXTRA_OECONF += " \
     --disable-ioemu-stubdom \
     --disable-pv-grub \
     --disable-xenstore-stubdom \
-    ${@base_contains('DISTRO_FEATURES', 'xsm', '--enable-xsmpolicy', '--disable-xsmpolicy',d)} \
 "
 
 do_configure() {
-- 
1.7.10.4


