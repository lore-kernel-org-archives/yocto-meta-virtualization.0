Return-Path: <cjp256@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0687BE00C5B; Mon, 21 Dec 2015 17:24:04 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (cjp256[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.192.48 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qg0-f48.google.com (mail-qg0-f48.google.com
	[209.85.192.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 392B4E00863
	for <meta-virtualization@yoctoproject.org>;
	Mon, 21 Dec 2015 17:24:01 -0800 (PST)
Received: by mail-qg0-f48.google.com with SMTP id 74so53401686qgh.1
	for <meta-virtualization@yoctoproject.org>;
	Mon, 21 Dec 2015 17:24:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=/xG3d5cLSk63kaYeB6+Jc8HDOCBEq0PZr1DKmLV92Aw=;
	b=EFudCNIKYOTeQIxLd0yV2tIJ99x1VqS81Ar7tLkSjP7i4QYSk88xyBYO0gMWpquSiM
	lZrn+jST+NtwcJLjeqBXUJ5gpMeQUQaS79Hsn54KpUJuqc6sCcy+ZEYc38JTrOS+Mwzj
	fpD2pEV9Nnc/xTiGlgQTT9Sajedczo6Dt9axzTuiAWfwg65kaUVtMImFTxskj0cwrwiq
	pMJPpLMV+b0DCnMi4emi2gp61DXcUPZtILAWzJhrUtQr+gBJUBegiJ+ofH5wL29Xs162
	XLbNaehshCu9CIE46oKRHbGT21DpD5qA9JTJ8cKXwcYR3K02X6IvQMUMsdGRzN1+aD27
	wHDQ==
X-Received: by 10.140.92.194 with SMTP id b60mr29003898qge.85.1450747441524;
	Mon, 21 Dec 2015 17:24:01 -0800 (PST)
Received: from roost.members.linode.com (chrispatterson.net. [66.175.209.160])
	by smtp.gmail.com with ESMTPSA id
	o51sm6344305qge.34.2015.12.21.17.24.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 Dec 2015 17:24:01 -0800 (PST)
From: Chris Patterson <cjp256@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Mon, 21 Dec 2015 20:23:55 -0500
Message-Id: <1450747435-5738-4-git-send-email-cjp256@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1450747435-5738-1-git-send-email-cjp256@gmail.com>
References: <1450747435-5738-1-git-send-email-cjp256@gmail.com>
Subject: [PATCH 4/4] xen: empty out rdepends for xen-dev to lose QA warning
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
X-List-Received-Date: Tue, 22 Dec 2015 01:24:04 -0000

It appears that it defaults to rdepend on xen, causing a QA error:
  WARNING: QA Issue: xen-dev rdepends on xen,
  but it isn't a build dependency? [build-deps]

Signed-off-by: Chris Patterson <cjp256@gmail.com>
---
 recipes-extended/xen/xen.inc |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index c1be16d..1bacf38 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -77,6 +77,8 @@ RDEPENDS_${PN}-base = "\
     ${PN}-xl \
     "
 
+RDEPENDS_${PN}-dev = ""
+
 RRECOMMENDS_${PN}-base = " \
     ${PN}-libblktap \
     ${PN}-flask \
-- 
1.7.10.4


