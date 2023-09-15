Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 159D6EED61B
	for <webhook@archiver.kernel.org>; Fri, 15 Sep 2023 17:28:48 +0000 (UTC)
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
 by mx.groups.io with SMTP id smtpd.web10.27501.1694798919505269208
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 15 Sep 2023 10:28:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OM6OtOrJ;
 spf=pass (domain: gmail.com, ip: 209.85.166.50, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-79565370aa3so89479339f.0
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 15 Sep 2023 10:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694798918; x=1695403718; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c4geVxYHwD3WtBp2FwxkKjB8QVM802DZksNGb5Eez1I=;
        b=OM6OtOrJErfawHit+oeGkcfhIYGJK+uWt4Zf5x8sc2lCKRRO4v+Tv8KZ3R4FQT9EgJ
         FDwEPPu1VrJHg/FWekZJKdGcGWwNeFYm0wXnkrFFocc3Pn9Vnf+xCawPDMRhQ5oj7KqD
         p4ygFq/ODO/kYiZb2ehDQ+f05jNGQRY8sVmZA1+ddVSPOBNmI1Wz83SYwUJ7h70u/Riv
         LYzBdsNgkXQu6JP0YGqQZgWnxVrGX1BmJgGZ4SEU2eCcbBerhY3uGDu1HyfXgm2cIq09
         nyjRLh8WDLYbxq1vQu07Zs/MxrEl3q3fIUMOee8l4mRhEdnCgWBqM8WOXG3sGQFLE8aI
         dZCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694798918; x=1695403718;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c4geVxYHwD3WtBp2FwxkKjB8QVM802DZksNGb5Eez1I=;
        b=SkLdQ7cktz3NFiAlXTzaXHOicSjDMJvx0iSPpVQ/OSEE6iee/qpz2wZQtFfOTLapTl
         wX5JI2VT5TBa9BOQQLAvNo110YaC95DB6rs6ruwVrqt9oaztfQsGSlBFAoe3Km6fUKUo
         yOZRMX0/XYoLt7aCD3gBAX3oLLSii/PL6YrioYyEdfMV247ClYB1z5x9RfGmlUXlVzcw
         nlxVDsJhGqn6S6NDSkcRFlWE8Effs3KvxeWlPN8Ehm0np7ONVigxeRk4bYmomk0qyNO9
         F9EsWC8SrzOc+TX1hBE2THA6yEP0FQk2e8Oc8pLCbAVdPEfA2tTnUlxw56tvOqvcySwt
         iP2w==
X-Gm-Message-State: AOJu0Yz8hW7yN32y8KBSGtgh3TvTrun1Rg3gg5Fto+kk2KwAqeIPVE77
	vHnEzI/m7lT05YBX5rdzJtziXcWibIO3N2647Dw5GNDSeoc=
X-Google-Smtp-Source: AGHT+IEC/qhr59Foqp/1n5m3kx/R5aYf39Kh9I5YIyY5tgXJi5vV+Ej6pWJ3P6YQI/amHNVi9H8vPvHmhQJKb/ZV/Ig=
X-Received: by 2002:a05:6e02:1314:b0:346:fe2:125a with SMTP id
 g20-20020a056e02131400b003460fe2125amr2712491ilr.26.1694798918612; Fri, 15
 Sep 2023 10:28:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230901090308.3242531-1-changqing.li@windriver.com>
 <ZPVJdC6MVeoKurB+@gmail.com> <785ed89f-e9ec-7360-5e4a-1f460732a44a@windriver.com>
In-Reply-To: <785ed89f-e9ec-7360-5e4a-1f460732a44a@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 15 Sep 2023 13:28:28 -0400
Message-ID: <CADkTA4NXhyOUz+Rb=cwM=hX0P1UGFo_yRvkRE31d+XFkq0gL9g@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] oci-image-tools: don't build for riscv64
To: Changqing Li <changqing.li@windriver.com>
Cc: Changqing Li <changqing.li@eng.windriver.com>, 
	meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 15 Sep 2023 17:28:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8310

Cherry picked to Mickledore.

Bruce

