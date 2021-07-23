Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web08.639.1627063392665594067
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 23 Jul 2021 11:03:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cuKHKGkW;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id v21so4994969ejg.1
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 23 Jul 2021 11:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=s1vDADLlFlEOINWV1lwFKHNBKBnWxThVIFSP7uetWEE=;
        b=cuKHKGkWy4kNHJklVtqfs0nlnI1ITIM+R49qnpPZVKV/V6Z7ge/bt9xlun698ht+KM
         /o4Cclys3WMJbstuQ5KvZpMG4N4QIJ1xhWAaxG7ClN+UsNGLUolgVmoO3gRgeHLVFYgF
         edTIVyNqjmUW7Qd4E4QCRkpv9drjiqrPPGlGPQ//ZHfH2bIYTGKXak1ko/pLLcsUeXiP
         Y860klVx2XTHQDS+pfEI/AWh/K1cEoF6xq9kdN4e46kAlWtak3CdlRujizzuF+1Cic0S
         46PZUC69D2pA5eV/NiBne5IfTGUlxKjXJ5shpjongZ+qu4A50FuzRWLNHEkvrEUBKIJM
         XRCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=s1vDADLlFlEOINWV1lwFKHNBKBnWxThVIFSP7uetWEE=;
        b=FjW2L6Q9Eupk/z97Mzur9eWyh2uuDcI0UndMBct45t6fQBQKDeqTUhU/oxtYBNK2Z7
         ZM8imhWCx8p9SPcnRxDV9QNFG/pEOQP8CIqVJgl5gkVBwXCuXFrnq8HVukyRoMS+/9AX
         d2LCT9UH27ISIOVwsobZc8wA0lFWnxLf725gPV391YBpj+lWxUqKp1V7ZKXVlRMLJcjl
         YeQD0XFhmxRe+rT7c2gblEM3rOZaFxEunFJByfPQ+IDtqmDNI+lMosjnOCWyKmTgXGsA
         zY6KXaKGkwEf78GG8OrkS12tEhQLAwfGkqWkwlcjKS9wl3QzQ7LriF2XFZnQRnZYeoTs
         7R/g==
X-Gm-Message-State: AOAM531dqOHXh82Wks7834N1sU92MKSga5im8NCRsvh4BwNMd8VRTMkL
	P7ImGDtLsZFBC7OJcsQ7iBeAqlLxRxyR8uDwr+g=
X-Google-Smtp-Source: ABdhPJx0CLqx6/PKk/wDdzfhDwgCSCU/Ox3vdmEewTw5OexnApjIRwoIE1l0ZnB7Qg5hbhYFKiaXv4ZBN5QzkdXmpls=
X-Received: by 2002:a17:906:76d8:: with SMTP id q24mr1814358ejn.22.1627063391141;
 Fri, 23 Jul 2021 11:03:11 -0700 (PDT)
MIME-Version: 1.0
References: <CAFrQVPN-a-5DPmxe3A9-o6U=bwsdGQForwQ-qYUPXsJS1pgdCw@mail.gmail.com>
 <32271.1627021942920151318@lists.yoctoproject.org>
In-Reply-To: <32271.1627021942920151318@lists.yoctoproject.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Fri, 23 Jul 2021 14:02:57 -0400
Message-ID: <CADkTA4Ny_xbg9Tw9zTBVJxzF2d_UAsfaR_Bt9ZWSUsCmzquxuw@mail.gmail.com>
Subject: Re: [meta-virtualization] linux-yocto virtualization requires virtio.scc from yocto-kernel-cache
To: Diego Sueiro <diego.sueiro@arm.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 23, 2021 at 2:32 AM Diego Sueiro <diego.sueiro@arm.com> wrote:
>
> On Fri, Jul 23, 2021 at 05:03 AM, Kyle Russell wrote:
>
> >
> > Hello,
> >
> > meta-virtualization's linux-yocto_virtualization.inc includes
> > cfg/virtio.scc in KERNEL_FEATURES, which is a dependency from
> > yocto-kernel-cache.  However, we do not use yocto-kernel-cache with our
> > custom linux-* recipe, so we're hitting a metadata error because of a
> > missing virtio.scc.  It seems like the creation of linux-%.bbappend (in
> > f2f36a8061c600b35b5f0ce1599d59f1d144a3aa) was intentional to match kernel
> > recipes other than linux-yocto*, which we could benefit from, but the lack
> > of yocto-kernel-cache is problematic with virtio.scc.
> >
> > Can meta-virtualization provide virtio.scc like it does for the other
> > kernel features to allow decoupling from yocto-kernel-cache?
> >
>
> Your question made me remember about the docker.scc. Which is being maintained
> both on meta-virt and yocto-kernel-cache. And linux-yocto_virtualization.inc makes
> usage of the one from meta-virt, which feels strange to me since it is a
> **linux-yocto**_virtualization.inc file that supposedly extends linux-yocto*.bb from
> oe-core.
> IMHO, for scc/cfg files we should try to rely on a single canonical source, and in this
> case, I believe is yocto-kernel-cache repo. Maintaining the same file for the same
> purpose in two different places brings the risk of diversion and increases maintenance
> effort to keep the instances aligned.
> Also, the yocto-kernel-cache gives us the ability to easily manage .scc files
> per kernel version.

Yes .. precisely! I'll reply to both email here, so I'm mixing replies
to Diego and
Kyle throughout.

We had a similar discussion in #meta-virt about a month ago, when some AGL
builds were running into a similar issue. The layout of the includes
and requirement
for the fragment were intentional, as was the broad nature of the bbappend
matching.

Without those fragments, I end up debugging end users' subtle runtime errors for
any number of packages in meta-virt, so having issues pop up when the
fragments can't be found, while annoying, is a useful flag for potential issues.

I resisted making a copy of virtio.cfg available in meta-virt for exactly the
reason Diego is bringing up. Maintaining them in two places is not ideal, and
having them centralized is the goal.

To solve the short term issue as we were talking about in #meta-virt, I did
a couple of things:

A "hack": https://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/commit/?h=master-wip&id=40cae93f631e77286de7fa79101abee2f6c04618

But if you use that, you'll need to ensure via other means that you get the
right configuration enabled.

And something that I had wanted to do for a while, which is the actual
solution I'm heading towards.

https://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/log/?h=master-test

see commits: https://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/commit/?h=master-test&id=44db8ee6ddf7c9eb1b5ffb22e9b83b3840997da9
and https://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/commit/?h=master-test&id=8db75f2809318cfb4dbe1c6873c5a6bcfefc4d8c

I still haven't done extensive testing with a lot of different kernels, hence
why I haven't moved them to master yet.

But with those two commits, I can remove all of the fragments in the layer
and rely on the one true reference in the kernel-cache.

Bruce

>
> > meta-virtualization used to allow this decoupling by configuring the virtio
> > feature without the yocto-kernel-cache in
> > f1c03f390e95b63d5c2dfba9140d1b07c4d17acf, but that was restructured in
> > 21d8bcdb791a1ea766a3e7e7663c7b6d49bc861a.  The dependency was not required
> > unless you were using linux-yocto, but as of f2f36a8061c60 is now required
> > for all linux-% recipes.  (We just now noticed because our linux recipe has
> > recently been updated to match a kernel version supported by
> > meta-virtualization.
> >
> > Thanks,
> >
> > Kyle
> >
>
> 
>


--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
