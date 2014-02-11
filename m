Return-Path: <flihp@twobit.us>
Received: from smtp.twobit.us (smtp.twobit.us [38.83.192.235])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6F7E2E0076F
	for <meta-virtualization@yoctoproject.org>;
	Tue, 11 Feb 2014 04:14:10 -0800 (PST)
Received: from c-76-24-20-220.hsd1.ma.comcast.net ([76.24.20.220]
	helo=localhost)
	by smtp.twobit.us with esmtpsa (TLS1.2:DHE_RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <flihp@twobit.us>)
	id 1WDCCJ-0002Sl-Vn; Tue, 11 Feb 2014 12:12:20 +0000
Received: from flihp by localhost with local (Exim 4.80)
	(envelope-from <flihp@longhaul.twobit.us>)
	id 1WDCE2-0007KK-DZ; Tue, 11 Feb 2014 12:14:06 +0000
From: Philip Tricca <flihp@twobit.us>
To: cjp256@gmail.com
Date: Tue, 11 Feb 2014 12:14:06 +0000
Message-Id: <1392120846-28138-1-git-send-email-flihp@twobit.us>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <CABZSBQdi7nw7g4mwHV+pxv23ynLVtkT4vhzp25RgqiLT+kN4ag@mail.gmail.com>
References: <CABZSBQdi7nw7g4mwHV+pxv23ynLVtkT4vhzp25RgqiLT+kN4ag@mail.gmail.com>
X-SA-Exim-Connect-IP: 76.24.20.220
X-SA-Exim-Mail-From: flihp@twobit.us
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on smtp.twobit.us
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
X-SA-Exim-Version: 4.2.1 (built Mon, 26 Dec 2011 16:24:06 +0000)
X-SA-Exim-Scanned: Yes (on smtp.twobit.us)
Cc: meta-virtualization@yoctoproject.org
Subject: [PATCH] xen: Remove dependency on python-setuptools-native.
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
X-List-Received-Date: Tue, 11 Feb 2014 12:14:14 -0000

oe-core fixed some overlap between the python-setuptools-native and
python-distribute-native recently. This made python-setuptools
obsolite. See: http://patchwork.openembedded.org/patch/66085/
The Xen recipe already DEPENDS on python-distribute-native by
inheriting setuptools so we only need to remove the dependency on
python-setuptools-native.

Signed-off-by: Philip Tricca <flihp@twobit.us>
---
 recipes-extended/xen/xen.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index e0d01a5..b238ddb 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -17,7 +17,7 @@ PACKAGECONFIG ??= " \
 PACKAGECONFIG[sdl] = "--enable-sdl,--disable-sdl,virtual/libsdl,"
 PACKAGECONFIG[xsm] = "--enable-xsmpolicy,--disable-xsmpolicy,checkpolicy-native,"
 
-DEPENDS = "util-linux util-linux-native file-native zlib ncurses openssl bison-native flex-native gettext dev86-native iasl-native pciutils bridge-utils iproute2 procps yajl pixman python python-setuptools-native xz xz-native glib-2.0"
+DEPENDS = "util-linux util-linux-native file-native zlib ncurses openssl bison-native flex-native gettext dev86-native iasl-native pciutils bridge-utils iproute2 procps yajl pixman python xz xz-native glib-2.0"
 
 # inherit setuptools adds python to RDEPENDS, override it
 RDEPENDS_${PN} = ""
-- 
1.7.10.4


