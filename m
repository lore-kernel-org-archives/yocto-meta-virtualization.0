Return-Path: <riku.voipio@linaro.org>
Received: from afflict.kos.to (afflict.kos.to [92.243.29.197])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EB36EE01897
	for <meta-virtualization@yoctoproject.org>;
	Mon, 11 Nov 2013 06:01:38 -0800 (PST)
Received: from aimless.elisa-laajakaista.fi
	(91-157-196-38.elisa-laajakaista.fi [91.157.196.38])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by afflict.kos.to (Postfix) with ESMTPSA id 7DFCF2654C;
	Mon, 11 Nov 2013 15:01:35 +0100 (CET)
From: Riku Voipio <riku.voipio@linaro.org>
To: meta-virtualization@yoctoproject.org
Message-Id: <1384178493-15854-1-git-send-email-riku.voipio@linaro.org>
X-Mailer: git-send-email 1.8.3.1
X-Mailman-Approved-At: Thu, 27 Feb 2014 01:11:37 -0800
Cc: koen.kooi@linaro.org, patches@linaro.org
Subject: [PATCH] fix inittab install when Xen not in DISTRO_FEATURES
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
Date: Mon, 11 Nov 2013 14:01:42 -0000
X-Original-Date: Mon, 11 Nov 2013 16:01:33 +0200
X-List-Received-Date: Mon, 11 Nov 2013 14:01:42 -0000

With the latest patch, OE builds may file like:

https://ci.linaro.org/jenkins/job/openembedded-armv7ab-rootfs/gcc_version=4.8,label=oe_persistent_cloud,rootfs=minimal/127/consoleText

By having the "failing" grep within the if block, set -e
in shell code will not bite configurations where meta-virtualization
is included but xen is not in DISTRO_FEATURES.

Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
---
 recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bbappend | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bbappend b/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bbappend
index 2edbedf..1b89aec 100644
--- a/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bbappend
+++ b/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bbappend
@@ -1,6 +1,5 @@
 do_install_append() {
-	echo "${DISTRO_FEATURES}" | grep -q 'xen'
-	if [ $? -eq 0 ]; then
+	if echo "${DISTRO_FEATURES}" | grep -q 'xen'; then
 		echo "" >> ${D}${sysconfdir}/inittab
 		echo "X0:12345:respawn:/sbin/getty 115200 hvc0" >> ${D}${sysconfdir}/inittab
 	fi
-- 
1.8.3.1


