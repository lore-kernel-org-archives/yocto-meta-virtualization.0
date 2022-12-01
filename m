Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8993C43217
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 15:08:22 +0000 (UTC)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
 by mx.groups.io with SMTP id smtpd.web11.46125.1669907293259611701
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 01 Dec 2022 07:08:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YYOgo5kk;
 spf=pass (domain: gmail.com, ip: 209.85.166.41, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f41.google.com with SMTP id n21so1200905iod.5
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 01 Dec 2022 07:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RILHoPd/Q1dysvKbTRCkQ3yA6TfMqbckQCnEuzbOfhU=;
        b=YYOgo5kkHaqOqn1vGyZ5NwDhYyGD46pBimOEIqcXzUGfRTDIYeV3XVyDYCE3hVisZq
         5Y5z4eicuZsCsjbqbQDwkCDDnS5zLKI0qQDEn6GH2YKIGcgJS8w/RDcaJ5BspPGKL1x4
         H/dfio0f/ppnRME1B6ugOj+3vZnSNQ/225ezXWNrHyfQK5F7G6NJ1tYnhvaPdBm2EXT9
         yC+4lpUINFO6lpKrt4SYPFMydWWKyEGBHHM+pN4kJYjQzBMdEN5snr2UQc81zZWXAIjB
         Tg6YOEExiy+/OHxMjUYgNmakGPvqyrKyANEPXmVUC0ELT7QVjqvHDnOgYrc2ZWFE0+JU
         cQ6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RILHoPd/Q1dysvKbTRCkQ3yA6TfMqbckQCnEuzbOfhU=;
        b=ppgyVntrqm3LtphRG+1qatYc3C9b3V2As79vYSxGcijt1/uixADHAa7YIXLuB1M1/4
         BP5KRByp8JKFXtsNkVvJskYkmSmoFS/KllWzU1h4JLTfZ8QIuIwsOvE8EtfmgWkqJRfF
         r1owdphs2QRSCw9Aiaolp9d2hj9amQP2u3gSH7UGk63/92kQknaJfj46/yIJP+4ppaGP
         IyXPIruLEJCUk67CVV44nX/zkHKuyU0VfFFtvFtTz+TnxWAuvs6QacifyTtLzPMosQ47
         2ARGzqE2DMeq+DIjUIYKpegeJcILLgkdcc5Vs+XU0XuR7fRnQPsTZjhm07M9nwBUE3Oo
         vVjg==
X-Gm-Message-State: ANoB5pmYVtlkeArkzht+cBQtIkWNNX8+KivSrj4Ht4rc4+fzBONyFXaW
	utY2NclYoTew5IN8BTt33fjRpHMSXtaiE8ArHQU=
X-Google-Smtp-Source: AA0mqf4V3mXnWsReMdagAy4h8lUGv8zZN5d+4I8DVGuCM0cZK/k/+59j68jPy9y2qJXsDnybxl3vH9DMAKmHCFNxLBw=
X-Received: by 2002:a02:6a64:0:b0:375:6225:97ae with SMTP id
 m36-20020a026a64000000b00375622597aemr32801475jaf.70.1669907292313; Thu, 01
 Dec 2022 07:08:12 -0800 (PST)
MIME-Version: 1.0
References: <ddf7cf66-0067-2ea9-dbad-a73bba79a5db@axis.com> <172CB2E0F08C4564.1705@lists.yoctoproject.org>
In-Reply-To: <172CB2E0F08C4564.1705@lists.yoctoproject.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 1 Dec 2022 10:08:01 -0500
Message-ID: <CADkTA4M=vRTm4Ty1Y1y_5Ehjb94Omk-MNeEFPtGZUsoS6xGsOw@mail.gmail.com>
Subject: Re: [meta-virtualization] [Question] upx: do_fetch: Bitbake Fetcher
 Error:,FetchError('Submodule refers to the parent repository.
To: bruce.ashfield@gmail.com
Cc: Joakim Roubert <joakim.roubert@axis.com>, 
	"meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 01 Dec 2022 15:08:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7722

On Thu, Dec 1, 2022 at 9:50 AM Bruce Ashfield via
lists.yoctoproject.org
<bruce.ashfield=gmail.com@lists.yoctoproject.org> wrote:
>
> On Thu, Dec 1, 2022 at 8:46 AM Joakim Roubert <joakim.roubert@axis.com> wrote:
> >
> > Hi!
> >
> > On Kirkstone, since Kirkstone 4.0.5 (commit
> > 189a6d452e3037c9e94ccdf6af38359fc6058064,
> > https://git.yoctoproject.org/poky/commit/?h=kirkstone&id=189a6d452e3037c9e94ccdf6af38359fc6058064)
> > the added check gives me
> >
> > ERROR: upx-3.96+AUTOINC+4e1ae22a1a-r0 do_fetch: Bitbake Fetcher Error:
> > FetchError('Submodule refers to the parent repository. This will cause
> > deadlock situation in current version of Bitbake.Consider using git
> > fetcher instead.', None)
> >
> > (I noticed that latest master is identical with latest kirkstone.)
> > I'm experimenting with using git:// instead of gitsm:// and adding a
> > suggested solution if found searching for documentation on how to
> > migitate this
>
> There's been some serious re-writing of the repository, which is
> generally speaking a no-no.
>
> The hash we were previously using is completely gone. But then again,
> we are using a branch called "devel", so history re-writing could be
> expected.
>
> The fix is not really about the fetcher,  but using a different git hash.
>
> I've bumped the recipe locally, and our one patch can also be dropped,
> as it has been merged.
>
> That being said, I'm now running into cmake build issues, which I'm
> working through.
>
> I'll continue to plug away at it in the background today, and with any
> luck can have it working again shortly (I'm terrible with cmake).
>

I did have some luck, and I pushed a proposed fix to master-next.

Have a look, and see if it fixes the build for you.

Bruce

> Bruce
>
> >
> > do_configure:prepend() {
> >      cd ${WORKDIR}/git
> >      git submodule update --init --recursive
> > }
> >
> > but I've not yet been able to make things work. Since I'm no power user
> > when it comes to Yocto magic perhaps someone already knows what would be
> > the best way forward on this (if I'm on the wrong path)?
> >
> > BR,
> >
> > /Joakim
> >
> >
> >
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7721): https://lists.yoctoproject.org/g/meta-virtualization/message/7721
> Mute This Topic: https://lists.yoctoproject.org/mt/95382316/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

