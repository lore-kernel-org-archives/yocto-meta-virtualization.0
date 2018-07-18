Return-Path: <christopher.w.clark@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B7CB7E015FE; Wed, 18 Jul 2018 15:04:06 -0700 (PDT)
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
	*      [209.85.215.193 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 50388E00AC5
	for <meta-virtualization@yoctoproject.org>;
	Wed, 18 Jul 2018 15:04:06 -0700 (PDT)
Received: by mail-pg1-f193.google.com with SMTP id z8-v6so2599605pgu.8
	for <meta-virtualization@yoctoproject.org>;
	Wed, 18 Jul 2018 15:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=p7904Zh85hOUIx+jIfMT0OjKAUntejd8FWfWjnrLJdk=;
	b=fltkfIyuO3TP8H7k3LX9Ps5GJfsdR61yjB2EFxSFSe6Lt6hpNzTBG4yVmkdLHOpuBZ
	QuhPF9L1WJPFBYH0bDdn/CJzfzrfEUt35xMrJDtOksy9dXYnimrHvBVKsgoPH8IKfous
	ZOeuEbf7BBVn/Od7XAf+hJaxyXazJEE29FH9DwWcz/V16+h6maV12biP2V4idOtLgvhL
	WSe2LEm0pHm0w6CxNf6+M4rUs+LwyWQe/hqa0BKyBGKZjNtCkcROHirbVih0P9Q45pMN
	6ayynIoW8kvKB8itDwb0XwCnMVhJAcNPXuXvSL1imk4uWO3rf5CnD5uAFX6UkfyHIHPH
	vcPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=p7904Zh85hOUIx+jIfMT0OjKAUntejd8FWfWjnrLJdk=;
	b=kT1zuMgtQdcTP3yH9Ta70EWgV3Tw+z/nO9e/wWyy7kfJvlWzFmbdXoNT62+nuSGifJ
	2472EFz1C/kk27z48C7vqIw8LIW280AlI4ZM65raOrEr9Oj87Syfdoul7khcFzLF0Rzg
	fHUt0WS5a386mYyEqyyNxcb4cssPGZj9iiTKVY6++YnCwizwCCAo6MT0ZcyOPW8DLAvk
	Gunm3sYTl+bQnv5Ifn4PAktNkx43X6WgfquNYSSoRmW9S7ZnmEEi45WE6FoodtcBHPru
	LWz2pSff/YCO3vgwfwS3Bg6T7BnFZ0kKaBDtKgwWr5JB+uXtDQFgNZ+nE7+dPSOuU823
	FLLQ==
X-Gm-Message-State: AOUpUlHCco2h34+Q+vCDEddb2snP2ZfJuYFJ5TJOZJQ6PEwl6WEYuTK5
	QmY5ejQbZmXfbBcCJIs2UtAEpxkL
X-Google-Smtp-Source: AAOMgpd4owD6qzmxxESYN/HVzl19WZkvZtJv9hpP4bQJVYVvY037GKEti+sDjq4XoEeWbuIxxc9zGA==
X-Received: by 2002:a65:608b:: with SMTP id
	t11-v6mr7394190pgu.259.1531951445307; 
	Wed, 18 Jul 2018 15:04:05 -0700 (PDT)
Received: from WorkStation-T3500.ice.pyrology.org
	(static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
	by smtp.gmail.com with ESMTPSA id
	h7-v6sm19341965pfd.155.2018.07.18.15.04.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 18 Jul 2018 15:04:04 -0700 (PDT)
From: christopher.w.clark@gmail.com
To: meta-virtualization@yoctoproject.org
Date: Wed, 18 Jul 2018 15:03:46 -0700
Message-Id: <1531951428-28983-6-git-send-email-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1531951428-28983-1-git-send-email-christopher.w.clark@gmail.com>
References: <1531951428-28983-1-git-send-email-christopher.w.clark@gmail.com>
Cc: cardoe@gentoo.org
Subject: [PATCH 5/7] xen-vtpm : fix patch fuzz, whitespace-only change
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
X-List-Received-Date: Wed, 18 Jul 2018 22:04:06 -0000

From: Christopher Clark <christopher.w.clark@gmail.com>


Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
---
Please use my gmail address for any correspondence to me.

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


