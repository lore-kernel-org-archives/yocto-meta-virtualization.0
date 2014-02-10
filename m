Return-Path: <flihp@twobit.us>
Received: from smtp.twobit.us (smtp.twobit.us [38.83.192.235])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D4BA0E0053A
	for <meta-virtualization@yoctoproject.org>;
	Mon, 10 Feb 2014 08:36:04 -0800 (PST)
Received: from c-76-24-20-220.hsd1.ma.comcast.net ([76.24.20.220]
	helo=localhost)
	by smtp.twobit.us with esmtpsa (TLS1.2:DHE_RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <flihp@twobit.us>)
	id 1WCtoG-0001qx-JB; Mon, 10 Feb 2014 16:34:17 +0000
Received: from flihp by localhost with local (Exim 4.80)
	(envelope-from <flihp@longhaul.twobit.us>)
	id 1WCtpw-0003Cp-PA; Mon, 10 Feb 2014 16:36:00 +0000
From: Philip Tricca <flihp@twobit.us>
To: cjp256@gmail.com
Date: Mon, 10 Feb 2014 16:36:00 +0000
Message-Id: <1392050160-12297-1-git-send-email-flihp@twobit.us>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <CABZSBQe0p6X805ErdNkFS99Yuu-04vki+h50B5U00tcO4EV9hQ@mail.gmail.com>
References: <CABZSBQe0p6X805ErdNkFS99Yuu-04vki+h50B5U00tcO4EV9hQ@mail.gmail.com>
X-SA-Exim-Connect-IP: 76.24.20.220
X-SA-Exim-Mail-From: flihp@twobit.us
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on smtp.twobit.us
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
X-SA-Exim-Version: 4.2.1 (built Mon, 26 Dec 2011 16:24:06 +0000)
X-SA-Exim-Scanned: Yes (on smtp.twobit.us)
Cc: meta-virtualization@yoctoproject.org
Subject: [PATCH] xen: Replace python-setuptools-native dependency with python-distribute-native.
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
X-List-Received-Date: Mon, 10 Feb 2014 16:36:05 -0000

oe-core fixed some overlap between the python-setuptools and
python-distribute recently. See:

http://patchwork.openembedded.org/patch/66085/.

Signed-off-by: Philip Tricca <flihp@twobit.us>
---
 recipes-extended/xen/xen.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index e0d01a5..d671d0f 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -17,7 +17,7 @@ PACKAGECONFIG ??= " \
 PACKAGECONFIG[sdl] = "--enable-sdl,--disable-sdl,virtual/libsdl,"
 PACKAGECONFIG[xsm] = "--enable-xsmpolicy,--disable-xsmpolicy,checkpolicy-native,"
 
-DEPENDS = "util-linux util-linux-native file-native zlib ncurses openssl bison-native flex-native gettext dev86-native iasl-native pciutils bridge-utils iproute2 procps yajl pixman python python-setuptools-native xz xz-native glib-2.0"
+DEPENDS = "util-linux util-linux-native file-native zlib ncurses openssl bison-native flex-native gettext dev86-native iasl-native pciutils bridge-utils iproute2 procps yajl pixman python python-distribute-native xz xz-native glib-2.0"
 
 # inherit setuptools adds python to RDEPENDS, override it
 RDEPENDS_${PN} = ""
-- 
1.7.10.4


