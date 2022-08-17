Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31FD6C25B08
	for <webhook@archiver.kernel.org>; Wed, 17 Aug 2022 16:29:56 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com
 [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.web12.31040.1660753791534881369
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 17 Aug 2022 09:29:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZBWTRUdx;
 spf=pass (domain: gmail.com, ip: 209.85.167.178,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-oi1-f178.google.com with SMTP id w196so15893812oiw.10
        for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 17 Aug 2022 09:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=HFbMvNspazpPqlOAflkP0IG+9x7OS707Wk/OTqPu35I=;
        b=ZBWTRUdxoPman8JUR6kS49KorNfjVDI/VCZBpQF7f5tKIhXPv6hkZG5pHXdLDpSHVG
         cy5GC2V9mVHX3BkFcATyai2XBqKY4Rro6OZwkeQdxPbp5f2D6Q0uvu+mVnl3tgGvYWTh
         RG00XuWEFbhBWIBsPc8vh+Jz9r3jen3aF+2dnZNw5myo3q85W/6pMjPJStouY6CITibl
         /E4PIEYP/1DmdKyqvmBqkN6llPcwYS/nnF7k+GzMr4tu1AgAM/iMRGwbQguirdejBXL7
         01/Pb9HlxxlSb9mKZals8VFZT9Dn43hTsa+JmSlwdxVbp4/DII1mdeqytsEe1GJ2gdmr
         y2+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=HFbMvNspazpPqlOAflkP0IG+9x7OS707Wk/OTqPu35I=;
        b=EwXEjiNeiuVZi//3NqJdKsOiNIcvqP6+dmW8iWiz+KBH5lMuaRCiv7PBaBbgRxpLNC
         3+7E9ngwng/6Msi8iTTdyINRTXIcIREwAIytMwFMLrYf7/ThLEsaJx3QAUkXCmfeFdFR
         Hc+cCUEigNAro/6QyLIny0zcOFIYdewUovN9eJwhsEbA1DB+w2IiXT06KJY2kJlVa5Gk
         uGWz7kqA8Oe1CWW1+wx/6/E7PLv/K9dsgSvAYu4+5kvfXvqCII66FecfcMmG6o5XTqgw
         V2HsH8pmBvi9XFSRhKpMsbWPsvo8HGgcv7YeooHLcaktfQ4/lExUtynbS6BjBgYLYXLw
         ZT/w==
X-Gm-Message-State: ACgBeo3mpIIyrMT1L27b8qT5yGxq7HtyMKhuu9gMpVsyN3holHSCUjHI
	nVtLfGNICz5XzkfMfO20T0N54y6paAkaBvvp3Jk=
X-Google-Smtp-Source: 
 AA6agR77fxDMLJuMVpvPUKa61zYAOSBrXoSkPGaqFabk4AYFud88gG4YwFiKBsgzyS+kY5HuY5w01TOpH6DSG13ASQU=
X-Received: by 2002:a05:6808:199d:b0:343:290a:9f4c with SMTP id
 bj29-20020a056808199d00b00343290a9f4cmr1882114oib.6.1660753789445; Wed, 17
 Aug 2022 09:29:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220815210243.25546-1-sakib.sajal@windriver.com>
 <CADkTA4MX053i=kVX2xDjKVNS-6tELBoopEYLABxFPazzyTULdA@mail.gmail.com>
 <BY5PR11MB39922BCF8D81159B0F0179E5886A9@BY5PR11MB3992.namprd11.prod.outlook.com>
In-Reply-To: 
 <BY5PR11MB39922BCF8D81159B0F0179E5886A9@BY5PR11MB3992.namprd11.prod.outlook.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 17 Aug 2022 12:29:37 -0400
Message-ID: 
 <CADkTA4Mrst2j8A5RJNYiV_QhrFQY7X-wdjsNXqFBHboR4GXfKg@mail.gmail.com>
Subject: Re: [kirkstone][meta-virtualization][PATCH] ceph: upgrade v15.2.15 ->
 v15.2.17
To: "Slater, Joseph" <joe.slater@windriver.com>
Cc: "Sajal, Sakib" <Sakib.Sajal@windriver.com>,
	"meta-virtualization@lists.yoctoproject.org"
 <meta-virtualization@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 17 Aug 2022 16:29:56 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7535

Thanks Joe!

Bruce

On Wed, Aug 17, 2022 at 12:28 PM Slater, Joseph
<joe.slater@windriver.com> wrote:
>
> The CVE fix I sent you is in the upgraded version of ceph.     Joe
>
> > -----Original Message-----
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > Sent: Wednesday, August 17, 2022 7:19 AM
> > To: Sajal, Sakib <Sakib.Sajal@windriver.com>; Slater, Joseph
> > <joe.slater@windriver.com>
> > Cc: meta-virtualization@lists.yoctoproject.org
> > Subject: Re: [kirkstone][meta-virtualization][PATCH] ceph: upgrade v15.2.15 ->
> > v15.2.17
> >
> > I also have a pending patch from Joe Slater that addresses a different CVE on
> > kirkstone.
> >
> > Can someone look and check if it is also covered by this uprev ? Ceph takes an
> > incredibly long time to build on my servers, so I'd like to avoid as many builds as
> > possible.
> >
> > Bruce
> >
> >
> > On Mon, Aug 15, 2022 at 5:03 PM <sakib.sajal@windriver.com> wrote:
> > >
> > > Upgrade ceph to latest v15.x.
> > > Minor upgrade containing fix for CVE-2022-0670.
> > >
> > > Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> > > ---
> > >  recipes-extended/ceph/{ceph_15.2.15.bb => ceph_15.2.17.bb} | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)  rename
> > > recipes-extended/ceph/{ceph_15.2.15.bb => ceph_15.2.17.bb} (98%)
> > >
> > > diff --git a/recipes-extended/ceph/ceph_15.2.15.bb
> > > b/recipes-extended/ceph/ceph_15.2.17.bb
> > > similarity index 98%
> > > rename from recipes-extended/ceph/ceph_15.2.15.bb
> > > rename to recipes-extended/ceph/ceph_15.2.17.bb
> > > index 17dbcf3..9fb2e72 100644
> > > --- a/recipes-extended/ceph/ceph_15.2.15.bb
> > > +++ b/recipes-extended/ceph/ceph_15.2.17.bb
> > > @@ -16,7 +16,7 @@ SRC_URI = "http://download.ceph.com/tarballs/ceph-
> > ${PV}.tar.gz \
> > >
> > > file://0001-SnappyCompressor.h-fix-snappy-compiler-error.patch \  "
> > >
> > > -SRC_URI[sha256sum] =
> > "5dccdaff2ebe18d435b32bfc06f8b5f474bf6ac0432a6a07d144b7c56700d0bf"
> > > +SRC_URI[sha256sum] =
> > "d8efe4996aeb01dd2f1cc939c5e434e5a7e2aeaf3f659c0510ffd550477a32e2"
> > >
> > >  DEPENDS = "boost bzip2 curl expat gperf-native \
> > >             keyutils libaio libibverbs lz4 \
> > > --
> > > 2.33.0
> > >
> > >
> > > -=-=-=-=-=-=-=-=-=-=-=-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#7523):
> > > https://lists.yoctoproject.org/g/meta-virtualization/message/7523
> > > Mute This Topic: https://lists.yoctoproject.org/mt/93046468/1050810
> > > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> > > Unsubscribe:
> > > https://lists.yoctoproject.org/g/meta-virtualization/unsub
> > > [bruce.ashfield@gmail.com]
> > > -=-=-=-=-=-=-=-=-=-=-=-
> > >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await thee at
> > its end
> > - "Use the force Harry" - Gandalf, Star Trek II



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

