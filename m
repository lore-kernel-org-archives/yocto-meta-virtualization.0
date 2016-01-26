Return-Path: <cardoe@cardoe.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 48B41E00C1E; Tue, 26 Jan 2016 11:09:52 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E1400E00C00
	for <meta-virtualization@yoctoproject.org>;
	Tue, 26 Jan 2016 11:09:49 -0800 (PST)
Received: by mail-yk0-f195.google.com with SMTP id v14so15389485ykd.1
	for <meta-virtualization@yoctoproject.org>;
	Tue, 26 Jan 2016 11:09:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cardoe-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=lDuB0Qn9Jl95WuS5mujEmIVSvBfYb2oLFOkksuW4PoE=;
	b=yVFzsQZ/N2p6O9bPJroqew+VEptXPUhwpQHIroGsPxVwMO5V//otMvzXFFvkA96FcH
	fTHXDQwjrjBV3qbI9ISDy1uadVALLUjVcyJR/mFHhd4TrZTpF6v4TEEY5JLvamKB7aKm
	FrAGxYAtBnU6E2gP6DGgc9LmdVS9ofO6b5gf3LsAsmqUpo8PthtJ5c2QJXWw7EqivTSR
	A8T+57SzLpmRmUV4AVBS5l9pV62lo1O1lBrJDiSDobBY3hSry0SNaeCTOTIzxk0nrHgn
	XxFyl6j2DI9vAbKmW2mBY1XYZwoYeFhF4HMewoF6Gu6vNCdGDfhgbK9TUm6IbgGfnfXY
	m5OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=lDuB0Qn9Jl95WuS5mujEmIVSvBfYb2oLFOkksuW4PoE=;
	b=fs8lz8qsKmk9bw4LFzsXGeI6nwryfMniUM8twcsEMWwGLDy2fMIB7JkPk6+Gbxswy7
	FKp4UAu4jp7uc9tVSum3v2R4db3tY5o/fdhg02bwoQWPj7nDheB/nV1SiBTfIehXxTxs
	INTVXMkWdp6xPBIhKemsd/+SJ2ZRqRPlb4C7wYhXFoyZ0ERFc4d18Gl0D3Vo1oxOsybD
	OmTwaxPFWEK2umVndfK258v9KKOZUfaoAF568vOTua4wEPdJshzEZZkLkdet//Vqna7D
	Sd9Job7mKhfftlQOsKXraXex887HFdDtpaEH5cH40WiKpOwEquE857VwZSsDdj/JHdOZ
	rWOQ==
X-Gm-Message-State: AG10YOReH2tING7FxDKhPBw+fBkNTbdslBxZZ+XrebL9eEvOlcqV/BoJAbmu0W1gKFTu+Q==
X-Received: by 10.13.206.2 with SMTP id q2mr13716895ywd.76.1453835389497;
	Tue, 26 Jan 2016 11:09:49 -0800 (PST)
Received: from swanson.lan (c-68-46-196-185.hsd1.al.comcast.net.
	[68.46.196.185]) by smtp.gmail.com with ESMTPSA id
	h187sm1899502ywc.0.2016.01.26.11.09.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 26 Jan 2016 11:09:48 -0800 (PST)
From: Doug Goldstein <cardoe@cardoe.com>
To: meta-virtualization@yoctoproject.org
Date: Tue, 26 Jan 2016 13:09:20 -0600
Message-Id: <1453835364-6473-5-git-send-email-cardoe@cardoe.com>
X-Mailer: git-send-email 2.4.10
In-Reply-To: <1453835364-6473-1-git-send-email-cardoe@cardoe.com>
References: <1453835364-6473-1-git-send-email-cardoe@cardoe.com>
Subject: [PATCH v2 4/8] xen: separate the extra steps into their own tasks
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
X-List-Received-Date: Tue, 26 Jan 2016 19:09:52 -0000

do_configure() was overloaded with a lot of behaviors that really were
source code patching so instead make them as extra tasks that happen
after do_patch() and before do_configure().

Signed-off-by: Doug Goldstein <cardoe@cardoe.com>
---
 recipes-extended/xen/xen.inc      | 21 ++++++++++++++++++++-
 recipes-extended/xen/xen_4.6.0.bb | 12 ------------
 2 files changed, 20 insertions(+), 13 deletions(-)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index 789fd34..86508ff 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -731,7 +731,21 @@ python () {
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
@@ -742,6 +756,11 @@ do_configure() {
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


