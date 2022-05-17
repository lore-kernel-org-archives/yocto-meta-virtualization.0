Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAC07C433EF
	for <webhook@archiver.kernel.org>; Tue, 17 May 2022 12:35:32 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com
 [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web08.6574.1652790930217816050
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 17 May 2022 05:35:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eKEQVsjm;
 spf=pass (domain: gmail.com, ip: 209.85.128.176,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-2ff155c239bso40603497b3.2
        for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 17 May 2022 05:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=iEbs5y0K/k6S70DqYJFjxX9GwHDSMemtiGXJlpKbMS0=;
        b=eKEQVsjmW86BAZS8tIAu2PMMuyZrvS/hNPvLB6Zv45OiTnaCi3psh6AKzro+/POo0c
         kf+OMx9SgjZBKBsHeE6sESFb63VQ7sHhMPqNcdTgEGPf1mxFnlh8jl6/X5jf2VWm5XXc
         Yd7UlSFY14utFtdiGMrJ5d9QhhOSRn9Zm7Ybcufai7Ovt1XzCnjA34KLcOr2An6cU8fV
         u1QLVqCrVALyCPxtUX+Qw66D9wx+jEqD+wBycPyZ9/uQohz50mroiSuCtAppbl7yrXga
         UqOn6AgiAvmXWQpixpxReMw7IQvh0/jY3Ca+ePvxq3eEDRvhSKowtdVAo55nSURGT8IC
         hlgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=iEbs5y0K/k6S70DqYJFjxX9GwHDSMemtiGXJlpKbMS0=;
        b=fDwCelD7ZZF1XRS52ENmY5c6MKAPZwyU0wtHx/Hcfx/0geAzTTXe5Gl1d2gq+2nQzD
         XUIqGpyQqMR97ijaLKyAY6UM+RKLerJ+FKTnLVPYMsgzcniuZ+mD/MT6R7+/xpOyosVA
         J0ujSwarPplxHlsEeorUh+GG+QFUwmeAk1zowNA0PGB8T/nm+UweVy6YqhZY7h3lPo4x
         +2fSyAA99w7qbUttEPJIW+cVKsuvCzX8Wj/VGsIgQq7g3w+V77Rw+Oe37uo0FHyhWQDF
         dVnz5+rBOOriIgboRGWvYE6AOJeHTzv2/m47mNKhTN0utDuzTx2jmUkVtby4p9vRco29
         w0OA==
X-Gm-Message-State: AOAM530CW3KFF9tNW19kwvAPnxx/i9Dy9Rv+Y98q37HFpjDJxX02GvXs
	aRprP2fZHnON4d5xQaW1hHL4+InWhGdUo816EjA=
X-Google-Smtp-Source: 
 ABdhPJzB/zIly6W609BSCrqG84nfj09iN1+BsVcJcBOsHy2VSnkxueIzthGVTtPkEEq6gjWqIHUUt0Xy2fkfjopVlNY=
X-Received: by 2002:a81:2443:0:b0:2eb:4ffe:fab2 with SMTP id
 k64-20020a812443000000b002eb4ffefab2mr25428647ywk.330.1652790929397; Tue, 17
 May 2022 05:35:29 -0700 (PDT)
MIME-Version: 1.0
References: <16EDC85ADC96BC5F.7065@lists.yoctoproject.org>
 <16EFD632AAA4CAF6.1719@lists.yoctoproject.org>
 <1A72E4E2-7DF9-449C-912A-86324874AE0A@arm.com>
In-Reply-To: <1A72E4E2-7DF9-449C-912A-86324874AE0A@arm.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 17 May 2022 08:35:18 -0400
Message-ID: 
 <CADkTA4NzTmK=4n5uSeMNjMTTGtQ+vr326SZxxCb01WivMk_9_A@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH v2 0/4] Vairous fixes for qemu
 support
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Christopher Clark <christopher.w.clark@gmail.com>,
	"meta-virtualization@lists.yoctoproject.org"
 <meta-virtualization@lists.yoctoproject.org>, nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 17 May 2022 12:35:32 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7282

On Tue, May 17, 2022 at 4:16 AM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
>
>
> > On 17 May 2022, at 09:11, Bertrand Marquis via lists.yoctoproject.org <=
bertrand.marquis=3Darm.com@lists.yoctoproject.org> wrote:
> >
> > Hi,
> >
> > Any news not those patches ?
>
> Sorry for the typo, this was suppose to be =E2=80=9Con"

No worries.

They worked for me, and everything seems fine. I was just waiting to
see if Christopher was going to ack them.

Either way, they'll arrive in the kirkstone (and obviously master) branch s=
oon.

Bruce

>
> >
> > Cheers
> > Bertrand
> >
> >> On 10 May 2022, at 16:35, Bertrand Marquis via lists.yoctoproject.org =
<bertrand.marquis=3Darm.com@lists.yoctoproject.org> wrote:
> >>
> >> This serie is a rework of the patch named "[PATCH] xen: enable qemuboo=
t
> >> for arm32" to fix some issues in the qemuboot support for arm and
> >> introduce arm32 support for it.
> >>
> >> First 2 patches are small fixes/enhancements
> >> Patch 3 is adding qemu arm32 support
> >> Patch 4 needs to be discuss but is a workaround to let qemu-arm32 boot
> >> right now by disabling PCI as it cause dom0 to hang at the moment.
> >>
> >> Bertrand Marquis (4):
> >> xen: Fix class inherit in xen-image
> >> qemuboot: Fix command line and enable other machines
> >> xen: enable qemuboot for arm32
> >> xen: Disable PCI on qemuarm with Xen
> >>
> >> classes/qemuboot-xen-defaults.bbclass | 20 +++++++++----
> >> classes/qemuboot-xen-dtb.bbclass | 31 +++++++++++++++++---
> >> recipes-extended/images/xen-image-minimal.bb | 2 +-
> >> 3 files changed, 43 insertions(+), 10 deletions(-)
> >>
> >> --
> >> 2.25.1
> >>
> >>
> >>
> >>
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#7280): https://lists.yoctoproject.org/g/meta-virtua=
lization/message/7280
> > Mute This Topic: https://lists.yoctoproject.org/mt/91015797/3619089
> > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub=
 [bertrand.marquis@arm.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

