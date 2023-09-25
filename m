Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DD49CE7A8B
	for <webhook@archiver.kernel.org>; Mon, 25 Sep 2023 01:24:07 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web10.52150.1695605037273906283
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 24 Sep 2023 18:23:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=N6H+Exo7;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-65b0383f618so10665196d6.1
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 24 Sep 2023 18:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695605036; x=1696209836; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SXxS+omBjgIoxxjMcd7KH25q8FrLiR4cElAkCXgHTL0=;
        b=N6H+Exo7QJVoJuHW5U0ck2DrrjAQaDMbz0RzOVfy4sXvihBmuV17BQOT67W9DOAEsQ
         cJ+uHjaSDDhwII0uM+ieDpSx6W5Oqgo/U0WxJUrcHb6bYMYGiqx8sRHRGMsdBrzJS2Ca
         3D+22jNs8A9Zkvyrw7EluOYbuyEHJuYdhVfE8jMIHwCpzNlMeR/gEmkebuTQbm9gX+yh
         k3tyB6svtsHSNhcSpeBBIFUHyVbZCJ7B0kbuFga1Lb9yi71B4Sg2fi7c2kn0MpertDo7
         WvShsJ+t0oqp1vWzkHumkztsyocpc+5N2iF08LfTO2RA6fOstz44RaROVNM6rUTSs9Iu
         PXRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695605036; x=1696209836;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SXxS+omBjgIoxxjMcd7KH25q8FrLiR4cElAkCXgHTL0=;
        b=rFiwmBRXA92KDNtf8G1bY2BEuHW1uPO2sNKxMY/iD9Cl4z/LbCaoHPVPzbIN3DkGJL
         cY+bufiyOw7Z6S8Zf5yvZKVZnfwPblxqtyyQoLYvRc5/LGXAb84Ek+xxk4hEOpsw0NPf
         JW/t5OSYH5zsiq+XiKTEb7xkkT+WB4H2Kr5ewPwTlwrkbX+zdQ//S3Haqy3MHPoKqdcE
         Y932UOqU61MhMNcVQfkA0Up3HAbcXL7oIYXBbFvZL32WqjF58XudQNai1kLvcKrnTRZt
         Qt4pkmzNgWrh40Qvir6oI7mrn9uOGxYwjhI5CG8TnUYgubMyitGr+IZxCNwRD+N7P3dF
         LS0A==
X-Gm-Message-State: AOJu0YwO7eAlytcC4jofyLNs6pvD2kua/+0PGLxZQtMjn1rSrfDXI7/k
	+bNQVTwGMkK1J0Pt4MAW+R4a9AVHEfTLVGX/
X-Google-Smtp-Source: AGHT+IHsxWIae+e0wakFbsI1CIJCg0r1zUeNOHnbzk44dT14+bmFUgmkAnZl9xhIg82n1pXf5LwjKA==
X-Received: by 2002:a0c:a801:0:b0:655:e12d:d42d with SMTP id w1-20020a0ca801000000b00655e12dd42dmr4812654qva.28.1695605036267;
        Sun, 24 Sep 2023 18:23:56 -0700 (PDT)
Received: from gmail.com ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id h19-20020a0cab13000000b0065b121d6251sm373648qvb.146.2023.09.24.18.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Sep 2023 18:23:55 -0700 (PDT)
Date: Mon, 25 Sep 2023 01:23:53 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Qi.Chen@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] nerdctl: fix textrel QA issue
Message-ID: <ZRDhKSMSQOrVb7+M@gmail.com>
References: <20230920051803.2385542-1-Qi.Chen@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230920051803.2385542-1-Qi.Chen@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 25 Sep 2023 01:24:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8319

merged.

Bruce

In message: [meta-virtualization][PATCH] nerdctl: fix textrel QA issue
on 19/09/2023 Chen Qi via lists.yoctoproject.org wrote:

> From: Chen Qi <Qi.Chen@windriver.com>
> 
> Fix the following QA issue:
> 
>   ERROR: QA Issue: nerdctl: ELF binary /usr/bin/nerdctl has relocations in .text [textrel]
> 
> We want to use -buildmode=pie, in order to avoid duplicating codes with
> go.bbclass, make use of GOBUILDFLAGS.
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  recipes-containers/nerdctl/nerdctl_git.bb | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/recipes-containers/nerdctl/nerdctl_git.bb b/recipes-containers/nerdctl/nerdctl_git.bb
> index 62460a52..f68223df 100644
> --- a/recipes-containers/nerdctl/nerdctl_git.bb
> +++ b/recipes-containers/nerdctl/nerdctl_git.bb
> @@ -51,6 +51,8 @@ PACKAGECONFIG ?= ""
>  # sets the "sites" variable.
>  include relocation.inc
>  
> +PIEFLAG = "${@bb.utils.contains('GOBUILDFLAGS', '-buildmode=pie', '-buildmode=pie', '', d)}"
> +
>  do_compile() {
>  
>      	cd ${S}/src/import
> @@ -64,7 +66,7 @@ do_compile() {
>  	export CGO_CFLAGS="${CFLAGS} --sysroot=${STAGING_DIR_TARGET}"
>  	export CGO_LDFLAGS="${LDFLAGS} --sysroot=${STAGING_DIR_TARGET}"
>  
> -	export GOFLAGS="-mod=vendor -trimpath"
> +	export GOFLAGS="-mod=vendor -trimpath ${PIEFLAG}"
>  
>  	# our copied .go files are to be used for the build
>  	ln -sf vendor.copy vendor
> -- 
> 2.40.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8313): https://lists.yoctoproject.org/g/meta-virtualization/message/8313
> Mute This Topic: https://lists.yoctoproject.org/mt/101473054/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


