Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53508CDB474
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 14:01:39 +0000 (UTC)
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
 by mx.groups.io with SMTP id smtpd.web10.216484.1697551292007487692
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 17 Oct 2023 07:01:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cz+Sv6s6;
 spf=pass (domain: gmail.com, ip: 209.85.166.50, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-79fa5d9f3a2so218153339f.3
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 17 Oct 2023 07:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697551291; x=1698156091; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NAioLQQKSMZuCoSUU5EIqNVzHyQodw48N3HkAidfXxw=;
        b=cz+Sv6s6R9vXVP+Mlz6wVMhJD9CMojS5CWO3TKhIT7piEuvEZRz482UYEgboiC7QBR
         lIMycULTtes9D4TxJX7ex5jLLekEVroKMvu7fGiA3f5nwYf15gifBus3+nXYSsAdkmYp
         ghbtQp2ZTESjDEJKu/suT2aurcELzTHzq32SHsV3xsG7nkZR5aHTFc3JMoETuDhmZn4A
         JB+mnfiPdtdnDjLw9GAQVUgULqPmNZJWiQxMkhpW65QFY2wK5MH3mn9gDTqhSHSSipG0
         Uq2BxpMHwyAhYpGz+U+NEuxLnzBQBCT8v4EnAW4n40wPp5PQ1dWWiJw5t8bAiJ20P79B
         xxAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697551291; x=1698156091;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NAioLQQKSMZuCoSUU5EIqNVzHyQodw48N3HkAidfXxw=;
        b=DN8qdlLWYtYxnGwqW34aDZRJj7Tv9nzyRR/G/CxfA9FOigbnuPPbbhWB48piHb52b2
         b/tnb7RZYqVx0fsXUvmxwr+BVqoCriYyW33uSveT0X9Eo8GL85jvi8snYeyk5p7ZK/ap
         lw5TqzUHV38XTWIA4rjObCN5l648BcuuOHJdYbmY7HiZi3cqUUafkP6iPcQEbV/+b3W/
         1btMUkgY0uVYZQwiyE1K2yKp4N7bYQkteacRZ9hF6mP7ffw2avCIC6lLYYQqjXSDVyMi
         pIjNUG5o2l74G9lvC+IT3KAsjJ37vfV5TL5WNWovg25LXSd5ckxBpUm3Fsi/scVZ7TeZ
         H+6Q==
X-Gm-Message-State: AOJu0YwfSjTRmn/cXyI8YwUB+7+CXWpncc9lBzv15nVsUvPwuE4evpxa
	N1ygUjqxAy6q9QIwHa83VCfHEKvrKFeNqbP6JOQ=
X-Google-Smtp-Source: AGHT+IFYnxzr6ds3PyQMllaHwg+jhiRdVtJ7xg5CMSi2G05mD7P985SiseEDs5MRIboVoyh9RwzIv3bxXlEGjN8Zyck=
X-Received: by 2002:a05:6602:1584:b0:79f:a25b:51c with SMTP id
 e4-20020a056602158400b0079fa25b051cmr2904234iow.11.1697551290844; Tue, 17 Oct
 2023 07:01:30 -0700 (PDT)
MIME-Version: 1.0
References: <20231016212626.2146963-1-JPEWhacker@gmail.com>
 <CADkTA4P_isu6k8b=jp37=2BdfO6ka_WziiPTT0+__qAnPsa4pw@mail.gmail.com> <CAJdd5GaLzmxW9gA8oy7iH428Pmw7GCh6r6wfRukUg5j4qHra+w@mail.gmail.com>
In-Reply-To: <CAJdd5GaLzmxW9gA8oy7iH428Pmw7GCh6r6wfRukUg5j4qHra+w@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 17 Oct 2023 10:01:19 -0400
Message-ID: <CADkTA4N8dkZvA5E-ZmP5Q-uecn-DTVs2CxR6DZrMoLtLr8k=xg@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] classes/image-oci: Map x86_64 -> amd64
To: Joshua Watt <jpewhacker@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 17 Oct 2023 14:01:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8380

