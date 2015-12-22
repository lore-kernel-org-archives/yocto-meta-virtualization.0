Return-Path: <cjp256@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 89B1FE00ACF; Tue, 22 Dec 2015 11:02:54 -0800 (PST)
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
	*      [209.85.220.170 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qk0-f170.google.com (mail-qk0-f170.google.com
	[209.85.220.170])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5F298E00ACF
	for <meta-virtualization@yoctoproject.org>;
	Tue, 22 Dec 2015 11:02:50 -0800 (PST)
Received: by mail-qk0-f170.google.com with SMTP id p187so152274929qkd.1
	for <meta-virtualization@yoctoproject.org>;
	Tue, 22 Dec 2015 11:02:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=lO/wYnnIruFLo0QogJNObu/MfF+w7cGE08bF4QQ3Yf8=;
	b=r+9DfuCwJsBK3iLgrMu6JNVO5meOxRpmEnBxjDiNvhLbNTZ+ccO44GKLCxrj+5a9uW
	NqMetl4W+8+pPIVg+erAPccEC+uGdtmhcBcLIz1Y2jIA6NhnqcrhVDErF0zLzyvvKOWo
	mvGA86Yinuk5xNy8I394bFq4AaC3Lt+P9lyvrgcZuD7/GZwGCQ4UrGJ9iStBQXMvLhK0
	WJGts3Yd6Sb4HJ9TOr7TZJ93X9yFwULMG5v6Vbs1C/y5SQa7Bj8u6+eXrFwEalEM5uux
	Od4eS4XSRc+FaRDmqLzw/9WldIS5D5xnteEEluYmWdGPM7k1tuVLAtYcuw50KGy+WUwi
	yiRg==
X-Received: by 10.55.77.216 with SMTP id a207mr34779199qkb.80.1450810970335;
	Tue, 22 Dec 2015 11:02:50 -0800 (PST)
Received: from roost.members.linode.com (chrispatterson.net. [66.175.209.160])
	by smtp.gmail.com with ESMTPSA id
	m107sm16558240qgm.19.2015.12.22.11.02.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 Dec 2015 11:02:49 -0800 (PST)
From: Chris Patterson <cjp256@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Tue, 22 Dec 2015 14:02:25 -0500
Message-Id: <1450810948-17131-2-git-send-email-cjp256@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1450810948-17131-1-git-send-email-cjp256@gmail.com>
References: <1450810948-17131-1-git-send-email-cjp256@gmail.com>
Subject: [PATCH v2 2/5] xen: empty out rdepends for xen-dev to lose QA warning
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
X-List-Received-Date: Tue, 22 Dec 2015 19:02:54 -0000

It appears that it defaults to rdepend on xen, causing a QA error:
  WARNING: QA Issue: xen-dev rdepends on xen,
  but it isn't a build dependency? [build-deps]

Signed-off-by: Chris Patterson <cjp256@gmail.com>
---
 recipes-extended/xen/xen.inc |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index 00f1823..d1f5a1b 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -78,6 +78,8 @@ RDEPENDS_${PN}-base = "\
     ${PN}-xl \
     "
 
+RDEPENDS_${PN}-dev = ""
+
 RRECOMMENDS_${PN}-base = " \
     ${PN}-libblktap \
     ${PN}-flask \
-- 
1.7.10.4


