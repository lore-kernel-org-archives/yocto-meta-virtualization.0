Return-Path: <cardoe@cardoe.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 860F7E00BB5; Fri, 11 Dec 2015 13:58:57 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_LOW,URIBL_BLACK autolearn=no version=3.3.1
X-Spam-HAM-Report: * 1.7 URIBL_BLACK Contains an URL listed in the URIBL
	blacklist *      [URIs: cardoe.com]
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.220.172 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qk0-f172.google.com (mail-qk0-f172.google.com
	[209.85.220.172])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 72D5EE00A04
	for <meta-virtualization@yoctoproject.org>;
	Fri, 11 Dec 2015 13:58:56 -0800 (PST)
Received: by qkdp187 with SMTP id p187so59704006qkd.1
	for <meta-virtualization@yoctoproject.org>;
	Fri, 11 Dec 2015 13:58:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cardoe-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=yslVLVKXxX+kSUuzIpKFlwoWeyWENrbbhFfPla65Kgs=;
	b=D/JLWjwyYy4lxTz0ILJRpwXGDH86H+PwgrfuRRIa5iBu76ua8kvXPV7XdZp4Z00o9Q
	kS5fWLD8gJabY8mZ70W9So1XgvtNo+BsI4Mscor9ShHqHmFFF9OTZ0oBIwQdLt5nbAFi
	Nt4SLslsFMwb1JTBNJFweOMoxmAjpzUNXp14m+VesCE4HnoJZMkSkP4snAf1rFcptyWP
	7KhUmCkofGDn47EsTq1i6nF2ZszwALfIfe6U3xaOEonMqUKefwbe5RGTrAT8hcsEEJom
	7wugTRZv1RzIZTXDLaI8fXBfyT9jgCdhri+QuqJuGgGfkBntUCTdvO4ebNeEnENJlll1
	zCZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=yslVLVKXxX+kSUuzIpKFlwoWeyWENrbbhFfPla65Kgs=;
	b=fa2lOUApjDcpdBpzpH0jEfG5mwjFCWk4W9hWjxHlZy0BalH/ek2xLY4AImYHz9Obmt
	gWOhPt7SE8vy4SU9Y/rt9fxW6bCh1z1QkAX4mns1RjnkZt1LZyLjF6FTydBKHQubN7bN
	KXK+FyEY0qMnVx5Nf2dT3K1yZzCdOmU+LffKyZPjgaXQuVsuLH2Iyc5eioiaYOpfSKmw
	du2zpr268N2uoorPYGnHpqUPzpIy1ezC1BVRzZie00OK3LUt1gVANZlVgqPQlRknIqSJ
	JEmRe0VQ7z2M+PgcBf+/AwsKAl8a8CaAEpjE2MUKsKypoZSX0d53TvSQbnBhPHyafZaL
	yYcA==
X-Gm-Message-State: ALoCoQkkM6TZUn5fLnkSDStqDtfW3figsQPuo3cqC0Bn1a750JyyXksXknTVtMQrA0XVuU8+4CKq3InlkPO277wuBoDZncQMbg==
X-Received: by 10.129.108.78 with SMTP id h75mr10526503ywc.310.1449871135754; 
	Fri, 11 Dec 2015 13:58:55 -0800 (PST)
Received: from swanson.lan (c-68-46-196-185.hsd1.al.comcast.net.
	[68.46.196.185]) by smtp.gmail.com with ESMTPSA id
	e64sm14070336ywb.25.2015.12.11.13.58.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 11 Dec 2015 13:58:55 -0800 (PST)
From: Doug Goldstein <cardoe@cardoe.com>
To: meta-virtualization@yoctoproject.org
Date: Fri, 11 Dec 2015 15:58:31 -0600
Message-Id: <1449871112-12401-3-git-send-email-cardoe@cardoe.com>
X-Mailer: git-send-email 2.4.10
In-Reply-To: <1449871112-12401-1-git-send-email-cardoe@cardoe.com>
References: <1449871112-12401-1-git-send-email-cardoe@cardoe.com>
Subject: [PATCH 3/4] xen: resolve issue when using sstate cache
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
X-List-Received-Date: Fri, 11 Dec 2015 21:58:57 -0000

When using an sstate cache xen/xen.gz was not being installed into the
image.

Signed-off-by: Doug Goldstein <cardoe@cardoe.com>
---
 recipes-extended/xen/xen.inc | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index 8598afc..1bb0e6a 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e0f0f3ac55608719a82394cc353928df"
 
 COMPATIBLE_HOST = '(x86_64.*).*-linux|aarch64.*-linux'
 
-inherit autotools-brokensep gettext setuptools update-rc.d systemd
+inherit autotools-brokensep gettext setuptools update-rc.d systemd deploy
 
 require xen-arch.inc
 
@@ -786,14 +786,14 @@ pkg_postinst_${PN}-volatiles() {
     fi
 }
 
-sysroot_stage_all_append() {
-    sysroot_stage_dir ${D}/boot ${SYSROOT_DESTDIR}/kernel
-
-    install -d ${DEPLOY_DIR_IMAGE}
+do_deploy() {
+    install -d ${DEPLOYDIR}
     if [ -f ${D}/boot/xen ]; then
-        install -m 0644 ${D}/boot/xen ${DEPLOY_DIR_IMAGE}/xen-${MACHINE}
+        install -m 0644 ${D}/boot/xen ${DEPLOYDIR}/xen-${MACHINE}
     fi
     if [ -f ${D}/boot/xen.gz ]; then
-        install -m 0644 ${D}/boot/xen.gz ${DEPLOY_DIR_IMAGE}/xen-${MACHINE}.gz
+        install -m 0644 ${D}/boot/xen.gz ${DEPLOYDIR}/xen-${MACHINE}.gz
     fi
 }
+
+addtask deploy after do_populate_sysroot
-- 
2.4.10