On Tue, Oct 17, 2023 at 9:46=E2=80=AFAM Joshua Watt <jpewhacker@gmail.com> =
wrote:
>
> On Mon, Oct 16, 2023 at 7:35=E2=80=AFPM Bruce Ashfield <bruce.ashfield@gm=
ail.com> wrote:
> >
> > On Mon, Oct 16, 2023 at 5:26=E2=80=AFPM Joshua Watt <JPEWhacker@gmail.c=
om> wrote:
> > >
> > > OCI requires that the architecture [1] be a valid GOARCH [2]. "x86_64=
"
> > > is not a valid GOARCH so map it to the correct "amd64" value.
> > >
> >
> > It may require it, but I've never had any issues with a container runni=
ng.
> >
> > Are you seeing a warning or something else ?
>
> I haven't, but I noticed it was wrong

Fair enough. I just always want to document any runtime issues that
were seen, since if for example, you weren't able to launch on x86-64
or were getting a runtime warning ... I wonder why I didn't pick it up
in my testing.

>
> >
> > > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> > >
> > > [1]: https://github.com/opencontainers/image-spec/blob/main/config.md=
#properties
> > > [2]: https://go.dev/doc/install/source#environment
> > >
> > > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> > > ---
> > >  classes/image-oci.bbclass | 9 ++++++++-
> > >  1 file changed, 8 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/classes/image-oci.bbclass b/classes/image-oci.bbclass
> > > index 9ddb88b..3370f86 100644
> > > --- a/classes/image-oci.bbclass
> > > +++ b/classes/image-oci.bbclass
> > > @@ -52,7 +52,7 @@ OCI_IMAGE_AUTHOR_EMAIL ?=3D "${PATCH_GIT_USER_EMAIL=
}"
> > >  OCI_IMAGE_TAG ?=3D "latest"
> > >  OCI_IMAGE_RUNTIME_UID ?=3D ""
> > >
> > > -OCI_IMAGE_ARCH ?=3D "${TARGET_ARCH}"
> > > +OCI_IMAGE_ARCH ?=3D "${@oci_map_arch(d.getVar('TARGET_ARCH'))}"
> > >  OCI_IMAGE_SUBARCH ?=3D "${@oci_map_subarch(d.getVar('TARGET_ARCH'), =
d.getVar('TUNE_FEATURES'), d)}"
> > >
> > >  OCI_IMAGE_ENTRYPOINT ?=3D "sh"
> > > @@ -74,6 +74,13 @@ OCI_IMAGE_ENV_VARS ?=3D ""
> > >  # bundled into a tarball.
> > >  OCI_IMAGE_TAR_OUTPUT ?=3D "true"
> > >
> > > +# Map architectures to a valid container arch. Note that the contain=
er archs
> > > +# should be a valid GOARCH
> > > +def oci_map_arch(a):
> > > +    if a =3D=3D "x86_64":
> > > +        return "amd64"
> > > +    return a
> >
> > If it is supposed to match to the goarch, why wouldn't we just use the
> > goarch.bbclass mapping ?
>
> Ah, that's a good idea. I think I'll move those functions to library
> code though so that they can be used without the bbclass.
>

perfect. I'll wait for v2, and ponder the other pending patches in the mean=
time.

Bruce

> Thanks
>
> >
> > Bruce
> >
> > > +
> > >  # Generate a subarch that is appropriate to OCI image
> > >  # types. This is typically only ARM architectures at the
> > >  # moment.
> > > --
> > > 2.34.1
> > >
> > >
> > >
> > >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#8378): https://lists.yoctoproject.org/g/meta-virtua=
lization/message/8378
> > Mute This Topic: https://lists.yoctoproject.org/mt/102006091/3616693
> > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/leave=
/12677403/3616693/1765413136/xyzzy [JPEWhacker@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