On Wed, Sep 13, 2023 at 10:03=E2=80=AFPM Changqing Li
<changqing.li@windriver.com> wrote:
>
>
> On 9/4/23 11:05, Bruce Ashfield wrote:
> > CAUTION: This email comes from a non Wind River email account!
> > Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
> >
> > Since riscv isn't tested with meta-virt at all, this isn't
> > the only recipe that has either build or runtime issues.
> >
> > This is staged to master-next.
> >
> > Bruce
> >
> > In message: [meta-virtualization] [PATCH] oci-image-tools: don't build =
for riscv64
> > on 01/09/2023 Changqing Li wrote:
>
> Hi, Bruce
>
> Could you also merge this to mickledore branch, thanks.
>
> //Changqing
>
> >> From: Changqing Li <changqing.li@windriver.com>
> >>
> >> Currently oci-image-tools has a do_compile error for riscv64. The
> >> problem could be reproduced by:
> >>      MACHINE=3Dqemuriscv64 bitbake oci-image-tools
> >>
> >> So explicitly set COMPATIBLE_HOST here to avoid it building for riscv6=
4.
> >> When someone interested in using this recipe for riscv64 fixes the
> >> compile issue, this setting could be removed.
> >>
> >> Also don't build packagegroup-container/packagegroup-kubernetes since
> >> they depends on oci-image-tools
> >>
> >> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> >> ---
> >>   recipes-containers/oci-image-tools/oci-image-tools_git.bb | 2 ++
> >>   recipes-core/packagegroups/packagegroup-container.bb      | 2 ++
> >>   recipes-core/packagegroups/packagegroup-kubernetes.bb     | 2 ++
> >>   3 files changed, 6 insertions(+)
> >>
> >> diff --git a/recipes-containers/oci-image-tools/oci-image-tools_git.bb=
 b/recipes-containers/oci-image-tools/oci-image-tools_git.bb
> >> index 4beb3a63..8c5020b3 100644
> >> --- a/recipes-containers/oci-image-tools/oci-image-tools_git.bb
> >> +++ b/recipes-containers/oci-image-tools/oci-image-tools_git.bb
> >> @@ -29,6 +29,8 @@ EXTRA_OEMAKE=3D"BUILDTAGS=3D''"
> >>
> >>   S =3D "${WORKDIR}/git/src/github.com/opencontainers/image-tools"
> >>
> >> +COMPATIBLE_HOST:riscv64 =3D "null"
> >> +
> >>   do_compile() {
> >>        export GOARCH=3D"${TARGET_GOARCH}"
> >>        export GOROOT=3D"${STAGING_LIBDIR}/go"
> >> diff --git a/recipes-core/packagegroups/packagegroup-container.bb b/re=
cipes-core/packagegroups/packagegroup-container.bb
> >> index 8d418e95..c41576a3 100644
> >> --- a/recipes-core/packagegroups/packagegroup-container.bb
> >> +++ b/recipes-core/packagegroups/packagegroup-container.bb
> >> @@ -4,6 +4,8 @@ LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/MIT=
;md5=3D0835ade698e0bcf8506ecda
> >>
> >>   inherit packagegroup
> >>
> >> +COMPATIBLE_HOST:riscv64 =3D "null"
> >> +
> >>   PACKAGES =3D "\
> >>       packagegroup-container \
> >>       packagegroup-lxc \
> >> diff --git a/recipes-core/packagegroups/packagegroup-kubernetes.bb b/r=
ecipes-core/packagegroups/packagegroup-kubernetes.bb
> >> index 70dc9713..7e6937b1 100644
> >> --- a/recipes-core/packagegroups/packagegroup-kubernetes.bb
> >> +++ b/recipes-core/packagegroups/packagegroup-kubernetes.bb
> >> @@ -4,6 +4,8 @@ LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/MIT=
;md5=3D0835ade698e0bcf8506ecda
> >>
> >>   inherit packagegroup
> >>
> >> +COMPATIBLE_HOST:riscv64 =3D "null"
> >> +
> >>   # k3s has this restriction
> >>   inherit features_check
> >>   REQUIRED_DISTRO_FEATURES ?=3D "seccomp"
> >> --
> >> 2.25.1
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#8263): https://lists.yoctoproject.org/g/meta-virtu=
alization/message/8263
> >> Mute This Topic: https://lists.yoctoproject.org/mt/101090972/1050810
> >> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> >> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsu=
b [bruce.ashfield@gmail.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

