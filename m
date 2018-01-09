Return-Path: <christopher.w.clark@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 16DE4E00E21; Mon,  8 Jan 2018 23:13:02 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (christopher.w.clark[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.223.194 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-io0-f194.google.com (mail-io0-f194.google.com
	[209.85.223.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D2CD4E00E15
	for <meta-virtualization@yoctoproject.org>;
	Mon,  8 Jan 2018 23:13:00 -0800 (PST)
Received: by mail-io0-f194.google.com with SMTP id w188so17442946iod.10
	for <meta-virtualization@yoctoproject.org>;
	Mon, 08 Jan 2018 23:13:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=PtoKybQXupmwAQwSTbuKQqK4pjKZapfWwCKtz5Ru74o=;
	b=BZ56Pra/Rl16nFahvAMdkzdjMW1Foxmivxi5/nIBDZ2epsLSibttgpEDuvbIxH4ngT
	/M3eYBrX/GB5PA2wo8WCOpVBJXhZZZ5PBBVNECl6CiDBab2HdCTT0+tlfTA+VzDlo4k8
	M7QB5jmbCMVzdjjMZgm4yWZoqhZteq3L/GicRBwqN9VOjt2arXeaIwPVn4pFbRxHbghM
	xTxcq0ThkvvSqlB5NKeJkdu8JJHXkVR6TtUcentAw0lNsolQ6IjeR4XxBWRE0JcDFUhA
	o2EBccm5e4UjcKDz5R434zzq0ciSxWuzfhIolWA8YJTaMUop41q+ZLp/8o0yD+iZxsBY
	Kayw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=PtoKybQXupmwAQwSTbuKQqK4pjKZapfWwCKtz5Ru74o=;
	b=QtI4vI4GK1i2Sef7Z/6EXxupivmHvX9C6O1VbCxm0VSEdbQiL2B9O94ebDbBETrilU
	5WlLyw2ys1IVh7DXNaGH0Gm0T4nCKomoobSkVjxr5dVAqpBbuJzBYde2YHvt3j8Crrq5
	aBAdiMUUdP2WDaCLhZBIaARXKVLSKZ+mxqfg0CJjFC/6kbH+b1RgeO031Fes80ZG6O1n
	rLRJbdFsuVnaapw0esmYIOcwAqF6V7ACNVYzsZDUibNoGHntjD81PKl9MXjPN9EBknsP
	IIkfAaDa8Q4GAFkl0QU0pUH059cMMaYGPBn2bbaOAYY/mADcEgwabRGmm60NBU2S1ATt
	p89w==
X-Gm-Message-State: AKGB3mLyMJWvr3Yjr/wyt9twIzJhjDXNptWT1q2nPW8tHEa/A8W+9R64
	FmSQMbJubE9QwEzRMtlMPXDyeaLI
X-Google-Smtp-Source: ACJfBou1uxLdvyx8GnVdcn/LoTJdv54nOc55R1S3RDg7Lm6mHdhzPfO1Gk9kOdqPUwVUji0SsXpyRw==
X-Received: by 10.107.155.3 with SMTP id d3mr14257197ioe.247.1515481980019;
	Mon, 08 Jan 2018 23:13:00 -0800 (PST)
Received: from WorkStation-T3500.ice.pyrology.org
	(static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
	by smtp.gmail.com with ESMTPSA id
	y64sm7725921ioy.25.2018.01.08.23.12.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 08 Jan 2018 23:12:59 -0800 (PST)
From: christopher.w.clark@gmail.com
To: meta-virtualization@yoctoproject.org
Date: Mon,  8 Jan 2018 23:12:45 -0800
Message-Id: <1515481968-4085-3-git-send-email-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1515481968-4085-1-git-send-email-christopher.w.clark@gmail.com>
References: <1515481968-4085-1-git-send-email-christopher.w.clark@gmail.com>
Cc: cardoe@gentoo.org
Subject: [PATCH 2/5] xen: Package libxentoolcore and xen-diag, introduced in Xen 4.10
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
X-List-Received-Date: Tue, 09 Jan 2018 07:13:02 -0000

From: Christopher Clark <christopher.w.clark@gmail.com>

Package a new library, libxentoolstore, introduced in Xen 4.10.
Also package the xen-diag tool in the xen-misc package.

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
---
 recipes-extended/xen/xen.inc | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index 4d56de9..f904e1e 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -196,6 +196,8 @@ PACKAGES = "\
     ${PN}-libxenstat-dev \
     ${PN}-libxenstore \
     ${PN}-libxenstore-dev \
+    ${PN}-libxentoolcore \
+    ${PN}-libxentoolcore-dev \
     ${PN}-libxentoollog \
     ${PN}-libxentoollog-dev \
     ${PN}-libxenvchan \
@@ -344,6 +346,12 @@ FILES_${PN}-libxenstore-dev = " \
     ${datadir}/pkgconfig/xenstore.pc \
     "
 
+FILES_${PN}-libxentoolcore = "${libdir}/libxentoolcore.so.*"
+FILES_${PN}-libxentoolcore-dev = " \
+    ${libdir}/libxentoolcore.so \
+    ${datadir}/pkgconfig/xentoolcore.pc \
+    "
+
 FILES_${PN}-libxentoollog = "${libdir}/libxentoollog.so.*"
 FILES_${PN}-libxentoollog-dev = " \
     ${libdir}/libxentoollog.so \
@@ -474,6 +482,7 @@ FILES_${PN}-misc = "\
     ${sbindir}/xenperf \
     ${sbindir}/xenpm \
     ${sbindir}/xsview \
+    ${sbindir}/xen-diag \
     ${sbindir}/xen-tmem-list-parse \
     ${sbindir}/xen-python-path \
     ${sbindir}/xen-ringwatch \
-- 
2.7.4


