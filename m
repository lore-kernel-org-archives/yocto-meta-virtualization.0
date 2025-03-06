Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20969C282D1
	for <webhook@archiver.kernel.org>; Thu,  6 Mar 2025 17:42:44 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web10.20320.1741282956459174621
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 06 Mar 2025 09:42:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ftAlJNi6;
 spf=pass (domain: gmail.com, ip: 209.85.222.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7c0848d475cso121240385a.2
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 06 Mar 2025 09:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741282955; x=1741887755; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NpL5xwGCfT2bAQ7LaE9HzRyTsYKZ2bOk+I+1iMxTeQo=;
        b=ftAlJNi6Q0KSi1X8MkqSkpaT+vzkqo+FCtQLecVEnlR76ovgoRszToXXMCf+xUNz5n
         Pzky0JYpzXfU9WbDw7Quf6wI1CyZWOPsRFZHK7T0QOGBe2mb2WnViHnc2B/9JQvcwNDu
         TU6+Iocvm06byynmMa+f4oozUSmf2iMZBN1dvEm6YMixnWxIZ+6KxjGclq4S+j9lCxFG
         KfLTZhdvwOtVZtvB5QDt2tYmq1UtvxScIFm2lYcbg/XLV+OJSlS4J6+50MdnfrHvZ7Hy
         WfCO6zRqvvWiYHPodGcQypvC2ML1UVXKFEvhiABgzqZwRiEvulh//LXWfeK0LQE52KFG
         9y/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741282955; x=1741887755;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NpL5xwGCfT2bAQ7LaE9HzRyTsYKZ2bOk+I+1iMxTeQo=;
        b=i2FvQh5oCA0aVJlp19mE7LQ7qrKL4d0N/RXl7GGTfgmjR/AJxcdXPkJrTZDzP85hhp
         GhPV09MB1YsMuzNkpZQb+WrhUfHgYTt8rgw5GO18/10ahwCw25Nl3xhHKtnXnC9JCmVv
         8lUGlqHyU2jnYzpmT9nQ1G9kheH4K5x+B0IGIRs40O5J7eCwYk/C1V1BBjBprc64qP3+
         qWpg9HHBft+g2yISs6LX1HuaoKDAnhML4McP5H5XI4xktsw0t2R9whsks8Jy6vXROiRJ
         j0N5ZJ20pVr0+s8gQ89Bj35VogqMmBB660I9Mrb1/5IA3y3Z6Lrw4h7SGDI7jA4KcY4N
         3B2g==
X-Gm-Message-State: AOJu0YwX2Qrvi3lQNxuuGMNSWHWw+bIZFoaXLKSmWDmjl6aBYSqGIOr5
	uwJZVvlmC1JLpk2QHnGptvDBiT1gdFP+q0kK4COgEQLeVsAyMyPf
X-Gm-Gg: ASbGnctLtZ70zr7GQ8BMqXxJh8MKroLMp3ELBFKGsrklaU1uPR7uUMl/uwVkbWWwXOS
	j2ZCh9GICATDoIwOrd6ZeiuTRaZfpwFVCX7MmZUpMIO5KIJCbcJxuraOqQX9W4CRB8UTOtT4Qaw
	e9erXfeT7FkaAvB/XEpjYiGK5/8ayr+D0NVF8Kb1DK5Qkc1rfXZlWUpbnNSl+Om+Jk93Gp5rwqe
	ttFzheErsltk9PmNRlwnfJnnI1gdzV/kbLN+u5AkBD9rI3bzMJKLEFNAYfs2XTvu5oA2w8Jtg16
	aYITZQU01NodYY81bq5Pwu/VXMwU3HvfE2YN9JsLnORSj370fRpTrr11q//udimvkK4WKn0Ioq9
	WzY/+/Y35q83I03JyWBL7oKc=
X-Google-Smtp-Source: AGHT+IGNhXJubnzhfUFKgf1oQDbw7kyfj80EpheM1lLZklgb1dQvU1lh3dJzNIE+AjrjqKNNBuVumw==
X-Received: by 2002:a05:620a:1d0d:b0:7c0:c0fc:c5cc with SMTP id af79cd13be357-7c4e611227cmr31185a.27.1741282955302;
        Thu, 06 Mar 2025 09:42:35 -0800 (PST)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c3e550f8easm115148485a.96.2025.03.06.09.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 09:42:34 -0800 (PST)
Date: Thu, 6 Mar 2025 17:42:33 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Qi.Chen@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][scarthgap][PATCH] docker-distribution: fix
 CVE-2025-24976
