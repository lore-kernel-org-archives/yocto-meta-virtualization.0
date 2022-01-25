Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 146BFC433EF
	for <webhook@archiver.kernel.org>; Tue, 25 Jan 2022 02:45:22 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web11.2112.1643078720979616810
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 24 Jan 2022 18:45:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eAfQCn4N;
 spf=pass (domain: gmail.com, ip: 209.85.218.46,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id k25so26698984ejp.5
        for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 24 Jan 2022 18:45:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=B2phkcYXUqtaXfNN2nU3E+cyVeSXiqsWKVw48jZYVpk=;
        b=eAfQCn4Ne/zGxOMdO5MydOj8GtvNOXj5wFeL29aak8W2AfJXgTDE1DkAZUZMDa6vKw
         SCJoAIpyGGc5xc7dC8pbDD7rR5khQgravqV32mpfMBaKZl8pcHJFVli+0QQNwU5NZZAR
         aNAc14KquaxuhpDN+ZXLGnjskR0eieO5jNHfwUjE072YMqvp5YDfEyJW3XTSxX/NMt7Z
         bnePPN/RnCq6E8X/HxfA8QsPxkUPoegZES5WaPrErFdtPw4qvFHc3bQR32YHk4vLS7YK
         ep0UatOcs/m3tkLwI202xfxKsYhf7A0rGppWPQlHpq/Ty3FTid8Zx4DanpR5LH5W4KiP
         jmSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=B2phkcYXUqtaXfNN2nU3E+cyVeSXiqsWKVw48jZYVpk=;
        b=UrLPMOnYZL4IjnwIbUC3oV8sbd7Vi0x3akTUoCtB6CucTMsuQi0PV1HtPWy1o0t242
         Lz41NzBYh1KDctuDdfYbq1RnsnHOHeuld1ItcMfKl9qHxBqOp/yZDHkmIn7FJ53GmhJ+
         vfPNPcTUq7JZ5b0ngRZoQvgP/ecq9mGRx2oqfD9xBC0K3Dgv8M9LwXHYBniqBHpsi5Vf
         NH0hbD7u2zhYYrTHVxmCzICj8ymY2nxkmwAIGiurP2NR25/UD0ZShhM612aR/L/hp/XR
         PX9PAlToxMLFY3hBkJFlfJIX73LJLVJ5BeiGFT0Bl3LJQHXtoB/cKAU/qegwkA+km0mL
         XQdA==
X-Gm-Message-State: AOAM530SRjFK1sy8Syu0EsfKFKVU0h2aDqMfJ96qdB+eAgc3X8ubBZp9
	TCKMjleocZlM/WO6GTKazVUZZ+lfBuVmBr0odG0=
X-Google-Smtp-Source: 
 ABdhPJx2pJdQwbnf2y+PPaFfw2FIcAhV4UIwKpR/jOtiOQRMQuonIlJRURDLj6dZq2+lHc06muzy1P0X6uQDkGrZX00=
X-Received: by 2002:a17:906:5d16:: with SMTP id
 g22mr379053ejt.391.1643078719098;
 Mon, 24 Jan 2022 18:45:19 -0800 (PST)
MIME-Version: 1.0
References: <20220119115956.1104692-1-liezhi.yang@windriver.com>
 <CADkTA4M3L97amNq62TyRGUnkSn7LDHzJkL2vz4cDJxW+AtBtUQ@mail.gmail.com>
 <a78a7025-154a-c71d-cad9-9bb0d8787ec2@windriver.com>
In-Reply-To: <a78a7025-154a-c71d-cad9-9bb0d8787ec2@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 24 Jan 2022 21:45:08 -0500
Message-ID: 
 <CADkTA4P5bnUi1Gm+a4zchsygqb-=Vdr5eK_g0UUvD_Y_nA1Zkg@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] docker: Add kernel-module-xt-nat to
 RRECOMMENDS
To: Robert Yang <liezhi.yang@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 25 Jan 2022 02:45:22 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7031

On Thu, Jan 20, 2022 at 2:07 AM Robert Yang <liezhi.yang@windriver.com> wrote:
>
> Hi Bruce,
>
> On 1/19/22 9:34 PM, Bruce Ashfield wrote:
> > On Wed, Jan 19, 2022 at 7:00 AM Robert Yang <liezhi.yang@windriver.com> wrote:
> >>
> >> Fixed when kernel-module-xt-nat is not installed:
> >> $ docker run --rm -it -p 80:80 alpine
> >>
> >> docker: Error response from daemon: driver failed programming external connectivity on endpoint elated_cori
> >> Try `iptables -h' or 'iptables --help' for more information.
> >>   (exit status 2)).
> >>
> >
> > There's already a pending patch for similar changes, I'm still
> > working through the unification of the meta-virt fragments and the
> > kernel-cache fragments, so I'm not doing any of the RRECOMMENDS
> > changes at the moment, until I have that unified.
> >
> > Since we can recommend all we want, but it can't fix a bad
> > configuration, and that's the issue.
>
> Yes, makes sense, do you have a clue on how to figure out all of them, please?

This is something that I'm working on in cooperation with the external
kernel-cache recipe/tool that I have in meta-virt.

Your change is correct, I'm just going to let it sit on my queue for a
bit, while I work through the rest of the changes with respect to
getting the right configuration across a range of kernels and having
the ability to check for the fragments (versus the final .config,
since we don't want to start checking for individual options after the
kernel configuration runs).

Bruce

>
> // Robert
>
> >
> > Bruce
> >
> >> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> >> ---
> >>   recipes-containers/docker/docker.inc | 8 +++++++-
> >>   1 file changed, 7 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/recipes-containers/docker/docker.inc b/recipes-containers/docker/docker.inc
> >> index 40a3642c..e7bdc388 100644
> >> --- a/recipes-containers/docker/docker.inc
> >> +++ b/recipes-containers/docker/docker.inc
> >> @@ -29,7 +29,13 @@ RDEPENDS:${PN} = "util-linux util-linux-unshare iptables \
> >>                    "
> >>   RDEPENDS:${PN} += "virtual-containerd virtual-runc"
> >>
> >> -RRECOMMENDS:${PN} = "kernel-module-dm-thin-pool kernel-module-nf-nat kernel-module-nf-conntrack-netlink kernel-module-xt-addrtype kernel-module-xt-masquerade"
> >> +RRECOMMENDS:${PN} = "kernel-module-dm-thin-pool \
> >> +    kernel-module-nf-nat \
> >> +    kernel-module-nf-conntrack-netlink \
> >> +    kernel-module-xt-addrtype \
> >> +    kernel-module-xt-masquerade \
> >> +    kernel-module-xt-nat \
> >> +    "
> >>
> >>   PROVIDES += "virtual/docker"
> >>
> >> --
> >> 2.17.1
> >>
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
> >



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

