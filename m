Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A522C4321E
	for <webhook@archiver.kernel.org>; Fri,  2 Dec 2022 14:58:52 +0000 (UTC)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
 by mx.groups.io with SMTP id smtpd.web10.77468.1669993123123126951
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 02 Dec 2022 06:58:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=A+FBINC8;
 spf=pass (domain: gmail.com, ip: 209.85.166.44, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f44.google.com with SMTP id p83so3212806iod.2
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 02 Dec 2022 06:58:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=m4u9sJvNYYdmOHklAddzU8Bp4IDY2qS6NniR8qlilXk=;
        b=A+FBINC8IIqN8fMB3v4JS7xsNNby7TxkrY14OOmgSNytmLzkGUmTl3ljg3zRN2B964
         ETkrEQxFIi9OdIcNtKnYVp7Ia2nv6Ybt/SPDnV1LEg6ypmGHK5tzxgiSslOtLjIDaZuc
         4QoYKf5sUQajIRfidvkD5zPDMFJ6/btUFtkqSPc1oUWK1jYreZm93bpXCw6sl0UOB19i
         zzBslP02iNYKJcb3HzS69b4UsQxiM/HvlYLfi4J2pp2I3lIh9PuiT6Nvmbz/XP3ppCnJ
         rOy1s6lWyGHE18EOGI5YFxXGhSy6Btigfl66StfrfA3wjZsYZxg1R7iKPjizIAX4fE/s
         0MPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m4u9sJvNYYdmOHklAddzU8Bp4IDY2qS6NniR8qlilXk=;
        b=f7wfTTV8nLleW38SjlKHkGAU9QMTbZXCP/xdW891CbJsQRkxvlSV6FAD14meyUHl/Q
         L7SQ4gSr9DmnXBoiDDQpArjkpjUUmsuwWJWzwMFcpAs5jUx7pXJUjOGvdQZA8bqHRuBk
         drFhmaptcj20XYlkC2j3T2eSA7ZISnohbecN528NIsgKY5dNEm+XPFCqQ3Ui8u4SEdXD
         wtXGDguzGnqHq9wIARyB0TCc4mzzu7uqISbDsXlOEx+GN6QzXliGtw4dNA42tzC0yvTg
         CdTE0BXPVU3CtA1oG+P96oquPCFTnrp+GD//1hheNGvCKb1TKbISwE7RUlc/UHK1L0pw
         eHoQ==
X-Gm-Message-State: ANoB5pkaHXJRHt9w8thwe6n1SFMkHUsVgr5zv8zOMZs1InvdkaG/JSKy
	jHN4koax93rzTSNiqYA93H/hqWRvbxyYqOES/4E=
X-Google-Smtp-Source: AA0mqf56psKqh86eGE4yj18JyXBZGhN9prMqiDaKFgTpumeqVajgS1C7owBRCqKCD4ka5ufAzX8Zf9CTuWbw9kniXYs=
X-Received: by 2002:a5d:80ce:0:b0:6de:c30c:4d49 with SMTP id
 h14-20020a5d80ce000000b006dec30c4d49mr24955386ior.83.1669993122440; Fri, 02
 Dec 2022 06:58:42 -0800 (PST)
MIME-Version: 1.0
References: <ddf7cf66-0067-2ea9-dbad-a73bba79a5db@axis.com>
 <172CB2E0F08C4564.1705@lists.yoctoproject.org> <CADkTA4M=vRTm4Ty1Y1y_5Ehjb94Omk-MNeEFPtGZUsoS6xGsOw@mail.gmail.com>
 <75e9b925-a236-0809-49f1-f2f3cca0e263@axis.com> <172CFC133FAF0B2B.27320@lists.yoctoproject.org>
In-Reply-To: <172CFC133FAF0B2B.27320@lists.yoctoproject.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 2 Dec 2022 09:58:31 -0500
Message-ID: <CADkTA4OP5kfM69ONL1rdvvEkwFvF-s1NJ=PZbduoNHVT21aPmQ@mail.gmail.com>
Subject: Re: [meta-virtualization] [Question] upx: do_fetch: Bitbake Fetcher
 Error:,FetchError('Submodule refers to the parent repository.
To: bruce.ashfield@gmail.com
Cc: Joakim Roubert <joakim.roubert@axis.com>, 
	"meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 02 Dec 2022 14:58:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7732

On Fri, Dec 2, 2022 at 8:12 AM Bruce Ashfield via
lists.yoctoproject.org
<bruce.ashfield=gmail.com@lists.yoctoproject.org> wrote:
>
> On Fri, Dec 2, 2022 at 3:46 AM Joakim Roubert <joakim.roubert@axis.com> wrote:
> >
> > On 2022-12-01 16:08, Bruce Ashfield wrote:
> > >
> > > I did have some luck, and I pushed a proposed fix to master-next.
> > >
> > > Have a look, and see if it fixes the build for you.
> >
> > Thanks a lot; I tried it out immediately.
> > It will, however, give me the same gitsm error:
> >
> > ERROR: upx-3.96+AUTOINC+8d1a98e03b-r0 do_fetch: Fetcher failure:
> > Submodule refers to the parent repository. This will cause deadlock
> > situation in current version of Bitbake.Consider using git fetcher instead.
> >
>
> I don't see this on my up to date master build (I'm always following tip).
>
> Let me dig in a bit more.
>
> That being said, I've written multiple recipes like your follow up
> patch, and I do prefer the clarity of everything being directly in the
> SRC_URI.
>

I still can't reproduce the issue here, but everything still works
with your patch on top .. so I've added it to the queue on
master-next.

Bruce

> Bruce
>
> > BR,
> >
> > /Joakim
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
> View/Reply Online (#7731): https://lists.yoctoproject.org/g/meta-virtualization/message/7731
> Mute This Topic: https://lists.yoctoproject.org/mt/95382316/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

