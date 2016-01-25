Return-Path: <cardoe@cardoe.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 32461E00BFD; Mon, 25 Jan 2016 07:29:41 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.160.195 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yk0-f195.google.com (mail-yk0-f195.google.com
	[209.85.160.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 94338E00BE6
	for <meta-virtualization@yoctoproject.org>;
	Mon, 25 Jan 2016 07:29:38 -0800 (PST)
Received: by mail-yk0-f195.google.com with SMTP id v14so12299677ykd.1
	for <meta-virtualization@yoctoproject.org>;
	Mon, 25 Jan 2016 07:29:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cardoe-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=fVr1ay+cHZ9ECFcDa9r+w5QzAOAXDThwtcs8Uhk49cg=;
	b=t134B546vFBasFqXeqXo6PX/zWdNDoI9rAnnvm6ivfTCj0kpVci+XL6oYmDODI/NpU
	B6fPxFCfGZF3eM0L5p15NO2p+gTW3ca0w0TLlFcQyz+OjOQMFo6y8kCnbxJeh3KyRen8
	Ytfibs7xXXOVdEA+NkdBR5ZDEegs+ef8TAR4LacyLn3nWjwm6EmZCVBQ7bpJ+VetBjb+
	45kedZ932MAKjYHpLonwDJx3Twwtqt3aYeLzjh9OoUkn3U5fCDkgzs4vdUIXTExTH6A0
	33anAIMFnQRDptjA144m+3FZOit/WDcytrSbr31hxxnIv5fcx+hurnCzrVRWT2zKON+g
	nFmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=fVr1ay+cHZ9ECFcDa9r+w5QzAOAXDThwtcs8Uhk49cg=;
	b=X68JuYaK+TBAyXCK8Xah4CI7tpefRTekT/elKw5r5hJ7hBiVMKzd+bXL0PSg0CI5Vt
	DE377DduvZ9WvZhawD4Ae0ux0H06+BSUrYFhGfKJY/zxjDXX0uQlvTh9TK2K1J6u9e6D
	Tysx3KFqhVBQJvuDZ31lnc81ALaK8XDokk7uREkePZV9FnxwrnQCts6AQWqw4kxHf/Sw
	yDCNf8b32yPggD/6UY49IuFwpqcJRQuGBJ7qTPb4luAZDZb02KdfHMkt3TRmM6C9P69b
	rCKqP9UDuvpPe+RmtggMgMBTLH5kXspEJCAuUh49Hr0uTa74eQ7X6UcFlkH8PMQBMhx1
	/43A==
X-Gm-Message-State: AG10YOTaIzCfkvQnq464YuQhS0QACESSxWPYx1q7s9mbyyLbwzTiZRxEKCRf3Mc3wzAf0A==
X-Received: by 10.13.205.199 with SMTP id p190mr9614138ywd.116.1453735778255; 
	Mon, 25 Jan 2016 07:29:38 -0800 (PST)
Received: from swanson.lan (c-68-46-196-185.hsd1.al.comcast.net.
	[68.46.196.185]) by smtp.gmail.com with ESMTPSA id
	193sm14422579ywe.22.2016.01.25.07.29.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 25 Jan 2016 07:29:37 -0800 (PST)
From: Doug Goldstein <cardoe@cardoe.com>
To: meta-virtualization@yoctoproject.org
Date: Mon, 25 Jan 2016 09:29:11 -0600
Message-Id: <1453735752-966-4-git-send-email-cardoe@cardoe.com>
X-Mailer: git-send-email 2.4.10
In-Reply-To: <1453735752-966-1-git-send-email-cardoe@cardoe.com>
References: <1453735752-966-1-git-send-email-cardoe@cardoe.com>
Subject: [PATCH 4/5] xen: separate the extra steps into their own tasks
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
X-List-Received-Date: Mon, 25 Jan 2016 15:29:41 -0000

do_configure() was overloaded with a lot of behaviors that really were
source code patching so instead make them as extra tasks that happen
after do_patch() and before do_configure().

Signed-off-by: Doug Goldstein <cardoe@cardoe.com>
---
 recipes-extended/xen/xen.inc      | 21 ++++++++++++++++++++-
 recipes-extended/xen/xen_4.6.0.bb | 12 ------------
 2 files changed, 20 insertions(+), 13 deletions(-)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index 2df7525..3e029ee 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -729,7 +729,21 @@ python () {
         d.setVar('XSM_ENABLED', '0')
 }
 
-do_configure() {
+do_post_patch() {
+    # fixup AS/CC/CCP/etc variable within StdGNU.mk
+    for i in LD CC CPP CXX; do
+        sed -i "s/^\($i\s\s*\).*=/\1?=/" ${S}/config/StdGNU.mk
+    done
+    # fixup environment passing in some makefiles
+    sed -i 's#\(\w*\)=\(\$.\w*.\)#\1="\2"#' ${S}/tools/firmware/Makefile
+
+    # libsystemd-daemon -> libsystemd for newer systemd versions
+    sed -i 's#libsystemd-daemon#libsystemd#' ${S}/tools/configure
+}
+
+addtask post_patch after do_patch before do_configure
+
+do_stubs() {
     # no stubs-32.h in our 64-bit sysroot - hack it into tools/include/gnu
     if ! test -f ${STAGING_DIR_TARGET}/usr/include/gnu/stubs-32.h ; then
         if test -f ${STAGING_DIR_TARGET}/usr/include/gnu/stubs-64.h ; then
@@ -740,6 +754,11 @@ do_configure() {
             echo \#define __stub___kernel_tanl >> ${S}/tools/include/gnu/stubs-32.h
         fi
     fi
+}
+
+addtask stubs after do_patch before do_configure
+
+do_configure() {
 
     #./configure --enable-xsmpolicy does not set XSM_ENABLE must be done manually
     if [ "${XSM_ENABLED}" = "1" ]; then
diff --git a/recipes-extended/xen/xen_4.6.0.bb b/recipes-extended/xen/xen_4.6.0.bb
index 92975a0..95570a7 100644
--- a/recipes-extended/xen/xen_4.6.0.bb
+++ b/recipes-extended/xen/xen_4.6.0.bb
@@ -27,18 +27,6 @@ EXTRA_OEMAKE += "SEABIOS_ROM=${STAGING_DIR_HOST}/usr/share/firmware/bios.bin"
 EXTRA_OEMAKE += "ETHERBOOT_ROMS=${STAGING_DIR_HOST}/usr/share/firmware/rtl8139.rom"
 #EXTRA_OEMAKE += "XENGFX_ROM=${STAGING_DIR_HOST}/usr/share/firmware/vgabios.bin"
 
-do_configure_prepend() {
-    # fixup AS/CC/CCP/etc variable within StdGNU.mk
-    for i in LD CC CPP CXX; do
-        sed -i "s/^\($i\s\s*\).*=/\1?=/" ${S}/config/StdGNU.mk
-    done
-    # fixup environment passing in some makefiles
-    sed -i 's#\(\w*\)=\(\$.\w*.\)#\1="\2"#' ${S}/tools/firmware/Makefile
-
-    # libsystemd-daemon -> libsystemd for newer systemd versions
-    sed -i 's#libsystemd-daemon#libsystemd#' ${S}/tools/configure
-}
-
 do_install_append() {
     # fixup default path to qemu-system-i386
     sed -i 's#\(test -z "$QEMU_XEN" && QEMU_XEN=\).*$#\1"/usr/bin/qemu-system-i386"#' ${D}/etc/init.d/xencommons
-- 
2.4.10


