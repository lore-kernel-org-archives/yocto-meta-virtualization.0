Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web09.6627.1637589784763752495
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 22 Nov 2021 06:03:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pf383fuX;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id v1so43920228edx.2
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 22 Nov 2021 06:03:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3/y4yw8ySPeAjV8ehJQdTet3gdydm0/UM8JRtHGIVPM=;
        b=pf383fuXOqJsSqsV9NEYckKTr4N/hXWQVOnzA68SclPTTSN4glVesB4ANHDtZwyBqr
         kN+mIF9jUmZZdaRNx7THd6V35b06fnGGKZflrbYWPt7qNH49UC79tv+G4793i9AZhI1l
         BHf8jkNCxiitDei36STgCw1MtMF5iOQJSHiOUyFfjZwUKeG3A0pRL5CaQtLj94It6bWe
         nNfwppwGt77sOBSUwjWTXZqVAKlyqTn1X4/4sSdo3wGszM4RheSB23ul8p3PXCsAUCgX
         mkrcSQcpffOAMcAebH+4Xdk8ftzhaML5HybPQAGikBvkF1dr2ucseRf/JcD4NgkKrvsk
         /ACQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3/y4yw8ySPeAjV8ehJQdTet3gdydm0/UM8JRtHGIVPM=;
        b=7kGDC2gL+MyY+7avMu8nbWT/qsJ9Tve3WA69cqsHRg1pFX51XFT60qnfimCFnHdNqR
         hKDpGuedS6IHUlLgdrGhgzC3iDZsU4Sjv1z4fiuba8YifbHqxuvC3hlh5QcteEKsTc4Q
         ixu2aqhLjo4KTTZbK5iY39jBtBOL/EPruMYz+cHEB5u9Gn540gFOEFXC7+KCRoigEPvv
         INS2dS1UprHIq8N+osGlnRMcKwf+W00oIKJ4aKe6iZGzoQEXPwCa0PUiUZ1WHfRvUGBe
         3VKskNwF+/Kyrst4r/dUL9p1iN1EJTr8ydXm0lXhkpTd0+LJjc1MIelAev3rxtO+B/0m
         YlKA==
X-Gm-Message-State: AOAM530h1f301RrXWKN90Igga+aUSUgRQe3j4XW3LPW6g/DxvxRFt4aU
	fBN8C0qvi4ZnypFEFAAdJn2Lq3tKualUol48Cvw=
X-Google-Smtp-Source: ABdhPJyb1qrfnyKEIjzFW67TAFg9N1GTpMoXhy+6R1KJjSdtAcZhH+WM8pdr/fOLVnCN6UN0npv53mJ0vPisII1DXsc=
X-Received: by 2002:a17:906:314e:: with SMTP id e14mr41160179eje.165.1637589778790;
 Mon, 22 Nov 2021 06:02:58 -0800 (PST)
MIME-Version: 1.0
References: <20211122073735.99777-1-Qi.Chen@windriver.com> <16B9E2BFEBABA343.12459@lists.yoctoproject.org>
In-Reply-To: <16B9E2BFEBABA343.12459@lists.yoctoproject.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Mon, 22 Nov 2021 09:02:47 -0500
Message-ID: <CADkTA4P3_dGXufv0JVr_g8iuko9GTYpWnmjYNY09YOYgb-mefA@mail.gmail.com>
Subject: Re: [meta-virtualization][hardknott][PATCH] containerd-opencontainers: bump to v1.4.12
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Chen Qi <Qi.Chen@windriver.com>, meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 22, 2021 at 8:54 AM Bruce Ashfield via
lists.yoctoproject.org
<bruce.ashfield=gmail.com@lists.yoctoproject.org> wrote:
>
> I already have version bumps for all of the related components under
> test, they'll show up in master-next shortly, and should cover this.
>

Aha. My mistake, I didn't see the branch you specified. I'll merge
this to hardknott shortly.

Bruce



> Cheers,
>
> Bruce
>
> On Mon, Nov 22, 2021 at 2:37 AM Chen Qi <Qi.Chen@windriver.com> wrote:
> >
> > Bump from v1.4.4 to v.1.4.12 so that some CVEs are resolved,
> > e.g. CVE-2021-41103.
> >
> > Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> > ---
> >  .../containerd/containerd-opencontainers_git.bb               | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/recipes-containers/containerd/containerd-opencontainers_git.bb b/recipes-containers/containerd/containerd-opencontainers_git.bb
> > index 774a28c..7f6c75d 100644
> > --- a/recipes-containers/containerd/containerd-opencontainers_git.bb
> > +++ b/recipes-containers/containerd/containerd-opencontainers_git.bb
> > @@ -5,7 +5,7 @@ DESCRIPTION = "containerd is a daemon to control runC, built for performance and
> >                 support as well as checkpoint and restore for cloning and live migration of containers."
> >
> >
> > -SRCREV = "409c87ba59dd96965239573aa9458a3585c05468"
> > +SRCREV = "7b11cfaabd73bb80907dd23182b9347b4245eb5d"
> >  SRC_URI = "git://github.com/containerd/containerd;branch=release/1.4 \
> >             file://0001-build-use-oe-provided-GO-and-flags.patch \
> >             file://0001-Add-build-option-GODEBUG-1.patch \
> > @@ -15,7 +15,7 @@ SRC_URI = "git://github.com/containerd/containerd;branch=release/1.4 \
> >  LICENSE = "Apache-2.0"
> >  LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=1269f40c0d099c21a871163984590d89"
> >
> > -CONTAINERD_VERSION = "v1.4.4"
> > +CONTAINERD_VERSION = "v1.4.12"
> >
> >  EXTRA_OEMAKE += "GODEBUG=1"
> >
> > --
> > 2.33.0
> >
> >
> >
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
