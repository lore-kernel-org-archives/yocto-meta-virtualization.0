Return-Path: <straka.derek@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5C843E00C27; Tue, 29 Mar 2016 05:47:09 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.192.50 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail-qg0-f50.google.com (mail-qg0-f50.google.com
	[209.85.192.50])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DCBCEE00BF5
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 Mar 2016 05:47:06 -0700 (PDT)
Received: by mail-qg0-f50.google.com with SMTP id y89so10590964qge.2
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 Mar 2016 05:47:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=TYkN1/8GeEhbYjpOrbA350WXmEcxw81KQgv1VMMFcaE=;
	b=T4XF51eU5YaXO2rJzvhU2ySk94EJaulWRT/Rt7/go6qY/t8GAGRafPCXTeegVgbLW8
	ozLruumgMHNM9pJzxdpbUVmQfMAbW7bN3DvY050RkMERaszBxfE78hdSIoWROe6pIJ9S
	5ESu1Zpi8gp6UozCncOdShkOan392UzjqmS3AjdWOWMVjeRYHxjxFoTZl89hLpy5YjWF
	4psyvRW1pGWUNhAaBM7leqjSduGyCQjTCaByteneyND9yKrBeZXGLrLZsw7iYCzd7n4v
	mv9vLSux/REYYNrBdMFPFuKYZ+dJ7EATO1L6PH+cQUIpOEgvOhSiGxzLDnajRvP/+nph
	0yfw==
X-Gm-Message-State: AD7BkJIAHEOXd9/4LWlAktufUzkRo+Fuf6t3LYtyiW59Cl43MHO1EDlDODv/ZSvFlowm+w==
X-Received: by 10.140.146.142 with SMTP id 136mr2591795qhs.30.1459255625817;
	Tue, 29 Mar 2016 05:47:05 -0700 (PDT)
Received: from localhost.localdomain ([96.91.222.230])
	by smtp.gmail.com with ESMTPSA id
	i46sm13864021qgd.19.2016.03.29.05.47.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 29 Mar 2016 05:47:05 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: meta-virtualization@yoctoproject.org
Date: Tue, 29 Mar 2016 08:46:40 -0400
Message-Id: <1459255600-14043-4-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1459255600-14043-1-git-send-email-derek@asterius.io>
References: <1459255600-14043-1-git-send-email-derek@asterius.io>
Cc: Derek Straka <derek@asterius.io>
Subject: [PATCHv2 4/4] xen: add the extra packages released with xen 4.7
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
X-List-Received-Date: Tue, 29 Mar 2016 12:47:09 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 recipes-extended/xen/xen.inc | 47 ++++++++++++++++++++++++++++++++++----------
 1 file changed, 37 insertions(+), 10 deletions(-)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index ae09b8b..a4af0b3 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -160,6 +160,7 @@ PACKAGES = "\
     ${PN}-gdbsx \
     ${PN}-hvmloader \
     ${PN}-hypervisor \
+    ${PN}-init-xenstore-dom \
     ${PN}-kdd \
     ${PN}-libblktap \
     ${PN}-libblktapctl \
@@ -169,8 +170,16 @@ PACKAGES = "\
     ${PN}-libfsimage-dev \
     ${PN}-libvhd \
     ${PN}-libvhd-dev \
+    ${PN}-libxencall \
+    ${PN}-libxencall-dev \
     ${PN}-libxenctrl \
     ${PN}-libxenctrl-dev \
+    ${PN}-libxenevtchn \
+    ${PN}-libxenevtchn-dev \
+    ${PN}-libxenforeignmemory \
+    ${PN}-libxenforeignmemory-dev \
+    ${PN}-libxengnttab \
+    ${PN}-libxengnttab-dev \
     ${PN}-libxenguest \
     ${PN}-libxenguest-dev \
     ${PN}-libxenlight \
