Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E962C282D1
	for <webhook@archiver.kernel.org>; Thu,  6 Mar 2025 17:42:34 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web10.20315.1741282945773060913
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 06 Mar 2025 09:42:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OhK2vC9o;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6df83fd01cbso4500306d6.2
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 06 Mar 2025 09:42:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741282945; x=1741887745; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zBvg5S+8k3s49KPnCcgW/CUhPM61GUY39jK9rtrx5ic=;
        b=OhK2vC9oE43mYS4SmNJZK45HSVSxLmVE4v68hB28d4jNFgEHrkI7hri9EXLfLn5reC
         9naJDJsv0vWTGg0jGF7BMFfwsA5jvr7KgAYWCBS/pfY5l22FAYTTR40BZqu1BKPa36eS
         asBbkB9dWyKH6hBc3Gm/vDh7XZ9FCatrbnnEXCyST+juMQ9wc4EriA/dD4S24YprjVAc
         Ba8QpU7o7wqtc7VkA/06W4Kr1TlPq+ggdnHKFnpXmQCgb/HiemLiPVc0XldNjU40HG8y
         Mc78jodspU3Xws+93TxrvW+tfU4P/ASTtK8hgxigZlj4PbKhStbaoQq4YtO4OCyYZzmH
         3ZuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741282945; x=1741887745;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zBvg5S+8k3s49KPnCcgW/CUhPM61GUY39jK9rtrx5ic=;
        b=C6lBCY0WFkMnY7kqGWQcSyi8msxcCeRCdRHLoDzxRWTqn7vgw1GieScYKQ1xkIwiAL
         EIcp0n7M5ChSEqN7dXEFlFnK5bHw3q0lJ0BuwzP7tHsp1I2I2wCB4P9btzM3+iGyljcW
         stBefvPv6lCangF10Y0ZaHCu21OF2Bq6fvJVE1i8fDF2fkw2EbqUUQCfWtiFsQIKRmk9
         rGeKBDrdy1SqXgDD+sNwK8WmfYH9+jjMsECYD6PO9IDzqMshKYQpKMX2bneaxPh8+6pu
         E+61BxXbEXedw6gTjE0ewqxwQSae6EeK8q8y6PJ+hn2VVaqfSJLdwOboNZ27dvKNYpoe
         5CGg==
X-Gm-Message-State: AOJu0YyjhmbRqVK8mXIR86/U/ECGEcBdK+AAsSzXjZBIdoMK9NeUNcPv
	h5Nqc29M6McHJxvyDJOQRH7TSZ2L0bkiAv2GROSwHL0Iasvgehc9OZBPj7oniqQ=
X-Gm-Gg: ASbGnctpFsc2WQCHXwy8L0F1/Wc4PCJkzTgv+sMZssEeAq1dO8JOSsJvMAn935x76D+
	k5t7PYalfNIsuUExz/+PmP1giUnUnxvCAvQuhrEWMbf7HDsqXo9rcwICCiXcyY1lJoDh1dxsUox
	DlBbXqMvoPzF8Vf/2eTY9YcQ2MVvGN55NB2ReWscpGe0gGL9XYNMCUxB/MDZC+95OrnrpRHaK9M
	HtiTYL+gS5VqL2dD+cvTTLoZwuDbjBhZkisjAPQK3Op50oB+9OfkNCVI6r/NND3CZU4vQJbpr7E
	Di3PWhhfa+tWzyQZTifL/lrbxVg8SaSGzKnagNCzzuQ63XwFtbASMpi3r6TZXNAp7t7y3+itrUL
	2yVsFqXachJVemxz+aoXg/uE=
X-Google-Smtp-Source: AGHT+IFsg7AoS5dL0W7XZPYPXQZddNF3THgbrwvVC6nlVRuaoekIiyjJYxswcpo4B5crQExAFji2qQ==
X-Received: by 2002:a05:6214:2026:b0:6e6:4969:f005 with SMTP id 6a1803df08f44-6e8e6d443e4mr119437436d6.30.1741282944698;
        Thu, 06 Mar 2025 09:42:24 -0800 (PST)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e8f708ffc6sm9471326d6.27.2025.03.06.09.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 09:42:24 -0800 (PST)
Date: Thu, 6 Mar 2025 17:42:22 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Qi.Chen@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][kirkstone][PATCH] docker-distribution: fix
 CVE-2025-24976
Message-ID: <Z8nefpfddsJBrFTp@gmail.com>
References: <20250306021901.2010684-1-Qi.Chen@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306021901.2010684-1-Qi.Chen@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 06 Mar 2025 17:42:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9157

merged.

Bruce

In message: [meta-virtualization][kirkstone][PATCH] docker-distribution: fix CVE-2025-24976
on 05/03/2025 Chen Qi via lists.yoctoproject.org wrote:

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
> index 50b6b302..5b5f75bb 100644
> --- a/recipes-containers/docker-distribution/docker-distribution_git.bb
> +++ b/recipes-containers/docker-distribution/docker-distribution_git.bb
> @@ -9,6 +9,7 @@ SRC_URI = "git://github.com/docker/distribution.git;branch=release/2.8;name=dist
>             file://0001-build-use-to-use-cross-go-compiler.patch \
>             file://0001-Fix-runaway-allocation-on-v2-_catalog.patch \
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
> View/Reply Online (#9154): https://lists.yoctoproject.org/g/meta-virtualization/message/9154
> Mute This Topic: https://lists.yoctoproject.org/mt/111541296/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


