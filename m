Return-Path: <cardoe@cardoe.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0F016E00BE8; Mon, 24 Aug 2015 13:27:25 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.220.171 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail-qk0-f171.google.com (mail-qk0-f171.google.com
	[209.85.220.171])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6F401E00BF4
	for <meta-virtualization@yoctoproject.org>;
	Mon, 24 Aug 2015 13:27:11 -0700 (PDT)
Received: by qkfh127 with SMTP id h127so86862677qkf.1
	for <meta-virtualization@yoctoproject.org>;
	Mon, 24 Aug 2015 13:27:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=6MLIpwaA0AiITBDgL/lVhlpq2mHp1yNWIJgJjMDPs4Y=;
	b=Iid+uC6ojNicpMka/LZ6Fu8a1KWmHddyqluf8IY1LYrK1ru3oN9Cn3rIBKtkdJBnQl
	9dXIgZ2GWFYZ+1JKnsWR1/nGey/ximj0dXVLmx2aXxvAcFFj6L7h59rTalyAGV+O9eoC
	9+D8dfSya3KtRO28Ha0JwoFbGh5q3RaFxl7qEglsG3+dHWz3awYHCLJ4FZf+3lUWX+Ly
	OClOqGZ7IvR1KJLpnLSIHlrDhu6Nc6m+IBtaonZ/I/TbEKqtb8PoLQYE1ycpQM3DLQRH
	en0Pc4yeZ3J9VYpu4dkBQ0gqWFEciZ4Hg3qCOg/fEq/o/wS8qOiKB5WFLcyn16G2zrwr
	XwAQ==
X-Gm-Message-State: ALoCoQl7pqk3mdDUhKwnDCBF24q8QFgzne4OriPD8vGRu/jhAd+R/mzdmhN/6ZdxAsWqz+iEhK/7
X-Received: by 10.170.55.70 with SMTP id 67mr32533715ykx.82.1440448030670;
	Mon, 24 Aug 2015 13:27:10 -0700 (PDT)
Received: from doug-t430.lan ([67.63.141.2]) by smtp.gmail.com with ESMTPSA id
	p79sm18531307ywp.37.2015.08.24.13.27.10
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 24 Aug 2015 13:27:10 -0700 (PDT)
From: Doug Goldstein <cardoe@cardoe.com>
To: meta-virtualization@yoctoproject.org
Date: Mon, 24 Aug 2015 15:26:47 -0500
Message-Id: <1440448008-9189-3-git-send-email-cardoe@cardoe.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1440448008-9189-1-git-send-email-cardoe@cardoe.com>
References: <1440448008-9189-1-git-send-email-cardoe@cardoe.com>
Subject: [PATCH 3/4] xen: add missing dependency
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
X-List-Received-Date: Mon, 24 Aug 2015 20:27:25 -0000

The xen-fsimage package contains shared libraries which depend on the
shared libraries from libext2fs so there needs to be a RDEPEND set.
---
 recipes-extended/xen/xen.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index c7a2347..20f8abe 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -91,6 +91,10 @@ RRECOMMENDS_${PN}-base = " \
     ${PN}-xenpaging \
     "
 
+RDEPENDS_${PN}-fsimage = " \
+    libext2fs \
+    "
+
 RDEPENDS_${PN}-misc = " \
     perl \
     python \
-- 
2.1.4


