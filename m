Return-Path: <flihp@twobit.us>
Received: from smtp.twobit.us (smtp.twobit.us [38.83.192.235])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6D82EE00782
	for <meta-virtualization@yoctoproject.org>;
	Tue, 26 Nov 2013 05:08:45 -0800 (PST)
Received: from c-76-24-20-220.hsd1.ma.comcast.net ([76.24.20.220]
	helo=localhost)
	by smtp.twobit.us with esmtpsa (TLS1.2:DHE_RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <flihp@twobit.us>)
	id 1VlIND-0004uD-3P; Tue, 26 Nov 2013 13:08:15 +0000
Received: from flihp by localhost with local (Exim 4.80)
	(envelope-from <flihp@longhaul.twobit.us>)
	id 1VlINr-0008Mi-EI; Tue, 26 Nov 2013 13:08:55 +0000
From: Philip Tricca <flihp@twobit.us>
To: meta-virtualization@yoctoproject.org
Date: Tue, 26 Nov 2013 13:08:55 +0000
Message-Id: <1385471335-32126-1-git-send-email-flihp@twobit.us>
X-Mailer: git-send-email 1.7.10.4
X-SA-Exim-Connect-IP: 76.24.20.220
X-SA-Exim-Mail-From: flihp@twobit.us
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on smtp.twobit.us
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED autolearn=ham
	version=3.3.2
X-SA-Exim-Version: 4.2.1 (built Mon, 26 Dec 2011 16:24:06 +0000)
X-SA-Exim-Scanned: Yes (on smtp.twobit.us)
Subject: [PATCH] base-files: add xenfs entry to fstab if xen DISTRO_FEATURE is enabled
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
X-List-Received-Date: Tue, 26 Nov 2013 13:08:48 -0000

Xen handles mounting xenfs with an init script. Unfortunately this
script is the same one that starts xenstored and xenconsoled. That's
great for dom0 but a domU may need xenfs but running xenstored/
xenconsoled in a domU makes no sense. A simple fstab entry is
preferrable.

Signed-off-by: Philip Tricca <flihp@twobit.us>
---
 recipes-core/base-files/base-files_3.0.14.bbappend |    5 +++++
 1 file changed, 5 insertions(+)
 create mode 100644 recipes-core/base-files/base-files_3.0.14.bbappend

diff --git a/recipes-core/base-files/base-files_3.0.14.bbappend b/recipes-core/base-files/base-files_3.0.14.bbappend
new file mode 100644
index 0000000..eb973ad
--- /dev/null
+++ b/recipes-core/base-files/base-files_3.0.14.bbappend
@@ -0,0 +1,5 @@
+do_install_append() {
+	if echo "${DISTRO_FEATURES}" | grep -q 'xen'; then
+		echo "xenfs                /proc/xen            xenfs      defaults              0  0" >> ${D}${sysconfdir}/fstab
+	fi
+}
-- 
1.7.10.4


