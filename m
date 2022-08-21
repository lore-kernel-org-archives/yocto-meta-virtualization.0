Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE32BC25B08
	for <webhook@archiver.kernel.org>; Sun, 21 Aug 2022 03:21:15 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web12.3527.1661052068854256700
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 20 Aug 2022 20:21:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NRl9IgRt;
 spf=pass (domain: gmail.com, ip: 209.85.222.178,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id f4so5805093qkl.7
        for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 20 Aug 2022 20:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc;
        bh=qQ/JJNmiVd7HDVMxX3RHFil4Hkr0H7gvsS4d/ZqRG9A=;
        b=NRl9IgRtpf8ZbN+qxNPB8IkeVyIpaNByI7qw9Bph/Wh2sFSTByDU0MRFX18INARF94
         czcmyX2IJWDGoNGJQbK/xDbeLHKuWL9NG7dnjQA1dk4tdg0zU6AWBtmqJds1Cm6rmEiR
         +Fu2rDpeFb2ZB00bGh6NsdxsoTTeeti9/6AFfHhulwwy7xyt0tnORz+stJEw1cZj5iQR
         hNgtNcrv/XOYMwIlMiaYgio/xQqPN1iU+WtQMhiJ2rGjHzfYOQ5KV5HfgA/k98uf/J0a
         vLuJImEXx5cqT2T/oe5fBRAY12rY1M9PhFdnmwWZ1Enp+HKheWrOuGKhWo/sFafc8umu
         296Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=qQ/JJNmiVd7HDVMxX3RHFil4Hkr0H7gvsS4d/ZqRG9A=;
        b=gMUFPDMs9QbBl/ZA/p+2k5gv7Tf/oB2C1i/LARMWmVvcbcpGnW4ZPBEMb7m4WxxmSW
         hjSFjO0O2Z76E5zfCoxBBQy5bLL1mKMPOglWln9E+VvokaM9XTsqQjKMZPfcImFv9Ogj
         U1uo9ACHPrSC9UBQPLig5ulr+nLS2n1DcAWYFgCwldwG4xuVlX85r3A6yGGw0A9aux/u
         BqldIaC0KP/xjb1naz+49w0f9MAPbhNmQqSdVwJsDRBVLFR3uE4mgKcE1zVpLSPo/iu9
         yApyzuADgQY7tpIHetoK9q2LRKrEEy29scUzELwNFyjMJezY5bW/jxpMVt38XD1j3vxd
         h1Vg==
X-Gm-Message-State: ACgBeo1yjjOp8Iz9OVCL8AItv3E5VdQGMFPXfnnXgF5xDaN4k03VMynh
	skRUjvyUyFdv7yjWG/4ayzw=
X-Google-Smtp-Source: 
 AA6agR7S4NwGobT8NqTajJkTX3nCk9xEZZIKLVoBe+g22UNSiZ/v0h6IhNm2XDr/bK65AyF3pmyMSw==
X-Received: by 2002:a05:620a:450e:b0:6bb:a4cf:de01 with SMTP id
 t14-20020a05620a450e00b006bba4cfde01mr9511285qkp.636.1661052067887;
        Sat, 20 Aug 2022 20:21:07 -0700 (PDT)
Received: from gmail.com ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 f9-20020ac84989000000b0034490214788sm6080855qtq.49.2022.08.20.20.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Aug 2022 20:21:07 -0700 (PDT)
Date: Sat, 20 Aug 2022 23:21:05 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Andrei Gherzan <andrei@gherzan.com>
Cc: Khem Raj <raj.khem@gmail.com>,
	meta-virtualization@lists.yoctoproject.org,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: Re: [meta-virtualization][PATCH] singularity: Skip recipe on musl
 builds
Message-ID: <20220821032102.GA57389@gmail.com>
References: <20220817115051.353409-1-andrei@gherzan.com>
 <CAMKF1sp61KuH21-T=Oqdq52DDAP6-uOjPbXZJQ1K-EGUL0Y0Aw@mail.gmail.com>
 <1a401d8a-cd6d-4948-ae9d-5baba6deca52@www.fastmail.com>
 <CAMKF1sr2EN_iZRKV6jpmR03Pvqs1=PNYR_1238xiOQWhErE-5A@mail.gmail.com>
 <6c9a52a0-8dc6-483a-9726-1a4f6fc829ec@www.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6c9a52a0-8dc6-483a-9726-1a4f6fc829ec@www.fastmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sun, 21 Aug 2022 03:21:15 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7548

In message: Re: [meta-virtualization][PATCH] singularity: Skip recipe on musl builds
on 17/08/2022 Andrei Gherzan wrote:

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

I've gone for the removal of the glibc dep, singluarity needs quite a bit of
runtime work .. so we'll do with that, and see if anyone notices.

merged to master and kirkstone.

Bruce

> 
> Andrei

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7538): https://lists.yoctoproject.org/g/meta-virtualization/message/7538
> Mute This Topic: https://lists.yoctoproject.org/mt/93078736/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


