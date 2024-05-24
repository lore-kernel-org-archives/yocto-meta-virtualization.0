Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06D06C25B74
	for <webhook@archiver.kernel.org>; Fri, 24 May 2024 18:52:31 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.3139.1716576746625928260
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 24 May 2024 11:52:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aam3IFht;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2bdf446f3d1so1504682a91.3
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 24 May 2024 11:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716576746; x=1717181546; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0rU5gOtcx9YbRk2DkLIfbe+gqeGbfsi3ADs+Spa54TY=;
        b=aam3IFht6NeCrY9/+o8BVy4veQV4j0GUH1+Ubpy5Z2d1/q3IHWPy+ehhjxbN6tmFY1
         74K9fTEyCEb/Q+Rb1wAzRkSc9CfZ6uZQFlzGbu87EbIO9GaTOCLwcAr3JriANGWn5Qa9
         25Dfrz1DRCXbJVO4bbrdo6Ae4aUbf6GUoKPzXZ8d+EbA/MjRCepWtooRzWZOBlUfm7Jh
         Jz4UOj6tM7vSotAKG7r7XFlb6ygZayhiegg15faENCYxskWZhc1CO3RMTRUJe6xVW6Iw
         FmrC0F/D1VH1zxEQCjfFjdvhiniOF12YqwbbrNisaMOmYJDIt3cjtOXOkpjTRX7bmm2X
         kOrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716576746; x=1717181546;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0rU5gOtcx9YbRk2DkLIfbe+gqeGbfsi3ADs+Spa54TY=;
        b=RQMxpG0gsSJdCKpTMn4OG5UePDuZc5FuKu9U0B98wC86LIhuU6ZwsJ6vupk2iDmvEe
         NPyy1jJV/tQyMgKyluo1HGol5EFwiErj5mF9s7TZ0UTUZ/1hmT6Lt2xNCzhhaGGmsxT9
         tUXvqNv59Dyr+YDy2mStOtIsJrSzqSM1tioivoE0eflH9/q2IUjp0Ase00Qo1PBPBwM2
         HdXUxTgWdCb8LqSc9x51zZzBKI7VbcBVSmbPPvRr9Hs4oegv/eQf9sssSv/AvaeH+z7M
         2kuBrQrpcWt6qGJp5Wzo0EObRxVqMxDnZGWmdK8hUWWFyO8kP1flkgfdDrmJEdnBNiPG
         2fSw==
X-Gm-Message-State: AOJu0YwJQD9eP1AXJoxoCqCaPJeaGePdJieXcsMNUu0/8FPANB6YseYS
	MOJtT9cheh3RICaej+wqdSvOLbW6d5btrsN1SKVIdGpu3xuZuwLjfKX8IelGJHXAofpANk/vtFH
	DQmrlcMSIQ5t4XTXbO4iQusTyVpr2yg==
X-Google-Smtp-Source: AGHT+IHYnvekgKjtBKb/MbC3FS/tqbxjwGAZ5mMbUFADUYPSiThUOedqEiwAxAt6JMEgH8LfC+IHlvD7t+n4Jd8cmBg=
X-Received: by 2002:a17:90a:db93:b0:2a2:9b37:367a with SMTP id
 98e67ed59e1d1-2bf5f715562mr2982599a91.39.1716576745953; Fri, 24 May 2024
 11:52:25 -0700 (PDT)
MIME-Version: 1.0
References: <20240524062746.232409-1-martin.jansa@gmail.com>
In-Reply-To: <20240524062746.232409-1-martin.jansa@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 24 May 2024 14:52:14 -0400
Message-ID: <CADkTA4OEec156ofyE8qS-Xr-HZANB6NTt2ht8QMUE2nxTcc0Zg@mail.gmail.com>
Subject: Re: [meta-virtualization] [RFC][PATCH 1/4] dev86: ignore various
 issues fatal with gcc-14
To: martin.jansa@gmail.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 24 May 2024 18:52:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8754

Looks good to me. I'll get this queued once I've worked through the
golang issues.

Bruce

On Fri, May 24, 2024 at 2:28=E2=80=AFAM Martin Jansa via
lists.yoctoproject.org <martin.jansa=3Dgmail.com@lists.yoctoproject.org>
wrote:
>
> work arounds for:
> meta-virtualization/recipes-extended/dev86/dev86_git.bb:do_install
>
> http://errors.yoctoproject.org/Errors/Build/183127/
>
> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> ---
>  recipes-extended/dev86/dev86_git.bb | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/recipes-extended/dev86/dev86_git.bb b/recipes-extended/dev86=
/dev86_git.bb
> index a3d0fded..5adf2826 100644
> --- a/recipes-extended/dev86/dev86_git.bb
> +++ b/recipes-extended/dev86/dev86_git.bb
> @@ -41,3 +41,20 @@ do_install() {
>  }
>
>  FILES:${PN} +=3D "${libdir}/bcc"
> +
> +# http://gecko.lge.com:8000/Errors/Details/832862
> +# http://errors.yoctoproject.org/Errors/Details/766930/
> +# cpp.c:548:1: error: type of 'ch' defaults to 'int' [-Wimplicit-int]
> +# strsave.c:47:42: error: implicit declaration of function 'strcmp' [-Wi=
mplicit-function-declaration]
> +# strsave.c:55:26: error: implicit declaration of function 'hash' [-Wimp=
licit-function-declaration]
> +# strsave.c:66:32: error: implicit declaration of function 'strlen' [-Wi=
mplicit-function-declaration]
> +# symbol.c:60:42: error: implicit declaration of function 'strcmp' [-Wim=
plicit-function-declaration]
> +# symbol.c:72:30: error: implicit declaration of function 'strlen' [-Wim=
plicit-function-declaration]
> +# symbol.c:77:13: error: implicit declaration of function 'hash' [-Wimpl=
icit-function-declaration]
> +# tok_class.c:305:43: error: implicit declaration of function 'strlen' [=
-Wimplicit-function-declaration]
> +# tok_io.c:219:20: error: implicit declaration of function 'atoi' [-Wimp=
licit-function-declaration]
> +# tok_io.c:488:20: error: implicit declaration of function 'strlen' [-Wi=
mplicit-function-declaration]
> +# unproto.c:188:51: error: implicit declaration of function 'strcmp' [-W=
implicit-function-declaration]
> +CFLAGS +=3D "-Wno-error=3Dimplicit-int -Wno-error=3Dimplicit-function-de=
claration"
> +
> +EXTRA_OEMAKE +=3D "CFLAGS=3D'${CFLAGS}'"
> --
> 2.45.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8746): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8746
> Mute This Topic: https://lists.yoctoproject.org/mt/106277144/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

