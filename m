Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 395D5EB64D9
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 03:30:48 +0000 (UTC)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
 by mx.groups.io with SMTP id smtpd.web11.10481.1686799846329238691
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 14 Jun 2023 20:30:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=ORkBiREu;
 spf=pass (domain: gmail.com, ip: 209.85.166.49, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-777a4926555so10658939f.0
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 14 Jun 2023 20:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686799845; x=1689391845;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cNP/kONZ3uQimRaygIGDGnScghBxEUj5WszC2IFFqbA=;
        b=ORkBiREuK04+ZHZLuyTKVHdO/otlY3hR2VMLeG/cYAADAluTYVBFciWIhMv6rEYeUj
         Nszbq1vUQpIhJf+zLfUQtAq+SM08GWkVCuPTblbPidNhwB0s8R2oozYItgoIAUS/X1Vs
         meKyxYQAeSCcm845M7sInOGGELNu6S2BilAmc2TxI4CIxwVY92xDPh2YLtinDlsfJLXh
         SgitTuHycnIN1L30cJbTTLE7USWah4IxxSGiJ/AgKjFYgYhBKQVNDfuuGnjJndusqscW
         6kZ/08QMySRlZGmLsPfOLq4P6zo1a13CwEeTlzpeqex0PM/gSdBbPADFj62pPWGYKgtU
         l6ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686799845; x=1689391845;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cNP/kONZ3uQimRaygIGDGnScghBxEUj5WszC2IFFqbA=;
        b=AEKA19DMkC5XlVT8m0IPBoyl8tjullErfMlvLFjfWcq999tqpjElqnkmABnhrKMYKj
         1PHZTKZhXvUL0gTH7EnAgTP+IhHygIrB5olIYsy3bACYnFZrj1pWq+XMv56k1t+dcl5Q
         Opj+x9jRF2phqMNTdMOSDAyrbq0g3LBSmouz1BE1xk/WZ6DWFxAuo7Qzd/7kDXpEbItD
         t00LzCIikBhWEc+HqRxMVofx/fvrIJKTI6ll7ynLFFUty8ejm+RwJzJTq+oPqvcqYdeu
         mDq+/55hRMiDjidZspne3mm8BGntWLBJYHqE1baiHsZZTALgHHb/2Q8QuzGaSxE04nzm
         Lsdw==
X-Gm-Message-State: AC+VfDwMeV2V7ZjgSXzGSPMAA120usDLVIxp6+yTHDiur/yUHqP8SPjw
	p8iRZc2gIUShsLP05lyViktcDe3dmXOwWPCE4fo=
X-Google-Smtp-Source: ACHHUZ7YPsX2Weh1B6ZLfPJXrVYGdt/f8og0XL5tMfBtBaO4SHU3mHbCj1xLvd94fSOJnP2z9R6w/uf/Mf4mreyPMvY=
X-Received: by 2002:a05:6602:2807:b0:76c:5b24:dfca with SMTP id
 d7-20020a056602280700b0076c5b24dfcamr2335304ioe.2.1686799845283; Wed, 14 Jun
 2023 20:30:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230612161712.3586578-1-Martin.Jansa@gmail.com>
In-Reply-To: <20230612161712.3586578-1-Martin.Jansa@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 14 Jun 2023 23:30:40 -0400
Message-ID: <CADkTA4OZi7M=NzcihuF9UijAf6UkkvVzVSdhG1B-sKL5kobq+A@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] libvmi: add dependency on autoconf-archive-native
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 15 Jun 2023 03:30:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8097

I've been distracted working on the 6.1 intermittent boot hang, but
will get to this shortly!

Bruce

On Mon, Jun 12, 2023 at 12:17=E2=80=AFPM Martin Jansa <Martin.Jansa@gmail.c=
om> wrote:
>
> * since https://git.openembedded.org/openembedded-core/commit/?id=3D57113=
2415ea7fe2d91c62948f2b6aa553eafa83d
>   this doesn't get autoconf-archive-native dependency and fails with:
>   http://errors.yoctoproject.org/Errors/Details/708195/
>
>   ./configure: line 14424: syntax error near unexpected token `-fno-stric=
t-overflow,'
>   ./configure: line 14424: `  AX_CHECK_COMPILE_FLAG(-fno-strict-overflow,=
 HARDEN_CFLAGS=3D"$HARDEN_CFLAGS -fno-strict-overflow", , -Werror )'
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  recipes-extended/libvmi/libvmi_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-extended/libvmi/libvmi_git.bb b/recipes-extended/lib=
vmi/libvmi_git.bb
> index 6338b80..25d7d40 100644
> --- a/recipes-extended/libvmi/libvmi_git.bb
> +++ b/recipes-extended/libvmi/libvmi_git.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING.LESSER;md5=3De6a600f=
d5e1d9cbde2d983680233ad02"
>  SECTION =3D "console/tools"
>  PV =3D "0.14.0+git${SRCPV}"
>
> -DEPENDS =3D "libvirt libcheck bison fuse bison-native flex-native"
> +DEPENDS =3D "libvirt libcheck bison fuse bison-native flex-native autoco=
nf-archive-native"
>
>  SRC_URI =3D "git://github.com/libvmi/libvmi.git;branch=3Dmaster;protocol=
=3Dhttps \
>             file://0001-Build-vbd-only-when-xen-is-enabled.patch \
> --
> 2.41.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8096): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8096
> Mute This Topic: https://lists.yoctoproject.org/mt/99486831/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

