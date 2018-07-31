Return-Path: <christopher.w.clark@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3A518E00CE7; Tue, 31 Jul 2018 12:36:40 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (christopher.w.clark[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.215.195 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DD5CDE00D16
	for <meta-virtualization@yoctoproject.org>;
	Tue, 31 Jul 2018 12:36:14 -0700 (PDT)
Received: by mail-pg1-f195.google.com with SMTP id d17-v6so5138996pgv.10
	for <meta-virtualization@yoctoproject.org>;
	Tue, 31 Jul 2018 12:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=xcFw3HWJ4f6eZkwefJyi44ynM5TJPtPqtLAVMTIn5+U=;
	b=BNZLxm+XbJfR6kfdTp5+BVswdSUAK7pF9S/xYldYaygEStJymP1fn/F69sZbDbI7qI
	2zpT5oVLiUUWxpSQhb47Z7Iwrhr9d4V5hN+wE2cW71cU9HO9Z4vhp2KNrM1mP2KZVPHP
	OLNmY93ZoICUjUdPNus4O5kdvsU22kR7weMwKOA2pmNhxXX5RfOjcHh53Knc5gb7YB5I
	FsXLfhPz3EWPgrzLaeIA0Gp6zqGXHk+krpIv4OoMQvkvKQcvcGwyI+aOInFP1VV8gbz9
	HgCfU7tNwIWn/rJJbQTdLGvSaBKwd+/1Z95EQDw0JVqasRiipPgyYboCiBKeuwDJ7K/y
	I1qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=xcFw3HWJ4f6eZkwefJyi44ynM5TJPtPqtLAVMTIn5+U=;
	b=O/5EFyCtplMfDnzUksjQnexLlFTavk8vKVToN49WgNLLJGXhYWmCFtsIzdZfB+XxpI
	Xj+pO9flzLwhEplZ+8On537ybwtWgUoIkRP9+p1bhxsPaKOVGAv5gVkxe77ZrqGMBK6u
	WOcnTDwUtIQHoq4lVxHMDUwIjQNfFbvHTsVc/YWAsjrgsFGQIvJz4SxjFyon7JN2idWe
	9W/crngB+dJm9wSYWg1c/6CWCWU0wcAbqQowT0DQNLVX8EIeDRM7Efxacb2Xx38230dL
	uGJTe/3r7+On+UlvlCx/02p78sJIT+wyiEmQNY/giCVFh7fXsvnfyD4J0Rj51Nlw6vxL
	QDXA==
X-Gm-Message-State: AOUpUlEhoeGgMhjAkpHbaxeZGBUPEV/SeqxAmabKVGt1fFWMFHrJqqLR
	OGcd4UQshDKLejcStJRKmESwXBqG
X-Google-Smtp-Source: AAOMgpfHRJE0PQoDrOUpc5ZTr//xpMIf0tYs8DKIcerMbJ/ljnkjwHUtEpzHAzwarKXs9BMmoyISXA==
X-Received: by 2002:a62:2304:: with SMTP id
	j4-v6mr23391719pfj.98.1533065773688; 
	Tue, 31 Jul 2018 12:36:13 -0700 (PDT)
Received: from WorkStation-T3500.ice.pyrology.org
	(static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
	by smtp.gmail.com with ESMTPSA id
	64-v6sm24758626pfi.89.2018.07.31.12.36.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 31 Jul 2018 12:36:12 -0700 (PDT)
From: christopher.w.clark@gmail.com
To: meta-virtualization@yoctoproject.org
Date: Tue, 31 Jul 2018 12:35:46 -0700
Message-Id: <1533065750-25786-6-git-send-email-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1533065750-25786-1-git-send-email-christopher.w.clark@gmail.com>
References: <1533065750-25786-1-git-send-email-christopher.w.clark@gmail.com>
Cc: cardoe@gentoo.org
Subject: [PATCH v2 5/9] xen-vtpm : fix patch fuzz, whitespace-only change
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
X-List-Received-Date: Tue, 31 Jul 2018 19:36:40 -0000

From: Christopher Clark <christopher.w.clark@gmail.com>

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
---
 recipes-extended/xen/files/vtpm-deepquote-anyloc.patch | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-extended/xen/files/vtpm-deepquote-anyloc.patch b/recipes-extended/xen/files/vtpm-deepquote-anyloc.patch
index 7b37d51..b1cbf66 100644
--- a/recipes-extended/xen/files/vtpm-deepquote-anyloc.patch
+++ b/recipes-extended/xen/files/vtpm-deepquote-anyloc.patch
@@ -101,16 +101,16 @@ index c0d62e7..6586c22 100644
 -                         UINT32 *sigSize, BYTE **sig)
 +                         UINT32 extraInfoFlags, UINT32 *quote_blob_size, BYTE **quote_blob)
  {
-   TPM_RESULT res;
-   TPM_DIGEST hres;
+ 	TPM_RESULT res;
+ 	TPM_DIGEST hres;
 @@ -253,7 +254,7 @@ TPM_RESULT TPM_DeepQuote(TPM_NONCE *externalData, TPM_PCR_SELECTION *myPCR,
  
-   tpm_free(buf);
+ 	tpm_free(buf);
  
 -	res = VTPM_GetParentQuote(&hres, ptPCR, sigSize, sig);
 +  res = VTPM_GetParentQuote((TPM_NONCE*)&hres, ptPCR, extraInfoFlags, quote_blob_size, quote_blob);
  
-   return res;
+ 	return res;
  }
 diff --git a/tpm/tpm_marshalling.h b/tpm/tpm_marshalling.h
 index d510ebe..2e0c008 100644
-- 
2.7.4


