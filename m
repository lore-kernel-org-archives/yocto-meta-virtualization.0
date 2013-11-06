Return-Path: <flihp@twobit.us>
Received: from smtp.twobit.us (unknown [38.83.192.235])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 22BF3E0174E
	for <meta-virtualization@yoctoproject.org>;
	Tue,  5 Nov 2013 18:54:33 -0800 (PST)
Received: from c-76-24-20-220.hsd1.ma.comcast.net ([76.24.20.220]
	helo=localhost)
	by smtp.twobit.us with esmtpsa (TLS1.2:DHE_RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <flihp@twobit.us>)
	id 1VdtGA-0002ES-S1; Wed, 06 Nov 2013 02:54:23 +0000
Received: from flihp by localhost with local (Exim 4.80)
	(envelope-from <flihp@longhaul.twobit.us>)
	id 1VdtGd-0000vt-7T; Wed, 06 Nov 2013 02:54:51 +0000
From: Philip Tricca <flihp@twobit.us>
To: meta-virtualization@yoctoproject.org
Date: Wed,  6 Nov 2013 02:54:51 +0000
Message-Id: <1383706491-3555-1-git-send-email-flihp@twobit.us>
X-Mailer: git-send-email 1.7.10.4
X-SA-Exim-Connect-IP: 76.24.20.220
X-SA-Exim-Mail-From: flihp@twobit.us
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on smtp.twobit.us
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED autolearn=ham
	version=3.3.2
X-SA-Exim-Version: 4.2.1 (built Mon, 26 Dec 2011 16:24:06 +0000)
X-SA-Exim-Scanned: Yes (on smtp.twobit.us)
Subject: [PATCH] Add getty to inittab for login on Xen serial console.
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
X-List-Received-Date: Wed, 06 Nov 2013 02:54:35 -0000

It's not pretty but the mechanisms in sysvinit-inittab assume the
console device name is tty*. The Xen console device doesn't meet
this criteria.

Signed-off-by: Philip Tricca <flihp@twobit.us>
---
 recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bbappend |    7 +++++++
 1 file changed, 7 insertions(+)
 create mode 100644 recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bbappend

diff --git a/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bbappend b/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bbappend
new file mode 100644
index 0000000..2edbedf
--- /dev/null
+++ b/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bbappend
@@ -0,0 +1,7 @@
+do_install_append() {
+	echo "${DISTRO_FEATURES}" | grep -q 'xen'
+	if [ $? -eq 0 ]; then
+		echo "" >> ${D}${sysconfdir}/inittab
+		echo "X0:12345:respawn:/sbin/getty 115200 hvc0" >> ${D}${sysconfdir}/inittab
+	fi
+}
-- 
1.7.10.4


