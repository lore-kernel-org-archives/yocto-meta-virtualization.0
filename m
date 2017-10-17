Return-Path: <cardoe@cardoe.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D5BA5E00B87; Tue, 17 Oct 2017 07:44:04 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.220.194 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.220.194 listed in dnsbl.sorbs.net]
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CA36EE00B87
	for <meta-virtualization@yoctoproject.org>;
	Tue, 17 Oct 2017 07:44:03 -0700 (PDT)
Received: by mail-qk0-f194.google.com with SMTP id n5so2302204qke.11
	for <meta-virtualization@yoctoproject.org>;
	Tue, 17 Oct 2017 07:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cardoe.com; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Esfq4qi0NDmpcCEM3EfzIO34othzN6BU5JD+oaOrwlQ=;
	b=RH3pwLX5kljjU0qSKd2FXF1a27kSjfQGx2DUIlTkj+DoMwqKj2miJgpJf2/TYxOYay
	Cq4ufp60FsoFCzqexevD/aiMLV7clzI5t7KYedds4EspBvMy6x4ZOWF8wrt37xk/Ew5B
	S1z3jtjmVON8bKW/XdTF8KZyBGVxmAODnPH8w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Esfq4qi0NDmpcCEM3EfzIO34othzN6BU5JD+oaOrwlQ=;
	b=JHIgajfout3qEQwwU22DW+xndpC/rLjmC4yD8IGk1cBT7tnP9RWEK6jkabfiUFNrFq
	KajOO2EqkQFfAQU+2h2Eh0gYshgxAC0otulb2mDQHgKcxVgX8OQR4dDW9SCCICzU8avk
	LvfiAYnIeomRwD16UYcIOQztxCbJAKSPPawzW1IWP2WNlsTGvvmPbavTJgQUIfsSQjVe
	La5+qciyvYjS06seofO5xZLvbaRg0SGbL+o7Iy1jJ2uvNbjuI4o8traEJljCWV8MzOce
	n4TkcjsyAUJaxq3cCGXDFtQEAuDVzBsOQomzsq3YTheLYa+HmCmFqDLNIDTgriHKSInn
	ifIA==
X-Gm-Message-State: AMCzsaXMzP5HSefVyycVyBZASCpL/FJ2BBqXtmMFsYHyPaO8v7Cli4NV
	ZbFYdadkigBoWFxbt06lYd7e19hdf/U=
X-Google-Smtp-Source: ABhQp+SjCQTDcxGJIFpZPd3r+2vxlXTr0e8Cd2XSovrDCV0yHvDjAyXlUbGujTVvNDPYjhsFbvHY9A==
X-Received: by 10.55.15.32 with SMTP id z32mr2583179qkg.2.1508251442644;
	Tue, 17 Oct 2017 07:44:02 -0700 (PDT)
Received: from swanson.localdomain
	(104-179-196-18.lightspeed.brhmal.sbcglobal.net. [104.179.196.18])
	by smtp.gmail.com with ESMTPSA id
	a190sm6116473qkg.15.2017.10.17.07.44.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 17 Oct 2017 07:44:02 -0700 (PDT)
From: Doug Goldstein <cardoe@cardoe.com>
To: meta-virtualization@yoctoproject.org
Date: Tue, 17 Oct 2017 09:43:36 -0500
Message-Id: <20171017144340.15635-2-cardoe@cardoe.com>
X-Mailer: git-send-email 2.13.5
In-Reply-To: <20171017144340.15635-1-cardoe@cardoe.com>
References: <20171017144340.15635-1-cardoe@cardoe.com>
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>,
	Christopher Clark <christopher.clark6@baesystems.com>
Subject: [PATCH 1/5] xen: Package libxendevicemodel, introduced in Xen 4.9
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
X-List-Received-Date: Tue, 17 Oct 2017 14:44:04 -0000

From: Christopher Clark <christopher.w.clark@gmail.com>

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
(cherry picked from commit 4c32ef8ba1f74e32a5b7047fec19e58a099e923b)
---
 recipes-extended/xen/xen.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index a28d474..677ab69 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -178,6 +178,8 @@ PACKAGES = "\
     ${PN}-libxencall-dev \
     ${PN}-libxenctrl \
     ${PN}-libxenctrl-dev \
+    ${PN}-libxendevicemodel \
+    ${PN}-libxendevicemodel-dev \
     ${PN}-libxenevtchn \
     ${PN}-libxenevtchn-dev \
     ${PN}-libxenforeignmemory \
@@ -283,6 +285,9 @@ FILES_${PN}-libxencall-dev = "${libdir}/libxencall.so"
 FILES_${PN}-libxenctrl = "${libdir}/libxenctrl.so.*"
 FILES_${PN}-libxenctrl-dev = "${libdir}/libxenctrl.so"
 
+FILES_${PN}-libxendevicemodel = "${libdir}/libxendevicemodel.so.*"
+FILES_${PN}-libxendevicemodel-dev = "${libdir}/libxendevicemodel.so"
+
 FILES_${PN}-libxenevtchn = "${libdir}/libxenevtchn.so.*"
 FILES_${PN}-libxenevtchn-dev = "${libdir}/libxenevtchn.so"
 
-- 
2.13.5


