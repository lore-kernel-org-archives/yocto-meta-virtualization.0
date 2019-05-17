Return-Path: <christopher.w.clark@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 42340E00CB3; Fri, 17 May 2019 16:01:25 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (christopher.w.clark[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.166.68 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D5C3FE00798
	for <meta-virtualization@yoctoproject.org>;
	Fri, 17 May 2019 16:01:22 -0700 (PDT)
Received: by mail-io1-f68.google.com with SMTP id a17so6742832iot.8
	for <meta-virtualization@yoctoproject.org>;
	Fri, 17 May 2019 16:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Ohzgv9kqK/6ICWkCuf0g5Xt4pd5UrMJ+UbnCNL5b1dA=;
	b=fniw2A/c8x/rOcWsv1xe4qOkcBs5W8pQxg8V36VqbDORA34doo5w7mQU6mOrRx9lPN
	o/ekWtkgTV85cInZUb/mdzY2DML2LlhMWw7ls2MKGw5q+KwrIYEy2OVhKDwe/F2Ii9ii
	VNvMgDfp5o2sj6MaQm4bExz2SS0jtZvzUnFR7Gi/90ALoAvkHeGn0u1leHvOwvV/bfvU
	mUG9cpbXNMqSqHs1uhyeefP4aEMQ8xcnGN09V/OuyZ/stKuhlZtvan7ymr5w266VfgPM
	NaFmp6fMeRO5nthFEoIWUok9jlR7eHoRSoCvJS5rwomqVfRrt4uKOpv3KErZesOookKm
	VVkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Ohzgv9kqK/6ICWkCuf0g5Xt4pd5UrMJ+UbnCNL5b1dA=;
	b=KHuf1Ng7h9GdX62ZaVrecwAh4n0Q/kbhC2ICKj86IYSAUt0WqOcL/Li9gvsSxYbTzl
	P4BrhnTywdMpxxhuMcb1TqRQ6B3B/+/2fHCV/ZEKhWNGXWHm2IARyWJqfIs5pUUdVrwZ
	OGClU8n5ZvJfwCe8Rfpc97rOw4foHrZSydmPk1Io0GCx/kuO0p7VqYbtudey3I9rEYa2
	wrIbQoG5/OxYjIJUXEoy9/fL233mZyybc8dwR/yjiCQdnkUc6nYkPu51nrSXqCB2SyDW
	6Fa9+Xk41QaKhFlcWJGqmSpxE44KRNVY8vLJuhCtUcpdLJM76Eh0COHOXExbYqQKh2sv
	Jxhw==
X-Gm-Message-State: APjAAAXus1jJzO4CbW5JCpEtIpS6IsXO/U+49mhr+WtGnbfD2VyMqJkM
	ALAj3341emA3vpBzTBND+lekPtTb
X-Google-Smtp-Source: APXvYqyU3EhcLiixCuuaWgU/sCk0mDm7Am3fMvTHO99nNLAd9dRfj9bE+aWucN1vLuCBxRI4R3IQpA==
X-Received: by 2002:a6b:6e07:: with SMTP id d7mr9273752ioh.88.1558134081693;
	Fri, 17 May 2019 16:01:21 -0700 (PDT)
Received: from desktop.ice.pyrology.org
	(static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
	by smtp.gmail.com with ESMTPSA id r12sm898702itb.2.2019.05.17.16.01.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 May 2019 16:01:20 -0700 (PDT)
From: christopher.w.clark@gmail.com
To: meta-virtualization@yoctoproject.org
Date: Fri, 17 May 2019 16:01:02 -0700
Message-Id: <20190517230102.32009-1-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] xen: update packaging for pkgconfig files in libdir
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
X-List-Received-Date: Fri, 17 May 2019 23:01:25 -0000

From: Christopher Clark <christopher.w.clark@gmail.com>

Xen commit a0f98145 changed the installation directory for pkgconfig
files, so update recipe to include the .pc files at their new location.

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
---
 recipes-extended/xen/xen.inc | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index 52780d6..628e52b 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -285,101 +285,118 @@ FILES_${PN}-staticdev += "\
 FILES_${PN}-libblktapctl = "${libdir}/libblktapctl.so.*"
 FILES_${PN}-libblktapctl-dev = " \
     ${libdir}/libblktapctl.so \
+    ${libdir}/pkgconfig/xenblktapctl.pc \
     ${datadir}/pkgconfig/xenblktapctl.pc \
     "
 
 FILES_${PN}-libxencall = "${libdir}/libxencall.so.*"
 FILES_${PN}-libxencall-dev = " \
     ${libdir}/libxencall.so \
+    ${libdir}/pkgconfig/xencall.pc \
     ${datadir}/pkgconfig/xencall.pc \
     "
 
 FILES_${PN}-libxenctrl = "${libdir}/libxenctrl.so.*"
 FILES_${PN}-libxenctrl-dev = " \
     ${libdir}/libxenctrl.so \
+    ${libdir}/pkgconfig/xencontrol.pc \
     ${datadir}/pkgconfig/xencontrol.pc \
     "
 
 FILES_${PN}-libxendevicemodel = "${libdir}/libxendevicemodel.so.*"
 FILES_${PN}-libxendevicemodel-dev = " \
     ${libdir}/libxendevicemodel.so \
+    ${libdir}/pkgconfig/xendevicemodel.pc \
     ${datadir}/pkgconfig/xendevicemodel.pc \
     "
 
 FILES_${PN}-libxenevtchn = "${libdir}/libxenevtchn.so.*"
 FILES_${PN}-libxenevtchn-dev = " \
     ${libdir}/libxenevtchn.so \
+    ${libdir}/pkgconfig/xenevtchn.pc \
     ${datadir}/pkgconfig/xenevtchn.pc \
     "
 
 FILES_${PN}-libxenforeignmemory = "${libdir}/libxenforeignmemory.so.*"
 FILES_${PN}-libxenforeignmemory-dev = " \
     ${libdir}/libxenforeignmemory.so \
+    ${libdir}/pkgconfig/xenforeignmemory.pc \
     ${datadir}/pkgconfig/xenforeignmemory.pc \
     "
 
 FILES_${PN}-libxengnttab = "${libdir}/libxengnttab.so.*"
 FILES_${PN}-libxengnttab-dev = " \
     ${libdir}/libxengnttab.so \
+    ${libdir}/pkgconfig/xengnttab.pc \
     ${datadir}/pkgconfig/xengnttab.pc \
     "
 
 FILES_${PN}-libxenguest = "${libdir}/libxenguest.so.*"
 FILES_${PN}-libxenguest-dev = " \
     ${libdir}/libxenguest.so \
+    ${libdir}/pkgconfig/xenguest.pc \
     ${datadir}/pkgconfig/xenguest.pc \
     "
 
 FILES_${PN}-libxenlight = "${libdir}/libxenlight.so.*"
 FILES_${PN}-libxenlight-dev = " \
     ${libdir}/libxenlight.so \
+    ${libdir}/pkgconfig/xenlight.pc \
     ${datadir}/pkgconfig/xenlight.pc \
     "
 
 FILES_${PN}-libxenstat = "${libdir}/libxenstat.so.*"
 FILES_${PN}-libxenstat-dev = " \
     ${libdir}/libxenstat.so \
+    ${libdir}/pkgconfig/xenstat.pc \
     ${datadir}/pkgconfig/xenstat.pc \
     "
 
 FILES_${PN}-libxenstore = "${libdir}/libxenstore.so.*"
 FILES_${PN}-libxenstore-dev = " \
     ${libdir}/libxenstore.so \
+    ${libdir}/pkgconfig/xenstore.pc \
     ${datadir}/pkgconfig/xenstore.pc \
     "
 
 FILES_${PN}-libxentoolcore = "${libdir}/libxentoolcore.so.*"
 FILES_${PN}-libxentoolcore-dev = " \
     ${libdir}/libxentoolcore.so \
+    ${libdir}/pkgconfig/xentoolcore.pc \
     ${datadir}/pkgconfig/xentoolcore.pc \
     "
 
 FILES_${PN}-libxentoollog = "${libdir}/libxentoollog.so.*"
 FILES_${PN}-libxentoollog-dev = " \
     ${libdir}/libxentoollog.so \
+    ${libdir}/pkgconfig/xentoollog.pc \
     ${datadir}/pkgconfig/xentoollog.pc \
     "
 
 FILES_${PN}-libxenvchan = "${libdir}/libxenvchan.so.*"
 FILES_${PN}-libxenvchan-dev = " \
     ${libdir}/libxenvchan.so \
+    ${libdir}/pkgconfig/xenvchan.pc \
     ${datadir}/pkgconfig/xenvchan.pc \
     "
 
 FILES_${PN}-libxlutil = "${libdir}/libxlutil.so.*"
 FILES_${PN}-libxlutil-dev = " \
     ${libdir}/libxlutil.so \
+    ${libdir}/pkgconfig/xlutil.pc \
     ${datadir}/pkgconfig/xlutil.pc \
     "
 FILES_${PN}-libvhd = "${libdir}/libvhd.so.*"
 FILES_${PN}-libvhd-dev = " \
     ${libdir}/libvhd.so \
+    ${libdir}/pkgconfig/vhd.pc \
     ${datadir}/pkgconfig/vhd.pc \
     "
 
 FILES_${PN}-libblktap = "${libdir}/libblktap.so.*"
 FILES_${PN}-libblktap-dev = " \
     ${libdir}/libblktap.so \
+    ${libdir}/pkgconfig/blktap.pc \
     ${datadir}/pkgconfig/blktap.pc \
     "
 
@@ -390,7 +407,9 @@ FILES_${PN}-libfsimage = " \
 FILES_${PN}-libfsimage-dev = " \
     ${libdir}/libfsimage.so \
     ${libdir}/libxenfsimage.so \
+    ${libdir}/pkgconfig/fsimage.pc \
     ${datadir}/pkgconfig/fsimage.pc \
+    ${libdir}/pkgconfig/xenfsimage.pc \
     ${datadir}/pkgconfig/xenfsimage.pc \
     "
 
-- 
2.17.1


