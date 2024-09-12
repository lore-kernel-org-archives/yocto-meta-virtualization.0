Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EA6EEEB567
	for <webhook@archiver.kernel.org>; Thu, 12 Sep 2024 08:36:31 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.43355.1726130182908530097
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 12 Sep 2024 01:36:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=l8RTKfQ2;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5356aa9a0afso963317e87.2
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 12 Sep 2024 01:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726130181; x=1726734981; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LA/xaGg79Hqzk/GU++U6LIvdh+febhGqqfdoRPc/6ps=;
        b=l8RTKfQ2prVvPY6LyDzuu9cbGSURFNMN1owKHy23N3AbE8YrO3V5slgsBcQSStKAvJ
         7WcnMuLQTr2o37EA471iOz0qYbThJrhzmbvpupWdc5uZeu9oZF8dbVNoYq+OB/GdmC4z
         aVb0ZhfgJoICMPck5DLo8mdh3kKyihvuG/jZU44lpTFoftY4wN0zJHU/QlO4mwoCHbxM
         xeI/o6GPITezW+cUCkxP5j8aTsgfzEJTu24Nyf+bCUvFSf1DwSa0IzW7DoDWI595Mg94
         zHYCC3cZK05ydVkbrwzfcwc/OFhgUw4pcPy+HtcTSXXhT+2NlwR+7Id8RfXsbX5z5Ci9
         4mCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726130181; x=1726734981;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LA/xaGg79Hqzk/GU++U6LIvdh+febhGqqfdoRPc/6ps=;
        b=qqK4U0+3CNovuBpa1qJTrQ2jSaerbFpP4SWfjfgtrPT6++GJCn8BAKP8kecV1JiOyl
         jVMLKLtPtxlUuapqiFYyDUgProA6d87CXic/BQ2wTl8rhAjcx0Cwz8gQGg9/tpdEcOuH
         wPMi8bawFJ+Z/MeXbY0oZJa3yDEa4t9yUnoraS3nrajSTvMi32KkDE1AKDcDPjkoLf4S
         z6SxnD634FI1xg0W32SAbnNUB7vwUpjMnIDmuc/Uc1pCKt66ZO5AA4WtgB2PZvXorHQi
         fFaz496No4+0jEo3B1EKrCIiVW2JVjdfGhqLZIVlfZmhqbk8CLPZPGkHbcRbYoMF4ZFS
         VYeg==
X-Gm-Message-State: AOJu0YxcVWduVyzhlv6xB+hWroci8Miq5YAjwrvXtFPmopnthTIgLneV
	v3PCeNxJp2CY9Zo6fXMlZ6pFVF3BAlAMZalPnDaoevLmG5wzKGXeRHYYEgZcvspARAR0pjyyToB
	zmV/1f5FWzvSBsm8cpHomBY+zfWM=
X-Google-Smtp-Source: AGHT+IH53ww41+pOjMC/pkTCASHAGecGHZ0kK9Tut93fqXfzA4i1xs3SbBlMnGBsHogXJZkHHtvK6JUYHClJYqcTJBA=
X-Received: by 2002:a05:6512:2812:b0:531:8f2f:8ae7 with SMTP id
 2adb3069b0e04-53678fbf743mr1408294e87.25.1726130179993; Thu, 12 Sep 2024
 01:36:19 -0700 (PDT)
MIME-Version: 1.0
References: <20240912083239.237361-1-f_l_k@t-online.de>
In-Reply-To: <20240912083239.237361-1-f_l_k@t-online.de>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 12 Sep 2024 10:36:04 +0200
Message-ID: <CA+chaQfdVmLsJD3WL_O8YiJ9urPvgwiHO82=48rBruRcw9-PWg@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] linux-%.bbappend: fix compatibility
 issue with linux-intel
To: f_l_k@t-online.de
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 12 Sep 2024 08:36:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8887

Wasn't this fixed by
https://git.yoctoproject.org/meta-virtualization/commit/?id=3Dc02af94731631=
b3432b8ddee2b89761ab32530ee
?

On Thu, Sep 12, 2024 at 10:31=E2=80=AFAM Markus Volk via
lists.yoctoproject.org <f_l_k=3Dt-online.de@lists.yoctoproject.org>
wrote:
>
> If building linux-intel from meta-intel in combination with meta-virtuali=
zation,
> build fails in:
> [https://git.yoctoproject.org/meta-virtualization/tree/recipes-kernel/lin=
ux/linux-yocto_virtualization.inc?h=3Dmaster-next#n36]
>
> ERROR: Nothing PROVIDES 'yocto-cfg-fragments-6.10+git-native'. Close matc=
hes:
>   yocto-cfg-fragments-6.10
>   yocto-cfg-fragments-6.10-native
>   yocto-cfg-fragments-6.6-native
> ERROR: Required build target 'linux-intel' has no buildable providers.
> Missing or unbuildable dependency chain was: ['linux-intel', 'yocto-cfg-f=
ragments-6.10+git-native']
>
> Be more sloppy for the sake of compatibility.
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  recipes-kernel/linux/linux-%.bbappend | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-kernel/linux/linux-%.bbappend b/recipes-kernel/linux=
/linux-%.bbappend
> index dbae9b14..abd5a5d5 100644
> --- a/recipes-kernel/linux/linux-%.bbappend
> +++ b/recipes-kernel/linux/linux-%.bbappend
> @@ -1,8 +1,8 @@
>  # any kernel recipe with fragment support, that sets LINUX_VERSION to on=
e of the tested
>  # values, will get the appropriate fragments included in their SRC_URI
>
> -LINUX_MAJOR =3D "${@(d.getVar('LINUX_VERSION') or "x.y").split('.')[0]}"
> -LINUX_MINOR =3D "${@(d.getVar('LINUX_VERSION') or "x.y").split('.')[1]}"
> +LINUX_MAJOR =3D "${@("x.y").split('.')[0]}"
> +LINUX_MINOR =3D "${@("x.y").split('.')[1]}"
>
>  KERNEL_META_TYPE =3D "${@'yocto' if d.getVar('SRC_URI').find('type=3Dkme=
ta') > 0 and d.getVar('SKIP_META_VIRT_KERNEL_INCLUDE') =3D=3D None else 'no=
ne'}"
>
> --
> 2.46.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8886): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8886
> Mute This Topic: https://lists.yoctoproject.org/mt/108409634/3617156
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
martin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

