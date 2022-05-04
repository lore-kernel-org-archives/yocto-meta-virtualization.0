Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66F7FC433F5
	for <webhook@archiver.kernel.org>; Wed,  4 May 2022 16:02:39 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com
 [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.web11.1418.1651680156686444595
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 04 May 2022 09:02:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Iy4m+lBU;
 spf=pass (domain: gmail.com, ip: 209.85.128.181,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-2f863469afbso20889877b3.0
        for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 04 May 2022 09:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WcQjhbvHJwLpnzQL0RS8kCg9PeT4F+WTFB65+fVseqs=;
        b=Iy4m+lBUdhJYsU6a3ScT750cAOK50aUYwfo53aTj13Kalcmp5cUtO44kB3qABCur1L
         cGlEoLggON7KPotQHP5McpF+O5Z1SN5jBDi3MFiweriVMO4hQK3tC5cP8Wv6o57qwx4Y
         PjqX/SQ4NJuXgbWHu9Gya1h8X6/MAEz2GW3+jmCxuU7afDgHw/IlHAqKN0BN/ye4YQcc
         knpCK71Lcp8DilgRHFR200YRR/PNfYQe/w+rtX3C2uR+yjTJ9Rofqxn6fBp9YSCuU2eV
         fh8ipa6T6/aWW52dsTat1YPErcSc83y+zm4tCgl8tFqRVjx5gTGyzRmveIKl7P1lMC+H
         e66A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WcQjhbvHJwLpnzQL0RS8kCg9PeT4F+WTFB65+fVseqs=;
        b=sSXASYP0hyrxKpvJ9rYXhFHr/EZiRrrk9MrFW5l+9M0aIX+hg6M1AATBIVm9CWem4O
         igAk0f/ipbkx7ObVeb4PhT7sHohpw9DzylaLuv8N/0QqK7JcP0SKpfZWP2PFaqJoIf+D
         foCGIPHQeIyxu3oroRiG16W3c54tP7tkLJWR9O2N5L59Sm3HIfCqokAiMzXobSOse+at
         eT/Svg3lIkmYmbDbSY6d1ac43AvKPzCG6yWYYsbuE2J3jCeV2pql696wiGMxLUHXfavJ
         Gn3m8yr+0F9td9DuTMIDybRrw6UfUgYQt/u2vmXmy6Aop8pmpluo86J62JZy67rLXH37
         DJkg==
X-Gm-Message-State: AOAM530ahJty4Z63LtC44knYKLvmKbau+bmmHUCPm7B0EfQeowQQZolp
	zmvmujs/60VB7eiEGFiu0SQRxVyoiFH3es8/gaU=
X-Google-Smtp-Source: 
 ABdhPJywnElwgUA1Jn7ZYNhPB8AIglGWwIc6s6zerVcVUi4GWXMJnXzp76XyrZdQ86epXzJ5498Zs+HALWF5e01A5f4=
X-Received: by 2002:a0d:f406:0:b0:2f4:e5c2:90f0 with SMTP id
 d6-20020a0df406000000b002f4e5c290f0mr20149944ywf.407.1651680155528; Wed, 04
 May 2022 09:02:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220504140917.623536-1-richard.neill@arm.com>
 <CADkTA4MRs3UWyZYOAEcSuSsnDfuyL+38e_OJOi8W-898jCUxxg@mail.gmail.com>
 <16EBED5FBFD686F6.29994@lists.yoctoproject.org>
 <AM6PR08MB34610DA802EC02E1E755B26D92C39@AM6PR08MB3461.eurprd08.prod.outlook.com>
In-Reply-To: 
 <AM6PR08MB34610DA802EC02E1E755B26D92C39@AM6PR08MB3461.eurprd08.prod.outlook.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 4 May 2022 12:02:24 -0400
Message-ID: 
 <CADkTA4O45yTDsCeJG+fRYf_P-E8tgzzHb_8_3w3tcKgKgrXmZg@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] docker: Add runtime provide for
 virtual-docker
To: Diego Sueiro <Diego.Sueiro@arm.com>
Cc: Richard Neill <Richard.Neill@arm.com>,
	"meta-virtualization@lists.yoctoproject.org"
 <meta-virtualization@lists.yoctoproject.org>, nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 04 May 2022 16:02:39 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7246

On Wed, May 4, 2022 at 11:06 AM Diego Sueiro <Diego.Sueiro@arm.com> wrote:
>
> >-----Original Message-----
> >From: meta-virtualization@lists.yoctoproject.org <meta-
> >virtualization@lists.yoctoproject.org> On Behalf Of Diego Sueiro via
> >lists.yoctoproject.org
> >Sent: 04 May 2022 15:31
> >To: bruce.ashfield@gmail.com; Richard Neill <Richard.Neill@arm.com>
> >Cc: meta-virtualization@lists.yoctoproject.org; nd <nd@arm.com>
> >Subject: Re: [meta-virtualization] [PATCH] docker: Add runtime provide for
> >virtual-docker
> >
> >Hi Bruce,
> >
> >>-----Original Message-----
> >>From: meta-virtualization@lists.yoctoproject.org <meta-
> >>virtualization@lists.yoctoproject.org> On Behalf Of Bruce Ashfield via
> >>lists.yoctoproject.org
> >>Sent: 04 May 2022 15:27
> >>To: Richard Neill <Richard.Neill@arm.com>
> >>Cc: meta-virtualization@lists.yoctoproject.org; nd <nd@arm.com>
> >>Subject: Re: [meta-virtualization] [PATCH] docker: Add runtime provide
> >>for virtual-docker
> >>
> >>On Wed, May 4, 2022 at 10:09 AM Richard Neill <richard.neill@arm.com>
> >>wrote:
> >>>
> >>> This patch enables successful runtime-dependency on the Docker
> >>> preferred provider, as virtual/docker does not resolve. Doing so
> >>> aligns with other virtual package providers (e.g. virtual-runc), and
> >>> follows the Yocto Project documentation
> >>> (https://docs.yoctoproject.org/singleindex.html#virtual-runtime-provides).
> >>
> >>We don't have a virtual-docker rprovides by design. Since there are
> >>differences
> >>(historically) between docker-ce and docker-moby.
> >>
> >>Your package lists and images should be referring to the one they want,
> >>not virtual-docker as a rdepends.
> >
> >In this case having ` PREFERRED_PROVIDER_virtual/docker ?= "docker-ce"` and
> >` PROVIDES += "virtual/docker"` is useless?
> >
>
> Also, it seems that on the browser github.com/docker/docker.git (from docker-ce_git.bb) redirects to github.com/moby/moby.git.
> Does it not make sense to retire one of the recipes and just keep one? It will reduce maintenance effort and avoid
> confusions to which one should be used.

It has been doing that for quite some time.

We'll keep the two. There are some patch differences, and update
cadences that differ between the two.  docker has moved closer to
moby, but we don't always want the docker-ce curated git hashes.

Bruce

>
> Diego
>
>
> >
> >>
> >>Bruce
> >>
> >>>
> >>> Signed-off-by: Richard Neill <richard.neill@arm.com>
> >>> ---
> >>>  recipes-containers/docker/docker.inc | 1 +
> >>>  1 file changed, 1 insertion(+)
> >>>
> >>> diff --git a/recipes-containers/docker/docker.inc
> >>> b/recipes-containers/docker/docker.inc
> >>> index 40a3642..e196f9b 100644
> >>> --- a/recipes-containers/docker/docker.inc
> >>> +++ b/recipes-containers/docker/docker.inc
> >>> @@ -32,6 +32,7 @@ RDEPENDS:${PN} += "virtual-containerd virtual-runc"
> >>>  RRECOMMENDS:${PN} = "kernel-module-dm-thin-pool kernel-module-nf-
> >>nat kernel-module-nf-conntrack-netlink kernel-module-xt-addrtype
> >>kernel- module-xt-masquerade"
> >>>
> >>>  PROVIDES += "virtual/docker"
> >>> +RPROVIDES:${PN} += "virtual-docker"
> >>>
> >>>  # we want all the docker variant recpes to be installable via "docker"
> >>>  PACKAGE_NAME = "docker"
> >>> --
> >>> 2.25.1
> >>>
> >>>
> >>>
> >>>
> >>
> >>
> >>--
> >>- Thou shalt not follow the NULL pointer, for chaos and madness await
> >>thee at its end
> >>- "Use the force Harry" - Gandalf, Star Trek II



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

