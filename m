Return-Path: <cardoe@cardoe.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A8D7DE008F2; Mon,  2 Jan 2017 21:01:45 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.161.194 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.161.194 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yw0-f194.google.com (mail-yw0-f194.google.com
	[209.85.161.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 00188E0089B
	for <meta-virtualization@yoctoproject.org>;
	Mon,  2 Jan 2017 21:01:44 -0800 (PST)
Received: by mail-yw0-f194.google.com with SMTP id b66so37267171ywh.2
	for <meta-virtualization@yoctoproject.org>;
	Mon, 02 Jan 2017 21:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cardoe.com; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=QodwEsq3J4EosZTuPh2YsryWaOmJQpo54M1eoPNsQ1k=;
	b=ZrnvRevTyMN0GBt6gxgDqXMsUmyAk1fFJmG5z4cMSU1WMhdywkOCTeFYkptzgnY/5P
	0El7GuPfK6+XiwVlB0opD4q3WKDu8T7n0lht+W9yDc4xpZf78bxkcP8gRzEygQ0QhhBi
	WKPGQlXYIPeWrCSodyopFSu+cX1gGqd8ME5Fw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=QodwEsq3J4EosZTuPh2YsryWaOmJQpo54M1eoPNsQ1k=;
	b=LVwme9B3uEV10CJckerY42aBkYkrgUBAN/7AjrIKzVWjP78SH8QXnbjjr2oyVj+GWt
	z+IIhc2oDOcyLtRPL9h8XmW/f1w1uSiYpkhnI2c6Rl3xQK6rq0TPIb5L1GseQRTvaS1R
	avEi2Pv3REr3Q4q+l4Zj0WraqaCM/0hOtR5YwIo2l2TCaxvte/stfIDMYl0O20TFYMir
	60sBGa0xm3laZCFUMeUNxcoVwc66sizJf3S2Thr8Wz1mcTbn/RaUhfx2aKruaR815s/v
	nLdn2A+IMFZ7me5cybtoytTVZMOO45hI4gI7lRru6Bi9QINqZFvFVa4O5SQdse9rbFu8
	Lhqg==
X-Gm-Message-State: AIkVDXIFJJavVmFl4s90CiJmAIGpxCcHZLkZmet7Pwbtah0p7lg+9pDxRhmh4fTDOA+txw==
X-Received: by 10.13.227.129 with SMTP id m123mr61851598ywe.214.1483419704586; 
	Mon, 02 Jan 2017 21:01:44 -0800 (PST)
Received: from swanson.attlocal.net
	(104-179-196-18.lightspeed.brhmal.sbcglobal.net. [104.179.196.18])
	by smtp.gmail.com with ESMTPSA id
	w129sm18817296yww.30.2017.01.02.21.01.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 02 Jan 2017 21:01:44 -0800 (PST)
From: Doug Goldstein <cardoe@cardoe.com>
To: meta-virtualization@yoctoproject.org
Date: Mon,  2 Jan 2017 23:01:42 -0600
Message-Id: <20170103050142.16924-1-cardoe@cardoe.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20170103044754.15012-3-cardoe@cardoe.com>
References: <20170103044754.15012-3-cardoe@cardoe.com>
Subject: [PATCH 3/5] xen: add gnu-efi to DEPENDS
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
X-List-Received-Date: Tue, 03 Jan 2017 05:01:45 -0000

Allow Xen to build the EFI loader by including the required dependency.

Signed-off-by: Doug Goldstein <cardoe@cardoe.com>
---
 recipes-extended/xen/xen.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index 429a05a..c9ed73f 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -52,6 +52,7 @@ DEPENDS = " \
     xz \
     yajl \
     zlib \
+    gnu-efi \
     "
 
 # inherit setuptools adds python to RDEPENDS, override it
-- 
2.10.2


