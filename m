Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.186.1582676223199289041
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 25 Feb 2020 16:17:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=csHKPgvL;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: christopher.w.clark@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 14C00E016E9; Tue, 25 Feb 2020 16:17:03 -0800 (PST)
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
	*      [209.85.216.65 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B22CFE016B5
	for <meta-virtualization@yoctoproject.org>; Tue, 25 Feb 2020 16:17:02 -0800 (PST)
Received: by mail-pj1-f65.google.com with SMTP id q39so482774pjc.0
        for <meta-virtualization@yoctoproject.org>; Tue, 25 Feb 2020 16:17:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=VxHUmxvuaQLqtuYQyZjXKu3Mvx+UeLWan2zlywtsZ/g=;
        b=csHKPgvLC8HX1OawbZUqdW6Eank79UICtjn06FWrgpjy0Bh8i1d4cldUbI6/BGSYz9
         FYdyQ5XAxm6UaZk1Zd2OplbeT5NkLFyybQZNZuFLzPULAs1Rw+rQZrgo+TLX5jl7OVt3
         uL3+3/8yQi3jisBxYW6p9lz2sgq9UwcURhujQlzETiIyF65HMmJfvcqvHST1xuns4Vz1
         fbWira1tbT+L4yJXRNoPNJM56nb9uqcN/Sb+vW53ZT/voXbSi2W41eq8q0Pgu9RMGyf4
         Z57T69pldxRjIFuiFIMJ6h1Bj+mMjbDFLUZqGTlCIJGVPs4Jb7UUuMT4V0H1AzOmvERY
         mqCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=VxHUmxvuaQLqtuYQyZjXKu3Mvx+UeLWan2zlywtsZ/g=;
        b=NzNhuKUV0mjahb1ZDvlGJ6FzFcIxHAD4WF3QBFLDXDyQYfZ0hvW4mpVBFb+qrpRFPI
         EynuZiN4uTPjgcRiYZ1uYfnbBIn2geR7jR5RCGk+1bcyEG1KMiCg1jtTP5XbCSsHoPHk
         8CWUmK8c6l1eH6C5H2w1N7txD+1XUnYwdg3qgwhWudC4mtNl0bRaWD7K/q5NTf6Nzt6j
         q5A1YutUvxdviK9AiKbtk8Cv38n3bJoNiGGOOcg4vgZ74DbXoU5bQHUcD6HDqAg/JONA
         s7EsN6ZAwaR5iAepoZ+MIiDTgpzSUV4csLvX1Uz2SXig1tW8kykOhuf2/aIK4tInL/zs
         418g==
X-Gm-Message-State: APjAAAVGtngKiKt1KwlIO7Rkss/aJUP8uJ6oH0bN/3GpePl0TB7ZuVKE
	yW/k3r+Y6Hq192ihaa625vBfbHRU
X-Google-Smtp-Source: APXvYqxvx05TYJJXjwmPgCGRfxPOYqwtSAt2Ce0VkvU5zu9yi60adchUYruVdElWssJPTMPxCPmB6Q==
X-Received: by 2002:a17:902:9f83:: with SMTP id g3mr1127604plq.101.1582676221700;
        Tue, 25 Feb 2020 16:17:01 -0800 (PST)
Received: from desktop.ice.pyrology.org (static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
        by smtp.gmail.com with ESMTPSA id x11sm235177pfn.53.2020.02.25.16.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2020 16:17:00 -0800 (PST)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	cardoe@gentoo.org
Subject: [meta-virtualization][PATCH v3 21/22] xen: add menuconfig instructions to the README
Date: Tue, 25 Feb 2020 16:16:05 -0800
Message-Id: <20200226001606.14750-22-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200226001606.14750-1-christopher.w.clark@gmail.com>
References: <20200226001606.14750-1-christopher.w.clark@gmail.com>

From: Christopher Clark <christopher.w.clark@gmail.com>

    bitbake xen -c menuconfig

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
---
 recipes-extended/xen/README | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/recipes-extended/xen/README b/recipes-extended/xen/README
index 5592b48..34e7977 100644
--- a/recipes-extended/xen/README
+++ b/recipes-extended/xen/README
@@ -16,6 +16,15 @@ copy it to your Yocto layer as 'defconfig' inside of
 'recipes-extended/xen/files/' and then create a bbappend adding
 'file://defconfig' to your SRC_URI.
 
+To generate your own .config file for Xen, you can use the interactive
+menuconfig via bitbake:
+
+    bitbake xen -c menuconfig
+
+Select the config settings that you want and Save the file. If you save it to
+the default ".config" file when prompted by menuconfig, you can find it in the
+'xen' subdirectory of the build tree.
+
 security patches
 ----------------
 
-- 
2.17.1