Message-ID: <Z8neiWDvXHx/rTCB@gmail.com>
References: <20250305064105.3044844-1-Qi.Chen@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305064105.3044844-1-Qi.Chen@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 06 Mar 2025 17:42:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9158

merged.

Bruce

In message: [meta-virtualization][scarthgap][PATCH] docker-distribution: fix CVE-2025-24976
on 04/03/2025 Chen Qi via lists.yoctoproject.org wrote:

> From: Chen Qi <Qi.Chen@windriver.com>
> 
> Backport patch to fix CVE-2025-24976.
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  .../docker-distribution_git.bb                |  1 +
>  ...ix-registry-token-authentication-bug.patch | 49 +++++++++++++++++++
>  2 files changed, 50 insertions(+)
>  create mode 100644 recipes-containers/docker-distribution/files/0001-Fix-registry-token-authentication-bug.patch
> 
> diff --git a/recipes-containers/docker-distribution/docker-distribution_git.bb b/recipes-containers/docker-distribution/docker-distribution_git.bb
> index 9b918b62..e85085e5 100644
> --- a/recipes-containers/docker-distribution/docker-distribution_git.bb
> +++ b/recipes-containers/docker-distribution/docker-distribution_git.bb
> @@ -8,6 +8,7 @@ SRC_URI = "git://github.com/docker/distribution.git;branch=release/2.8;name=dist
>             file://docker-registry.service \
>             file://0001-build-use-to-use-cross-go-compiler.patch \
>             file://0001-panicwrap-Use-dup3-on-riscv64-linux.patch \
> +           file://0001-Fix-registry-token-authentication-bug.patch \
>            "
>  
>  PACKAGES =+ "docker-registry"
> diff --git a/recipes-containers/docker-distribution/files/0001-Fix-registry-token-authentication-bug.patch b/recipes-containers/docker-distribution/files/0001-Fix-registry-token-authentication-bug.patch
> new file mode 100644
> index 00000000..8d3e98f9
> --- /dev/null
> +++ b/recipes-containers/docker-distribution/files/0001-Fix-registry-token-authentication-bug.patch
> @@ -0,0 +1,49 @@
> +From ff9eed251cfd7dd279ea231a289cc784fd7f829f Mon Sep 17 00:00:00 2001
> +From: Milos Gajdos <milosthegajdos@gmail.com>
> +Date: Sat, 1 Feb 2025 15:30:18 -0800
> +Subject: [PATCH] Fix registry token authentication bug
> +
> +When a JWT contains a JWK header without a certificate chain,
> +the original code only checked if the KeyID (kid) matches one of the trusted keys,
> +but doesn't verify that the actual key material matches.
> +
> +As a result, if an attacker guesses the kid, they can inject an
> +untrusted key which would then be used to grant access to protected
> +data.
> +
> +This fixes the issue such as only the trusted key is verified.
> +
> +Signed-off-by: Milos Gajdos <milosthegajdos@gmail.com>
> +
> +CVE: CVE-2025-24976
> +
> +Upstream-Status: Backport [https://github.com/distribution/distribution/commit/f4a500caf68169dccb0b54cb90523e68ee1ac2be]
> +
> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> +---
> + registry/auth/token/token.go | 5 +++--
> + 1 file changed, 3 insertions(+), 2 deletions(-)
> +
> +diff --git a/registry/auth/token/token.go b/registry/auth/token/token.go
> +index f803415f..fbcf5bfa 100644
> +--- a/registry/auth/token/token.go
> ++++ b/registry/auth/token/token.go
> +@@ -290,12 +290,13 @@ func parseAndVerifyRawJWK(rawJWK *json.RawMessage, verifyOpts VerifyOptions) (pu
> + 	x5cVal, ok := pubKey.GetExtendedField("x5c").([]interface{})
> + 	if !ok {
> + 		// The JWK should be one of the trusted root keys.
> +-		if _, trusted := verifyOpts.TrustedKeys[pubKey.KeyID()]; !trusted {
> ++		trustedKey, trusted := verifyOpts.TrustedKeys[pubKey.KeyID()]
> ++		if !trusted {
> + 			return nil, errors.New("untrusted JWK with no certificate chain")
> + 		}
> + 
> + 		// The JWK is one of the trusted keys.
> +-		return
> ++		return trustedKey, nil
> + 	}
> + 
> + 	// Ensure each item in the chain is of the correct type.
> +-- 
> +2.25.1
> +
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9153): https://lists.yoctoproject.org/g/meta-virtualization/message/9153
> Mute This Topic: https://lists.yoctoproject.org/mt/111524442/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


