Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB240C25B79
	for <webhook@archiver.kernel.org>; Fri, 24 May 2024 18:50:50 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web11.3103.1716576641857071394
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 24 May 2024 11:50:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AwZZUql9;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2bdf3f4d5ffso1552944a91.3
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 24 May 2024 11:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716576641; x=1717181441; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6JCHvTm54fO6WHHMAgLrG1ZA70zkqVp3ieT5bPownNw=;
        b=AwZZUql9QedxrofpanrMOU8gVroV96RE4t3gRr3nT92zD0SzIu1YjKY7bwpAJaRC+a
         Wn8SQBumdJp16TiokxVNE6Dps4ntN1NQZE1+xWkjZoELdBomAm/2F7TISxrPcRninMBx
         vxGMBpoLngj/vQ0WJ9INZaH7wZroTxOBKQ+zyJ3ne4rVU9Ni9EH5RbYyEk8ROrHYKWcy
         DP/v2tuov1MkQM3biKwQubk6d9KADVgF1bJSiGkRS1iahr+HHiesRnRL7bhGRprsrY4B
         ngU98/X69TtzwduW+uSTC2HGvWKpQjjqnZhKzEnATMjWvh/JZoBqzua9nT4xFeMcfcjA
         1f2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716576641; x=1717181441;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6JCHvTm54fO6WHHMAgLrG1ZA70zkqVp3ieT5bPownNw=;
        b=qGOgeGyGB9lY9+KqZh2Aeu8fxiBPovHqFHZw5VuYMBROtk8lbmcFa3TDHIJWTDUTGR
         hCWW1PcEAOdH9JxCpZDt0ThOryEDSOc8tCGyvD3IjYqM451A3vgYaz52TfQ7vawiGO3Q
         eLOVJtY3ANNlSLBtrMwbOc+Ra/BsGzJehdWVIRu8P1SewX1ifUVlA38b61aHFfqDQR2k
         tWw8+sSWE8B5IoHjejDWogWYefzXPnQuOiZyurYGmV4p2ycb4seKYm8s5y9SOs9v82rD
         S0eOsU5cW/4/ZNEJW4b26JrJMUDFFxfolozDLr6Kr0GaHeEwrGvo7hlqc8IW7pkoARBO
         2/Lg==
X-Gm-Message-State: AOJu0Yyvw1XnOHetqtj9CeB2sUtvTqEz97X2I+wOZVQWKinhq09X7KyY
	NpAbKd9LgOKgYYUxo8DZ6U17i62spBqbXCSjt370T0TR+IXrmpumkAktG5/sKpgEQ2q8iuazQzn
	i0POGky3w/zZPWwjTZHZQ9y6cbGuA1g==
X-Google-Smtp-Source: AGHT+IFwW1j367DLzeX+PA4nT59fzwbHjd4IIUt7ojBTyirl/hxpAavUGVRymWYJaeTro65bRfU24+FApqkSvn/NfjQ=
X-Received: by 2002:a17:90a:e605:b0:2bf:5793:630c with SMTP id
 98e67ed59e1d1-2bf5f74d6d5mr3136832a91.42.1716576641249; Fri, 24 May 2024
 11:50:41 -0700 (PDT)
MIME-Version: 1.0
References: <20240524062746.232409-1-martin.jansa@gmail.com> <20240524062746.232409-4-martin.jansa@gmail.com>
In-Reply-To: <20240524062746.232409-4-martin.jansa@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 24 May 2024 14:50:29 -0400
Message-ID: <CADkTA4MkM5uHWN7CNs=axmXkhZQnjuHBc6bFPnasLsPWVxTgjw@mail.gmail.com>
Subject: Re: [meta-virtualization] [RFC][PATCH 4/4] linux-yocto_virtualization.inc:
 adjust path to kcfg for UNPACKDIR
To: martin.jansa@gmail.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 24 May 2024 18:50:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8752

Ack'd.

This one is good. I did the same thing locally to adjust to the new directo=
ry
structure, but your commit log is better, so I'll take this version.

Bruce

On Fri, May 24, 2024 at 2:28=E2=80=AFAM Martin Jansa via
lists.yoctoproject.org <martin.jansa=3Dgmail.com@lists.yoctoproject.org>
wrote:
>
> * UNPACKDIR added one more level
>
> * this needs some more robust solution, but now with UNPACKDIR changes
>   this was failing in do_kernel_metadata:
>
> | NOTE: do_kernel_metadata: for summary/debug, set KCONF_AUDIT_LEVEL > 0
> | ERROR: Feature '../recipe-sysroot-native/kcfg/cfg/virtio.scc' not found=
, this will cause configuration failures.
> | ERROR: Check the SRC_URI for meta-data repositories or directories that=
 may be missing
> | ERROR: Set KERNEL_DANGLING_FEATURES_WARN_ONLY to ignore this issue
>
> * fixes:
>   http://errors.yoctoproject.org/Errors/Details/772680/
>
> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> ---
>  recipes-kernel/linux/linux-yocto_virtualization.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-kernel/linux/linux-yocto_virtualization.inc b/recipe=
s-kernel/linux/linux-yocto_virtualization.inc
> index 9a6554d1..5edaef94 100644
> --- a/recipes-kernel/linux/linux-yocto_virtualization.inc
> +++ b/recipes-kernel/linux/linux-yocto_virtualization.inc
> @@ -21,12 +21,12 @@ def kernel_cache_cond_feature(src_uri,feature):
>      if kernel_cache:
>         return feature
>
> -    return "../recipe-sysroot-native/kcfg/" + feature
> +    return "../../recipe-sysroot-native/kcfg/" + feature
>
>  # no conditional, just use the yocto-kernel-cache addition, yes
>  # the src_uri isn't used, but we may need to check it in the future
>  def kernel_cache_feature(src_uri,feature):
> -    return "../recipe-sysroot-native/kcfg/" + feature
> +    return "../../recipe-sysroot-native/kcfg/" + feature
>
>  def distro_cond_feature(feature_fragment,distro_feature,d):
>      import bb
> --
> 2.45.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8749): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8749
> Mute This Topic: https://lists.yoctoproject.org/mt/106277147/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

