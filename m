Return-Path: <christopher.w.clark@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4685BE00C41; Wed,  9 Aug 2017 18:29:05 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (christopher.w.clark[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.192.193 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.192.193 listed in dnsbl.sorbs.net]
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9120EE00C1C
	for <meta-virtualization@yoctoproject.org>;
	Wed,  9 Aug 2017 18:28:59 -0700 (PDT)
Received: by mail-pf0-f193.google.com with SMTP id t83so7650994pfj.3
	for <meta-virtualization@yoctoproject.org>;
	Wed, 09 Aug 2017 18:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=jM6jpivUdHqO5F1TfcD9ItRJgOjzSesAaHT1q54RK9s=;
	b=SI9CfwYij0brRUOjUlYF2xa+5sBhmbKFkGJvLC9eSeSHZlnbNk15qw1zH3WH3AdRRe
	Ties+qp5WzDUMqd+KgOlBhRGgkdirtaCeKTTrJuabpmXD5jWJkRt9OQEyMl/maE5SLwS
	2kDhQ0KxJe1lS5DutVTSxKusSuB9Ub4kDL7NI5/tKcyXtgk4H5dMwrsHutkDNCsdYoOL
	yRuVT5GkXq76QCt7FDTU/zbRJNpUIdSSiTzbGsNzgyY9HpClpTBbd/Whv/hdVQi4xJQo
	IuVHUgz2fPTxK82oGjIHS2KMN3Xy0megituq88l4c6/QQj5mDSp6l1RGZ4Ch05VerdNt
	TusQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=jM6jpivUdHqO5F1TfcD9ItRJgOjzSesAaHT1q54RK9s=;
	b=Fwrx/Aq8SioqyVr6PQtmSTcnAVsXcFxDPZux8pdHvMJs7bFlzDN3s4m9/dfd+KtnEV
	+GuJh0xOFnhc23sKtd/oQfm5UfxjA8ir0NGcVS9gccVZ7Ohl3WVgIcSKvWEOoyas+9mg
	Q5b/7tpR5iZBuvvjAOEkLrrh3ZIQMVok3MPPBXHjkbab+XeRysJOx+ucK7wz5bAjGUUh
	VdwetpDqFXIxFBMnHmRX2RXzHbRHIT7ElNAFtl5O/p6BF3+25oho2dYO429BFXBpOo9S
	wY1BYhyXl1VfoqUldV3fZ80Fhhn+uKq7lug+ewz5FXHOukAjMoxQbyy7Vz3/on6KTuKE
	/f0g==
X-Gm-Message-State: AHYfb5jUwCCg8eLTq74otD/WyuTQWfKKUIziuSys/uJYMvbKeuh77wLI
	vWS8zSr8ELlhYssCJoo=
X-Received: by 10.98.11.65 with SMTP id t62mr10260085pfi.119.1502328538543;
	Wed, 09 Aug 2017 18:28:58 -0700 (PDT)
Received: from WorkStation-T3500.ice.pyrology.org
	(static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
	by smtp.gmail.com with ESMTPSA id
	o17sm8642348pgn.52.2017.08.09.18.28.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 09 Aug 2017 18:28:58 -0700 (PDT)
From: christopher.w.clark@gmail.com
To: meta-virtualization@yoctoproject.org
Date: Wed,  9 Aug 2017 18:28:43 -0700
Message-Id: <1502328524-4230-3-git-send-email-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1502328524-4230-1-git-send-email-christopher.w.clark@gmail.com>
References: <1502328524-4230-1-git-send-email-christopher.w.clark@gmail.com>
Cc: Christopher Clark <christopher.clark6@baesystems.com>, cardoe@gentoo.org
Subject: [PATCH 2/3] xen: Package .pc packageconfig files into dev packages
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
X-List-Received-Date: Thu, 10 Aug 2017 01:29:05 -0000

From: Christopher Clark <christopher.w.clark@gmail.com>

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
---
 recipes-extended/xen/xen.inc | 75 +++++++++++++++++++++++++++++++++++---------
 1 file changed, 60 insertions(+), 15 deletions(-)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index 274d0df..cda737c 100644
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
2.7.4


