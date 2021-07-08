Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web12.7881.1625718793404231839
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 07 Jul 2021 21:33:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kyrwpYTA;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id x6so2220553qvx.4
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 07 Jul 2021 21:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2Mzj+gjnMP4Y4GjJHFROv/CnV8L1pV8n0hYpCjhk+HU=;
        b=kyrwpYTAm0iAGt0e6FfFuzc+lSOy46mdj2fhTyCXN+RbUw1F1E6a3EkF3dMRUSoOCW
         0cunO0jhu8dosPA+wXgOWz/6/9PJvD1HnaF7j/ydAfxCwjX2ZWR+6a2Mrdg9qCyHXtAN
         KPwj1DpP1iwMaZPt9lzNV0ucoYHVzuJt8rnn6VsyiSDTaSj41/NcrpvivH46E/WL6GDA
         8h9Vc87eb7Ciesf5tcn10A2S57n0MF54NQwuMGMBUoz5N2gaOTqSIyrvCcLs7KzzHtM1
         Ua+JK5qx48jkRDqecIt4qUN/pIOulau36d+KKa5Arz/qGCro2yD9kEBbbIjTlxQPUo7G
         6Rxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2Mzj+gjnMP4Y4GjJHFROv/CnV8L1pV8n0hYpCjhk+HU=;
        b=rst/dEaclBxYmfPv5R1mv1asYpmCr3vpxgvVxXRffIYAM1sQ2jLv62GpIwYpKyhX1k
         +/tbFtYVTmWCbeYDvL1V0q/baDQDO4kQfFCSb5XaDC/YQVQQIEHO6b7b5a6ULOE4VRWu
         uvBWW1cKZOas7B8lTD0k3U6DVrJHRoGEGv/bEeibjJ/rzIdJRsvsujtoP0NuBFaR4duT
         UbWY0HpZQSFIK2pLRzColMW4MbINqoHiHHzjluvxoRXpLIvPCXnUFiZ6IGLHpVX166SU
         dmqSs74S/ffbDyc5k03rowfkFlRbq64fYte/BTxZvigSjv5dA0slW4x3O9a52UIQVUV1
         AP7Q==
X-Gm-Message-State: AOAM533lhZnJBkhBSp1l1Zs5elRsjhUVQ7L3uOyIsTt2ehknNBh1uu6q
	LwjMKKGMLDRb6O3Ya+A/bg6/Y/jkPnsNPMF7
X-Google-Smtp-Source: ABdhPJzL2rtJPtVnQZSqPSG+T/Zo1m7vnHN6L/rYZ+5esBiTo9y+X8UA/cXJCIui5bGfcd/f/JaEwA==
X-Received: by 2002:a05:6214:170f:: with SMTP id db15mr27694146qvb.48.1625718792311;
        Wed, 07 Jul 2021 21:33:12 -0700 (PDT)
Return-Path: <christopher.w.clark@gmail.com>
Received: from walnut.ice.pyrology.org (mobile-166-177-250-205.mycingular.net. [166.177.250.205])
        by smtp.gmail.com with ESMTPSA id p9sm517908qtw.88.2021.07.07.21.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jul 2021 21:33:11 -0700 (PDT)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	cardoe@gentoo.org,
	diego.sueiro@arm.com,
	Bertrand.Marquis@arm.com,
	andrew.cooper3@citrix.com,
	dpsmith@apertussolutions.com,
	persaur@gmail.com
Subject: [meta-virtualization][PATCH v2 3/4] xtf: fix build with gcc11 SRCREV and specifying linker
Date: Wed,  7 Jul 2021 21:32:45 -0700
Message-Id: <20210708043246.126719-4-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210708043246.126719-1-christopher.w.clark@gmail.com>
References: <20210708043246.126719-1-christopher.w.clark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Newer XTF revision works around GCC 11.1 issue 99578 and
supplying the correct linker to use fixes the build.

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 recipes-extended/xen/xtf_git.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/recipes-extended/xen/xtf_git.bb b/recipes-extended/xen/xtf_git.bb
index 3580324..bf7470e 100644
--- a/recipes-extended/xen/xtf_git.bb
+++ b/recipes-extended/xen/xtf_git.bb
@@ -6,7 +6,7 @@ LICENSE = "BSD-2-Clause"
 # https://static.sched.com/hosted_files/xendeveloperanddesignsummit2017/79/xtf.pdf
 
 SRC_URI = "git://xenbits.xen.org/xtf"
-SRCREV = "b0bc49846c154b79243f39d461a4515804bcaf53"
+SRCREV = "3e800027016ea4eb19887bf626b46f45fc43fa5d"
 
 COMPATIBLE_HOST = '(x86_64.*).*-linux'
 
@@ -32,6 +32,7 @@ RDEPENDS_${PN} = " \
 do_compile() {
     oe_runmake CC="${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS}" \
                CPP="${CPP}" \
+               LD="${LD}" \
                OBJCOPY="${OBJCOPY}" \
                PYTHON="${PYTHON}"
     # switch the shebang to python3
-- 
2.25.1

