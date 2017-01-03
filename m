Return-Path: <cardoe@cardoe.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A9FF2E008D3; Mon,  2 Jan 2017 20:48:14 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.161.196 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.161.196 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yw0-f196.google.com (mail-yw0-f196.google.com
	[209.85.161.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 48658E0089B
	for <meta-virtualization@yoctoproject.org>;
	Mon,  2 Jan 2017 20:48:13 -0800 (PST)
Received: by mail-yw0-f196.google.com with SMTP id s68so37342659ywg.0
	for <meta-virtualization@yoctoproject.org>;
	Mon, 02 Jan 2017 20:48:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cardoe.com; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=QZ46YvH+/IMmHkBikkdHKISPLSFmYyQ7zAFhHuoUszI=;
	b=O5dQ6Gt3lLuhVBDzdGtM4HhuNu/mUZeVYjai/4RYgFtA4ds8qgsDplxj8Ud70HSMuq
	M4Y4+4YZuhRA5qNZoVZB44shl36BLzPMqFoJslYIwCGYyLcjLsmH03vkBznkx/B65vut
	FI4KhG/fHUXXREq+Rk3836Kk1H6n6uU2Oeq60=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=QZ46YvH+/IMmHkBikkdHKISPLSFmYyQ7zAFhHuoUszI=;
	b=cu+RGYFxMuuMt4Ctkvaxe+X8ZfcouiwTbQL+LEezOF1+KGRLagRVH/p76orjsfgu7m
	xJf1X3AcQv8YIVhP3Jh6FuoUjLnrGDblQDaj27AYjR6oYVygd8tu8rWSIaYI3I6qZVub
	LfSu7et0K4dNRjYcXcdxitRsTrEIYHh+HqM+n54eqFStG3sEPHqA6u7ejRxe16H9YN9C
	mICA2vr0onVOtCix0gfmJLNK71rRkC5weoZSOyVCGsWDdBo6jB8P8bLLdXhkgLFvoZB0
	/FMwg4H8QxFcYVuRXOsiJFYhXN53vOYWl372jyJkNnB1DkmKjKNLuHEzmAyeCintD/NG
	Alpw==
X-Gm-Message-State: AIkVDXJpJWr0n/Powa5sBOixPVRMHx+2vCqxo+L97K89XBSGO32jIveEK6IGU/ZKFfDJmQ==
X-Received: by 10.129.108.13 with SMTP id h13mr58516986ywc.101.1483418892872; 
	Mon, 02 Jan 2017 20:48:12 -0800 (PST)
Received: from swanson.attlocal.net
	(104-179-196-18.lightspeed.brhmal.sbcglobal.net. [104.179.196.18])
	by smtp.gmail.com with ESMTPSA id
	v1sm16209892ywc.17.2017.01.02.20.48.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 02 Jan 2017 20:48:12 -0800 (PST)
From: Doug Goldstein <cardoe@cardoe.com>
To: meta-virtualization@yoctoproject.org
Date: Mon,  2 Jan 2017 22:47:51 -0600
Message-Id: <20170103044754.15012-2-cardoe@cardoe.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20170103044754.15012-1-cardoe@cardoe.com>
References: <20170103044754.15012-1-cardoe@cardoe.com>
Subject: [meta-virtualization (krogoth)][PATCH 2/5] xen: sync packages and fixes from master
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
X-List-Received-Date: Tue, 03 Jan 2017 04:48:14 -0000

Sync the latest list of packages and installed files from master along
with a handful of compilation bug fixes.

Signed-off-by: Doug Goldstein <cardoe@cardoe.com>
---
 recipes-extended/xen/xen.inc | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index de8c168..429a05a 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -151,6 +151,7 @@ PACKAGES = "\
     ${PN}-base \
     ${PN}-blktap \
     ${PN}-console \
+    ${PN}-cpuid \
     ${PN}-dbg \
     ${PN}-dev \
     ${PN}-devd \
@@ -196,6 +197,7 @@ PACKAGES = "\
     ${PN}-libxenvchan-dev \
     ${PN}-libxlutil \
     ${PN}-libxlutil-dev \
+    ${PN}-livepatch \
     ${PN}-misc \
     ${PN}-pygrub \
     ${PN}-python \
@@ -369,6 +371,10 @@ FILES_${PN}-console = "\
     ${sbindir}/xenconsoled \
     "
 
+FILES_${PN}-cpuid = "\
+    ${bindir}/xen-cpuid \
+    "
+
 FILES_${PN}-devd = "\
     ${sysconfdir}/init.d/xendriverdomain \
     "
@@ -399,6 +405,10 @@ FILES_${PN}-kdd = "\
     ${sbindir}/kdd \
     "
 
+FILES_${PN}-livepatch += " \
+    ${sbindir}/xen-livepatch \
+    "
+
 FILES_${PN}-misc = "\
     ${bindir}/xencons \
     ${bindir}/xencov_split \
@@ -527,6 +537,7 @@ FILES_${PN}-remus = "\
     "
 
 FILES_${PN}-scripts-network = " \
+    ${sysconfdir}/xen/scripts/colo-proxy-setup \
     ${sysconfdir}/xen/scripts/network-bridge \
     ${sysconfdir}/xen/scripts/network-nat \
     ${sysconfdir}/xen/scripts/network-route \
@@ -544,6 +555,7 @@ FILES_${PN}-scripts-block = " \
     ${sysconfdir}/xen/scripts/blktap \
     ${sysconfdir}/xen/scripts/block \
     ${sysconfdir}/xen/scripts/block-common.sh \
+    ${sysconfdir}/xen/scripts/block-dummy \
     ${sysconfdir}/xen/scripts/block-enbd \
     ${sysconfdir}/xen/scripts/block-iscsi \
     ${sysconfdir}/xen/scripts/block-nbd \
@@ -667,6 +679,7 @@ FILES_${PN}-xm = "\
 FILES_${PN}-xencommons += "\
     ${sysconfdir}/default/xencommons \
     ${sysconfdir}/init.d/xencommons \
+    ${sysconfdir}/xen/scripts/launch-xenstore \
     ${systemd_unitdir}/modules-load.d/xen.conf \
     ${systemd_unitdir}/system/proc-xen.mount \
     ${systemd_unitdir}/system/xen-qemu-dom0-disk-backend.service \
@@ -744,9 +757,11 @@ export XEN_OS = "Linux"
 
 # this is used for the header (#!${bindir}/python) of the install python scripts
 export PYTHONPATH="${bindir}/python"
+export ac_cv_path_PYTHONPATH="${bindir}/python"
 
-# seabios forcefully sets HOSTCC to CC - fixup to allow it to build native conf executable
+# xen and seabios require HOSTCC and HOSTCXX set to cross-compile
 export HOSTCC="${BUILD_CC}"
+export HOSTCXX="${BUILD_CXX}"
 
 # make xen requires CROSS_COMPILE set by hand as it does not abide by ./configure
 export CROSS_COMPILE="${TARGET_PREFIX}"
@@ -837,6 +852,9 @@ do_configure() {
 }
 
 do_compile() {
+    # workaround for build bug when CFLAGS is exported
+    # https://www.mail-archive.com/xen-devel@lists.xen.org/msg67822.html
+    unset CFLAGS
     oe_runmake
 }
 
-- 
2.10.2


