Return-Path: <cardoe@cardoe.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8927DE00BE1; Mon, 24 Aug 2015 13:27:11 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.220.174 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 56070E00BD6
	for <meta-virtualization@yoctoproject.org>;
	Mon, 24 Aug 2015 13:27:08 -0700 (PDT)
Received: by qkda128 with SMTP id a128so37073496qkd.3
	for <meta-virtualization@yoctoproject.org>;
	Mon, 24 Aug 2015 13:27:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=yjno5HX1tvOTHZMhk2rOasDDd8PSuungttgw8aZMerc=;
	b=CScHH8+mDG/fm+5qhjJwRLIBQklY6jLkzp6lRgfLT+Eq7NEfkLXf7mHyvC+8ke1jc/
	hh3hTHOh1Cu47Q4mnoW/bOr9bqZa5Blau89IQIBzAe0tgNJbn70pvy6PokElGEIWAy15
	/qXTDtcGZT1ug6GjDkiplF/5iV5FIR3CPBT6byZhGTt2+lvxhD0rmlAx8XDjyCWwhzd2
	nkEersKuh+m/+gVjs40YojaErTJP4qxE09dty3Q1EStcoakAGsUatWr69/oyqrb5UxO1
	5GltDc80GU2SvbRsSdtqikYgA7wnts1dqgHXQkYEQalJfOZ/JAY2hd+94+BV4j/eetin
	WW7g==
X-Gm-Message-State: ALoCoQlsQpGQY9qH6XZ2SYW9uFcxtJN2SMEbaa1rf40z3h+nJWHHO/T7NtGMv+LX1aVObY4X63E0
X-Received: by 10.129.38.212 with SMTP id m203mr31790475ywm.25.1440448028230; 
	Mon, 24 Aug 2015 13:27:08 -0700 (PDT)
Received: from doug-t430.lan ([67.63.141.2]) by smtp.gmail.com with ESMTPSA id
	p79sm18531307ywp.37.2015.08.24.13.27.07
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 24 Aug 2015 13:27:07 -0700 (PDT)
From: Doug Goldstein <cardoe@cardoe.com>
To: meta-virtualization@yoctoproject.org
Date: Mon, 24 Aug 2015 15:26:46 -0500
Message-Id: <1440448008-9189-2-git-send-email-cardoe@cardoe.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1440448008-9189-1-git-send-email-cardoe@cardoe.com>
References: <1440448008-9189-1-git-send-email-cardoe@cardoe.com>
Subject: [PATCH 2/4] xen: drop incorrectly broken out package
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
X-List-Received-Date: Mon, 24 Aug 2015 20:27:11 -0000

The xen-mfndump utility was broken out into xen-xen-mfndump which is
clearly a typo for xen-mfndump but the xen.inc file which is also used
for 4.5.0 places this binary into xen-misc so remove these lines and let
it go into xen-misc.
---
 recipes-extended/xen/xen_git.bb | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/recipes-extended/xen/xen_git.bb b/recipes-extended/xen/xen_git.bb
index f333157..88145a3 100644
--- a/recipes-extended/xen/xen_git.bb
+++ b/recipes-extended/xen/xen_git.bb
@@ -11,8 +11,3 @@ SRC_URI = " \
     "
 
 DEFAULT_PREFERENCE = "-1"
-
-PACKAGES += "${PN}-xen-mfndump"
-
-FILES_${PN}-xen-mfndump = "${sbindir}/xen-mfndump"
-
-- 
2.1.4


