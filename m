Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 478FBC25B08
	for <webhook@archiver.kernel.org>; Wed, 17 Aug 2022 16:54:26 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com
 [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.web12.31362.1660755261362130401
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 17 Aug 2022 09:54:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=heGCSNO0;
 spf=pass (domain: gmail.com, ip: 209.85.128.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-333b049f231so135478757b3.1
        for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 17 Aug 2022 09:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=rWHQBIvkkcdpj2mOmB139bpXeonn+nGTVdD37T8GApE=;
        b=heGCSNO0NyY2hkZfgA+myfpdOdunhEna9rBmXUzRuuK1+oAxRIj5kqcZfL5BSgTShi
         SXQwSQXBmES/B45B9WBVyZIQ5NXm2IAmp90nB4fX3RhmOAQslXN1bedkfxY+1bkQlyXS
         UvmIV5tx/x0y67Qx8k6EpD5nkMSNEt0hme2RB+JWHZ6IBCWfEtdEZg7nxqzkkX3nNemm
         HgYpS0/faeDOG8t2miFdHhuwxfMB/3bBFeWZQQJh6tvkFkmS5rYwXsz1tDgYiIDdn0H6
         6ZghXURyuoBroj6WZZhp8ty/WLNsCj29GEMRh2vvUcyDQFJjCk7n5KwAJMdKvWG+m94c
         kWyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=rWHQBIvkkcdpj2mOmB139bpXeonn+nGTVdD37T8GApE=;
        b=m51qT5h8B9sgeF0FK31ISg1eu3HD7uld4ew/PCzKe3XPXmGez3GXu6vsPkkfc2yhrO
         qjth6yLdITGXfWL1CFilM63NHZTFMd9a6dmeZENYP22z876/1Q/bXcd6osIKbb/ITnIh
         SFH9qfaW2a/+5bQjOmpTLJxDlSZ3rEAmAXbn22MiF6x13B3BLCKTpz3hq90UKRURZPUE
         5yIeYwuVivcfKdqOHBBG7k1ZqHsXCP0DLCqSSUT9SWyQvTxqHNf1WLBaS16DMb1bnDXf
         9lwdr5bzuHq4YYqlKDIVuZ6sHW2zOw6BSQR64QGmBFrsgfxCO8fY1lJAN8y+mXJO466i
         e/cQ==
X-Gm-Message-State: ACgBeo3Yaaf8JWasIZQJpQXuRUdfK+i1Y6Hjwf1YGIXD8dFYWhttt2RN
	fEWvjKhdyZ7h3HY4IwLT+IpUKGII8W/bCXLXQgQ=
X-Google-Smtp-Source: 
 AA6agR7iUZ1HiRQthUWl8kXqO/8yFu6BwchF6a5u422sUqFg9gaY9fEMpjYcy9hqn9bN35MOcLVcILAQGumB0dZSz+Q=
X-Received: by 2002:a25:b985:0:b0:671:3386:8bf8 with SMTP id
 r5-20020a25b985000000b0067133868bf8mr20769937ybg.495.1660755260400; Wed, 17
 Aug 2022 09:54:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220817115051.353409-1-andrei@gherzan.com>
 <CAMKF1sp61KuH21-T=Oqdq52DDAP6-uOjPbXZJQ1K-EGUL0Y0Aw@mail.gmail.com>
 <1a401d8a-cd6d-4948-ae9d-5baba6deca52@www.fastmail.com>
 <CAMKF1sr2EN_iZRKV6jpmR03Pvqs1=PNYR_1238xiOQWhErE-5A@mail.gmail.com>
 <6c9a52a0-8dc6-483a-9726-1a4f6fc829ec@www.fastmail.com>
In-Reply-To: <6c9a52a0-8dc6-483a-9726-1a4f6fc829ec@www.fastmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 17 Aug 2022 09:53:53 -0700
Message-ID: 
 <CAMKF1sqSWLvwac12ve=dk_zm5iEODWyp9dBhkHfuX3yJx+pfvw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] singularity: Skip recipe on musl
 builds
To: Andrei Gherzan <andrei@gherzan.com>
Cc: meta-virtualization@lists.yoctoproject.org,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 17 Aug 2022 16:54:26 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7539

On Wed, Aug 17, 2022 at 9:38 AM Andrei Gherzan <andrei@gherzan.com> wrote:
>
> On Wed, 17 Aug 2022, at 15:59, Khem Raj wrote:
> > On Wed, Aug 17, 2022 at 7:15 AM Andrei Gherzan <andrei@gherzan.com> wrote:
> >>
> >> On Wed, 17 Aug 2022, at 15:09, Khem Raj wrote:
> >> > On Wed, Aug 17, 2022 at 4:51 AM Andrei Gherzan <andrei@gherzan.com> wrote:
> >> >>
> >> >> From: Andrei Gherzan <andrei.gherzan@huawei.com>
> >> >>
> >> >> This recipe explicitely rdepends on glibc so trying to build this with
> >> >> musl will break world builds.
> >> >>
> >> >
> >> > do you know why is it marked as glibc only.
> >>
> >> I've tried to figure it out but I couldn't find anything obvious.
> >>
> >> https://git.yoctoproject.org/meta-virtualization/commit/recipes-containers/singularity/singularity_git.bb?id=06bc17d1f0650ad2cb134b09b25133bcd641d473
> >>
> >
> > maybe that rdep on glibc is bogus. Its not normal to depends on glibc
> > like that, in some cases e.g. locales etc it maybe that we need them
> > but thats usually for ptests etc.
> > can you try to remove the rdep and see if it builds ok with musl too ?
>
> It built alright but I didn't check any runtime behaviour. I do find this a bit orthogonal at this point but I've sent both patches so Bruce can pick any - both approaches are working for me.
>

Well not orthogonal I would say but alternate solution to what this
patch is trying to fix, if you remove glibc from the rdeps then this
patch is not needed

> Andrei
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7538): https://lists.yoctoproject.org/g/meta-virtualization/message/7538
> Mute This Topic: https://lists.yoctoproject.org/mt/93078736/1997914
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

