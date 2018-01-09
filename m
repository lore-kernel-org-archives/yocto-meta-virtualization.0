Return-Path: <christopher.w.clark@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3A7D1E00E2F; Mon,  8 Jan 2018 23:13:04 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (christopher.w.clark[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.223.193 listed in list.dnswl.org]
Received: from mail-io0-f193.google.com (mail-io0-f193.google.com
	[209.85.223.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EBF7FE00DBD
	for <meta-virtualization@yoctoproject.org>;
	Mon,  8 Jan 2018 23:13:01 -0800 (PST)
Received: by mail-io0-f193.google.com with SMTP id f6so17448370ioh.8
	for <meta-virtualization@yoctoproject.org>;
	Mon, 08 Jan 2018 23:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ZSzXS/Uj82mDrtYQnMZow++fglpKHbrnKrZ/YoZrud8=;
	b=DR+pbDKet1FPFZ3XRivanooUuyXS9/aDC7HuCW7FRONlpHWXqIftIWOf9udxJsjBpB
	b6aLRPlVj0nIldZOhu+5Tm7jrPyCSOhcZNvLsFKdYAIhWXFrE2ubvHKAXa7kp48IJz2G
	e4ICRlLT6l6TH4qzyEZXf1LXl00mBdMZtF1alM1fRtm99d1E5pM2VCJcjOQavzijtXhx
	lxwLfHX8LdKD+eh0bKT5K0W1TwW4AJYGQhfPDns2FTkJ3yoDRJKPWDqaF9pgjoDeSceg
	jJP16azdOmn0YTvp7oAVFS/hRuAiiq4OiORd4x7TS7hl5anbD6rAYBMcLChrpxMUMCzq
	vOIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ZSzXS/Uj82mDrtYQnMZow++fglpKHbrnKrZ/YoZrud8=;
	b=CFWQM9cY1Vcyjhl3Er0EvZQZCYtrz78NIz8Py0rRdB5KV81xZMoCPJ3yfUyN2+ZuG5
	wDUeApqu4Soedg6Sv1gXb4eCfeGJ938/fw8DflXdUqmlJkoe6iQcA73MU/iZwDm5NHvO
	r520t1suTB7klhRLPTucpHWL0my4QXmNgPFNZf6ixsc3bDAmQJUOoviR4jr0JL//J6IT
	BjjvpaEmsdaVfmaKow1jX1++02Y+KyYwN6VN5xMDd60CiE/mGq5m19KmKapcvY+2q5zy
	7hqVycR0dMiCAy6Z36V9Uq8QJrwILBcydjjAqnPak/V3GxYJDafN37xl3VOE76sDRcNj
	Gg8A==
X-Gm-Message-State: AKwxytfU318jscvwgF1kQrczxWtXJizdVlxklX2XYV0HdC8cH3ph2cqk
	diV4uls1nSwrM+rYeKZKibhwXegI
X-Google-Smtp-Source: ACJfBouHakZrj7mRXHf06nmK4CT8WAHED5FJETh1Vt4shaH1EkZ/AoOyM/L+s/JrJ0O3X8RGYqejtA==
X-Received: by 10.107.114.4 with SMTP id n4mr13751046ioc.134.1515481981079;
	Mon, 08 Jan 2018 23:13:01 -0800 (PST)
Received: from WorkStation-T3500.ice.pyrology.org
	(static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
	by smtp.gmail.com with ESMTPSA id
	y64sm7725921ioy.25.2018.01.08.23.13.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 08 Jan 2018 23:13:00 -0800 (PST)
From: christopher.w.clark@gmail.com
To: meta-virtualization@yoctoproject.org
Date: Mon,  8 Jan 2018 23:12:46 -0800
Message-Id: <1515481968-4085-4-git-send-email-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1515481968-4085-1-git-send-email-christopher.w.clark@gmail.com>
References: <1515481968-4085-1-git-send-email-christopher.w.clark@gmail.com>
Cc: cardoe@gentoo.org
Subject: [PATCH 3/5] xen: xen.inc: remove xen-blktap from xen-base RDEPENDS
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
X-List-Received-Date: Tue, 09 Jan 2018 07:13:04 -0000

From: Christopher Clark <christopher.w.clark@gmail.com>

In Xen 4.10, blktap is deprecated and no longer built by default,
so make the xen-blktap, xen-libblktap and xen-libvhd packages optional
instead of required dependencies for the xen-base package.

Move xen-blktap and related packages to RRECOMMENDS to preserve
xen.inc compatability with previous Xen releases.

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
---
 recipes-extended/xen/xen.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index f904e1e..15ec8cb 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -62,15 +62,12 @@ RDEPENDS_${PN} = ""
 
 RDEPENDS_${PN}-base = "\
     bash perl xz \
-    ${PN}-blktap \
     ${PN}-console \
-    ${PN}-libblktapctl \
     ${PN}-libxenguest \
     ${PN}-libxenlight \
     ${PN}-libxenvchan \
     ${PN}-libxenctrl \
     ${PN}-libxlutil \
-    ${PN}-libvhd \
     ${PN}-libxenstat \
     ${PN}-libxenstore \
     ${PN}-libfsimage \
@@ -88,7 +85,10 @@ RDEPENDS_${PN}-base = "\
 RDEPENDS_${PN}-dev = ""
 
 RRECOMMENDS_${PN}-base = " \
+    ${PN}-blktap \
     ${PN}-libblktap \
+    ${PN}-libblktapctl \
+    ${PN}-libvhd \
     ${PN}-flask \
     ${PN}-hvmloader \
     ${PN}-xenpaging \
-- 
2.7.4


