Return-Path: <cardoe@cardoe.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 75D7DE00D35; Tue, 17 Oct 2017 07:44:05 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.216.194 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.216.194 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6B1FEE00C01
	for <meta-virtualization@yoctoproject.org>;
	Tue, 17 Oct 2017 07:44:04 -0700 (PDT)
Received: by mail-qt0-f194.google.com with SMTP id p1so4031233qtg.2
	for <meta-virtualization@yoctoproject.org>;
	Tue, 17 Oct 2017 07:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cardoe.com; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=hccQ3D53uofyYmR1F7+VFI3KteJ+/+kSUQSpSrsRZ0E=;
	b=YWVE8cWipTDQaC6QqtWdSvavf/QQxMpZJhg4rtiAquBbeleFEmJ1daOcJCBZuF0suv
	f4Zl2UOS4dCthwoWR/bbzr7PRh1HlT7kjCcAU/rABcmeIywT2C8i+XSrHJpgY4Gkkjh8
	Dr2S5luBMyxxRcplNDtKXa2ad8omolpvNhqK8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=hccQ3D53uofyYmR1F7+VFI3KteJ+/+kSUQSpSrsRZ0E=;
	b=ndr16384G0c98mKYDts0VtgUIP5ZDwas3gBpVurdJahtGA4ZpNbclv9WysaLr9GqVG
	xQCYaV7Nw2wVZGB31U/GDVXR8X2wqyGeIqmP41s5edirQqB/bCHqcKXstRqHAown7jdM
	vzfxk0VFLvv3+Bm92SU+HQT+fsjbTE0C/VzrltMNqt0zfPq7Y73VFvVemcqFQtC0Jblz
	puBstSjaWynWyahEyAsyrkm9LzU3NfVURbJmpdAqYiPD/iwV6NG6C1/0GjozpGs66ToP
	UU+DAceOMqAb4ku/GbsxXgX3QBHWdB/A2G+VKnoQd+VGIBEI7aS54GMUCbaSDHgq2XhM
	Djig==
X-Gm-Message-State: AMCzsaVikEM33D1f8qt3tC5Z2XE77vK+bYSUiIcr2S1F0Ky5ujlFg91q
	+Pp625YXoIugetS6F/MR+DOndWBiIK8=
X-Google-Smtp-Source: AOwi7QAcax2MRVH73fn9BoelxSN+WGuK90Vuy/SYFaoq6rIJ20t3pgE59EJGld6Mfg2RSdvM4dGKDQ==
X-Received: by 10.200.48.103 with SMTP id g36mr19638027qte.289.1508251443642; 
	Tue, 17 Oct 2017 07:44:03 -0700 (PDT)
Received: from swanson.localdomain
	(104-179-196-18.lightspeed.brhmal.sbcglobal.net. [104.179.196.18])
	by smtp.gmail.com with ESMTPSA id
	a190sm6116473qkg.15.2017.10.17.07.44.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 17 Oct 2017 07:44:03 -0700 (PDT)
From: Doug Goldstein <cardoe@cardoe.com>
To: meta-virtualization@yoctoproject.org
Date: Tue, 17 Oct 2017 09:43:37 -0500
Message-Id: <20171017144340.15635-3-cardoe@cardoe.com>
X-Mailer: git-send-email 2.13.5
In-Reply-To: <20171017144340.15635-1-cardoe@cardoe.com>
References: <20171017144340.15635-1-cardoe@cardoe.com>
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>,
	Christopher Clark <christopher.clark6@baesystems.com>
Subject: [PATCH 2/5] xen: Package .pc packageconfig files into dev packages
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
X-List-Received-Date: Tue, 17 Oct 2017 14:44:05 -0000

From: Christopher Clark <christopher.w.clark@gmail.com>

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
(cherry picked from commit bd7cfb39bdf23560e0fbf9d121336e6464eb5b47)
---
 recipes-extended/xen/xen.inc | 75 +++++++++++++++++++++++++++++++++++---------
 1 file changed, 60 insertions(+), 15 deletions(-)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index 677ab69..5242385 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -277,28 +277,52 @@ FILES_${PN}-staticdev += "\
     "
 
 FILES_${PN}-libblktapctl = "${libdir}/libblktapctl.so.*"
-FILES_${PN}-libblktapctl-dev = "${libdir}/libblktapctl.so"
+FILES_${PN}-libblktapctl-dev = " \
+    ${libdir}/libblktapctl.so \
+    ${datadir}/pkgconfig/xenblktapctl.pc \
+    "
 
 FILES_${PN}-libxencall = "${libdir}/libxencall.so.*"
-FILES_${PN}-libxencall-dev = "${libdir}/libxencall.so"
+FILES_${PN}-libxencall-dev = " \
+    ${libdir}/libxencall.so \
+    ${datadir}/pkgconfig/xencall.pc \
+    "
 
 FILES_${PN}-libxenctrl = "${libdir}/libxenctrl.so.*"
-FILES_${PN}-libxenctrl-dev = "${libdir}/libxenctrl.so"
+FILES_${PN}-libxenctrl-dev = " \
+    ${libdir}/libxenctrl.so \
+    ${datadir}/pkgconfig/xencontrol.pc \
+    "
 
 FILES_${PN}-libxendevicemodel = "${libdir}/libxendevicemodel.so.*"
