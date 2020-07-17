Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.2353.1595019857536545871
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 17 Jul 2020 14:04:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JiIOJYyf;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: christopher.w.clark@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 60D9BE01EAC; Fri, 17 Jul 2020 14:04:17 -0700 (PDT)
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
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.222.193 listed in list.dnswl.org]
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F4139E01EA8
	for <meta-virtualization@yoctoproject.org>; Fri, 17 Jul 2020 14:04:16 -0700 (PDT)
Received: by mail-qk1-f193.google.com with SMTP id l23so2218276qkk.0
        for <meta-virtualization@yoctoproject.org>; Fri, 17 Jul 2020 14:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=92scOgH64ypakw2aiugtotv3mDdsHJuPpCjFGxlGwNE=;
        b=JiIOJYyfc9tQ3FpmZRLqsJoexiAzseOVDrGRlyY3TOZ7+8bXJyZO7m4gxSWjwpPCMD
         RRfkcG/jiYrhtb+y/vmniAMoaRQ9KoRBEzT43IF2vpIAWCIytMlbt3wTbjsrXp+FUHgR
         qEXwGfKfdGQ/rgEy5moK7z/hR6CFgIMf1UvnMNyZssqiojYOnZM3tvpLlE8ubM9/t9SF
         L6bc9OPbJ5DHFQPtKgfdC37E0lBzNaimlt2+gevnbDoyNftMTZhoJeGpYHdqGZ3ccQjr
         NeV+AVhHFA6VOlxOzjOI9frFHSRNVQOg0DBr9SLdloDeN++0mChr4E978bY/44oHhK/b
         nDJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=92scOgH64ypakw2aiugtotv3mDdsHJuPpCjFGxlGwNE=;
        b=Y71sPB/MG9k8zvajkNbhA4kwIchwFiRFC0uenTlhZ/r/5GmYT7UU46TargbC7T5fgW
         oIGDa6hpxuhgg8C360nnH4xKDgB67hP22FaMEuNQJq1s2uJEMMgif1VBvzzSUOPRIo9d
         OsTleHQZgAWuxqed9+XvwoNdN2FHjCyEtWcjnPmH/nqcWb0ZJ2roSAazoJQXMq84vAmh
         xo6Oy6IzxU+4Z6Y0N8fStR/iy/hwrCmT1dK/2bQR6IJGqJYPR5lhInTb8SrgmK8SJuwk
         3K/8ozUD9bVfEDSy1BRzYkAx3YVFrUpjXUAeFsXXcLmLYSIs3zcd90t/ym5N7lNbybRt
         We1Q==
X-Gm-Message-State: AOAM531BCQeID9MviPmtsb9r+e5sM5j/jiqY9uMuavmGvHavgQ/i0oCs
	xvKxe3x1vwBhobpU52G9aHiYhhczZjs=
X-Google-Smtp-Source: ABdhPJxSRKZkm5YtqLqL0iz/JgISH+97ktK+loS98+IYdUl5wdbo4vwbgZ2GEU9Oil1bcPZLb41pag==
X-Received: by 2002:a05:620a:137a:: with SMTP id d26mr10861021qkl.259.1595019856102;
        Fri, 17 Jul 2020 14:04:16 -0700 (PDT)
Received: from localhost.localdomain (mobile-166-137-177-108.mycingular.net. [166.137.177.108])
        by smtp.gmail.com with ESMTPSA id y45sm12819387qtk.19.2020.07.17.14.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2020 14:04:15 -0700 (PDT)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@yoctoproject.org
Cc: cardoe@gentoo.org,
	Christopher Clark <christopher.w.clark@gmail.com>,
	bruce.ashfield@gmail.com
Subject: [meta-virtualization][PATCH 3/4] xen: drop vars that duplicate hvc console from the r-pi4 config
Date: Fri, 17 Jul 2020 14:03:48 -0700
Message-Id: <20200717210349.16459-3-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200717210349.16459-1-christopher.w.clark@gmail.com>
References: <20200717210349.16459-1-christopher.w.clark@gmail.com>

From: Christopher Clark <christopher.w.clark@gmail.com>

These settings are not needed here. Serial configuration is done
in the bsp layer. Tested and working on the Raspberry Pi 4.

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
---
 conf/distro/include/meta-virt-xen.inc | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/conf/distro/include/meta-virt-xen.inc b/conf/distro/include/meta-virt-xen.inc
index 2c8ef0b..b61f612 100644
--- a/conf/distro/include/meta-virt-xen.inc
+++ b/conf/distro/include/meta-virt-xen.inc
@@ -6,9 +6,6 @@ PACKAGECONFIG_append_pn-qemu_arm = " fdt"
 PACKAGECONFIG_append_pn-qemu_aarch64 = " fdt"
 
 # Raspberry Pi settings
-#  - Xen guest console
-KERNEL_CONSOLE = "hvc0"
-SERIAL_CONSOLES = "115200;hvc0"
 #  - Xen uses u-boot for configuration and uses the uart
 RPI_USE_U_BOOT = "1"
 ENABLE_UART = "1"
-- 
2.17.1

