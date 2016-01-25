Return-Path: <cardoe@cardoe.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 00E4AE00BE3; Mon, 25 Jan 2016 07:29:37 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.160.194 listed in list.dnswl.org]
Received: from mail-yk0-f194.google.com (mail-yk0-f194.google.com
	[209.85.160.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7AD60E008F5
	for <meta-virtualization@yoctoproject.org>;
	Mon, 25 Jan 2016 07:29:36 -0800 (PST)
Received: by mail-yk0-f194.google.com with SMTP id y10so12610391ykf.0
	for <meta-virtualization@yoctoproject.org>;
	Mon, 25 Jan 2016 07:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cardoe-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=gkuf6bKy0+NSlDmNifJ6vfRGYAsIp/7v+X8WzQYzgKc=;
	b=0JL0EBOWId0nGDq0GbZF6mGADHTe13kLYJh+K6ZNxVdomQisuRcM3aD0nuiuhwfRJv
	j95DGDk/S7hLmWLY6DRxPDm1d4IQWHVuUzeb9V52GUnSFmc1/vvaLF48eRD6PMiUA4XN
	Nfa8FyqZqeit9mqHv0NUZrg+bE5y32KSey8UGrYU+toyN2y3MOnvP9J7Pt2ZMjMvNspB
	HFw02VdoZYZ4oEaEeot9yVc0X6Yt7OxfcSf0FsaH0f8BCbd9FBIxvcfSS2o2xHBetark
	dCccWccmIEPyoVxkdlD9pmRd+UGwYiCl/kYgrxg9aOJDULeIbv+GNvo0nOv4NosljHQL
	FgCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=gkuf6bKy0+NSlDmNifJ6vfRGYAsIp/7v+X8WzQYzgKc=;
	b=gjP4yyz0vr7pKmYxEoLzh+UQdRgaLl9RkjHDHqQcuo3/CT3iDUE0BWy3xCSzjxg5H/
	wK9IHb8arA7yxl9QAMFDragBI8/AsQP1V1G6Te55G9LkPWtNrsRVuZzFBz0pRGGjQmdW
	pq+w7C4YAPt+dvBpqJbWBxB+8zf6Yua8bWtrB6zhz/oEXDJHwBPPYxmsadrG6Vwo/qlX
	01Ld9BGliuZbYzJnBzVlJA2rW9JtohoqgSBkxPaIYcJd4f9Os+6KSaWrfP2X2S8K3E2K
	tQrPdQy6tW8WyaEhjIDtVvKyIGJkMH9OshLcs+1Lq2BK9C7a+ip883tvAcq0E94XhaLX
	iUJg==
X-Gm-Message-State: AG10YOSEMBzcok3ah31wfjHRsl5pa8r4ZKbnDMgMtQdR/JLP8yHgK3igXCh9LhALcJVM5g==
X-Received: by 10.129.153.18 with SMTP id q18mr8500304ywg.318.1453735776042;
	Mon, 25 Jan 2016 07:29:36 -0800 (PST)
Received: from swanson.lan (c-68-46-196-185.hsd1.al.comcast.net.
	[68.46.196.185]) by smtp.gmail.com with ESMTPSA id
	193sm14422579ywe.22.2016.01.25.07.29.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 25 Jan 2016 07:29:34 -0800 (PST)
From: Doug Goldstein <cardoe@cardoe.com>
To: meta-virtualization@yoctoproject.org
Date: Mon, 25 Jan 2016 09:29:09 -0600
Message-Id: <1453735752-966-2-git-send-email-cardoe@cardoe.com>
X-Mailer: git-send-email 2.4.10
In-Reply-To: <1453735752-966-1-git-send-email-cardoe@cardoe.com>
References: <1453735752-966-1-git-send-email-cardoe@cardoe.com>
Subject: [PATCH 2/5] xen: drop explicit DEPEND on libgcc
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
X-List-Received-Date: Mon, 25 Jan 2016 15:29:38 -0000

The ELFs that get built in the 'xen-xl' package do not have a NEEDED
entry on libgcc. 'xen-base' is a meta package and itself should not
depend on a library like this. Yocto checks the NEEDED of the dynamic
section and automatically includes those libraries as dependencies.

Signed-off-by: Doug Goldstein <cardoe@cardoe.com>
---
 recipes-extended/xen/xen.inc | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index c63cb2c..c0acbcd 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -54,7 +54,7 @@ DEPENDS = " \
 RDEPENDS_${PN} = ""
 
 RDEPENDS_${PN}-base = "\
-    libgcc bash perl xz \
+    bash perl xz \
     ${PN}-blktap \
     ${PN}-console \
     ${PN}-libblktapctl \
@@ -137,8 +137,6 @@ RDEPENDS_${PN}-xendomains = "\
     ${PN}-xenstored \
     "
 
-RDEPENDS_${PN}-xl = "libgcc"
-
 RDEPENDS_${PN}-xentrace = "python"
 
 RDEPENDS_${PN}-xen-watchdog = "bash"
-- 
2.4.10


