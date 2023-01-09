Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAE46C63797
	for <webhook@archiver.kernel.org>; Mon,  9 Jan 2023 21:25:10 +0000 (UTC)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
 by mx.groups.io with SMTP id smtpd.web11.86361.1673299503849562345
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 09 Jan 2023 13:25:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=J4utVD4x;
 spf=pass (domain: gmail.com, ip: 209.85.166.49, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f49.google.com with SMTP id q190so5182039iod.10
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 09 Jan 2023 13:25:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ll1XDootI4FiJkeuhvjYBG2d0LHUsgOL5mJvYQLSAvI=;
        b=J4utVD4xsMynASp9KwD58odkXCk743z4tW/aF2mQqP8iiXRbHpaNhAwDBTLndBw/I+
         dE17ZM5CfdKe/7eRkGNn/4Jc6wHovvKsBl/DrtL5271aPY0aJPBh1vG/vpcm8YzOD8Gu
         NgbBcR6iwozVEnyusspv7EhGTXIESzUMiK4PN9q93GFPlBAOKVZC5Njcdvjv/wmQwcQV
         mCfMEiCSkr6MV6eyXk0cEjHqEqao8yFIljsgjpJ+/oaz8BZZ2lZMgqeGicTvmVc+vnNP
         zA0282VV2ZstywM493wUn5X9QpS+P+Dt1wrV32WVui9XE9ZkC1/13gktmEsRMTxefAMg
         /i/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ll1XDootI4FiJkeuhvjYBG2d0LHUsgOL5mJvYQLSAvI=;
        b=GQUPy2qaXJ+N8asE+rT9rtd8sx0Vx+rvOfHaKh7EFrJ+oSougiMypjdt+MXRxIyOef
         BBK1gnb3cqULe21TvW9k2+oRswt0joW//RdTtTnU5uWh4Pp4pS6LKdp0mD8bm8jJnpLA
         gQO1wIhgsYSmKsl8hgeK7Hki+xyNFWBd1+hn+ggfx86n0CX2SU/KSxpXH481B3qJRSz+
         xw7UeboqCNE9I6TZghcuxtCUhe7I3Bw/Rboix0Ra0kRxx+rjwlKZfxCuNjyWKe/Qst3V
         Tir650LuYbaz5ygsRl4vwJX5onzi7Nw30ORmRp+AeffaBHwAaXaiX027o3HldiDFjjPP
         A+Eg==
X-Gm-Message-State: AFqh2kpAN1qYIOJXV/IhEjhPbOSk8JQntBJF7PYojfwsOc1bdhoR7NMA
	y/NsQbuQbH1m9DNzsVk52dzWkIILW7G9m6sAHuw=
X-Google-Smtp-Source: AMrXdXvVV+YMMY6bN1yEdy+Y9aIOphqg9U0OisrOUP+blrhQR/QufRb5euXhRDXrBW3esT3RD6nR/IbYBIpxKEkdj0I=
X-Received: by 2002:a02:6a1e:0:b0:38a:c2a7:369d with SMTP id
 l30-20020a026a1e000000b0038ac2a7369dmr6317012jac.245.1673299503069; Mon, 09
 Jan 2023 13:25:03 -0800 (PST)
MIME-Version: 1.0
References: <20230106101248.852370-1-mingli.yu@eng.windriver.com> <1737C26C23343587.7095@lists.yoctoproject.org>
In-Reply-To: <1737C26C23343587.7095@lists.yoctoproject.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 9 Jan 2023 16:24:51 -0500
Message-ID: <CADkTA4Nd4D-tL1JkARqQY4DASPA9FqErqj0DEN4xS8sy8RaOnA@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] libslirp: remove the recipe
To: bruce.ashfield@gmail.com
Cc: mingli.yu@eng.windriver.com, meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 09 Jan 2023 21:25:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7807

FYI: I'll get to this shortly. I updated repos today and have run into
a few build issues, so I need to sort them out first.

Bruce

