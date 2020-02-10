Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.17603.1581311321620171052
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 09 Feb 2020 21:08:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LNAsTZRp;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: christopher.w.clark@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 78DC0E01711; Sun,  9 Feb 2020 21:08:41 -0800 (PST)
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
	*      [209.85.214.179 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 65E25E016BB
	for <meta-virtualization@yoctoproject.org>; Sun,  9 Feb 2020 21:08:40 -0800 (PST)
Received: by mail-pl1-f179.google.com with SMTP id y8so2314242pll.13
        for <meta-virtualization@yoctoproject.org>; Sun, 09 Feb 2020 21:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=cmigaB1XuzrQ7A1qP1dNgfyjwtYoekN/6uqA0Oncscc=;
        b=LNAsTZRpoaQpqnW8YwTko0+HffpczMOX081anx1TwewQnaxgCvEJ1q2TTSQYU2/LOl
         wyO5xtibCSINof7lKcRh87Fco/ewtYicaYiSNldUHa6az2vFWHCXged3y/qQx0eOmTI6
         s5qEqF3dp/YQlb+87yBhHCvrqwtzEddYxPH/QE2nLUj7U96U1WOVh2UoIINwFFLMsxq0
         7zIzWq+1/iSCSN/6CBdkkewsmeWbsU26MlI2HFxENPVqAlI429/CZrMIf3AmL9lxys68
         ezYC4JL+ojIQXg0KGZJuETAW0bSQLp9VFowU6ZdBjxDP1+tVUaXYgedbjoqn1TF8Tg3d
         cszg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=cmigaB1XuzrQ7A1qP1dNgfyjwtYoekN/6uqA0Oncscc=;
        b=N0Am6ucG2v4qiIOPrE+CokqNbbj2QEEoIOminaj2PtANWFKWAhNJT3sJsT2B0QjPYa
         m42Rj1St4wnfhKp+OKWV5JwGGLgPTGbwu3cEUM8vN/udPHB1ZlUFio2k2+v4cnFtotCX
         pcfvTCAMili6T0paBYw5+cB7WkFXVrDjihV0nhLG4RZIattcv/xAmKp8dRZwIbw2S/bd
         iXS+t6oQ0azyguHaL/oXbciKoMmp1CxoXYOg8nsZAamG685lNjeru2THES1EctO28ilr
         8CG6strg4Am9zUfosLUX+NTZqhcpKdOhdEiXxroGS5lD0nIQZWVb0yOz2c1HO8MfGlyl
         mD0Q==
X-Gm-Message-State: APjAAAVBAGjXiKk1XYPbaOPUXcQlXkgey69OeGAvW+n2x4asmGLvkCpE
	I/nz3rgoFGsDf95wP6wMViI6dVT3
X-Google-Smtp-Source: APXvYqzcBqBX1CbEtTml89RuxITViD8Xrxz8nr22PHPTkjDlxrUNaXo3tEQSpAZ0j1xC4HZcZzVX+g==
X-Received: by 2002:a17:902:8c8b:: with SMTP id t11mr10375274plo.319.1581311319448;
        Sun, 09 Feb 2020 21:08:39 -0800 (PST)
Received: from desktop.ice.pyrology.org (static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
        by smtp.gmail.com with ESMTPSA id 70sm10921120pgd.28.2020.02.09.21.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2020 21:08:38 -0800 (PST)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	Christopher Clark <christopher.w.clark@gmail.com>,
	cardoe@gentoo.org,
	Rich Persaud <persaur@gmail.com>,
	Daniel Smith <dpsmith@apertussolutions.com>,
	Jason Andryuk <jandryuk@gmail.com>,
	Eric Chanudet <eric.chanudet@gmail.com>
Subject: [meta-virtualization][PATCH 15/16] xen, xen-tools: bug fix to post_patch task
Date: Sun,  9 Feb 2020 21:07:53 -0800
Message-Id: <20200210050754.3534-19-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200210050754.3534-1-christopher.w.clark@gmail.com>
References: <20200210050754.3534-1-christopher.w.clark@gmail.com>

From: Christopher Clark <christopher.w.clark@gmail.com>

Apply the patching to the source tree in ${S}, not ${B}.
Fixes an observed build failure.

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
---
 recipes-extended/xen/xen.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index 1029777..e4682e0 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -192,7 +192,7 @@ do_post_patch() {
 
 do_post_patch_append_arm()  {
     # The hypervisor binary must not be built with the hard floating point ABI.
-    echo "CC := \$(filter-out ${TUNE_CCARGS},\$(CC))" >> ${B}/xen/arch/arm/Rules.mk
+    echo "CC := \$(filter-out ${TUNE_CCARGS},\$(CC))" >> ${S}/xen/arch/arm/Rules.mk
 }
 
 addtask post_patch after do_patch before do_configure
-- 
2.17.1

