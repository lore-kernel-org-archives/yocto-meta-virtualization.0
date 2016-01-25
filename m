Return-Path: <cardoe@cardoe.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9561EE00BFF; Mon, 25 Jan 2016 07:29:41 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.160.193 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yk0-f193.google.com (mail-yk0-f193.google.com
	[209.85.160.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 05EDBE00BE9
	for <meta-virtualization@yoctoproject.org>;
	Mon, 25 Jan 2016 07:29:39 -0800 (PST)
Received: by mail-yk0-f193.google.com with SMTP id a85so12306174ykb.2
	for <meta-virtualization@yoctoproject.org>;
	Mon, 25 Jan 2016 07:29:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cardoe-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=pb+K7Zbg0+TMaNcG2+XXB/Tm0Rt/Mxk8nbso3ifjRng=;
	b=KsEbq4wibMubwsCd30Pa1+11nmkmR7atIWBw7xVCZPFzSHIBh+qAgx5L+vQKYR0sDb
	BUnH+ia6PJkgd+d8Ado9FHY56SxVYoFAR1o+j9ED5AnAIuVkrFtsyOfhD3UqWLjCZYTO
	zwApm5r8wN2KEsHIed6i9zy6HFCkzYe3qiz42it0IP6S2YQ8dh2bNUdTKA3kyryIT8z9
	s9Ejg4Y2rrwNBND8a9XWCZPpotaTUTDDvQztk7u0sbobwXz/2xTcmavgmAVn7RD8iAiq
	97YfJRVj1pxxWmDlbeW4sIUMEhN/FEazoBPMA8MPj3WOq2y+OsqovsO+uKVjKtWFw1qa
	/b5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=pb+K7Zbg0+TMaNcG2+XXB/Tm0Rt/Mxk8nbso3ifjRng=;
	b=mKcFw6Adn1YqyB+SZe8+KSL42ld8aY748MnRT54l/G3qCBeHCt+qr3lLM6YZD+SACc
	4sDkhso8pLL/Qk9qBfPW8cnuPEKv51tL5BLmDt+SNTu2hP+hM6AoukaEiql3/PIrtspN
	drNxA/O2C7h7lsBNoiknagWmTgVFhY8niaeq3fa+N6snLwlAiZXi0QY+Yo/TBsU9UrlA
	QjysMZCoRI/KbZQ6pX+1uN2Dz37tuEt97CCUq0z3JjzKT1OR87qGbeiAoE44btNrpU7X
	bdDmFQeL/apMqDJ6rIvYjHrA5VT7mF8YsEaTnIGMHDvf7ufP/Pv0bbBcKev8NUADrf6E
	WoBw==
X-Gm-Message-State: AG10YOR4NkAssvaYzO3xKNxFPxBOFPc3ZyZbbi8fj6R/GmEsQ31EkPfEECq6VkKmRRviYA==
X-Received: by 10.37.69.8 with SMTP id s8mr8599343yba.120.1453735779471;
	Mon, 25 Jan 2016 07:29:39 -0800 (PST)
Received: from swanson.lan (c-68-46-196-185.hsd1.al.comcast.net.
	[68.46.196.185]) by smtp.gmail.com with ESMTPSA id
	193sm14422579ywe.22.2016.01.25.07.29.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 25 Jan 2016 07:29:38 -0800 (PST)
From: Doug Goldstein <cardoe@cardoe.com>
To: meta-virtualization@yoctoproject.org
Date: Mon, 25 Jan 2016 09:29:12 -0600
Message-Id: <1453735752-966-5-git-send-email-cardoe@cardoe.com>
X-Mailer: git-send-email 2.4.10
In-Reply-To: <1453735752-966-1-git-send-email-cardoe@cardoe.com>
References: <1453735752-966-1-git-send-email-cardoe@cardoe.com>
Subject: [PATCH 5/5] xen: move bits common to all Xen versions to xen.inc
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

These items are common for all Xen versions since at least 4.5 and newer
so these should just go in the common include file.

Signed-off-by: Doug Goldstein <cardoe@cardoe.com>
---
 recipes-extended/xen/xen.inc      |  9 +++++++++
 recipes-extended/xen/xen_4.6.0.bb | 11 -----------
 2 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index 3e029ee..6f52765 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -691,6 +691,11 @@ python () {
         raise bb.parse.SkipPackage('Cannot map `%s` to a xen architecture' % d.getVar('TARGET_ARCH', True))
 }
 
+# Yocto appends ${PN} to libexecdir by default and Xen appends 'xen' as well
+# the result is a nested xen/xen/ so let's avoid that by shunning Yocto's
+# extra ${PN} appended.
+libexecdir = "${libdir}"
+
 # hardcoded as Linux, as the only compatible hosts are Linux.
 export XEN_OS = "Linux"
 
@@ -718,6 +723,10 @@ EXTRA_OECONF += " \
     --disable-xenstore-stubdom \
     --disable-rombios \
     --disable-ocamltools \
+    --with-initddir=${INIT_D_DIR} \
+    --with-sysconfig-leaf-dir=default \
+    --with-system-qemu=/usr/bin/qemu-system-i386 \
+    --disable-qemu-traditional \
     "
 
 # check for XSM in package config to allow XSM_ENABLE to be set
diff --git a/recipes-extended/xen/xen_4.6.0.bb b/recipes-extended/xen/xen_4.6.0.bb
index 95570a7..3e99324 100644
--- a/recipes-extended/xen/xen_4.6.0.bb
+++ b/recipes-extended/xen/xen_4.6.0.bb
@@ -10,17 +10,6 @@ SRC_URI[sha256sum] = "6fa1c2431df55aa5950d248e6093b8c8c0f11c357a0adbd348a2186478
 
 S = "${WORKDIR}/xen-${PV}"
 
-# Xen suffixes the libexecdir within its configure scripts, prevent the nested xen/xen/
-libexecdir = "${libdir}"
-
-# These options override detected values from the build.
-EXTRA_OECONF_append += " \
-    --with-initddir=${INIT_D_DIR} \
-    --with-sysconfig-leaf-dir=default \
-    --with-system-qemu=/usr/bin/qemu-system-i386 \
-    --disable-qemu-traditional \
-    "
-
 EXTRA_OEMAKE += "STDVGA_ROM=${STAGING_DIR_HOST}/usr/share/firmware/vgabios-0.7a.bin"
 EXTRA_OEMAKE += "CIRRUSVGA_ROM=${STAGING_DIR_HOST}/usr/share/firmware/vgabios-0.7a.cirrus.bin"
 EXTRA_OEMAKE += "SEABIOS_ROM=${STAGING_DIR_HOST}/usr/share/firmware/bios.bin"
-- 
2.4.10


