Return-Path: <cardoe@cardoe.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 930A5E009D7; Wed, 12 Aug 2015 07:43:17 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.192.50 listed in list.dnswl.org]
Received: from mail-qg0-f50.google.com (mail-qg0-f50.google.com
	[209.85.192.50])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 192EAE00ABC
	for <meta-virtualization@yoctoproject.org>;
	Wed, 12 Aug 2015 07:42:58 -0700 (PDT)
Received: by qgeg42 with SMTP id g42so11801713qge.1
	for <meta-virtualization@yoctoproject.org>;
	Wed, 12 Aug 2015 07:42:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=vGmBVLLckqhEWMfTLyVM93R0J+d75Bf2ZDjJBSougIo=;
	b=WNjijv4yEz/Wd2LkQcH5cgi2/mSBpBeHL+cTbtl5b5gVpLWA2mwNtXxGYfmoE8wDiv
	dyhSPQ9JUP622E3QAja2OnoooNYvvMXukVe5a27npwgYkiJ2J7GF2r3VMynVYVT914cW
	LiKTdzlepykg8hMPAkZdJk6zWYIj7N0Zr+O6xsu5uIZDQ2lq35xVv98BnUUk7w79L0Nx
	Z2ASPnWvTqfO/1xOFUjyMwYcYHY5jCkPl4fFmPwhKhYcqNgAthPMIPmaxLL8Isl8IgI+
	0kicBLoM+0GEcXQVN6PMWpsUcbcyn6av8jgt/iOqwBFIPDyy2UZtBhwGwQMvs1WyJCBc
	EHBQ==
X-Gm-Message-State: ALoCoQlQiH8JaUsm9uLQ7qi8CUi9Js2eUunUEwOeVor5HLSQsYee7uj8NQhvaiwl57zejcchp0jp
X-Received: by 10.140.19.48 with SMTP id 45mr59120242qgg.13.1439390578103;
	Wed, 12 Aug 2015 07:42:58 -0700 (PDT)
Received: from doug-t430.lan ([67.63.141.2]) by smtp.gmail.com with ESMTPSA id
	b196sm3270271qka.14.2015.08.12.07.42.57
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 12 Aug 2015 07:42:57 -0700 (PDT)
From: Doug Goldstein <cardoe@cardoe.com>
To: meta-virtualization@yoctoproject.org
Date: Wed, 12 Aug 2015 09:39:48 -0500
Message-Id: <1439390388-16012-2-git-send-email-cardoe@cardoe.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1439390388-16012-1-git-send-email-cardoe@cardoe.com>
References: <1439390388-16012-1-git-send-email-cardoe@cardoe.com>
Subject: [PATCH 2/2] dev86: adjust SRC_URI to author's new site
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
X-List-Received-Date: Wed, 12 Aug 2015 14:43:17 -0000

Update the SRC_URI to the author's new site where the hosted files match
the existing md5sum and sha256sum.

Signed-off-by: Doug Goldstein <cardoe@cardoe.com>
---
 recipes-extended/dev86/dev86_0.16.19.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/dev86/dev86_0.16.19.bb b/recipes-extended/dev86/dev86_0.16.19.bb
index 807504e..0402c99 100644
--- a/recipes-extended/dev86/dev86_0.16.19.bb
+++ b/recipes-extended/dev86/dev86_0.16.19.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 SECTION = "console/tools"
 PR="r0"
 
-SRC_URI="http://www.debath.co.uk/dev86/Dev86src-${PV}.tar.gz"
+SRC_URI="http://v3.sk/~lkundrak/dev86/archive/Dev86src-${PV}.tar.gz"
 
 SRC_URI[md5sum] = "442e98e1afa23fe00d40c5a996385942"
 SRC_URI[sha256sum] = "33398b87ca85e2b69e4062cf59f2f7354af46da5edcba036c6f97bae17b8d00e"
-- 
2.1.4


