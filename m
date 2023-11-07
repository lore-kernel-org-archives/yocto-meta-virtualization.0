Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 251A9C4332F
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 13:23:34 +0000 (UTC)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
 by mx.groups.io with SMTP id smtpd.web11.10184.1699363409181187540
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 07 Nov 2023 05:23:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=j85P78Fo;
 spf=pass (domain: gmail.com, ip: 209.85.166.46, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-7a692658181so188095939f.1
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 07 Nov 2023 05:23:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699363408; x=1699968208; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X8xKL9MWOrc3QdglOPUxb4mZoLFePiSEo3hGAzyFtAA=;
        b=j85P78FoZhZx0NMy9NvPnomqDyxJUbg4KuiZoMvNvblm0FKaIEzCRXB7hrb4sY6DtM
         qleygUy4hrsDQpyAP/LbkOH2sVabSOrqMn0P5YtfvnmXEuT7i2anvMYmb0NeOacvq/K6
         Z2yJUEoAIevopduzbd4OcCRs10v9Pwduv0u7EIjRyD+LhCK3wHwam0sDx40f/nVRwn2X
         d/ee8ImGcFWs673fda+yuvvgZXxi0nBnUtXsrIS5o/NB2+pPMLDuGrDOyuYs3KRKYzyr
         MDBIKCn3OYLr48d5n2lXoo5jyUrM9G1vUtf0dSagwlGEal7zFMI2RxgagTdS63u6LK+r
         wbeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699363408; x=1699968208;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X8xKL9MWOrc3QdglOPUxb4mZoLFePiSEo3hGAzyFtAA=;
        b=T+5eW9UE+ZaRLAbEaAAkPYZ1LlfVhWMac8UiDrYbx1eVpg3dIxvT6t6k53MNXfweul
         ZvRlY75/ZMUyy5i7nCBo60puz+UpTa15vbiyEP1yyGcLkXCl2Ot6ytYeq0WXRDo4xmY1
         Qg0slZt+ZoXDHnRzcvXUYT7VHBSiwxTuwQH3h0ZL9gL535RiZNE/V++1RQYMd67yv3Fu
         LS/+nHJ0Ug2QXsXcCP5Zs0S5nrD/Fjmuw4PrjIj+X0wTmAt73F2nPq0Gi7wvPKwbrqfK
         A2kYoOswRtdYS+lhLZ3/apvvZldOFtTZRJa/hvy9Va3PMqIcKLgo79zneWVehBYNZqYZ
         kwbA==
X-Gm-Message-State: AOJu0Yx6lGDZkR5TaYWcyvBCgqZKRU7kRAbMT9NWGUguqsfocCB19hWC
	h4VxDKsJtkxogqPC45yFEFZMC5SMphOxiJQ3jd8=
X-Google-Smtp-Source: AGHT+IGl1g9Ns/iSGylkna4+5CAophf/11Vzun0ClRdzucOYsJKhFaD+EJDeLdKNGTUW8Q05+sYjY4AGothQHF534Ow=
X-Received: by 2002:a05:6602:168c:b0:7a9:77ac:5446 with SMTP id
 s12-20020a056602168c00b007a977ac5446mr38586922iow.21.1699363408416; Tue, 07
 Nov 2023 05:23:28 -0800 (PST)
MIME-Version: 1.0
References: <CADkTA4ORrENvzkPYG_1EnDca-BQjhm4L3nj9e+ZfNer4wcd0Yw@mail.gmail.com>
 <20231106092058.1209687-1-alexander.sverdlin@siemens.com> <17950C6F5A95F7ED.26468@lists.yoctoproject.org>
 <CADkTA4P3NK9JQvsOX5729Le=NGLwG7LqGUVxq1KFn90RMMxfXQ@mail.gmail.com> <8b75984f95e392f776d732e43bcf60fbc7573b44.camel@siemens.com>
In-Reply-To: <8b75984f95e392f776d732e43bcf60fbc7573b44.camel@siemens.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 7 Nov 2023 08:23:17 -0500
Message-ID: <CADkTA4NK7z7obH3-9OE8LRRKNJ=7mJVz5XFbn36Nog4OkfS0Qg@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH RFC] kernel: allow KERNEL_META_TYPE redefinition
To: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
Cc: "meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>, 
	"adrian.freihofer@gmail.com" <adrian.freihofer@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 07 Nov 2023 13:23:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8440

On Tue, Nov 7, 2023 at 5:10=E2=80=AFAM Sverdlin, Alexander
<alexander.sverdlin@siemens.com> wrote:
>
> Hi Bruce!
>
> On Mon, 2023-11-06 at 19:57 -0500, Bruce Ashfield wrote:
> > > As I keep looking at it, there's very little in the .inc file that is=
n't
> > > controlled by a distro feature, so there's only small tweaks needed
> > > to make sure that only fragments and kernel features that are
> > > quite well targeted are enabled.
> > >
> > > Having the kernel-cache as a dependency is not much to ask,
> > > combined with the ability to use them to configure kernels
> > > properly and audit the results.
> > >
> > > The hours (more like weeks and months) spent debugging runtime
> > > issues due to incorrectly configured kernels has been huge over
> > > the lifetime of meta-virtualization. Asking for a few fragments to
> > > be downloaded (which can be mirrored) is minor in the scope of
> > > things.
> > >
> > > Which is why if a kernel type that can merge fragments, but yet
> > > is disabling the feature specification, the layer should emit a
> > > warning. I'd then have another variable which inhibits the warning
> > > message. Since that is something I can ask about in bug reports
> > > and until the warning message is re-enabled, the reporter is on
> > > their own.
> >
> > My solution is now in master-next:
> >
> > https://git.yoctoproject.org/meta-virtualization/commit/?h=3Dmaster-nex=
t&id=3D45c2297a916516e5fc7b82dab46c4719590813b7
>
> I've tested your solution and it solves the issue on my side,
> thank you for addressing it so quickly!
>
> There is a problem in the warning code though, namely a typo here:
>
> skip_kernel_include_enabled =3D d.getVar('SKIP_META_VIRT_KERNEL_INLUDE')
>
> if it would be
>
> skip_kernel_include_enabled =3D d.getVar('SKIP_META_VIRT_KERNEL_INCLUDE')
>
> the warning would be emitted as expected. After the change both emitting
> and silencing the warning works fine.

oops!

I just force pushed the fix to master-next.

Bruce

>
> --
> Alexander Sverdlin
> Siemens AG
> www.siemens.com



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

