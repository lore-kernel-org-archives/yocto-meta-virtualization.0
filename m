Return-Path: <cardoe@cardoe.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4A294E00D67; Tue, 17 Oct 2017 07:44:11 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.216.193 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.216.193 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9AF34E00D43
	for <meta-virtualization@yoctoproject.org>;
	Tue, 17 Oct 2017 07:44:07 -0700 (PDT)
Received: by mail-qt0-f193.google.com with SMTP id f8so4021314qta.5
	for <meta-virtualization@yoctoproject.org>;
	Tue, 17 Oct 2017 07:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cardoe.com; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=U188th/9lPJ03znZM6FnV4nVx6F5IcoyPNjU3SI3tk8=;
	b=JV2btmFAoU5R7XSfJnsTXKUlq1mHMNtCXZ8bxt2KSQbm+Abtvd8DWfGSTtsdT8/HHM
	A6TGhPQd4774N00JR2l/4xifXOngEWyXpab+PHxOj0di1mMDL4/pbadMKMSXvjIZeUsd
	M1k4D+tHsrqIxZi1A1Or5RiKKjoxgODuiej2U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=U188th/9lPJ03znZM6FnV4nVx6F5IcoyPNjU3SI3tk8=;
	b=fv8w17qoFLD5ALoBiqHShwzSgEv6O3HWtZM6UpseQumjyJUqb0qHg7YIfMdULcjIaY
	LGl+sULVANf/wNuxMMncGvdUnMmq/AlF/WHpEN9tIEhLdQcs9gtYgoG7J0PIwtr9nM6J
	gmcph6Mtl8D/j8wLeqHhSk9NjpzIOSpZXthLe6UbznwMAP8dI2FpTIxq3Dj4sUs/q7g0
	wQQgjQ9S0ypEEEDjtPHtRo8O1ksu6hm/sNoQECOwZj/AKW2SOV28Ny75GvKL/IaU7EZr
	yUj1+LY+ZjWNvhaaB4dkoNSMBBCXqKYSlWL9eDaHoX0B+T5b9dIpZio0bY+YzyHAO+P8
	/SBw==
X-Gm-Message-State: AMCzsaUvcCe0QJIuD3oarnjPc3YblD91VU8UgVomXO1Y+qswvM7qlE/u
	380GT0fuoSXaqjo9G7p3z+KPM/zk/+o=
X-Google-Smtp-Source: ABhQp+Q735ashRG3YYg9pbwZU3NGiKeRWodwWOMNn6BGDhrhhP2CgoV0lXXW1bcT274SOi40DiJ6kg==
X-Received: by 10.200.3.150 with SMTP id t22mr20707588qtg.156.1508251446509;
	Tue, 17 Oct 2017 07:44:06 -0700 (PDT)
Received: from swanson.localdomain
	(104-179-196-18.lightspeed.brhmal.sbcglobal.net. [104.179.196.18])
	by smtp.gmail.com with ESMTPSA id
	a190sm6116473qkg.15.2017.10.17.07.44.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 17 Oct 2017 07:44:05 -0700 (PDT)
From: Doug Goldstein <cardoe@cardoe.com>
To: meta-virtualization@yoctoproject.org
Date: Tue, 17 Oct 2017 09:43:40 -0500
Message-Id: <20171017144340.15635-6-cardoe@cardoe.com>
X-Mailer: git-send-email 2.13.5
In-Reply-To: <20171017144340.15635-1-cardoe@cardoe.com>
References: <20171017144340.15635-1-cardoe@cardoe.com>
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>,
	Christopher Clark <christopher.clark6@baesystems.com>
Subject: [PATCH 5/5] xen: Replace 'inherit gettext' with explicit gettext-native dependency
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
X-List-Received-Date: Tue, 17 Oct 2017 14:44:11 -0000

From: Christopher Clark <christopher.w.clark@gmail.com>

This fixes the build when libc-locale-code is not a DISTRO_FEATURE.

xen's configure script checks for xgettext and will abort if not found.

xgettext is provided by the gettext-native package but not by
gettext-minimal-native. This means that "inherit gettext" is not
sufficient to satisfy Xen's build requirements: gettext-native is
required.

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
(cherry picked from commit 55b1cbe55dcd356e4d6b257ee1f58df9bb728665)
---
 recipes-extended/xen/xen.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index 4333905..37fb4ce 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=bbb4b1bdc2c3b6743da3c39d03249095"
 
 COMPATIBLE_HOST = '(x86_64.*).*-linux|aarch64.*-linux'
 
-inherit autotools-brokensep gettext setuptools update-rc.d systemd deploy
+inherit autotools-brokensep setuptools update-rc.d systemd deploy
 
 require xen-arch.inc
 
@@ -29,6 +29,7 @@ DEPENDS = " \
     dev86-native \
     flex-native \
     file-native \
+    gettext-native \
     iasl-native \
     ncurses-native \
     util-linux-native \
-- 
2.13.5


