Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.177.1582676221778079600
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 25 Feb 2020 16:17:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QwtsAjjr;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: christopher.w.clark@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9ECB1E0175C; Tue, 25 Feb 2020 16:17:01 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: 
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.214.194 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      (christopher.w.clark[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3DEDDE016B6
	for <meta-virtualization@yoctoproject.org>; Tue, 25 Feb 2020 16:17:01 -0800 (PST)
Received: by mail-pl1-f194.google.com with SMTP id b22so498085pls.12
        for <meta-virtualization@yoctoproject.org>; Tue, 25 Feb 2020 16:17:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=wH8hZeiRkUrztlifmNzna+jJCEvv+ZdgOlt75ZtkZl4=;
        b=QwtsAjjrCXUdAAMlluaqRKxH3iNw+3K0APS4bn0ihw6l1ab6j1RtnZHjR0o3rm9hbw
         HWem1kUFnFyLSpl2hw/sLxAVY5V4jpm80ODlg2IMYB9GGfgFSeFhFEwL4fvkOh2bvxhk
         Hb7RMNB/TQdg33oMoERb8DsMHLJj8Stn8T1T1rVRdzb5wc6/LY8ZVAMEWOPU4HnzA9DQ
         lYBR2ujTkT0g43N+9IndTo31iPU6EjbO1YVeJinVfpQB4TiY9uLycfPq801JErry2NeL
         RRAQddwoUTLfS+3p+9suEAJvH5H9itPb0c7MCt9tGu6mUBB2sM2y4/ntoU85Kc7uis7g
         0Q8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=wH8hZeiRkUrztlifmNzna+jJCEvv+ZdgOlt75ZtkZl4=;
        b=hphD8Iy1Lz9QOMvpYxNWy7iU1OmMVkBstmG8xdmbW3K6jUvTpHQsCyqFn0PxDlCmgz
         G92nfh51cZlW4XH5L7zLPDmScWH3oiiJIn+hW1BK6HS7cW+tQ7fNXXjHefYikqxiUXy5
         HFienA+w2wm3yDn0my+rlTZKsooPeYeyBUEfikwpzvEEK8Z+m1pZPDeecrvesDhq8x7l
         UaOroGwxSqI2SSfALsUnzA7DJyYRuu03oDdQ81557KFiYsniDIj8ZZtiEjLIc4iV4Ofj
         MEzvSygaD8BTBLke/vziPaaxV3hdV92NaFuRNmDdQ7XolXYptend91n3PWjrNZ0ff8Lf
         jwNw==
X-Gm-Message-State: APjAAAW1+3+rTu6ZIDOwe/bDhut3KQOkcCictCen573iTTD/hZLBRe62
	YnQks+9WSi7gCIKjl4XlydwZqDnE
X-Google-Smtp-Source: APXvYqytHksq2HKn1GdR8s9MKAA/xkQwiYk8GLHh8n2sKVlAk9zCWcT8uf1/Dex4SpC0tUFKTIxqIw==
X-Received: by 2002:a17:902:ac97:: with SMTP id h23mr1128937plr.237.1582676220510;
        Tue, 25 Feb 2020 16:17:00 -0800 (PST)
Received: from desktop.ice.pyrology.org (static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
        by smtp.gmail.com with ESMTPSA id x11sm235177pfn.53.2020.02.25.16.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2020 16:16:59 -0800 (PST)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	cardoe@gentoo.org
Subject: [meta-virtualization][PATCH v3 20/22] xen-image-minimal: add a build dependency on the xen hypervisor
Date: Tue, 25 Feb 2020 16:16:04 -0800
Message-Id: <20200226001606.14750-21-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200226001606.14750-1-christopher.w.clark@gmail.com>
References: <20200226001606.14750-1-christopher.w.clark@gmail.com>

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

