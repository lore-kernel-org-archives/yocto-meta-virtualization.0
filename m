Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28D3FC25B74
	for <webhook@archiver.kernel.org>; Mon, 27 May 2024 13:22:43 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web10.27562.1716816162817032830
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 27 May 2024 06:22:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MqymFk5q;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-681a48efe77so2526982a12.2
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 27 May 2024 06:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716816162; x=1717420962; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VOuDmqknisReT41o8mc9hC5gwQX+A1yLsk+kM7Z8DaQ=;
        b=MqymFk5qYW/CRv2156JX7V/htJHsEIxAVyXSQJp+Qm3FKQVickAPSy5EoKaH1Q7z8u
         DhZt2iHLqVPCvVu/+s/Iqao8Ui4hmjTVfRFWPcSaA3357UXpEBhxSBD/WdbFkjVVBYGO
         a6HX0b1T2B1spY5A2QP9D4ltnw6nugJazExZy1FQO/4gys8zrN+j819Q63UQfKR6QiCl
         icFT8vuUc7S9Lp41vd2DpnMXmtQHBLNym8QQbYPchA1fm3jDa6WHGsNJIjqNMwAtFf26
         uW/RiGgqS4tT2uyQJGeGt7T96a1g8zwEWRdMT8igibi6oYZi5HPpWKQ6mQ+BMW7cDqVO
         NgBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716816162; x=1717420962;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VOuDmqknisReT41o8mc9hC5gwQX+A1yLsk+kM7Z8DaQ=;
        b=G+junXHFRUJXIr9KcX0Ap4+Bd1+BLhlRwYyhc2SjrGm5UJqKDLA5o/X55QJU5s2nS/
         fTChOimyebJXat2jgiM91rd+IOkXGE5+nkOZGrhDZmfwFh6nRDsYaXDXTnBNA7XOYQ3M
         5J4wphJ9KvT3HGyeiYXBARZnZlyhRnxyelmeaxM7RDfODxyhtoBuzkY1fPvP/m2D5hp4
         wQ5E5wE9fhtLmEoW35LX51hN8SlIx9kN3NtnujBVgjHzJx26p23yUa7aU8p1omXAnCVV
         1w3w1jhr7OtUfOUgWofF3Q2vIspNfaJIZ7sIsRr5QJbrP/Q2L9XL6VhmQ0+/E3YYRbfM
         NEiw==
X-Gm-Message-State: AOJu0YxAgUpE4mHtnNKORGznmvkb+G3qWDzvcIBap8n7McfcKGRoWY4o
	2+/YLRqofARVgP9BrhSCUIr6gMHMpHv1nI3ki0xG1OtKkk+ma3PJChZqdu41xz26UkWJx0IxDA6
	xkpveJoPBBvr8aa4LyawwpB/0+9o=
X-Google-Smtp-Source: AGHT+IEivwcgeLSW+0c6qQaR6h3OVr+iZsSOt8dETooohi98Y0e0nlldatdFqRZ687l/PVjXTJc1eINUuq3mVIMiU20=
X-Received: by 2002:a17:90b:4b03:b0:2bf:dcba:a3c1 with SMTP id
 98e67ed59e1d1-2bfdcbaa53cmr2076761a91.34.1716816162013; Mon, 27 May 2024
 06:22:42 -0700 (PDT)
MIME-Version: 1.0
References: <20240527131755.1903448-1-f_l_k@t-online.de>
In-Reply-To: <20240527131755.1903448-1-f_l_k@t-online.de>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 27 May 2024 09:22:29 -0400
Message-ID: <CADkTA4OJ9p8f0nfq2wU7uv5dYKHvfHKQ71ifgv6hzXmkLmFi=w@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] linux-yocto_virtualization: adjust
 path for scc files
To: f_l_k@t-online.de
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 27 May 2024 13:22:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8767

Martin already sent this patch, and I have a similar one that I did as well=
.

As I was saying on the list late last week, I've been on vacation for
the past week and a half and have most of the recent breakage fixed,
but it needs more testing before I push the changes.

Cheers,

Bruce

On Mon, May 27, 2024 at 9:17=E2=80=AFAM Markus Volk via lists.yoctoproject.=
org
<f_l_k=3Dt-online.de@lists.yoctoproject.org> wrote:
>
> this avoids:
> | ERROR: Feature '../recipe-sysroot-native/kcfg/cfg/virtio.scc' not found=
, this will cause configuration failures.
> | ERROR: Check the SRC_URI for meta-data repositories or directories that=
 may be missing
> | ERROR: Set KERNEL_DANGLING_FEATURES_WARN_ONLY to ignore this issue
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
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
> 2.44.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8766): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8766
> Mute This Topic: https://lists.yoctoproject.org/mt/106329585/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

