Return-Path: <cardoe@cardoe.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7969EE00C09; Mon, 24 Aug 2015 13:27:28 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.220.171 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail-qk0-f171.google.com (mail-qk0-f171.google.com
	[209.85.220.171])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4704DE00C05
	for <meta-virtualization@yoctoproject.org>;
	Mon, 24 Aug 2015 13:27:12 -0700 (PDT)
Received: by qkda128 with SMTP id a128so37076647qkd.3
	for <meta-virtualization@yoctoproject.org>;
	Mon, 24 Aug 2015 13:27:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=qbzBBBfFzInQZdreiJ5RdgAyKHtnx5zt9+bGKoh4maE=;
	b=TpV2fCAy6wQar+2oRGZ2G8Ozv9TDyHCXT1pVvlEK8dq7uaiAguSIF4/ETHZY+ugfwh
	JhBrvdKyBVScQVzEfiQX4/HVfoKS2h39otN/QBswJMiatetbbn8MTMCpC2lKTTMBmhEH
	klJlNRqWFCPCXbbHdSlpqKvdmP3ONswMVuutp+vuGRvbG9pSmTWu5qVcO/2Xtd28PLF6
	cxLUU+mX6L3Nmr3+WVqWguuYUAENY34UDNQP1ZM9ICWTXRDBiHfCpEFvi7j8Ckepdh0O
	5CpMdrq881Yco24B07GNbqBBafOGF2myKfMtSLtvEMqXVcioWYw7dBrZMOVX2RWcczYS
	UUoQ==
X-Gm-Message-State: ALoCoQke/MvhxL/STUnU2BSOzHETlcmYDP1+UfnPeE/TlMUZ+TJX5f2Jdg+XsV/h/qz+KpagKYJU
X-Received: by 10.170.216.70 with SMTP id i67mr32102532ykf.15.1440448032228;
	Mon, 24 Aug 2015 13:27:12 -0700 (PDT)
Received: from doug-t430.lan ([67.63.141.2]) by smtp.gmail.com with ESMTPSA id
	p79sm18531307ywp.37.2015.08.24.13.27.11
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 24 Aug 2015 13:27:11 -0700 (PDT)
From: Doug Goldstein <cardoe@cardoe.com>
To: meta-virtualization@yoctoproject.org
Date: Mon, 24 Aug 2015 15:26:48 -0500
Message-Id: <1440448008-9189-4-git-send-email-cardoe@cardoe.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1440448008-9189-1-git-send-email-cardoe@cardoe.com>
References: <1440448008-9189-1-git-send-email-cardoe@cardoe.com>
Subject: [PATCH 4/4] xen: add new files to packages
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
X-List-Received-Date: Mon, 24 Aug 2015 20:27:28 -0000

These files are now installed post 4.5.0 and as such they need to be
placed into appropriate packages.
---
 recipes-extended/xen/xen.inc | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index 20f8abe..7f9ff96 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -209,6 +209,7 @@ PACKAGES = "\
 
 FILES_${PN}-dbg += "\
     ${libdir}/.debug \
+    ${libdir}/debug/* \
     ${libdir}/xen/bin/.debug \
     ${libdir}/python2.7/site-packages/.debug \
     ${libdir}/python2.7/site-packages/xen/lowlevel/.debug \
@@ -259,7 +260,10 @@ FILES_${PN}-libxenguest = "${libdir}/libxenguest.so.*"
 FILES_${PN}-libxenguest-dev = "${libdir}/libxenguest.so"
 
 FILES_${PN}-libxenlight = "${libdir}/libxenlight.so.*"
-FILES_${PN}-libxenlight-dev = "${libdir}/libxenlight.so"
+FILES_${PN}-libxenlight-dev = " \
+    ${libdir}/libxenlight.so \
+    /usr/share/pkgconfig/xenlight.pc \
+    "
 
 FILES_${PN}-libxenvchan = "${libdir}/libxenvchan.so.*"
 FILES_${PN}-libxenvchan-dev = "${libdir}/libxenvchan.so"
@@ -268,7 +272,10 @@ FILES_${PN}-libxenctrl = "${libdir}/libxenctrl.so.*"
 FILES_${PN}-libxenctrl-dev = "${libdir}/libxenctrl.so"
 
 FILES_${PN}-libxlutil = "${libdir}/libxlutil.so.*"
-FILES_${PN}-libxlutil-dev = "${libdir}/libxlutil.so"
+FILES_${PN}-libxlutil-dev = " \
+    ${libdir}/libxlutil.so \
+    /usr/share/pkgconfig/xlutil.pc \
+    "
 
 FILES_${PN}-libvhd = "${libdir}/libvhd.so.*"
 FILES_${PN}-libvhd-dev = "${libdir}/libvhd.so"
@@ -367,6 +374,8 @@ FILES_${PN}-misc = "\
     ${sbindir}/xenlockprof \
     ${sbindir}/xen-lowmemd \
     ${sbindir}/xen-mfndump \
+    ${libdir}/xen/bin/verify-stream-v2 \
+    ${libdir}/xen/bin/convert-legacy-stream \
     "
 
 FILES_${PN}-pygrub = "\
@@ -492,6 +501,7 @@ FILES_${PN}-scripts-block = " \
     ${sysconfdir}/xen/scripts/block-iscsi \
     ${sysconfdir}/xen/scripts/block-nbd \
     ${sysconfdir}/xen/scripts/block-drbd-probe \
+    ${sysconfdir}/xen/scripts/block-tap \
     ${sysconfdir}/xen/scripts/vscsi \
     "
 
@@ -565,6 +575,9 @@ FILES_${PN}-xentrace = "\
     ${bindir}/xentrace_format \
     ${bindir}/xentrace_setsize \
     ${libdir}/xen/bin/xenctx \
+    ${bindir}/xenalyze \
+    ${sbindir}/xentrace \
+    ${sbindir}/xentrace_setsize \
     "
 
 FILES_${PN}-xen-watchdog = "\
-- 
2.1.4


