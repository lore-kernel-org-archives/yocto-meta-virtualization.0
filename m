Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18F1DC25B74
	for <webhook@archiver.kernel.org>; Fri, 24 May 2024 19:22:41 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web10.3781.1716578552987638927
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 24 May 2024 12:22:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=A6DEfoL2;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-681adefa33fso944042a12.3
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 24 May 2024 12:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716578552; x=1717183352; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1nBNIAz2U3oNPKBi2InexUQLRm+05KGrFNljfAQ6DHc=;
        b=A6DEfoL2MYcFYmHzmLhGXobPAFERYp6XSxbxYq5qRowTs2IV2wjxSvaXF4uZyaNkcg
         J3vmACzfBcfWzv0toZ+d/TATpKK75vThKpNwdMjMTSK9I/7bGiCN9sQo3aSk2BZDaATz
         oNjh3x8AXU/cqiN+3qpCjmsYw43XMX6gHgT35Q4p6NcoauzwWWHbG7KOJX6GXoPZBTZK
         WHAWwUoZofqp78rNnPWmhz4xMBp87suFtcOgaP+WXZDoW1JiHOHxnUjHYf//tue0QOTr
         WXUK1v7wyOGDaUt3SvqkfEZfevFIvVzEpV9gSgzKfOKOSROW0fztWeYHCFueV0lLi1gJ
         lSuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716578552; x=1717183352;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1nBNIAz2U3oNPKBi2InexUQLRm+05KGrFNljfAQ6DHc=;
        b=JD97dBJUAGY4Sipuk47IdtwIbmVZLkADWD1zxYqdu+R8NprRsbxP6bh0AYc82lYEPs
         y+5RhDDxbVExUtYvLNfGudNkHSxSejxINihGlF21rQV42jaoq/axAWcDKjcKNR8H+nlJ
         fodpmbJ/ogl/MRSeGFPOhl4EZOcCOa/FGJO5uxfWRpM5iTFMuvpTP+hLBPlCcNefVfE4
         gYRbXoSUTKo4X6ElvLG8LKnYu7J5jUc+x33313PyS156XRFJzjP55l1EYVpoPkrJIHug
         Sdl3iTAwM90jjXHEg3hny8rcLIOaao5Maue8Af+2lDowOS1QUFB2LhkZbmmKaNipqydQ
         Y5gA==
X-Gm-Message-State: AOJu0YwbQPRRm0kTfhciJrTPMBH1H+VNMfnDAiC5hmBY5ODyj7ciYoe5
	5pA9bK+L5sPwJJAycIwfE1coXJ/8IC7jJXLPj3NREQaOj0QD+GZEi+0M87dsrc3ov+KkrQZYeyf
	OqERwUG0zxOuMj8ZmsKTGMT/jGZw=
X-Google-Smtp-Source: AGHT+IFRIChciMMNh5XL2xkxQD8hrbyrVWmlxGk5niVwGxomNsXHo8BBcX5s8vOyQ+fOl+uHblPahk6KJK6xcJQM3QQ=
X-Received: by 2002:a17:90b:46c6:b0:2b3:d512:d487 with SMTP id
 98e67ed59e1d1-2bf5f51aedamr3459779a91.39.1716578552317; Fri, 24 May 2024
 12:22:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240524190915.1241716-1-martin.jansa@gmail.com> <20240524190915.1241716-2-martin.jansa@gmail.com>
In-Reply-To: <20240524190915.1241716-2-martin.jansa@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 24 May 2024 15:22:21 -0400
Message-ID: <CADkTA4MJRMzVBZ7vksRw_+oHusHvGJhu9dQaL3HbwNKTvfaNJA@mail.gmail.com>
Subject: Re: [meta-virtualization] [RFC][PATCH 2/3] cni: use GO_SRCURI_DESTSUFFIX
To: martin.jansa@gmail.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 24 May 2024 19:22:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8759

Did you get this to build with just that change ?

My patches to cni are significantly larger to get it to build and
create binaries.

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
>   http://errors.yoctoproject.org/Errors/Details/772691/
>   ERROR: QA Issue: cni: LIC_FILES_CHKSUM points to an invalid file: TOPDI=
R/tmp-glibc/work/core2-64-oe-linux/cni/v1.2.0-rc0+gitb62753aa2bfa365c1ceaff=
6f25774a8047c896b5/cni-v1.2.0-rc0+gitb62753aa2bfa365c1ceaff6f25774a8047c896=
b5/src/import/LICENSE [license-checksum]
>
> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> ---
>  recipes-networking/cni/cni_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-networking/cni/cni_git.bb b/recipes-networking/cni/c=
ni_git.bb
> index b41b47cf..c0f316ec 100644
> --- a/recipes-networking/cni/cni_git.bb
> +++ b/recipes-networking/cni/cni_git.bb
> @@ -14,7 +14,7 @@ SRCREV_plugins =3D "b6a0e0bc96906f0d3bd6bfcaab0b5ae7229=
2f46c"
>  SRCREV_flannel_plugin =3D "6464faacf5c00e25321573225d74638455ef03a0"
>  SRCREV_FORMAT =3D "cni_plugins"
>  SRC_URI =3D "\
> -       git://github.com/containernetworking/cni.git;branch=3Dmain;name=
=3Dcni;protocol=3Dhttps \
> +       git://github.com/containernetworking/cni.git;branch=3Dmain;name=
=3Dcni;protocol=3Dhttps;destsuffix=3D${GO_SRCURI_DESTSUFFIX} \
>          git://github.com/containernetworking/plugins.git;branch=3Dmain;d=
estsuffix=3D${S}/src/github.com/containernetworking/plugins;name=3Dplugins;=
protocol=3Dhttps \
>          git://github.com/flannel-io/cni-plugin;branch=3Dmain;name=3Dflan=
nel_plugin;protocol=3Dhttps;destsuffix=3D${S}/src/github.com/containernetwo=
rking/plugins/plugins/meta/flannel \
>          file://modules.txt \
> --
> 2.45.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8756): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8756
> Mute This Topic: https://lists.yoctoproject.org/mt/106287452/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

