Return-Path: <cardoe@cardoe.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 53CDEE00D36; Tue, 17 Oct 2017 07:44:06 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.220.196 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.220.196 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D2C40E00D43
	for <meta-virtualization@yoctoproject.org>;
	Tue, 17 Oct 2017 07:44:05 -0700 (PDT)
Received: by mail-qk0-f196.google.com with SMTP id 17so2294037qkq.8
	for <meta-virtualization@yoctoproject.org>;
	Tue, 17 Oct 2017 07:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cardoe.com; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=4ppgTk9KygvCiE0tLR4xNPVBFmILNLy11+fYWtlp/Xs=;
	b=esCFvODsR3MLaGL0HgAlHyLQW55gbgzxv/7gGFWpgeOC17i9zec2R/jf+feXE1rDa/
	JQNDIglm2EVqWzWLvJtrQvO8vripGcOPgJ33ZCRrh4veCyR5e4SbD8h50CICfQfraIbg
	UrEU2hP2atzD1uccDPKgeRcvYW3fqaLOtAAwY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=4ppgTk9KygvCiE0tLR4xNPVBFmILNLy11+fYWtlp/Xs=;
	b=S2M3Edq4QmH4FF+z481sTQ7FR4oGiTHpOd3izVN/YC9/e2lKneu1pWxJhz5BJk7Qvz
	WEmXa11uH4PeSTgDrCyUZhIs60ue984LYgZ47Jj/iWWlKSJ6tOYmhwhOyc/iXZPxBcrW
	Y4IBN8jI0aL25nPqP5bU4xh9Z6fcf8Wf4wCjQtnSjvlBsyqunrFmFRo1BOdvH8a9muTQ
	TXKcOEqiJNRID5BzYGuWrxctr4B2/nzQcePKJ/V7k+jk015RKZ2/ox31VwQ3joncoIsi
	+e3x74i57OFTNEmTzvO1oiqsnPgG6p5X9ebl9oA1iQB9e+IU+6afJWUeVGgZa4rbAakB
	fqZg==
X-Gm-Message-State: AMCzsaXjxuFezfI79RX6LZVajKjsScQWF8ga8REocGvrqwwTXKlPxba0
	kP5QSsgs5A/V91s3zTXpApk//EpN3m0=
X-Google-Smtp-Source: ABhQp+Q45qXoKwa9diAsIfjK43cKhCdHeucuJJuP8VcJPhB8nZBlBF+scVKmPTBFCZQUVsSId69Iaw==
X-Received: by 10.55.182.135 with SMTP id g129mr19164239qkf.227.1508251444684; 
	Tue, 17 Oct 2017 07:44:04 -0700 (PDT)
Received: from swanson.localdomain
	(104-179-196-18.lightspeed.brhmal.sbcglobal.net. [104.179.196.18])
	by smtp.gmail.com with ESMTPSA id
	a190sm6116473qkg.15.2017.10.17.07.44.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 17 Oct 2017 07:44:03 -0700 (PDT)
From: Doug Goldstein <cardoe@cardoe.com>
To: meta-virtualization@yoctoproject.org
Date: Tue, 17 Oct 2017 09:43:38 -0500
Message-Id: <20171017144340.15635-4-cardoe@cardoe.com>
X-Mailer: git-send-email 2.13.5
In-Reply-To: <20171017144340.15635-1-cardoe@cardoe.com>
References: <20171017144340.15635-1-cardoe@cardoe.com>
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>,
	Christopher Clark <christopher.clark6@baesystems.com>
Subject: [PATCH 3/5] xen: remove STAGING_DIR_HOST from the runtime search path for bios.bin
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
X-List-Received-Date: Tue, 17 Oct 2017 14:44:06 -0000

From: Christopher Clark <christopher.w.clark@gmail.com>

This configuration option sets a run-time search path rather
than the location of a build-time dependency.

Tested with Xen 4.9 on OpenXT.

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
(cherry picked from commit 9e84be6360c64d822fb5a1cea027f40007db2fe5)
---
 recipes-extended/xen/xen.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index 5242385..cda737c 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -22,7 +22,7 @@ FLASK_POLICY_FILE ?= "xenpolicy-${PV}"
 PACKAGECONFIG[sdl] = "--enable-sdl,--disable-sdl,virtual/libsdl,"
 PACKAGECONFIG[xsm] = "--enable-xsmpolicy,--disable-xsmpolicy,checkpolicy-native,"
 PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd,systemd,"
-PACKAGECONFIG[hvm] = "--with-system-seabios="${STAGING_DIR_HOST}/usr/share/firmware/bios.bin",--disable-seabios,seabios ipxe vgabios,"
+PACKAGECONFIG[hvm] = "--with-system-seabios="/usr/share/firmware/bios.bin",--disable-seabios,seabios ipxe vgabios,"
 
 DEPENDS = " \
     bison-native \
-- 
2.13.5