@@ -179,6 +188,8 @@ PACKAGES = "\
     ${PN}-libxenstat-dev \
     ${PN}-libxenstore \
     ${PN}-libxenstore-dev \
+    ${PN}-libxentoollog \
+    ${PN}-libxentoollog-dev \
     ${PN}-libxenvchan \
     ${PN}-libxenvchan-dev \
     ${PN}-libxlutil \
@@ -261,6 +272,21 @@ FILES_${PN}-staticdev += "\
 FILES_${PN}-libblktapctl = "${libdir}/libblktapctl.so.*"
 FILES_${PN}-libblktapctl-dev = "${libdir}/libblktapctl.so"
 
+FILES_${PN}-libxencall = "${libdir}/libxencall.so.*"
+FILES_${PN}-libxencall-dev = "${libdir}/libxencall.so"
+
+FILES_${PN}-libxenctrl = "${libdir}/libxenctrl.so.*"
+FILES_${PN}-libxenctrl-dev = "${libdir}/libxenctrl.so"
+
+FILES_${PN}-libxenevtchn = "${libdir}/libxenevtchn.so.*"
+FILES_${PN}-libxenevtchn-dev = "${libdir}/libxenevtchn.so"
+
+FILES_${PN}-libxenforeignmemory = "${libdir}/libxenforeignmemory.so.*"
+FILES_${PN}-libxenforeignmemory-dev = "${libdir}/libxenforeignmemory.so"
+
+FILES_${PN}-libxengnttab = "${libdir}/libxengnttab.so.*"
+FILES_${PN}-libxengnttab-dev = "${libdir}/libxengnttab.so"
+
 FILES_${PN}-libxenguest = "${libdir}/libxenguest.so.*"
 FILES_${PN}-libxenguest-dev = "${libdir}/libxenguest.so"
 
@@ -270,27 +296,26 @@ FILES_${PN}-libxenlight-dev = " \
     ${datadir}/pkgconfig/xenlight.pc \
     "
 
+FILES_${PN}-libxenstat = "${libdir}/libxenstat.so.*"
+FILES_${PN}-libxenstat-dev = "${libdir}/libxenstat.so"
+
+FILES_${PN}-libxenstore = "${libdir}/libxenstore.so.*"
+FILES_${PN}-libxenstore-dev = "${libdir}/libxenstore.so"
+
+FILES_${PN}-libxentoollog = "${libdir}/libxentoollog.so.*"
+FILES_${PN}-libxentoollog-dev = "${libdir}/libxentoollog.so"
+
 FILES_${PN}-libxenvchan = "${libdir}/libxenvchan.so.*"
 FILES_${PN}-libxenvchan-dev = "${libdir}/libxenvchan.so"
 
-FILES_${PN}-libxenctrl = "${libdir}/libxenctrl.so.*"
-FILES_${PN}-libxenctrl-dev = "${libdir}/libxenctrl.so"
-
 FILES_${PN}-libxlutil = "${libdir}/libxlutil.so.*"
 FILES_${PN}-libxlutil-dev = " \
     ${libdir}/libxlutil.so \
     ${datadir}/pkgconfig/xlutil.pc \
     "
-
 FILES_${PN}-libvhd = "${libdir}/libvhd.so.*"
 FILES_${PN}-libvhd-dev = "${libdir}/libvhd.so"
 
-FILES_${PN}-libxenstat = "${libdir}/libxenstat.so.*"
-FILES_${PN}-libxenstat-dev = "${libdir}/libxenstat.so"
-
-FILES_${PN}-libxenstore = "${libdir}/libxenstore.so.*"
-FILES_${PN}-libxenstore-dev = "${libdir}/libxenstore.so"
-
 FILES_${PN}-libblktap = "${libdir}/libblktap.so.*"
 FILES_${PN}-libblktap-dev = "${libdir}/libblktap.so"
 
@@ -307,6 +332,8 @@ FILES_${PN}-hypervisor = "\
     /boot/xen-syms-* \
     "
 
+FILES_${PN}-init-xenstore-dom = "${libdir}/xen/bin/init-xenstore-domain"
+
 FILES_${PN}-efi = "\
     ${exec_prefix}/lib64 \
     ${exec_prefix}/lib64/xen* \
-- 
1.9.1


