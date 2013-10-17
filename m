Return-Path: <flihp@twobit.us>
Received: from www.twobit.us (www.twobit.us [50.19.210.51])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 34445E016D7
	for <meta-virtualization@yoctoproject.org>;
	Thu, 17 Oct 2013 11:47:54 -0700 (PDT)
Received: from c-76-24-20-220.hsd1.ma.comcast.net ([76.24.20.220]
	helo=longhaul.twobit.us)
	by www.twobit.us with esmtpsa (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.72) (envelope-from <flihp@twobit.us>)
	id 1VWsbx-0004ra-Dc; Thu, 17 Oct 2013 18:47:53 +0000
Received: from flihp by longhaul.twobit.us with local (Exim 4.80)
	(envelope-from <flihp@longhaul.twobit.us>)
	id 1VWsbp-0007uI-0G; Thu, 17 Oct 2013 18:47:45 +0000
From: flihp@twobit.us
To: meta-virtualization@yoctoproject.org
Date: Thu, 17 Oct 2013 18:47:35 +0000
Message-Id: <1382035656-30349-3-git-send-email-flihp@twobit.us>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1382035656-30349-1-git-send-email-flihp@twobit.us>
References: <1382035656-30349-1-git-send-email-flihp@twobit.us>
X-SA-Exim-Connect-IP: 76.24.20.220
X-SA-Exim-Mail-From: flihp@twobit.us
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on www.twobit.us
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.1
X-SA-Exim-Version: 4.2.1 (built Mon, 22 Mar 2010 06:26:47 +0000)
X-SA-Exim-Scanned: Yes (on www.twobit.us)
Subject: [PATCH 2/3] build xsm policy when 'xsm' DISTRO_FEATURE is present
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
X-List-Received-Date: Thu, 17 Oct 2013 18:47:54 -0000

From: Philip Tricca <flihp@twobit.us>

This pulls in a dependency on the checkpolicy compiler (native)
and adds --enable-xsmpolicy in do_configure when 'xsm'
DISTRO_FEATURE is present.

Signed-off-by: Philip Tricca <flihp@twobit.us>
---
 recipes-extended/xen/xen_4.3.0.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-extended/xen/xen_4.3.0.bb b/recipes-extended/xen/xen_4.3.0.bb
index 228f75f..078b39c 100644
--- a/recipes-extended/xen/xen_4.3.0.bb
+++ b/recipes-extended/xen/xen_4.3.0.bb
@@ -20,7 +20,7 @@ COMPATIBLE_HOST = '(x86_64.*).*-linux'
 
 inherit autotools gettext setuptools update-rc.d
 
-DEPENDS = "util-linux util-linux-native file-native zlib ncurses openssl bison-native flex-native gettext dev86-native iasl-native pciutils virtual/libgl virtual/libsdl bridge-utils iproute2 procps yajl pixman python python-setuptools-native xz xz-native libsdl"
+DEPENDS = "util-linux util-linux-native file-native zlib ncurses openssl bison-native flex-native gettext dev86-native iasl-native pciutils virtual/libgl virtual/libsdl bridge-utils iproute2 procps yajl pixman python python-setuptools-native xz xz-native libsdl ${@base_contains('DISTRO_FEATURES', 'xsm', 'checkpolicy-native', '', d )}"
 
 # inherit setuptools adds python to RDEPENDS, override it
 RDEPENDS_${PN} = ""
@@ -580,7 +580,7 @@ do_configure() {
     fi
 
     # do configure
-    ./configure --exec-prefix=/usr --prefix=/usr --host=${HOST_SYS} --disable-stubdom --disable-ioemu-stubdom --disable-pv-grub --disable-xenstore-stubdom
+    ./configure --exec-prefix=/usr --prefix=/usr --host=${HOST_SYS} --disable-stubdom --disable-ioemu-stubdom --disable-pv-grub --disable-xenstore-stubdom "${@base_contains('DISTRO_FEATURES', 'xsm', '--enable-xsmpolicy', '--disable-xsmpolicy',d)}"
 
     # seabios needs a patch to specify correct compiler - pull and patch Makefile
     make -C ${S}/tools/firmware seabios-dir
-- 
1.7.10.4


