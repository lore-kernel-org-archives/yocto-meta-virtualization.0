Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CABDC4332F
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 14:12:04 +0000 (UTC)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
 by mx.groups.io with SMTP id smtpd.web11.11618.1699366322840546183
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 07 Nov 2023 06:12:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dauex8LY;
 spf=pass (domain: gmail.com, ip: 209.85.166.48, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-7a66b5f7ea7so214866939f.2
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 07 Nov 2023 06:12:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699366322; x=1699971122; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EFt35z3g51geN9c4QjuYZxYLVhtU46IcKW0ImHng4n4=;
        b=dauex8LYCAsqPF1zaLCTYRUF0d2nAx0bIhaxyPtWVkALg9+ljf+Jyr3fdm5OoQdLV9
         GOfmZ/L0pg/CJ8f+HYwq2WQgN3gcHaG4X0qI4qeBXCfbI1vgiwWah0liNUwXxWT2LKXO
         mB0ypM8FBsWG/nlLSQxx9HddTE0UfHpzxQQw4UBH+3yof/z+BmpnOrWKUfKVHQgrEmzM
         b7VmTFGJdI8T6gGmsVyFyem3Vt9FY55HMuFAztAG6hmTXrU/kuAJDgah1K45NtQ3zkwk
         qZw0MupdpaY9403NiWapOE18GBKf3YELDCdOVzaynHXgcrTJE45XZG4TQdD6UwiAiv8v
         cZkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699366322; x=1699971122;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EFt35z3g51geN9c4QjuYZxYLVhtU46IcKW0ImHng4n4=;
        b=Z849mBnDcB6AZXBUMLVuiWsJjLI6bpRZ//C+Uu2dVazwJ2xxZ8g0PWuJoxB2YDI4Zx
         cyy3rwa/tEe8wDnJmbQRRRyC4lGVeA3rrOzV8rOmfkqD6uHPxyQfiouvrClkpWXU6s4u
         mwdDz4jrau08CEScDp760kompRMUCOD2V7UeCqzZAhq/4sWtOk8sJaGKMkm+fM5TPf8x
         N/+mpSj2qg3CIbrSFiZHBN8OBgOu9Sfn+z2j7PSHoPf/vfhS+xahmpfELi/Y0hnbhIYT
         D2/ylnyZz3XJ9ZW+aJFxG525/pot5SyirNRf1x8bYIJnTXTohLawodeK8I5b93gv8CiU
         Fbyg==
X-Gm-Message-State: AOJu0YzuROsfMF3iF/BG+r4XllwgVYLUfqmm7bMayw3YWbFDo76JfHV3
	CgyhU05m2fp96usQ33EnB1ClerJiJnwcVw3HGW4=
X-Google-Smtp-Source: AGHT+IF/F19nnCfEv8gtZQfDLxcAxctZf6PhMhPSPMn+Gvnvr+XUPUBmcQlNpe1fmXDoQGL6ZERnz8hsc2/51fsjWpk=
X-Received: by 2002:a05:6602:2e8f:b0:792:7f26:dc95 with SMTP id
 m15-20020a0566022e8f00b007927f26dc95mr44632716iow.14.1699366322075; Tue, 07
 Nov 2023 06:12:02 -0800 (PST)
MIME-Version: 1.0
References: <CADkTA4ORrENvzkPYG_1EnDca-BQjhm4L3nj9e+ZfNer4wcd0Yw@mail.gmail.com>
 <20231106092058.1209687-1-alexander.sverdlin@siemens.com> <17950C6F5A95F7ED.26468@lists.yoctoproject.org>
 <CADkTA4P3NK9JQvsOX5729Le=NGLwG7LqGUVxq1KFn90RMMxfXQ@mail.gmail.com>
 <8b75984f95e392f776d732e43bcf60fbc7573b44.camel@siemens.com>
 <CADkTA4NK7z7obH3-9OE8LRRKNJ=7mJVz5XFbn36Nog4OkfS0Qg@mail.gmail.com> <642e2c00f27c5897f333d3f73a1c723fd0740c4d.camel@siemens.com>
In-Reply-To: <642e2c00f27c5897f333d3f73a1c723fd0740c4d.camel@siemens.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 7 Nov 2023 09:11:51 -0500
Message-ID: <CADkTA4NGhrRwZNfdi-2+SfhOqqMn5Tofakjvfyy1ebhcxVDnGg@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH RFC] kernel: allow KERNEL_META_TYPE redefinition
To: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
Cc: "meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>, 
	"adrian.freihofer@gmail.com" <adrian.freihofer@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 07 Nov 2023 14:12:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8443

On Tue, Nov 7, 2023 at 8:57=E2=80=AFAM Sverdlin, Alexander
<alexander.sverdlin@siemens.com> wrote:
>
> Thanks Bruce,
>
> On Tue, 2023-11-07 at 08:23 -0500, Bruce Ashfield wrote:
> > > > > Which is why if a kernel type that can merge fragments, but yet
> > > > > is disabling the feature specification, the layer should emit a
> > > > > warning. I'd then have another variable which inhibits the warnin=
g
> > > > > message. Since that is something I can ask about in bug reports
> > > > > and until the warning message is re-enabled, the reporter is on
> > > > > their own.
> > > >
> > > > My solution is now in master-next:
> > > >
> > > > https://git.yoctoproject.org/meta-virtualization/commit/?h=3Dmaster=
-next&id=3D45c2297a916516e5fc7b82dab46c4719590813b7
> > >
> > > I've tested your solution and it solves the issue on my side,
> > > thank you for addressing it so quickly!
> > >
> > > There is a problem in the warning code though, namely a typo here:
> > >
> > > skip_kernel_include_enabled =3D d.getVar('SKIP_META_VIRT_KERNEL_INLUD=
E')
> > >
> > > if it would be
> > >
> > > skip_kernel_include_enabled =3D d.getVar('SKIP_META_VIRT_KERNEL_INCLU=
DE')
> > >
> > > the warning would be emitted as expected. After the change both emitt=
ing
> > > and silencing the warning works fine.
> >
> > oops!
> >
> > I just force pushed the fix to master-next.
>
> Tested-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
>
> if it matters

It does! Thanks for the confirmation.

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

