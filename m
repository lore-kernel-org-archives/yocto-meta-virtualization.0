Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web09.17557.1581311317051225832
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 09 Feb 2020 21:08:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DxYpmggI;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: christopher.w.clark@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E5143E01711; Sun,  9 Feb 2020 21:08:36 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: 
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.214.171 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      (christopher.w.clark[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 80F10E016B9
	for <meta-virtualization@yoctoproject.org>; Sun,  9 Feb 2020 21:08:36 -0800 (PST)
Received: by mail-pl1-f171.google.com with SMTP id j7so2344298plt.1
        for <meta-virtualization@yoctoproject.org>; Sun, 09 Feb 2020 21:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=RsbdwC2MGQeZ/dNzgNW6HiDTMFgUcJqGT7wY7CYO/a4=;
        b=DxYpmggIWKriVmuWhLygXR4Z5BeHSWKGdPvbAM52P97e0Vlh4fbRxLDMlvXOeBzle+
         oFmzkNZaz9zC59JuxzArm6QooXPTqNBMq4L9h5E68u1Sn4eMjHCJHTnvXsMaOsjhuke+
         2c3ErGz4HkhKpPBRUzzXmRxJbsSGJ+CZhCJd9g0Br5b4KAKY+3C/AcUmSqRSMSvUlVL/
         NPImOA43S9AMidwAEJpJq+RwWWOkq7PpgZs6RFtALXu/x9f07E+DQattJFL+Kauxlgp5
         SBmBVTNvwNyxdUA2fsHZWMLgkqytRsZGlz8ClbDQoO+6YDBemIsld2Qnjtj7zlXDKatg
         f+PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=RsbdwC2MGQeZ/dNzgNW6HiDTMFgUcJqGT7wY7CYO/a4=;
        b=CMSuzziB3RboOfPFVm2uwUsAUm9yIqTmjTpCHyvJ3CsN0hiJP+EzsXjm9yKV/WvdH8
         Uxe/u+9arqLelz8XBnSAdXJi4vl4AfbsEpQ3P4RJ95ret2liLpyVGnVa9M5jy7HvaIXE
         CfqSr7+JFYdLFepn46RUlWb1PxDbCOY+XwoPzcmH9Qektj7otVoiHcl7MtnQYYB6N3nj
         veExBf6a+bFLX7hZigWOeuGE90t9eb9T4dMYyUiDRCsW93VDbwiNXVunaFAeSmAe/RH5
         GmWAEyOagXz2Ukn2GHE6c4XMbbu1H8x067pDEkhTx60u6XyH6PX3W/uzCGPnCfnGjdNA
         WYhQ==
X-Gm-Message-State: APjAAAWMD4gTYMdhCGu8ugGu7cJoL7CKICSVjxtiVcczXKo4LCFsQ98r
	jLVF1alxLkSeA1q2fbVf/AyZu83r
X-Google-Smtp-Source: APXvYqy3ah8KH2dgpOX1NeZT3jeluDwvslX0vTSM5Jxhm95/C+sP+3TyRNJz9ffGbiubAn1fnh/cfA==
X-Received: by 2002:a17:902:8b89:: with SMTP id ay9mr10932133plb.309.1581311315827;
        Sun, 09 Feb 2020 21:08:35 -0800 (PST)
Received: from desktop.ice.pyrology.org (static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
        by smtp.gmail.com with ESMTPSA id 70sm10921120pgd.28.2020.02.09.21.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2020 21:08:33 -0800 (PST)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	Christopher Clark <christopher.w.clark@gmail.com>,
	cardoe@gentoo.org,
	Rich Persaud <persaur@gmail.com>,
	Daniel Smith <dpsmith@apertussolutions.com>,
	Jason Andryuk <jandryuk@gmail.com>,
	Eric Chanudet <eric.chanudet@gmail.com>
Subject: [meta-virtualization][PATCH 13/16] xen, xen-tools: separate COMPATIBLE_HOST for hypervisor and tools
Date: Sun,  9 Feb 2020 21:07:51 -0800
Message-Id: <20200210050754.3534-17-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200210050754.3534-1-christopher.w.clark@gmail.com>
References: <20200210050754.3534-1-christopher.w.clark@gmail.com>

From: Christopher Clark <christopher.w.clark@gmail.com>

The tools have broader platform compatibility than the hypervisor.

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
---
 recipes-extended/xen/xen-hypervisor.inc | 3 +++
 recipes-extended/xen/xen-tools.inc      | 2 ++
 recipes-extended/xen/xen.inc            | 2 --
 3 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/recipes-extended/xen/xen-hypervisor.inc b/recipes-extended/xen/xen-hypervisor.inc
index 79fafd2..41de9b6 100644
--- a/recipes-extended/xen/xen-hypervisor.inc
+++ b/recipes-extended/xen/xen-hypervisor.inc
@@ -6,6 +6,9 @@ DESCRIPTION = "The Xen hypervisor"
 # this allows for varying the target architecture or toolchain used
 # to build the different components. eg. 32-bit tools and a 64-bit hypervisor.
 
+# The Xen hypervisor has a narrower compatible platform range than the Xen tools
+COMPATIBLE_HOST = '(x86_64.*).*-linux|aarch64.*-linux|arm-.*-linux-gnueabi'
+
 inherit deploy python3native
 
 PACKAGES = " \
diff --git a/recipes-extended/xen/xen-tools.inc b/recipes-extended/xen/xen-tools.inc
index a6f1209..00843ca 100644
--- a/recipes-extended/xen/xen-tools.inc
+++ b/recipes-extended/xen/xen-tools.inc
@@ -1,6 +1,8 @@
 SUMMARY = "Xen hypervisor tools"
 DESCRIPTION = "Tools and utility software for the Xen hypervisor"
 
+COMPATIBLE_HOST = 'i686-oe-linux|(x86_64.*).*-linux|aarch64.*-linux|arm-.*-linux-gnueabi'
+
 inherit setuptools3 update-rc.d systemd deploy
 require xen-blktap.inc
 
diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index 562726c..47e3520 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -4,8 +4,6 @@ SECTION = "console/tools"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
 
-COMPATIBLE_HOST = '(x86_64.*).*-linux|aarch64.*-linux|arm-.*-linux-gnueabi'
-
 inherit autotools-brokensep
 
 require xen-arch.inc
-- 
2.17.1

