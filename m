Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF824C71153
	for <webhook@archiver.kernel.org>; Mon,  4 Sep 2023 06:39:31 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web10.42570.1693809561867326082
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 03 Sep 2023 23:39:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=o0QrLpCW;
 spf=pass (domain: linaro.org, ip: 209.85.208.178, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2bd3f629c76so17258661fa.0
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 03 Sep 2023 23:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693809560; x=1694414360; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=f96XcYjGfaT98BkKDdaq9SMqVwwTXJk4hd+nxEoyan8=;
        b=o0QrLpCWXS1jlYkVdBidQg0FbcWDVsJMKm6SEV6nyXI8ha+TYRa5r+ia/aWWk0XoMh
         BEJHyIMiThou+5CSIEHL9AIZl6gZTJUKABTBoGxB+B7Xq75jhWmij7uAfRbXmagIW7h1
         OQI63/mbqmXKXuDvjHsdY6bY89yvnG8hPzxybO7hoK6rgLh57IOtdb251FgS7jBiHFfy
         2Gs6QlukI+3RKrFOSbJPLUWpA5qySJmEfph98Q5hGyZTIqdAy1Al2bGjKjZccwKQ2cOg
         bLbtCFJzgFjObUB8202cZ+vgnc2faba/ia1FFSOwO6+UQLU7eb+WSgblNrYWzEqQlCHF
         uFtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693809560; x=1694414360;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f96XcYjGfaT98BkKDdaq9SMqVwwTXJk4hd+nxEoyan8=;
        b=I5b8BS5/6bTKEiIVwZJaUiENpglq8gPsmeslQ86IPCocGfMfRGhccS8h/q++02KI7k
         LpxJIbYGeD9mMw1E1dU8y00+0jW/fFINW7pIHcKmgMVOtE4ddSHuNMB1c28reKnwWTCL
         JJ6pg1+ZShK40iUKHmxHCfDr50ezVKrANTiWnZRTRl6mBJ05E5uq2iLMJrsYNwTcNkec
         pVRp+ZsxGUsN2GC/m38x0dNbo6NOLq4FO93fT4NaByDy5AtOt9zGBeygRtd/lvSwOeT+
         KOuhxPmv1qSqvNxo+m5HO8I7ftkzbaliFrkC5dIx2OCqNOy9BAxMYIxsZdrtWtXFIEdH
         HyXA==
X-Gm-Message-State: AOJu0YywntzE61H9g+sibKmWiHOr/1sa9JJQjFFvtYugCZq3OHKCXhcv
	a8SoBRUoPqTHpTmtXgHECh6MbFH6kqRn0+eBu7M=
X-Google-Smtp-Source: AGHT+IFRulCuj5Yx/FiZOaG9AxMXE6WdhbT3EyuzDWGjmcSVvrOby8nYDDdzTrHnhiJfOjkWoR4l7w==
X-Received: by 2002:a2e:350e:0:b0:2b9:ed84:b2bf with SMTP id z14-20020a2e350e000000b002b9ed84b2bfmr5855439ljz.33.1693809560001;
        Sun, 03 Sep 2023 23:39:20 -0700 (PDT)
Received: from nuoska (dc7g6tyjby-d304c4945t-3.rev.dnainternet.fi. [2001:14ba:16cb:a800:e107:c77f:6058:ee33])
        by smtp.gmail.com with ESMTPSA id k16-20020a05651c10b000b002b9e6d7f72fsm1912422ljn.5.2023.09.03.23.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Sep 2023 23:39:19 -0700 (PDT)
Date: Mon, 4 Sep 2023 09:39:17 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: meta-virtualization@lists.yoctoproject.org
Cc: Javier Tia <javier.tia@linaro.org>
Subject: Re: [meta-virtualization] [PATCH] go-build: add SRCREV_FORMAT
Message-ID: <ZPV7letLuc9IeUJs@nuoska>
References: <20230828202834.2981605-1-javier.tia@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230828202834.2981605-1-javier.tia@linaro.org>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 04 Sep 2023 06:39:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8269

Hi, would be nice to get this applied as it fixes this parsing
error from latest poky master branch:

Parsing recipes...WARNING: /oe/build/../meta-virtualization/recipes-devtools/go/go-build_git.bb: Exception during build_dependencies for fetcher_hashes_dummyfunc
WARNING: /oe/build/../meta-virtualization/recipes-devtools/go/go-build_git.bb: Error during finalise of /oe/build/../meta-virtualization/recipes-devtools/go/go-build_git.bb
ERROR: ExpansionError during parsing /oe/build/../meta-virtualization/recipes-devtools/go/go-build_git.bb
Traceback (most recent call last):
  File "Var <fetcher_hashes_dummyfunc[vardepvalue]>", line 1, in <module>
  File "/oe/poky/bitbake/lib/bb/fetch2/__init__.py", line 834, in get_hashvalue(d=<bb.data_smart.DataSmart object at 0x7f0fd64ce640>, method_name='sortable_revision'):
     def get_hashvalue(d, method_name='sortable_revision'):
    >    pkgv, revs = _get_srcrev(d, method_name=method_name)
         return " ".join(revs)
  File "/oe/poky/bitbake/lib/bb/fetch2/__init__.py", line 804, in _get_srcrev(d=<bb.data_smart.DataSmart object at 0x7f0fd64ce640>, method_name='sortable_revision'):
         if not format:
    >        raise FetchError("The SRCREV_FORMAT variable must be set when multiple SCMs are used.\n"\
                              "The SCMs are:\n%s" % '\n'.join(scms))
bb.data_smart.ExpansionError: Failure expanding variable fetcher_hashes_dummyfunc[vardepvalue], expression was ${@bb.fetch.get_hashvalue(d)} which triggered exception FetchError: Fetcher failure: The SRCREV_FORMAT variable must be set when multiple SCMs are used.
The SCMs are:
git://github.com/lf-edge/runx;nobranch=1;name=runx;protocol=https
git://github.com/opencontainers/runc;branch=release-1.1;name=runc;protocol=https;destsuffix=git/src/import/gobuild/go/src/github.com/opencontainers/runc
The variable dependency chain for the failure is: fetcher_hashes_dummyfunc[vardepvalue]

ERROR: Parsing halted due to errors, see error messages above

Cheers,

-Mikko

On Mon, Aug 28, 2023 at 02:28:34PM -0600, Javier Tia wrote:
> Recipes that use multiple SCMs in the SRC_URI, must supply SRCREV_FORMAT
> to avoid an expansion error.
> 
> Signed-off-by: Javier Tia <javier.tia@linaro.org>
> ---
>  recipes-devtools/go/go-build_git.bb | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/recipes-devtools/go/go-build_git.bb b/recipes-devtools/go/go-build_git.bb
> index 2337c9e1..2a78be01 100644
> --- a/recipes-devtools/go/go-build_git.bb
> +++ b/recipes-devtools/go/go-build_git.bb
> @@ -4,12 +4,12 @@ DESCRIPTION = "Xen Runtime for OCI"
>  
>  SRCREV_runx = "f24efd33fb18469e9cfe4d1bfe8e2c90ec8c4e93"
>  SRCREV_runc = "1e7bb5b773162b57333d57f612fd72e3f8612d94"
> -
> +SRCREV_FORMAT = "runx"
>  SRC_URI = "\
> -	  git://github.com/lf-edge/runx;nobranch=1;name=runx;protocol=https \
> -          git://github.com/opencontainers/runc;branch=release-1.1;name=runc;protocol=https;destsuffix=git/src/import/gobuild/go/src/github.com/opencontainers/runc \
> -          file://0001-build-use-instead-of-go.patch \
> -	  "
> +    git://github.com/lf-edge/runx;nobranch=1;name=runx;protocol=https \
> +    git://github.com/opencontainers/runc;branch=release-1.1;name=runc;protocol=https;destsuffix=git/src/import/gobuild/go/src/github.com/opencontainers/runc \
> +    file://0001-build-use-instead-of-go.patch \
> +"
>  SRC_URI[md5sum] = "0d701ac1e2a67d47ce7127432df2c32b"
>  SRC_URI[sha256sum] = "5a26478906d5005f4f809402e981518d2b8844949199f60c4b6e1f986ca2a769"
>  
> -- 
> 2.42.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8250): https://lists.yoctoproject.org/g/meta-virtualization/message/8250
> Mute This Topic: https://lists.yoctoproject.org/mt/101018420/7159507
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [mikko.rapeli@linaro.org]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


