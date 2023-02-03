Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83E86C636D4
	for <webhook@archiver.kernel.org>; Fri,  3 Feb 2023 14:44:00 +0000 (UTC)
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
 by mx.groups.io with SMTP id smtpd.web11.12266.1675435438555095336
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 03 Feb 2023 06:43:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=g/fUpXM0;
 spf=pass (domain: gmail.com, ip: 209.85.166.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f178.google.com with SMTP id z2so2146259ilq.2
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 03 Feb 2023 06:43:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Kh/5bSIZZ5r8bIbyX4JMbsS+EmIAgJ9RchiMZFphLlo=;
        b=g/fUpXM0d7BKf0mgUz44ZpNMRvsRCG7zOBO3p0GPfBBxp1d3oOuaZDu8F5UuPgAGNi
         B3LPqd1gMhMTlXhxiorPDQcj5nXryiQM6KXBcWrCpwqpC68teSrr2o9dvJQx0fP7C0JV
         K45IcCYD4L22U2VQt3sXvyMXxRz3RlBFObhkllwbsSygPdUx0UyaD8JLjyPcidp9en3b
         gHlSPAH7tZFd/HXOjId545BdXQ6p1PnWCw383EEPpPH4BfEC0fHKhF6MsL/h68tVLOg8
         wkzf0oZwfgqe0smzqHn3ZTRe2WKRW/NNS/4GfILBXH6SlBqqKTPK9HnWIAUGs2yKV81g
         oFTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kh/5bSIZZ5r8bIbyX4JMbsS+EmIAgJ9RchiMZFphLlo=;
        b=IRtB5i/9izWzo1r/8wD3jWt2FLEFegokV96FMR7uzBt0olT/5bu6J8qfM2vswNGZbB
         IZbxgM2vevvkOqSPTP7O2t+jvx4ZTQZv9mhB1Xn2GsDAaQhrXqaAc5X0oeHiW4wbeeqA
         hT9Q1B8l9Sn8BWjcDnJK3FkFGSYZoZfT6aXMqQb7OUhAlJJWAGtO4hp4nRBGIMu7t4e4
         RhSqNUec1OmzlCEakq48Ue8b4HxY5fKTo6ZpdmFMwH5SfWkzssOYapJi0PTc01pin21R
         TuYOMFlHLxXII4A2006S7J7kyBEBVVqXMtvxccbmcKsMYwOgcMpLyWgiKphjcT8ldz9R
         i2Rg==
X-Gm-Message-State: AO0yUKWIIGr7FxCNRJ6AncUJzFYp0sSFF7AzkV+LK8SRiy6LLQ4E+nyD
	9Fh/FUHL8AYc9r2/TBb1f+8nokIW7st9zk47zOwYfQgwthg=
X-Google-Smtp-Source: AK7set+Ftjj1D+aT+B+2UDnuNlxNThfTnbPKsrJyLn5tXcMfv6AK4zSi5WJWjGjRzNlyEb4lL+mD8/JA8ovG4zRq6+k=
X-Received: by 2002:a92:7111:0:b0:310:ada7:55f4 with SMTP id
 m17-20020a927111000000b00310ada755f4mr2316032ilc.74.1675435437747; Fri, 03
 Feb 2023 06:43:57 -0800 (PST)
MIME-Version: 1.0
References: <dda91366-c250-a853-576c-388e8a168cab@kernel.crashing.org>
In-Reply-To: <dda91366-c250-a853-576c-388e8a168cab@kernel.crashing.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 3 Feb 2023 09:43:46 -0500
Message-ID: <CADkTA4PR-zVcgBryHwuLwnB9OrcWjeE4-Z=WJH=2TvxmYgajHg@mail.gmail.com>
Subject: Re: [meta-virtualization] QEMU vmsep/virtfs setting
To: Mark Hatle <mark.hatle@kernel.crashing.org>
Cc: "meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 03 Feb 2023 14:44:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7845

On Thu, Feb 2, 2023 at 3:51 PM Mark Hatle
<mark.hatle@kernel.crashing.org> wrote:
>
> I've encountered an issue.  When I build nativesdk-qemu for mingw32 target I'm
> getting a failure.  Below is my attempt to figure out what is going wrong.
>
> nativesdk-qemu is depending on libcap-ng for some reason, which does not compile
> for mingw32.  Looking into how this dependency is coming about what appears to
> be happening is "virtfs" support is being enabled which triggers the dependency.
>
> Looking at the bitbake -e output, what I see is:
>
> https://git.yoctoproject.org/meta-virtualization/tree/recipes-devtools/qemu/qemu-package-split.inc#n46
>
> This is running for me in both the target and nativesdk configurations.  Trying
> to understand why it's enable, go back to the caller:
>
> https://git.yoctoproject.org/meta-virtualization/tree/recipes-devtools/qemu/qemu_%25.bbappend
>
> It SHOULD only be loading that file if 'vmsep' is enabled, but I believe due to
> the way bitbake, oe-core and BBCLASSEXTEND works, the nativesdk file includes
> work the same way for both target and nativesdk.  Looking at my DISTRO_FEATURES,
> my target does include 'vmsep', but my nativesdk does not.
>
> So hopefully this explains the failure, the target has vmsep, so the require
> always kicks in, which causes 'virtfs' to always be added to the configuration.
>
> I see two possible solutions to this:
>
> 1) Make the virtfs class-target specific.  This would match the prior lines and
> how they are arranged.  However, it's unclear to me if this was intended to be
> target specific or also alter and SDKs configuration.
>
> 2) Only enable virtfs for a Linux system (target or nativesdk), I think this can
> be done using an override one way or another.
>
> So for #1 the change would be something like:
>
> -PACKAGECONFIG:append = " virtfs"
> +PACKAGECONFIG:append:class-target = " virtfs"
>

The intention is that we require virtfs for a vmseparated target. i.e.
the target is the host running vmseparated containers.

So from the point of view of the build, restricting it to class-target is fine.

Bruce

>
> So for #2 the change would be something like:
>
> -PACKAGECONFIG:append = " virtfs"
> +ENABLE_VIRTFS = " virtfs"
> +ENABLE_VRITFS:sdkmingw32 = ""
> +
> +PACKAGECONFIG:append = "${ENABLE_VIRTFS}"
>
>
> I'm happy to submit a proper pull request, but I'm not sure what direction to go
> to fix this.
>
> Thanks!
> --Mark
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7842): https://lists.yoctoproject.org/g/meta-virtualization/message/7842
> Mute This Topic: https://lists.yoctoproject.org/mt/96709289/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

