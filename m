Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 038D9C4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 20:57:04 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web11.37.1649968835556452614
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 14 Apr 2022 13:40:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ij614U/a;
 spf=pass (domain: gmail.com, ip: 209.85.167.41,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id u7so11068895lfs.8
        for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 14 Apr 2022 13:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oXeFl91HyqKAH0w8Vk8ZqykCNDSb7vpTgsPL/ReAyxo=;
        b=Ij614U/aIE4ret82jfHeqi4x2Ua58STXg9ZAg2oWyutqyGVXnUH96Kc9u9YXcXaKQR
         5Fg/DXiRrRlgSwiNz4HoElV1AHQu6Ia71ihYpafz24xjRftf1kSPgog40iClh0t2eU93
         653I8aWwl51RHGDWKItzzu8Sr0nm67YygXfKJ7ZukzgqmXi9OJMEHbclGcsAwyzJoOIg
         qQQjZmMO0Mpga3Iev+qXCnbjl8gMw7Qg+rkyqtZRWiYB9S14Jpu613T7v/J0mqUmj0P9
         K9nBoVDAL7tEKRojxq84KAmsEIH8agXk4NK8pKMDTXyC0xuiJfyXK/V+8/hFDBG+oZ/M
         0PYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oXeFl91HyqKAH0w8Vk8ZqykCNDSb7vpTgsPL/ReAyxo=;
        b=y8bxra+3EGe3pyCyzpXX6IbE0aG3/vpgWbJnmdS3QxMDKtzKx6/bzuxoAJb2BSdf/V
         O7pMm8X9Zbo6hfFWcZWy1CB+aU2b14igD3mk9Uva5Z/ABrYIcSV5vSFmRq/WAVlkUwex
         C4frDyCHSU16NidGJDKyUqRMRBIhj8qJ1zRL9MNdFKdhnWgU42ug7Iw05i0j9wC5Zdos
         4DteqLEE+Nkr5uJ6U2Mq6GHwa9JCtSzhVWbmwW3raOfSZr/mCvghsNG3Ra2sINtCkDH7
         uxnN7gcuYucOuWjwfaBjMtH0MbIaDnSUdw3exZAW5rIzxh6zPgPEd09CROyfQ14eyjV+
         oGaA==
X-Gm-Message-State: AOAM533o9bRNSzVMfFhOA9uk3h3zBK5Y8BvoQOWRJcW482LLQLDVgGrx
	nTmO1DwKQr5r0ESSSdLZGBOvuKIe3OZHVc4nmQMFEYrQ5gc=
X-Google-Smtp-Source: 
 ABdhPJzkA2TS/y9YO9tCci+N8C0vb/DlhTiDPypBGFCWPMaXO25aVq/nivincEwzEDxtrV+DFqEDNKZ7bqTJdMgjP9o=
X-Received: by 2002:a05:6512:3b2b:b0:46d:b51:dfb8 with SMTP id
 f43-20020a0565123b2b00b0046d0b51dfb8mr2882517lfv.505.1649968833691; Thu, 14
 Apr 2022 13:40:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220408084420.102085-1-michal.orzel@arm.com>
 <CADkTA4MxDwunJex7NnjFpLs2k0sUo354XUysH0PeYww+gYxA_A@mail.gmail.com>
 <A524ADAA-241A-4206-AA65-6B2778D5FE01@arm.com>
In-Reply-To: <A524ADAA-241A-4206-AA65-6B2778D5FE01@arm.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 14 Apr 2022 16:40:22 -0400
Message-ID: 
 <CADkTA4P2y+5Szb123+ZbU6w+rWpdxKv7fdqE0pHvPdwHCu-ZCA@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH 0/3] xen: Update recipes for xen and
 xen-tools
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: Michal Orzel <Michal.Orzel@arm.com>,
	"meta-virtualization@lists.yoctoproject.org"
 <meta-virtualization@lists.yoctoproject.org>,
	Christopher Clark <christopher.w.clark@gmail.com>,
 Doug Goldstein <cardoe@gentoo.org>, nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 14 Apr 2022 20:57:03 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7177

