Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web09.16778.1582521586712910515
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 23 Feb 2020 21:19:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kE3tbKL3;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: christopher.w.clark@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8EE2BE014C6; Sun, 23 Feb 2020 21:19:46 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      (christopher.w.clark[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.215.195 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8A053E00804
	for <meta-virtualization@yoctoproject.org>; Sun, 23 Feb 2020 21:19:45 -0800 (PST)
Received: by mail-pg1-f195.google.com with SMTP id 7so2424218pgr.2
        for <meta-virtualization@yoctoproject.org>; Sun, 23 Feb 2020 21:19:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=wH8hZeiRkUrztlifmNzna+jJCEvv+ZdgOlt75ZtkZl4=;
        b=kE3tbKL3DTx4EO+CqBAHwtzIQpyingZogLpCmRBqFZUUJv7dRhuzjGlDtytKCJtSKb
         v5ux1SZV/YTq+V/zT78cAts25NtT8zspT4H4++1B60olADi/tQwe0aiGfy4EGIdUGvBp
         yP33t7ZO7WP954Wt9Ht5TyASaIVJHc6GfEwiwbzX3VDLJINpKflXm/hweGebF6JQZsfi
         6xQ1fj0PDzRC0E/aat83IhL1LW9qDFhcJpiunYepGa4NSOl/G98f++Z4Wj8QJ1WacJQg
         L2dB8xUbm2Md2tF/s/QVUJlfHnkEqMH7idBjGDjEXMBuKS1IH3CiW2tBkoeEz9LUZoNG
         loZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=wH8hZeiRkUrztlifmNzna+jJCEvv+ZdgOlt75ZtkZl4=;
        b=NcL9okDzv5pC8qmcpni+bDjPvzmH5bT5GxwKOK1XLYZQkCy+YIi8FY7B1RFvRMneE5
         B+SU5uBGq5t+CkXX3YLq1ihxoFXxmw7Wk53wvgzThtoHOaJD6Dj8fM2Gt+Dk92UwKI6c
         2RlorFw3z7IPbDADE4CJKIHgsB9E5585vvoqsyb5URdvQIUEwWa89JXT/0QBZrDmy/dh
         1tTVXEVZxQqroXkQUrRTUYW2qsGUFzkCJi+4Yn6kHsaYTtAh10x8e6pK5IGuO3pc1H0M
         jenVtCTBFOa6gkP78MuCZ7oyxEZT3i6wu3ZB42TA8VcoAzHtEShvO5UV2bQ+y2+pf+lR
         HbpA==
X-Gm-Message-State: APjAAAW9/eSAu3vRD0uMWuQ1fYgtfa8GZddWL6PbqF5enXbrLLmVGxlx
	O94A8wasCdNdivA8VtCWjiPDxNbi
X-Google-Smtp-Source: APXvYqygPfJpxZNGzEGaatRUJ/LTXhnxSkq4A41M7p+jmaNgLXm3bIN270RyISR+3CBODAtxYuv1sw==
X-Received: by 2002:a63:5345:: with SMTP id t5mr50602082pgl.254.1582521584658;
        Sun, 23 Feb 2020 21:19:44 -0800 (PST)
Received: from desktop.ice.pyrology.org (static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
        by smtp.gmail.com with ESMTPSA id a195sm10859409pfa.120.2020.02.23.21.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2020 21:19:43 -0800 (PST)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	cardoe@gentoo.org
Subject: [meta-virtualization][PATCH v2 20/22] xen-image-minimal: add a build dependency on the xen hypervisor
Date: Sun, 23 Feb 2020 21:18:50 -0800
Message-Id: <20200224051852.21933-21-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200224051852.21933-1-christopher.w.clark@gmail.com>
References: <20200224051852.21933-1-christopher.w.clark@gmail.com>

From: Christopher Clark <christopher.w.clark@gmail.com>

The hypervisor may not be within the dom0 filesystem image itself,
so add a task dependency to ensure that it is deployable:
    do_build[depends] += "xen:do_deploy"

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
---
 recipes-extended/images/xen-image-minimal.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/recipes-extended/images/xen-image-minimal.bb b/recipes-extended/images/xen-image-minimal.bb
index c98314e..dcdc864 100644
--- a/recipes-extended/images/xen-image-minimal.bb
+++ b/recipes-extended/images/xen-image-minimal.bb
@@ -16,6 +16,10 @@ IMAGE_INSTALL += " \
     qemu \
     "
 
+# The hypervisor may not be within the dom0 filesystem image but at least
+# ensure that it is deployable:
+do_build[depends] += "xen:do_deploy"
+
 # Networking for HVM-mode guests (x86/64 only) requires the tun kernel module
 IMAGE_INSTALL_append_x86    = "kernel-module-tun"
 IMAGE_INSTALL_append_x86-64 = "kernel-module-tun"
-- 
2.17.1