-FILES_${PN}-libxendevicemodel-dev = "${libdir}/libxendevicemodel.so"
+FILES_${PN}-libxendevicemodel-dev = " \
+    ${libdir}/libxendevicemodel.so \
+    ${datadir}/pkgconfig/xendevicemodel.pc \
+    "
 
 FILES_${PN}-libxenevtchn = "${libdir}/libxenevtchn.so.*"
-FILES_${PN}-libxenevtchn-dev = "${libdir}/libxenevtchn.so"
+FILES_${PN}-libxenevtchn-dev = " \
+    ${libdir}/libxenevtchn.so \
+    ${datadir}/pkgconfig/xenevtchn.pc \
+    "
 
 FILES_${PN}-libxenforeignmemory = "${libdir}/libxenforeignmemory.so.*"
-FILES_${PN}-libxenforeignmemory-dev = "${libdir}/libxenforeignmemory.so"
+FILES_${PN}-libxenforeignmemory-dev = " \
+    ${libdir}/libxenforeignmemory.so \
+    ${datadir}/pkgconfig/xenforeignmemory.pc \
+    "
 
 FILES_${PN}-libxengnttab = "${libdir}/libxengnttab.so.*"
-FILES_${PN}-libxengnttab-dev = "${libdir}/libxengnttab.so"
+FILES_${PN}-libxengnttab-dev = " \
+    ${libdir}/libxengnttab.so \
+    ${datadir}/pkgconfig/xengnttab.pc \
+    "
 
 FILES_${PN}-libxenguest = "${libdir}/libxenguest.so.*"
-FILES_${PN}-libxenguest-dev = "${libdir}/libxenguest.so"
+FILES_${PN}-libxenguest-dev = " \
+    ${libdir}/libxenguest.so \
+    ${datadir}/pkgconfig/xenguest.pc \
+    "
 
 FILES_${PN}-libxenlight = "${libdir}/libxenlight.so.*"
 FILES_${PN}-libxenlight-dev = " \
@@ -307,16 +331,28 @@ FILES_${PN}-libxenlight-dev = " \
     "
 
 FILES_${PN}-libxenstat = "${libdir}/libxenstat.so.*"
-FILES_${PN}-libxenstat-dev = "${libdir}/libxenstat.so"
+FILES_${PN}-libxenstat-dev = " \
+    ${libdir}/libxenstat.so \
+    ${datadir}/pkgconfig/xenstat.pc \
+    "
 
 FILES_${PN}-libxenstore = "${libdir}/libxenstore.so.*"
-FILES_${PN}-libxenstore-dev = "${libdir}/libxenstore.so"
+FILES_${PN}-libxenstore-dev = " \
+    ${libdir}/libxenstore.so \
+    ${datadir}/pkgconfig/xenstore.pc \
+    "
 
 FILES_${PN}-libxentoollog = "${libdir}/libxentoollog.so.*"
-FILES_${PN}-libxentoollog-dev = "${libdir}/libxentoollog.so"
+FILES_${PN}-libxentoollog-dev = " \
+    ${libdir}/libxentoollog.so \
+    ${datadir}/pkgconfig/xentoollog.pc \
+    "
 
 FILES_${PN}-libxenvchan = "${libdir}/libxenvchan.so.*"
-FILES_${PN}-libxenvchan-dev = "${libdir}/libxenvchan.so"
+FILES_${PN}-libxenvchan-dev = " \
+    ${libdir}/libxenvchan.so \
+    ${datadir}/pkgconfig/xenvchan.pc \
+    "
 
 FILES_${PN}-libxlutil = "${libdir}/libxlutil.so.*"
 FILES_${PN}-libxlutil-dev = " \
@@ -324,13 +360,22 @@ FILES_${PN}-libxlutil-dev = " \
     ${datadir}/pkgconfig/xlutil.pc \
     "
 FILES_${PN}-libvhd = "${libdir}/libvhd.so.*"
-FILES_${PN}-libvhd-dev = "${libdir}/libvhd.so"
+FILES_${PN}-libvhd-dev = " \
+    ${libdir}/libvhd.so \
+    ${datadir}/pkgconfig/vhd.pc \
+    "
 
 FILES_${PN}-libblktap = "${libdir}/libblktap.so.*"
-FILES_${PN}-libblktap-dev = "${libdir}/libblktap.so"
+FILES_${PN}-libblktap-dev = " \
+    ${libdir}/libblktap.so \
+    ${datadir}/pkgconfig/blktap.pc \
+    "
 
 FILES_${PN}-libfsimage = "${libdir}/libfsimage.so.*"
-FILES_${PN}-libfsimage-dev = "${libdir}/libfsimage.so"
+FILES_${PN}-libfsimage-dev = " \
+    ${libdir}/libfsimage.so \
+    ${datadir}/pkgconfig/fsimage.pc \
+    "
 
 FILES_${PN}-fsimage = "${libdir}/fs/*/*fsimage.so"
 
-- 
2.13.5


