Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web10.5500.1625057330393859476
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 30 Jun 2021 05:48:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Cw8f32/a;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id u20so3072779ljo.12
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 30 Jun 2021 05:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rgaOALJwBKWTUhX9qKMdhb7KyWs0SwmUOZQ9W72vxVw=;
        b=Cw8f32/ahVrR2XnTA7dG77UeHOA7LT8sZwOgcXsxzKJd5GzFoOL/NsKxwBP3Y7wMk3
         ajLV86fePa1lnN1ewnbWby6ErLTNdNm1ROgsh7LPpfOI2ngfnqGtBXfxcnkx1zkgXGQn
         lpA+3q1QI1XaE8Jpqv9tXRzYuywquOUQ9inqCWqY+rgUEFwdzfdfmETRdMWqUNuaFvqM
         vTVbc7VBYti0LYQAZ1xIRn726JE9GNSxnvvhR5UkUlac1iSp+2a1AyozbMy4WVsXxySR
         9UktZOVHP0ymXQI7IaPIDjx6MyLYwzcPpUYmmUlosCS7UaylK2QYdZoTXtuAeGF7vevn
         Kf2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rgaOALJwBKWTUhX9qKMdhb7KyWs0SwmUOZQ9W72vxVw=;
        b=XfsofsgZf1XfYcH249dlF+s0A8tOlT4CejAKz7RwiwEScuvCg96Z12XcCdajRYFzj0
         nKgmc09xpm+N5gLGbS9jVwmshV1BDxLecKV3rWnaQ9XXPBocXvfkMciSN7bnPVLLa8As
         Yx4deBvfg3Zxp+GGM9/y+Os2cm7oHgooLXMW5cJm3oFd7DYQqnUZJNuHAfPAdxf5BRX3
         k2DzXBaThSzWU3N1A172OrtGArE5lQGXg/qJx1LlSGTgjv83i6l2WnqMzRCsP4agwaXa
         RWhAPBO3yMA2JDNxCtVNG3KvliCPq1PSPhN7sN/u9U8JUD0p4bIZ8KOcQfdVElj+OOWa
         QgeA==
X-Gm-Message-State: AOAM531x71L+qRMsRt6m3kKqu7bSaOZJONm1Td+FzljQkWFMTM+azsnU
	OdY6MGEfDkGPudeQSK+YK0vbZGDdeNJYKMVRLAI=
X-Google-Smtp-Source: ABdhPJwruSL+AlFECrwNIbLPq5R01Guj55U/hgVxNjr95OzHtLJI+WLXAQzj0G47ivHpZGJPUsqyl/HYQeToGu/LuUo=
X-Received: by 2002:a2e:8019:: with SMTP id j25mr7616182ljg.263.1625057328538;
 Wed, 30 Jun 2021 05:48:48 -0700 (PDT)
MIME-Version: 1.0
References: <d9bb229282006df4f0bf945346312e1b53145a1e.1624561041.git.diego.sueiro@arm.com>
 <CADkTA4Or9D4H3imLR9Pqgu2CB4VGPJO8Ng8qgReB0ridu=F_yQ@mail.gmail.com>
 <CA+chaQfm5Q4dX8xE42N2GfPKZwWwZa3pR4ttH=jwX34PXkLz1Q@mail.gmail.com>
 <CADkTA4P7gGBGTBdVLTFdSGiX5DDoHZc7ymmrcre+ifPA=vG7fA@mail.gmail.com>
 <AM6PR08MB3461FE3409922F52F7A6ED2592069@AM6PR08MB3461.eurprd08.prod.outlook.com>
 <CADkTA4O5XShSxFr-5EASoKrTdqXY1z2XsJ5CF376cOoR2Ap+Jw@mail.gmail.com>
 <CA+chaQeZG57ZxMd+wOc4pUfNJLF61ZK8tOkKPmN6Eph9iiDYHg@mail.gmail.com>
 <AM6PR08MB34615D753470426E1679E0A192069@AM6PR08MB3461.eurprd08.prod.outlook.com>
 <168BDC4B6AEEB1F5.20368@lists.yoctoproject.org> <168BDC756BE2FF71.10690@lists.yoctoproject.org>
 <CADkTA4PNTH0nUb8XH-UcD2+vfA6zYbRVu9ETy9M7HhrC9QMiTw@mail.gmail.com> <dff2419f8628febf129a41d00cd11dc66465d21b.camel@linuxfoundation.org>
In-Reply-To: <dff2419f8628febf129a41d00cd11dc66465d21b.camel@linuxfoundation.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Wed, 30 Jun 2021 08:48:36 -0400
Message-ID: <CADkTA4PYKZTsgZP9R5Wjpa4-GbvEP+vu5ZKQRCDSDuFNrEwg+w@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 1/3] podman: Add seccomp as REQUIRED_DISTRO_FEATURES
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Diego Sueiro <Diego.Sueiro@arm.com>, Martin Jansa <martin.jansa@gmail.com>, 
	"meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>, nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 30, 2021 at 3:58 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2021-06-29 at 23:27 -0400, Bruce Ashfield wrote:
> > On Fri, Jun 25, 2021 at 11:21 AM Bruce Ashfield via
> > lists.yoctoproject.org
> > > > That is the core of what I was asking. A package that is now in core,
> > > > why is it only enabled by a distro feature ?
> > > >
> > >
> > > And for clarity, I realize that the systemd recipe checks for the
> > > systemd distro feature .. so that is similar. But systemd is one of
> > > many init managers, so I can see why it is used.
> >
> > I still don't have a better solution to this, and while I see about
> > getting seccomp behaviour changed in core, I can get this into the
> > tree.
> >
> > I've added the extra seccomp dependent recipes and expect to merge
> > this on Wednesday.
>
> The reason for the distro_feature is to have a way to configure multiple
> packageconfigs on/off centrally. Some platforms don't support seccomp
> at all (riscv/arc) so forcing it on everywhere isn't possible.
>
> I think we can remove the DISTRO_FEATURE restriction in the seccomp recipe itself
> in core and replace it with a COMPATIBLE_HOST declaration.

That would be preferable on my end, since these recipes that depend on
seccomp unconditionally, are also incompatible with that same set of
hosts (I state the obvious here).

>
> We could also add the option to the default distro backfill.
>

I'm not as familiar with the backfill and when it should be used, but
I'll have a look at doing both of these for the seccomp work, and then
update the meta-virt recipes that can be simplified.

Bruce

> Cheers,
>
> Richard
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
