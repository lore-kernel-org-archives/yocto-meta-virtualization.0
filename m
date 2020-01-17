Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com [209.85.167.65])
 by mx.groups.io with SMTP id smtpd.web09.673.1579289044280396183
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 17 Jan 2020 11:24:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fPzobikh;
 spf=pass (domain: gmail.com, ip: 209.85.167.65, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-lf1-f65.google.com with SMTP id r14so19201817lfm.5
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 17 Jan 2020 11:24:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1DI5eeiKC7Cua3mta+H3iTB1aarY+wWn+MkMULt+7YM=;
        b=fPzobikhUG4sh2xy5MQDUqoEMKvEFBJsKlFq4rHgvoTsrj7b7xu/23VcHsGnU2pxrV
         r4AytWDujN46bbYjhRhy5jXuDDY4QJpUHdD0b35mjNexT5HLf577WtDh3oI1ivULZTbe
         6CtUU/OZkUGSgRW8djaCLRz9XQy5EDdsy1qRx0BWeFtNbn1uPLCUO75yQcJuHz0JlIfT
         3xIm5Uz11EdldqteUGBRywDfA2DCQ2bj+F7qeXPDaapf0A0P0Lhh/8iwrgb0z70Y3lw7
         Aj+5LAm1ZGsyBtRHdvM2mP6Fws5UN1PXqzseBDdamlhlHFw5SjM6RelYX2EgqFhEqdpg
         aDag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1DI5eeiKC7Cua3mta+H3iTB1aarY+wWn+MkMULt+7YM=;
        b=CQFXDaOyHh1Os7U/eFblWxbbdebJo8MFwb0eV5lJXrqKyLsvo6RsqoimPs7+O3VpRh
         nzxtnPaGt9smmTzNiZ1nwgG7WOp8QolcajizmGZK8CC4ash5CkJpxRSdvF6PQ2bg+RV2
         FYwgiOr7GsGgcBhna5Yaou0dDGlYoVM73rhv7GRf0mCQr+FUHimvsvp32aI9rd559+lN
         jvbvPHrfamYwhvuFV8935PSlAjtQ5rgZfsLUHC0jdYBvTv+qgWuD8irxYm0RIbXyFc5s
         CNPhAVNBmVaVQPRT9DGVt1DOb4nKaKI1xZ2axUNeK0tXigqzHWW//FdIaAKnZGN9v33o
         Fh+A==
X-Gm-Message-State: APjAAAW5/M7lLBQv/vSOaPlwUHZ5R92mP0cE4yyv7cndGrEkgGVE8ZYX
	dk9nNHYFLwCWX4EYjLraLaPGrQ4SfaMbhxzp9IU=
X-Google-Smtp-Source: APXvYqxDu08/vg0OadHcSnYFzfAvltLTsxHMJfv9xxtb5VfPBSBrSfqbTyuxf9ax51J9zo3jRwh7sQqpfoGkq4yh/bc=
X-Received: by 2002:ac2:5f65:: with SMTP id c5mr6413872lfc.207.1579289042326;
 Fri, 17 Jan 2020 11:24:02 -0800 (PST)
MIME-Version: 1.0
References: <20200113154742.15509-1-brendank310@gmail.com> <20200113154742.15509-3-brendank310@gmail.com>
 <15EA88ECCB8B1E8F.22146@lists.yoctoproject.org>
In-Reply-To: <15EA88ECCB8B1E8F.22146@lists.yoctoproject.org>
From: "Christopher Clark" <christopher.w.clark@gmail.com>
Date: Fri, 17 Jan 2020 11:23:51 -0800
Message-ID: <CACMJ4GYxgYfkdyxpF25je6D3prDeFamkj2AaCPvVYg4zeL0t9g@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH 2/3] xen: add package for xen-ucode
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: Brendan Kerrigan <brendank310@gmail.com>, meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 16, 2020 at 5:39 PM Christopher Clark via
Lists.Yoctoproject.Org
<christopher.w.clark=gmail.com@lists.yoctoproject.org> wrote:
>
> On Mon, Jan 13, 2020 at 8:16 AM Brendan Kerrigan <brendank310@gmail.com> wrote:
> >
> > From: Brendan Kerrigan <kerriganb@ainfosec.com>
> >
> > Signed-off-by: Brendan Kerrigan <kerriganb@ainfosec.com>
>
> Reviewed-by: Christopher Clark <christopher.clark6@baesystems.com>
>
> > ---
> >  recipes-extended/xen/xen.inc | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
> > index a77b0d7..ed56e38 100644
> > --- a/recipes-extended/xen/xen.inc
> > +++ b/recipes-extended/xen/xen.inc
> > @@ -74,6 +74,7 @@ RDEPENDS_${PN}-base = "\
> >      ${PN}-fsimage \
> >      ${PN}-scripts-block \
> >      ${PN}-scripts-network \
> > +    ${PN}-ucode \
> >      ${PN}-xen-watchdog \
> >      ${PN}-xencommons \
> >      ${PN}-xendomains \
> > @@ -216,6 +217,7 @@ PACKAGES = "\
> >      ${PN}-scripts-network \
> >      ${PN}-shim \
> >      ${PN}-staticdev \
> > +    ${PN}-ucode \
> >      ${PN}-volatiles \
> >      ${PN}-xcutils \
> >      ${PN}-xencommons \
> > @@ -673,6 +675,10 @@ FILES_${PN}-shim = " \
> >      ${libdir}/xen/boot/xen-shim \
> >      "
> >
> > +FILES_${PN}-ucode = " \
> > +    ${sbindir}/xen-ucode \
> > +    "
> > +
> >  FILES_${PN}-volatiles = "\
> >      ${sysconfdir}/default/volatiles/99_xen \
> >      ${sysconfdir}/tmpfiles.d/xen.conf \
> > --
> > 2.20.1

After a bit more testing with this, I think this commit should be
revised: adding the ucode package to RDEPENDS_${PN}-base breaks the
compatability of xen.inc with versions of Xen prior to 4.13, where
that package is not produced. Adding it instead to
RRECOMMENDS_${PN}-base should avoid that, and I think better reflects
the status of that tool as recommended but still optional.

Christopher


> >
> >
> 
