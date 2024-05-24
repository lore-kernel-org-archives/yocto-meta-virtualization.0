Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26DFBC25B74
	for <webhook@archiver.kernel.org>; Fri, 24 May 2024 19:23:11 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web10.3794.1716578588760226996
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 24 May 2024 12:23:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Bas8BQlq;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2be00b445c2so1227805a91.2
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 24 May 2024 12:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716578588; x=1717183388; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uv698sbDhIKYo9dKbpYo/n8pAq9ftYUNr0v+kziZkGk=;
        b=Bas8BQlqFXQzOCKHKL5yaGnewNEPgDtj6g32x5xZDOYecIubCD2l3vP3HQfLZyOMXV
         1mCngkbBdvlhiU3ql7SdgcvVXULw5I4KacOUEGL39x4z+NdqaX8BGwDhgvLi7axBfM0m
         +O/Z5uOzcRtgLP0Z72RJS9LlYvG1U7CNzHOSkKk2gF1r3Lfvnm6dKU+ntUVID626+zGm
         FWgNfI7wu31EbxYjlzeCkqi7WG1JaOiH9QWfKXeK1s7UTH1+0oInyu9lIsW5gVHKG3vI
         okNZZGeupVsCuzr4chtkUWcFMl2NDxHSunQRwUswzcvpR8T/xNQlDHjjOzQQaWCTYraj
         7mow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716578588; x=1717183388;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uv698sbDhIKYo9dKbpYo/n8pAq9ftYUNr0v+kziZkGk=;
        b=MPo4wftkAZKSCudVj7IJlpykA5U72NlN1z4Tmy0wv5qTCTIAikQmdwBqIcthGsfmBe
         CdXmLkKF7KplB62OqXDjJi5IVD9fpvSWgavA3LQ+9R1zsT1Y5LiFDbN+T/I+luMW4nNe
         N8qAJF+93U7igfFlJkjQBsMVejaqw9P1swiBcbY/+hlBxrfPl6LFg0wzy25pxVVVvHHE
         Bgg5Nv+F+s3T4ebl28OlKVaiP0nRifl6zLdokV4807kPXsRbf4z2txzWcu1EOu5o+MCu
         3IiMLk0SvZ4bWMMY/Gal3zN5/NYho+tXBTdrFeg1whu06YfD3weOVuu4D3zFF7kHpAhG
         8FwQ==
X-Gm-Message-State: AOJu0Yxk4kgBhyJRwEJzZsiuDPz7UET9SqNrrmmczqc0fLqca/073Knu
	szJlQUmWhe++1MKXVDDA8KJRqld2KbJPStkabj2bsv8NeBAf9QeW+YxaCo5fHCqMlP+8ZvaUHk5
	EZ7YITHecDcylN3eUUBZxk7dnEOdtEA==
X-Google-Smtp-Source: AGHT+IFVwfdlF2puadkRLU8iv4w5FoTqCs3Mus1mdflII+e5TlQIKZG+zN1JBAGUSZYMuNwnoHavdNakMueIVnm8CVQ=
X-Received: by 2002:a17:90a:c208:b0:2b4:a57:4bee with SMTP id
 98e67ed59e1d1-2bf5ee1cbe4mr3119908a91.17.1716578588103; Fri, 24 May 2024
 12:23:08 -0700 (PDT)
MIME-Version: 1.0
References: <20240524190915.1241716-1-martin.jansa@gmail.com> <20240524190915.1241716-3-martin.jansa@gmail.com>
In-Reply-To: <20240524190915.1241716-3-martin.jansa@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 24 May 2024 15:22:56 -0400
Message-ID: <CADkTA4OXnCLo8B22HNcQFZWyqONuQQp0wXxwna6L7-_MOoJViQ@mail.gmail.com>
Subject: Re: [meta-virtualization] [RFC][PATCH 3/3] go-md2man: use GO_SRCURI_DESTSUFFIX
To: martin.jansa@gmail.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 24 May 2024 19:23:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8760

I've already got this one fixed locally, similar to the other ones,
I'll push to master-next once I test the image.

Bruce

On Fri, May 24, 2024 at 3:09=E2=80=AFPM Martin Jansa via
lists.yoctoproject.org <martin.jansa=3Dgmail.com@lists.yoctoproject.org>
wrote:
>
> * see:
>   https://lists.openembedded.org/g/openembedded-architecture/message/2007
>   https://git.openembedded.org/openembedded-core/commit/?id=3Dcc4ec43a2b6=
57fb4c58429ab14f1edc2473c1327
>
> * fixes:
>   http://errors.yoctoproject.org/Errors/Details/772683/
>   no Go files in TOPDIR/tmp-glibc/work/core2-64-oe-linux/go-md2man/1.0.10=
+git/build
>
>   http://errors.yoctoproject.org/Errors/Details/772689/
>   ERROR: QA Issue: go-md2man: LIC_FILES_CHKSUM points to an invalid file:=
 TOPDIR/tmp-glibc/work/core2-64-oe-linux/go-md2man/1.0.10+git/git/src/githu=
b.com/cpuguy83/go-md2man/LICENSE.md [license-checksum]
>
> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> ---
>  recipes-devtools/go/go-md2man_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-devtools/go/go-md2man_git.bb b/recipes-devtools/go/g=
o-md2man_git.bb
> index 1d96bb1b..73d8d167 100644
> --- a/recipes-devtools/go/go-md2man_git.bb
> +++ b/recipes-devtools/go/go-md2man_git.bb
> @@ -9,7 +9,7 @@ BBCLASSEXTEND =3D "native"
>  GO_IMPORT =3D "github.com/cpuguy83/go-md2man"
>  #GO_INSTALL =3D "${GO_IMPORT}/bin/go-md2man"
>
> -SRC_URI =3D "git://${GO_IMPORT}.git;branch=3Dmaster;protocol=3Dhttps"
> +SRC_URI =3D "git://${GO_IMPORT}.git;branch=3Dmaster;protocol=3Dhttps;des=
tsuffix=3D${GO_SRCURI_DESTSUFFIX}"
>
>  SRCREV =3D "f79a8a8ca69da163eee19ab442bedad7a35bba5a"
>  PV =3D "1.0.10+git"
> --
> 2.45.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8757): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8757
> Mute This Topic: https://lists.yoctoproject.org/mt/106287453/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

