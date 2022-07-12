Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DDBCC433EF
	for <webhook@archiver.kernel.org>; Tue, 12 Jul 2022 02:14:16 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.4288.1657592051815065216
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 11 Jul 2022 19:14:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VmTvc7Yt;
 spf=pass (domain: gmail.com, ip: 209.85.214.169,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id g13so1089651plh.2
        for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 11 Jul 2022 19:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fNSen6ocfT1eK++4Tl4wSfmrsdXWylUBUkVkTDKBufo=;
        b=VmTvc7YtTmXV8q2G07CZX/nUXGw6596tVo/V9Hhj1DK7ngEWMlV9fpgoAdygGFC5zF
         N3qAbtEsko2gh/UO/mh0BYA+LAp6OfisTI3kTTinYeetEmFddpEu7/al8SVvLnG2nirX
         czgomd0K0PIdIN9ju73+hikqninn30cQeruCq7dy8aRK3sFvMlHQQGi8tgTikcq/Chna
         fCv8YZHh9MhmbJoQRmz258auP72htwMy5EHxVbMCbt1hAf4HI646l7Cr7FKexirv4Jnl
         7Kwj4WQthKX0/u7fBrTFXkHkW/Y4suwWghjq5gzAJu3mpwYbH6l6OkkXxpLADB4MTL6B
         hsyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fNSen6ocfT1eK++4Tl4wSfmrsdXWylUBUkVkTDKBufo=;
        b=Ds5KqHCC8x6fNkXcDy96VU1vlWY9OWR4J9GkkJqxx7E98WgAGtA0jDap1rAC3TpiUL
         lUJpJgLBrwavwH/Qzc/GItG5pbqwblbeifTRQwHW33QKFindx4IWS+l07DHMNbrg4Z8V
         +C9f2O9HKjOGZLym10Sjh4Vq7SKnpn+HUuUcFGyNH253N+csmbD2AXE53IpkmQyFMxTr
         ihen12EbDEwfw/RElRBCPfQ0m3C1xGcq8jrr0DWUOdbhwcfBXflKZ77oR+NZ0Gxpitdl
         H1GL1jrDe+uwMLZHhjwjRQvuooaIpus1UtlS9du4BmxVsbuX7KepA6eBBZcDHMOooxZ/
         TRKg==
X-Gm-Message-State: AJIora8ir8dUGjbmYUgfLaGtfhuQgXh9PWfWEaxC6XAyEGFJS8IezpJ+
	eDXYPkzzdWpelVLKseMLm9AlFR5iO7Rk/TL8mEQ=
X-Google-Smtp-Source: 
 AGRyM1sj3MHLoWX5KN4xB73IktS8n/fKPE/0QwG56PlxWiRJaSt3osR8ICSr2hJ/foTDasciPsyOCXZaqxgpjo0+Uk8=
X-Received: by 2002:a17:902:d548:b0:16c:115d:7483 with SMTP id
 z8-20020a170902d54800b0016c115d7483mr22199396plf.135.1657592051183; Mon, 11
 Jul 2022 19:14:11 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CANp-EDa+9Wa6GntcF6+XU3khNfRoCfhE0cCAXihNHr1Btb2H5A@mail.gmail.com>
In-Reply-To: 
 <CANp-EDa+9Wa6GntcF6+XU3khNfRoCfhE0cCAXihNHr1Btb2H5A@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 11 Jul 2022 22:13:59 -0400
Message-ID: 
 <CADkTA4M8yppFXr-EnvqSEJZ0Fw3wJvXg4z5vQSAoy7UA0=z82A@mail.gmail.com>
Subject: Re: [meta-virtualization] docker/containerd/runc version
 compatability
To: Ralph Siemsen <ralph.siemsen@linaro.org>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 12 Jul 2022 02:14:16 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7440

On Mon, Jul 11, 2022 at 2:13 PM Ralph Siemsen <ralph.siemsen@linaro.org> wrote:
>
> Perhaps someone here can help point me to relevant documentation. I'm
> wondering if there are some guidelines about which version(s) of
> docker/containerd/runc are compatible. I've searched through the
> docker manuals and release notes, without finding very many details.
>
> Backing up a step further, the dunfell branch of meta-virtualization
> has docker-moby 19.03.15, containerd-v1.2.14, and runc-1.0.0-rc8. This
> combination seems to work fine, however there are several CVEs
> flagged.
>
> In a somewhat naive attempt to fix some of the CVEs, I updated
> containerd from 1.2.x to v1.4.12. This version was picked primarily
> because it was available in gatesgarth at the time, I could just copy
> the recipe over. This compiles and runs hello-world and ubuntu test
> images successfully.

FWIW, that's more than just bug fixes, so we wouldn't want that
much of a version bump on any of the -stable branches. They'd
stay within the .x series of a release.

>
> However over time, an oddity has emerged: even with no images
> downloaded and therefore no containers running (just the daemon
> sitting idle), the system log shows a goroutine crashing periodically
> with "fatal error: bad symbol table". It can take up to 10 hours, but
> usually happens within an hour, on an otherwise idle system.
>
> This did not happen with the original set of versions on the dunfell
> branch. So I'm wondering what versions can be combined? What other
> tests (besides downloading and starting a container) could be run to
> check that the chosen versions are working together correctly?

What you are describing is exactly why you'll see me in the list archives
telling folks that there's no need to send updates to the individual
packages in master. I do unified testing on all the various components
in about the m3 timeframe of a release. The -stable branches are
updated for CVEs/bugs only and get updates at a much slower cadence.

The dependencies/versions are documented within the projects
themselves, but they aren't tightly coupled (for the most part) so
there is some flex.  But honestly, it is often that the latest of all the
projects work together at any given point, so when I do the updates
that is fundamentally the known set of working versions. Otherwise,
you are into looking at the project and their documented dependencies
on the various components. (or looking at what other distros are doing,
etc).

The larger stacks (i.e. k3s) are what I use to drive more complex
and end to end testing with the components. But fetching a container
and running it is a good test and covers a lot of ground.

Bruce


>
> Any hints or advice would be appreciated!
> Ralph
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7435): https://lists.yoctoproject.org/g/meta-virtualization/message/7435
> Mute This Topic: https://lists.yoctoproject.org/mt/92316357/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

