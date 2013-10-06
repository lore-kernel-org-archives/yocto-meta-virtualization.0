Return-Path: <cjp256@gmail.com>
Received: from mail-ie0-f174.google.com (mail-ie0-f174.google.com
	[209.85.223.174])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5950DE016B8
	for <meta-virtualization@yoctoproject.org>;
	Sun,  6 Oct 2013 14:22:56 -0700 (PDT)
Received: by mail-ie0-f174.google.com with SMTP id u16so13638548iet.5
	for <meta-virtualization@yoctoproject.org>;
	Sun, 06 Oct 2013 14:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=oACArLUUNc2v1frnHbWRPBTqMSTleJRsinjnTwdEX/M=;
	b=cuBAn+yH/8YTtX+vKLkiYY5neVtz43aBRfg0W8jgVxxBY/dMAf20+TpqGyPg89obfw
	E2bO4NX7bVdNmqDIYzXuGJjX3RXxhyjTzvt/O9sTg4Se9J2abprT4qhxp+IdR0Auo5Qw
	vTyWCy/wpZMJ9+0wCAm6q82NFus0PJZ1IPZ/x3lMXXi7XHZ/jSChtWasW7SM/YLut2Hz
	goUR2AtzEk1tQqej4wys6WQWpFWHiP0gr8HMk8Yi8LtRA43fLVpF5ac/hIvwNfQGlv0l
	wMli4QybTEEE2PGjAsis6G1R1nDFUhzwCowfhtGKkDf793etLVRHhV1EkpobolyfXW2v
	lXNQ==
X-Received: by 10.50.111.228 with SMTP id il4mr14716829igb.1.1381094576472;
	Sun, 06 Oct 2013 14:22:56 -0700 (PDT)
Received: from hatchery.local (cpe-74-71-215-22.twcny.res.rr.com.
	[74.71.215.22])
	by mx.google.com with ESMTPSA id i3sm22631061igh.0.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 06 Oct 2013 14:22:55 -0700 (PDT)
From: Chris Patterson <cjp256@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Sun,  6 Oct 2013 17:22:17 -0400
Message-Id: <1381094537-11576-5-git-send-email-cjp256@gmail.com>
X-Mailer: git-send-email 1.8.4.rc3
In-Reply-To: <1381094537-11576-1-git-send-email-cjp256@gmail.com>
References: <1381094537-11576-1-git-send-email-cjp256@gmail.com>
Subject: [PATCH] xen-image-minimal: break out arguments for xen and linux kernel as variables SYSLINUX_XEN_ARGS and SYSLINUX_KERNEL_ARGS to allow modification/overwriting.
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
X-List-Received-Date: Sun, 06 Oct 2013 21:22:57 -0000

Signed-off-by: Chris Patterson <cjp256@gmail.com>
---
 recipes-extended/images/xen-image-minimal.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/recipes-extended/images/xen-image-minimal.bb b/recipes-extended/images/xen-image-minimal.bb
index 23c4911..c582f57 100644
--- a/recipes-extended/images/xen-image-minimal.bb
+++ b/recipes-extended/images/xen-image-minimal.bb
@@ -42,6 +42,9 @@ populate_append() {
 	install -m 0644 ${DEPLOY_DIR_IMAGE}/xen-${MACHINE}.gz ${DEST}/xen.gz
 }
 
+SYSLINUX_XEN_ARGS ?= "loglvl=all guest_loglvl=all console=com1,vga com1=115200,8n1"
+SYSLINUX_KERNEL_ARGS ?= "ramdisk_size=32768 root=/dev/ram0 rw console=hvc0 earlyprintk=xen console=tty0 panic=10 LABEL=boot debugshell=5"
+
 build_syslinux_cfg () {
 	echo "ALLOWOPTIONS 1" > ${SYSLINUXCFG}
 	echo "DEFAULT boot" >> ${SYSLINUXCFG}
@@ -49,6 +52,6 @@ build_syslinux_cfg () {
 	echo "PROMPT 1" >> ${SYSLINUXCFG}
 	echo "LABEL boot" >> ${SYSLINUXCFG}
 	echo "  KERNEL mboot.c32" >> ${SYSLINUXCFG}
-	echo "  APPEND /xen.gz loglvl=all guest_loglvl=all console=com1,vga com1=115200,8n1 --- /vmlinuz ramdisk_size=32768 root=/dev/ram0 rw console=hvc0 earlyprintk=xen console=tty0 panic=10 LABEL=boot debugshell=5 --- /initrd" >> ${SYSLINUXCFG}
+	echo "  APPEND /xen.gz ${SYSLINUX_XEN_ARGS} --- /vmlinuz ${SYSLINUX_KERNEL_ARGS} --- /initrd" >> ${SYSLINUXCFG}
 }
 
-- 
1.8.4.rc3


