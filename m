Return-Path: <christopher.w.clark@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1BA52E00CDC; Tue, 31 Jul 2018 12:36:09 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.160.49 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (christopher.w.clark[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-pl0-f49.google.com (mail-pl0-f49.google.com
	[209.85.160.49])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 35D8DE00CCE
	for <meta-virtualization@yoctoproject.org>;
	Tue, 31 Jul 2018 12:36:08 -0700 (PDT)
Received: by mail-pl0-f49.google.com with SMTP id d5-v6so2071316pll.4
	for <meta-virtualization@yoctoproject.org>;
	Tue, 31 Jul 2018 12:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=fiu8F4G4Ltl2v0pDGpos59TtX7c8ljnDXPzQl/I5ymc=;
	b=dUiQ3oh1Y4q1fQi7Yxpu2g/5Q8Q4dQ9T8Q18Mt4FT+0xmY73uWGXRq8imXs4+dEugF
	GSJhIqysPEebTf37cgfrXEzFeCD3LzNa1n+0H7xoH7T5OE+NKLRdxF6Nbrfk16LsEsiR
	L+VjPJ18jRNmZTdwYaX+BcxI1Yy1L1/2EQQ7o+vfyYkq5rmtDGr3C1TgpO4lp5GOk/SC
	d6SwBZ0Qu9cykG4Ty0k5eZ/h9mftZlxZwih9lHWcbyFn8dqwLhknpqg5rEUv2L5DMbYA
	+wpXNtsOrtlKopEh6VKd17GjogThdsRXhJEiRgLg9NQYsp/0Lg7HL/tE2iXqFRM1UTCY
	jJDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=fiu8F4G4Ltl2v0pDGpos59TtX7c8ljnDXPzQl/I5ymc=;
	b=FWIWjYBo+BEtw062traJfE7WhoYX4r2ESJMMvLNVUkmAndLsDCpoHooCFWBSMPrAtp
	cIr5tgzbU1h0VBB2zTB22FPL7kw8gwXXYWgHmarNJLNjzTGTkIOL22z+gkqcf7YSC8c0
	AkLx6fqCu+H9bUzvERAiw73eFISxIjsS5P1/jf2u/XoR+0E/8fujDFOEjHB2FID17xEy
	S+DzUtAYaMxMi5QpcxXzIaLXkxEMg84NRe7JvCufHaoF1rs4yNzP/NFyGOok+j/IMjpV
	gUL7vcWrk+amr3QbgCKVoJbaGNQqj4JGvMckhAXs7Ieo5FWrTSm+rIs7Fdc1rh8g4tbN
	7A6g==
X-Gm-Message-State: AOUpUlGsLP5LFBq750NBhKO+chwLCqeXRG9BwzYnD2fOwmqEoQgVmabh
	LydLmq5q4a95QEX4wmxkzl1Wlmnj
X-Google-Smtp-Source: AAOMgpdYMyWQFqhHa8MHZMCeB/rrkeP1sD2+Y06y3sIGgthnieRsIP241si5M5UI/DeE51UCwkcmDw==
X-Received: by 2002:a17:902:8303:: with SMTP id
	bd3-v6mr6573492plb.329.1533065767450; 
	Tue, 31 Jul 2018 12:36:07 -0700 (PDT)
Received: from WorkStation-T3500.ice.pyrology.org
	(static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
	by smtp.gmail.com with ESMTPSA id
	64-v6sm24758626pfi.89.2018.07.31.12.36.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 31 Jul 2018 12:36:06 -0700 (PDT)
From: christopher.w.clark@gmail.com
To: meta-virtualization@yoctoproject.org
Date: Tue, 31 Jul 2018 12:35:43 -0700
Message-Id: <1533065750-25786-3-git-send-email-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1533065750-25786-1-git-send-email-christopher.w.clark@gmail.com>
References: <1533065750-25786-1-git-send-email-christopher.w.clark@gmail.com>
Cc: cardoe@gentoo.org
Subject: [PATCH v2 2/9] xen: add recipe for 4.11.0
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
X-List-Received-Date: Tue, 31 Jul 2018 19:36:09 -0000

From: Christopher Clark <christopher.w.clark@gmail.com>

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
---
 recipes-extended/xen/xen_4.11.0.bb | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 recipes-extended/xen/xen_4.11.0.bb

diff --git a/recipes-extended/xen/xen_4.11.0.bb b/recipes-extended/xen/xen_4.11.0.bb
new file mode 100644
index 0000000..7884194
--- /dev/null
+++ b/recipes-extended/xen/xen_4.11.0.bb
@@ -0,0 +1,12 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
+require xen.inc
+
+SRC_URI = " \
+    https://downloads.xenproject.org/release/xen/${PV}/xen-${PV}.tar.gz \
+    file://tools-xentop-vwprintw.patch \
+    "
+
+SRC_URI[md5sum] = "cbec0600284921744bc14119f4ed3fff"
+SRC_URI[sha256sum] = "826e3a9f6d0eac94a825d272cc2c1294e22640ae75af906eb13920f9ad667643"
+
+S = "${WORKDIR}/xen-${PV}"
-- 
2.7.4