On Thu, Apr 14, 2022 at 4:02 AM Bertrand Marquis
<bertrand.marquis@arm.com> wrote:
>
> Hi Bruce,
>
> > On 14 Apr 2022, at 04:13, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> >
> > On Fri, Apr 8, 2022 at 4:44 AM Michal Orzel <michal.orzel@arm.com> wrote:
> >>
> >> Before the next Yocto release, Xen recipes need to be updated.
> >> This patch series:
> >> - updates 4.15 recipes
> >> - introduces 4.16 recipes
> >> - removes 4.14 recipes
> >
> > FYI: I'm not ignoring these, and I will make sure they get into the
> > upcoming release branch and are in place for the LTS release. I'm just
> > waiting until Christopher gets a chance to review and see if these
> > match up with what he was thinking about for versions.
>
> Thanks.
>
> For LTS, I think we said the strategy should be a bit different:
> - keep the original versions and update them.
> - keep the same default version
> - add/update other recipe upon request
>

My fault for not being clear, I was thinking about "the upcoming LTS",
aka the very-soon to be released kirstone .. but just typed "LTS",
which is no longer unambiguous!

Unless you were also speaking about kirstone .. :)

For dunfell-LTS, we definitely don't need to add new versions, but I'm
happy to do updates.

For Kirstone LTS, I just wanted to make sure that we had the right Xen
versions, where at least one is also a Xen LTS and another version to
track a latest release (for those that need it).

I think we are aligned on both fronts.

Bruce

> I do not think we need to push this change to LTS branch, there it might make more sense to update the present versions.
> I can check that in the next weeks.
>
> Cheers
> Bertrand
>
> >
> > Bruce
> >
> >>
> >> Michal Orzel (3):
> >>  xen: Bump SRCREV of 4.15 recipes to 4.15.2
> >>  xen: Add recipes for stable Xen 4.16 release and update master
> >>  xen: Remove 4.14 recipes and related patches
> >>
> >> .../include/meta-virt-default-versions.inc    |   4 +-
> >> ...-stand-alone-set-of-headers-Xen-4.14.patch | 178 ------------------
> >> ...ython-pygrub-pass-DISTUTILS-xen-4.14.patch |  66 -------
> >> ...d-firmware-as-ffreestanding-Xen-4.14.patch |  83 --------
> >> recipes-extended/xen/xen-tools_4.14.bb        |  21 ---
> >> recipes-extended/xen/xen-tools_4.15.bb        |   4 +-
> >> recipes-extended/xen/xen-tools_4.16.bb        |  19 ++
> >> recipes-extended/xen/xen-tools_git.bb         |   6 +-
> >> recipes-extended/xen/xen_4.15.bb              |   4 +-
> >> .../xen/{xen_4.14.bb => xen_4.16.bb}          |   6 +-
> >> recipes-extended/xen/xen_git.bb               |   6 +-
> >> 11 files changed, 34 insertions(+), 363 deletions(-)
> >> delete mode 100644 recipes-extended/xen/files/0001-firmware-provide-a-stand-alone-set-of-headers-Xen-4.14.patch
> >> delete mode 100644 recipes-extended/xen/files/0001-python-pygrub-pass-DISTUTILS-xen-4.14.patch
> >> delete mode 100644 recipes-extended/xen/files/0001-tools-firmware-Build-firmware-as-ffreestanding-Xen-4.14.patch
> >> delete mode 100644 recipes-extended/xen/xen-tools_4.14.bb
> >> create mode 100644 recipes-extended/xen/xen-tools_4.16.bb
> >> rename recipes-extended/xen/{xen_4.14.bb => xen_4.16.bb} (79%)
> >>
> >> --
> >> 2.25.1
> >>
> >>
> >>
> >>
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7172): https://lists.yoctoproject.org/g/meta-virtualization/message/7172
> Mute This Topic: https://lists.yoctoproject.org/mt/90331599/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

