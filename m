Return-Path: <flihp@twobit.us>
Received: from smtp.twobit.us (smtp.twobit.us [38.83.192.235])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 88592E00764
	for <meta-virtualization@yoctoproject.org>;
	Sun,  9 Feb 2014 17:45:29 -0800 (PST)
Received: from c-76-24-20-220.hsd1.ma.comcast.net ([76.24.20.220]
	helo=localhost)
	by smtp.twobit.us with esmtpsa (TLS1.2:DHE_RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <flihp@twobit.us>)
	id 1WCfuL-0001PM-SJ; Mon, 10 Feb 2014 01:43:43 +0000
Received: from flihp by localhost with local (Exim 4.80)
	(envelope-from <flihp@longhaul.twobit.us>)
	id 1WCfvz-0003l8-Lg; Mon, 10 Feb 2014 01:45:19 +0000
From: Philip Tricca <flihp@twobit.us>
To: meta-virtualization@yoctoproject.org
Date: Mon, 10 Feb 2014 01:45:18 +0000
Message-Id: <1391996719-14419-2-git-send-email-flihp@twobit.us>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1391996719-14419-1-git-send-email-flihp@twobit.us>
References: <1391996719-14419-1-git-send-email-flihp@twobit.us>
X-SA-Exim-Connect-IP: 76.24.20.220
X-SA-Exim-Mail-From: flihp@twobit.us
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on smtp.twobit.us
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
X-SA-Exim-Version: 4.2.1 (built Mon, 26 Dec 2011 16:24:06 +0000)
X-SA-Exim-Scanned: Yes (on smtp.twobit.us)
Subject: [PATCH 1/2] xen: Replace python-setuptools-native with python-distutils-native to keep pace with upstream.
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
X-List-Received-Date: Mon, 10 Feb 2014 01:45:29 -0000

python-native RPROVIDES python-distutils-native so this changes the
dependency around a bit.

Signed-off-by: Philip Tricca <flihp@twobit.us>

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index e0d01a5..bd2fc74 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -17,10 +17,10 @@ PACKAGECONFIG ??= " \
 PACKAGECONFIG[sdl] = "--enable-sdl,--disable-sdl,virtual/libsdl,"
 PACKAGECONFIG[xsm] = "--enable-xsmpolicy,--disable-xsmpolicy,checkpolicy-native,"
 
-DEPENDS = "util-linux util-linux-native file-native zlib ncurses openssl bison-native flex-native gettext dev86-native iasl-native pciutils bridge-utils iproute2 procps yajl pixman python python-setuptools-native xz xz-native glib-2.0"
+DEPENDS = "util-linux util-linux-native file-native zlib ncurses openssl bison-native flex-native gettext dev86-native iasl-native pciutils bridge-utils iproute2 procps yajl pixman python xz xz-native glib-2.0"
 
 # inherit setuptools adds python to RDEPENDS, override it
-RDEPENDS_${PN} = ""
+RDEPENDS_${PN} = "python-distutils-native"
 
 RDEPENDS_${PN}-base = "\
     libgcc udev bash perl xz \
-- 
1.7.10.4


