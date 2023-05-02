Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7C1EC77B78
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 20:55:45 +0000 (UTC)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
 by mx.groups.io with SMTP id smtpd.web10.2237.1683060939860197137
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 02 May 2023 13:55:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=I5icruv+;
 spf=pass (domain: gmail.com, ip: 209.85.166.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-3311482ae2cso4620605ab.2
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 02 May 2023 13:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683060939; x=1685652939;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0QER5WyR6vYfgDZv3yRRWnqZ27spjY2h3qPQ8xOlt5g=;
        b=I5icruv+B3s5Vv5O7JERGPiJzRGVf/xbi94dtCKcCkhNeYyl/FKa5M8qByaQclauJv
         O/lC1P3IWLZH29Qy5tfGCsrazomNavX6ewIH3cvQMn3nZZrybJax3FUWvBaCTMqP9OuI
         gwUL5YiVaXYn6J0+IRUHY6TGP2tYehpgQ2+wilQO6g9fy+m6aVCn+U79sbqehXvOW+gw
         F8tw0N61/b6rfozLQQPQUy+IgvbRQwgstmfkK7r1D294GftAf/uyMxwGbfGzZZH4g4DZ
         Pjtn17oy3eS5iJK1+Mx3fl+5gZbAnyZ2CldxJxzup+J0caBhOP2SlvyDxAk1JjYxMmbg
         AYtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683060939; x=1685652939;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0QER5WyR6vYfgDZv3yRRWnqZ27spjY2h3qPQ8xOlt5g=;
        b=fK9oUA4rZWkUvZymZWfbpopIR/2QbfNB9OteJV6W8jO6G+s3IZ6dj4BhSDep3nEhgu
         JkD/xoreh3KROKXIiwOkZEdRasLb7iDCCdDnFCcGGmO28AkA4wWOKAotS5Xmh2FP2tzy
         b0WXV0KW4n4/H651/pG8Cuk3AXuktuZZ+7/TKLga/dJHaB2vrneT29NgLW2vy9hL3Ajb
         IfWRh4s7PZN8r/+Z5HIKG1TxJ3Qo/qk/1OjcyZNE9U4VifE4cwGSBKe/0s0ODuRDOTfr
         dXdSXOgDushPUP+ugaeItZOLaJfgRldylvmPxBqwpEbIHw+GQp4mGpLNeQpbffSirzBB
         oZhA==
X-Gm-Message-State: AC+VfDxS2d7J40d2D2jyyKrAXHD3UarBajjXtqfHm4KHLzCbJjRY/jgT
	Ibesj/w0HuK8siHL8dlobj6LShvfyr5cP6NwJ7c=
X-Google-Smtp-Source: ACHHUZ4sYHavbwzFsrMROoRatj4+rjAp3li6Dyz0dY8aMtkRGhW3Ci701jWtEnLrKP/IEW6u94m/0+yq+VF1ZMY+b4o=
X-Received: by 2002:a05:6e02:5cd:b0:325:b96e:6701 with SMTP id
 l13-20020a056e0205cd00b00325b96e6701mr13672124ils.2.1683060938935; Tue, 02
 May 2023 13:55:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230502202631.2102074-1-pkj@axis.com> <20230502202631.2102074-4-pkj@axis.com>
 <CADkTA4MENogff6ezzKLjf4AY=4NanzAGT98H=WeHN9YxbsDMSw@mail.gmail.com> <DB5PR02MB102132B06A11ED31A99E7B751EF6F9@DB5PR02MB10213.eurprd02.prod.outlook.com>
In-Reply-To: <DB5PR02MB102132B06A11ED31A99E7B751EF6F9@DB5PR02MB10213.eurprd02.prod.outlook.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 2 May 2023 16:55:31 -0400
Message-ID: <CADkTA4NyX6qOzoiDrn_EX+MbdY7NV1TiS_uxT3=k--kSWeJMLA@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH 4/8] aardvark-dns: Fetch the crate
 instead of the Git repository
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 02 May 2023 20:55:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8030

On Tue, May 2, 2023 at 4:48=E2=80=AFPM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> > -----Original Message-----
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > Sent: den 2 maj 2023 22:41
> > To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > Cc: meta-virtualization@lists.yoctoproject.org
> > Subject: Re: [meta-virtualization] [PATCH 4/8] aardvark-dns: Fetch the =
crate instead of the Git repository
> >
> > On Tue, May 2, 2023 at 4:26=E2=80=AFPM Peter Kjellerstedt <peter.kjelle=
rstedt@axis.com> wrote:
> > >
> > > Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > > ---
> > >  recipes-containers/aardvark-dns/aardvark-dns_1.2.0.bb | 8 ++------
> > >  1 file changed, 2 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/recipes-containers/aardvark-dns/aardvark-dns_1.2.0.bb b/=
recipes-containers/aardvark-dns/aardvark-dns_1.2.0.bb
> > > index 10901eb..ac2fc6d 100644
> > > --- a/recipes-containers/aardvark-dns/aardvark-dns_1.2.0.bb
> > > +++ b/recipes-containers/aardvark-dns/aardvark-dns_1.2.0.bb
> > > @@ -4,15 +4,11 @@ HOMEPAGE =3D "https://github.com/containers/aardvar=
k-dns"
> > >  LICENSE =3D "Apache-2.0"
> > >  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D86d3f3a95c324c9479bd89869=
68f4327"
> > >
> > > -SRCREV =3D "cb1a462dd8427e33355f6907394a0646f5a26bf2"
> > > -
> > > -# how to get aardvark-dns could be as easy as but default to a git c=
heckout:
> > > -# SRC_URI +=3D "crate://crates.io/aardvark-dns/1.2.0"
> > > -SRC_URI =3D "git://github.com/containers/aardvark-dns;protocol=3Dhtt=
ps;nobranch=3D1 \
> >
> > I much prefer the git fetch, and am inclined to reject this part of the
> > update.
> >
> > Is something actually broken with the git fetch ? If we can't mix the
> > two, then I'm inclined to say the crates support is broken.
> >
> > Bruce
>
> While this change is not strictly necessary, I was looking for
> some recipe in the common layers to serve as example for how to
> use the crate fetcher to fetch the source for the recipe's source,
> and these two were the only ones I could find that fit the bill.
>
> Be aware that this and the corresponding patch for netavark do
> not work until the functionality in the crate fetcher has been
> restored to support fetching the recipe's code using it (see my
> patch to bitbake-devel from a couple of days ago).

I'm not following the rust and crates discussions too closely, but I
am always a supporter of the revision control history in the source.

As the one who ends up fixing, bumping and otherwise maintaining, I
need that granularity and insist on it when I can.

So in this case, let's leave it as git and from my reading of the
bitbake patches, we shouldn't see the issue as we have no crate
matching the recipe name.

I do appreciate the cleanups, but there are other things I'm putting
as a higher importance (the revision control history).

Perhaps leave the fetch-the-main-source-as-a-crate in the recipe as a comme=
nt ?

Bruce

>
> //Peter
>
> >
> > > +SRC_URI =3D "crate://crates.io/${BPN}/${PV} \
> > >             file://run-ptest"
> > >  require ${BPN}-crates.inc
> > >
> > > -S =3D "${WORKDIR}/git"
> > > +SRC_URI[aardvark-dns-1.2.0.sha256sum] =3D "1f9d011e5edaa6e0fa055e383=
bec03a46c9ef35dfa346883aeb5bf86b794a949"
> > >
> > >  inherit cargo cargo-update-recipe-crates features_check ptest
>

--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

