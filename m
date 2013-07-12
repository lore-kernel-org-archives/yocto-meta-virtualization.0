Return-Path: <stickmanthe@gmail.com>
Received: from mail-qc0-f170.google.com (mail-qc0-f170.google.com
	[209.85.216.170])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B1C4CE013D6
	for <meta-virtualization@yoctoproject.org>;
	Thu, 11 Jul 2013 17:03:23 -0700 (PDT)
Received: by mail-qc0-f170.google.com with SMTP id s1so4747306qcw.1
	for <meta-virtualization@yoctoproject.org>;
	Thu, 11 Jul 2013 17:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=XQyjjXAJv9Eb5wojADDIf1g70tD3iv9CO/aaPcUVGlg=;
	b=FVf8J2A2lag5PRynk1STLSk7Y9esFAduQVYqVnrMM8TiW08TngTg2VSmHGKytTM+Yf
	adOd+eky1eKgsLaqYVJUG8mNoczdXS9qGW0UA8NfGD7V1chlPg3ARlBG98DyTRxVqRYd
	luFSaTtXcTjoVqlt5lMllUh1+/EIj3GAtKgWGyJ3iOaGs7vAVEs4RE+UaRMo1yrGhXCr
	J8R9MFOvidip0lcCu5riRQpaJaLfCvkHcJFo5+r3mqHrBLl10HOKZjOJ58cIrdNmpklL
	Z81S46Xzgt4zU9NYIw9cTD+ldQUxOgFm+JOz1ycq/mAE8+j7Vmg9TbYc0UVrXvH9J7zs
	s+7w==
X-Received: by 10.224.23.72 with SMTP id q8mr35782613qab.63.1373587402285;
	Thu, 11 Jul 2013 17:03:22 -0700 (PDT)
Received: from BeyondTape.localdomain (cpe-74-71-215-69.twcny.res.rr.com.
	[74.71.215.69])
	by mx.google.com with ESMTPSA id pg6sm31805805qeb.5.2013.07.11.17.03.21
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 11 Jul 2013 17:03:21 -0700 (PDT)
From: Peter Muller <stickmanthe@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Thu, 11 Jul 2013 20:02:54 -0400
Message-Id: <1373587374-3084-1-git-send-email-stickmanthe@gmail.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] xen.inc: Fixed typos in initscript declarations and syntax
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
X-List-Received-Date: Fri, 12 Jul 2013 00:03:24 -0000

Signed-off-by: Peter Muller <stickmanthe@gmail.com>
---
 recipes-extended/xen/xen.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index 6207897..ccaa8fe 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -222,7 +222,7 @@ INITSCRIPT_NAME_${PN}-watchdog = "xen-watchdog"
 INITSCRIPT_PARAMS_${PN}-watchdog = "defaults 66"
 INITSCRIPT_NAME_${PN}-domains = "xendomains"
 INITSCRIPT_PARAMS_${PN}-domains = "defaults 68"
-NITSCRIPT_NAME_${PN}-minimal = "xenminiinit"
+INITSCRIPT_NAME_${PN}-minimal = "xenminiinit"
 INITSCRIPT_PARAMS_${PN}-minimal = "defaults 69"
 
 do_compile() {
@@ -295,7 +295,7 @@ do_install() {
 		fi
 	done
 	
-	cp -av ${S}/dist/install/* ${D}/
+	cp -av ${S}/dist/install/\* ${D}/
 	install -d ${D}/etc/xen
 	install -d ${D}/etc/init.d
 
-- 
1.8.3.1