On Fri, Jan 6, 2023 at 10:39 AM Bruce Ashfield via
lists.yoctoproject.org
<bruce.ashfield=gmail.com@lists.yoctoproject.org> wrote:
>
> This is an already known issue.
>
> I'll be forking the recipe versus removing it, I'm just not back full
> time so haven't had a chance to do it yet.
>
> Bruce
>
> On Fri, Jan 6, 2023 at 5:12 AM <mingli.yu@eng.windriver.com> wrote:
> >
> > From: Mingli Yu <mingli.yu@windriver.com>
> >
> > The libslirp recipe is added in openembedded-core [1], so remove the
> > recipe in meta-virtualization to fix the below yocto compliance issue.
> >
> > INFO: ======================================================================
> > INFO: FAIL: test_signatures (common.CommonCheckLayer)
> > INFO: ----------------------------------------------------------------------
> > INFO: Traceback (most recent call last):
> >   File "/build/layers/oe-core/scripts/lib/checklayer/cases/common.py", line 84, in test_signatures
> >     self.fail('Adding layer %s changed signatures.\n%s' % (self.tc.layer['name'], msg))
> > AssertionError: Adding layer meta-virtualization changed signatures.
> > 26 signatures changed, initial differences (first hash before, second after):
> >    libslirp:do_fetch: ddef7cb42fde46edfd7be943eae54ddc2b27bc0af62f8cb6b31593cabb0d5925 -> b71e325b62905059e0cf07b61ee0a4db192d212ff56395d0d93702e525ef8d4a
> >       bitbake-diffsigs --task libslirp do_fetch --signature ddef7cb42fde46edfd7be943eae54ddc2b27bc0af62f8cb6b31593cabb0d5925 b71e325b62905059e0cf07b61ee0a4db192d212ff56395d0d93702e525ef8d4a
> >       NOTE: Starting bitbake server...
> >       basehash changed from 50c45a6065da00132b899786d818a66f056190f6664fc4bfe974e8a9f70c7f78 to 3b4e51c0058462af0c141c974b2ea19a9efc51cb61ef26bc2b4367c1066ad8f9
> >       Variable SRCREV value changed from '3ad1710a96678fe79066b1469cead4058713a1d9' to '888ddad6bde1dc6d7dbfc8daa7d015251b72e02c'
> >
> >    libslirp:do_write_config: 8a3791774ea0f5793d1c14d0f3521582814420a057a2ee34488c8f868c7aacbb -> bdebe27987ebfdfdac9cf4c1af489f7aa674ef19454f7bf983549ae8ee2baf69
> >       bitbake-diffsigs --task libslirp do_write_config --signature 8a3791774ea0f5793d1c14d0f3521582814420a057a2ee34488c8f868c7aacbb bdebe27987ebfdfdac9cf4c1af489f7aa674ef19454f7bf983549ae8ee2baf69
> >       NOTE: Starting bitbake server...
> >       basehash changed from 8e5d9803b05d9999dbd18f4dce549312dc908f475362e236db785c94c99c8d5d to 0870fb4d535f92b666ed5a78d46ef69acc292888399961a24547b22d82b26d84
> >       Variable PV value changed from '4.7.0' to '4.6.1+gitAUTOINC+888ddad6bd'
> >
> > [1] https://git.openembedded.org/openembedded-core/commit/?id=a4409583e0f8187b0c0cbf92fbddeffef12fd8f5
> >
> > Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> > ---
> >  recipes-networking/slirp/libslirp_git.bb | 14 --------------
> >  1 file changed, 14 deletions(-)
> >  delete mode 100644 recipes-networking/slirp/libslirp_git.bb
> >
> > diff --git a/recipes-networking/slirp/libslirp_git.bb b/recipes-networking/slirp/libslirp_git.bb
> > deleted file mode 100644
> > index aeb61f63..00000000
> > --- a/recipes-networking/slirp/libslirp_git.bb
> > +++ /dev/null
> > @@ -1,14 +0,0 @@
> > -SUMMARY = "A general purpose TCP-IP emulator"
> > -LICENSE = "BSD-3-Clause & MIT"
> > -LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=bca0186b14e6b05e338e729f106db727"
> > -
> > -SRC_URI = "git://gitlab.freedesktop.org/slirp/libslirp.git;protocol=https;branch=master"
> > -SRCREV = "888ddad6bde1dc6d7dbfc8daa7d015251b72e02c"
> > -PV = "4.6.1+git${SRCPV}"
> > -S = "${WORKDIR}/git"
> > -
> > -DEPENDS = " \
> > -    glib-2.0 \
> > -"
> > -
> > -inherit meson pkgconfig
> > --
> > 2.25.1
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
> View/Reply Online (#7801): https://lists.yoctoproject.org/g/meta-virtualization/message/7801
> Mute This Topic: https://lists.yoctoproject.org/mt/96090819/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

