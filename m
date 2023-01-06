Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34569C3DA7A
	for <webhook@archiver.kernel.org>; Fri,  6 Jan 2023 15:39:21 +0000 (UTC)
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
 by mx.groups.io with SMTP id smtpd.web11.16586.1673019556087617522
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 06 Jan 2023 07:39:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TeTq1Gdr;
 spf=pass (domain: gmail.com, ip: 209.85.166.51, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f51.google.com with SMTP id d123so851776iof.6
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 06 Jan 2023 07:39:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NwPKW8PGGUqWzdQcPAsP2IFPuMDaY1ntqx+g5/Wi1Nk=;
        b=TeTq1Gdrgxyci1GhavrwPP8m1ECu6ksVad91GiWwJLwKXUPNxSFfGP9ntEsWRkyOEk
         oVKQ1F5V7ZOAqyMMITiS9JdNeSYQ+IqD3fY0fSeTTlmrripRPgj8GnAhBqWZSVLJfUOg
         TvGvD7yQWIYbFNMwFbOEeuekYFT45qtx44vkdbAIWf5cLwKlKe6UJOqPilH0a/rdaGRw
         Otox7kM3mBECKcA16ty0GnRdO0bGjKJj99kOnhf90105wK4roHnU+33U9igYSsoe5ugX
         7uXZSCOQBgF2vo+sXM6vPN53EVTctIxdkDqdfztmDtoXC4FdP4lTLrv3yrNT2T+k/8tE
         I91g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NwPKW8PGGUqWzdQcPAsP2IFPuMDaY1ntqx+g5/Wi1Nk=;
        b=Idw08N8bHmIgQsvljIeGc3OrdYzfwoSdQ6zyvcE0iWKfHZ7QZ05IyNHmeFDNiCD36t
         c3E/KsrNBDqNBLGvkTBiqiQm+J1n/3tuumXqTcA8MA1xcTU5JWWK2iqkh0lipjyeEZD7
         I7wXKd5qrSsKOwuqaKIqfczMbQa/3hLxTN2ABwAv6+2OsDXa4rIyPtMu2C0mFaBeQs9f
         fUKpIRaqlIX7jyMuP7bHcIORka008OY5HR4x+T0eOc5NrqvP5d6QUl27Sd1j4DK+XqZa
         dyupWKSaCMBvHljvJbP6Oqq9A8Ldz/Z9mnyAigDeNz/GM09YUZP7jETP40tU7RFVoUwS
         sRog==
X-Gm-Message-State: AFqh2koyPNII+K0UflmioPasNjngeF52pk04QczryVa1Ru769ZPpYaYn
	ifAdxA2CR0t/gjX4w+FhP5jG71TUcLoFMlBURYa3ecgO
X-Google-Smtp-Source: AMrXdXsmoh9vDeUmthJ9PSuMftBD1LlPSStB0R64fEhR+TQ+8T+VO/qLmqNyLSBrPQfF8kJdwP6DNdTC1Shbrf8LIL8=
X-Received: by 2002:a05:6638:19ca:b0:375:1a70:9c5c with SMTP id
 bi10-20020a05663819ca00b003751a709c5cmr4419268jab.129.1673019555252; Fri, 06
 Jan 2023 07:39:15 -0800 (PST)
MIME-Version: 1.0
References: <20230106101248.852370-1-mingli.yu@eng.windriver.com>
In-Reply-To: <20230106101248.852370-1-mingli.yu@eng.windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 6 Jan 2023 10:39:04 -0500
Message-ID: <CADkTA4NktMhRCcHV6mYUCdY465zRaBy5GXmuW5NfBgva-S49qQ@mail.gmail.com>
Subject: Re: [PATCH] libslirp: remove the recipe
To: mingli.yu@eng.windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 06 Jan 2023 15:39:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7801

This is an already known issue.

I'll be forking the recipe versus removing it, I'm just not back full
time so haven't had a chance to do it yet.

Bruce

On Fri, Jan 6, 2023 at 5:12 AM <mingli.yu@eng.windriver.com> wrote:
>
> From: Mingli Yu <mingli.yu@windriver.com>
>
> The libslirp recipe is added in openembedded-core [1], so remove the
> recipe in meta-virtualization to fix the below yocto compliance issue.
>
> INFO: ======================================================================
> INFO: FAIL: test_signatures (common.CommonCheckLayer)
> INFO: ----------------------------------------------------------------------
> INFO: Traceback (most recent call last):
>   File "/build/layers/oe-core/scripts/lib/checklayer/cases/common.py", line 84, in test_signatures
>     self.fail('Adding layer %s changed signatures.\n%s' % (self.tc.layer['name'], msg))
> AssertionError: Adding layer meta-virtualization changed signatures.
> 26 signatures changed, initial differences (first hash before, second after):
>    libslirp:do_fetch: ddef7cb42fde46edfd7be943eae54ddc2b27bc0af62f8cb6b31593cabb0d5925 -> b71e325b62905059e0cf07b61ee0a4db192d212ff56395d0d93702e525ef8d4a
>       bitbake-diffsigs --task libslirp do_fetch --signature ddef7cb42fde46edfd7be943eae54ddc2b27bc0af62f8cb6b31593cabb0d5925 b71e325b62905059e0cf07b61ee0a4db192d212ff56395d0d93702e525ef8d4a
>       NOTE: Starting bitbake server...
>       basehash changed from 50c45a6065da00132b899786d818a66f056190f6664fc4bfe974e8a9f70c7f78 to 3b4e51c0058462af0c141c974b2ea19a9efc51cb61ef26bc2b4367c1066ad8f9
>       Variable SRCREV value changed from '3ad1710a96678fe79066b1469cead4058713a1d9' to '888ddad6bde1dc6d7dbfc8daa7d015251b72e02c'
>
>    libslirp:do_write_config: 8a3791774ea0f5793d1c14d0f3521582814420a057a2ee34488c8f868c7aacbb -> bdebe27987ebfdfdac9cf4c1af489f7aa674ef19454f7bf983549ae8ee2baf69
>       bitbake-diffsigs --task libslirp do_write_config --signature 8a3791774ea0f5793d1c14d0f3521582814420a057a2ee34488c8f868c7aacbb bdebe27987ebfdfdac9cf4c1af489f7aa674ef19454f7bf983549ae8ee2baf69
>       NOTE: Starting bitbake server...
>       basehash changed from 8e5d9803b05d9999dbd18f4dce549312dc908f475362e236db785c94c99c8d5d to 0870fb4d535f92b666ed5a78d46ef69acc292888399961a24547b22d82b26d84
>       Variable PV value changed from '4.7.0' to '4.6.1+gitAUTOINC+888ddad6bd'
>
> [1] https://git.openembedded.org/openembedded-core/commit/?id=a4409583e0f8187b0c0cbf92fbddeffef12fd8f5
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  recipes-networking/slirp/libslirp_git.bb | 14 --------------
>  1 file changed, 14 deletions(-)
>  delete mode 100644 recipes-networking/slirp/libslirp_git.bb
>
> diff --git a/recipes-networking/slirp/libslirp_git.bb b/recipes-networking/slirp/libslirp_git.bb
> deleted file mode 100644
> index aeb61f63..00000000
> --- a/recipes-networking/slirp/libslirp_git.bb
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -SUMMARY = "A general purpose TCP-IP emulator"
> -LICENSE = "BSD-3-Clause & MIT"
> -LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=bca0186b14e6b05e338e729f106db727"
> -
> -SRC_URI = "git://gitlab.freedesktop.org/slirp/libslirp.git;protocol=https;branch=master"
> -SRCREV = "888ddad6bde1dc6d7dbfc8daa7d015251b72e02c"
> -PV = "4.6.1+git${SRCPV}"
> -S = "${WORKDIR}/git"
> -
> -DEPENDS = " \
> -    glib-2.0 \
> -"
> -
> -inherit meson pkgconfig
> --
> 2.25.1
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

