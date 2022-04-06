Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 872A8C43217
	for <webhook@archiver.kernel.org>; Wed,  6 Apr 2022 18:41:41 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web08.313.1649264290168485347
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 06 Apr 2022 09:58:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=oN9I9UZI;
 spf=pass (domain: burtonini.com, ip: 209.85.128.49,
 mailfrom: ross@burtonini.com)
Received: by mail-wm1-f49.google.com with SMTP id p189so1877790wmp.3
        for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 06 Apr 2022 09:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0qa5joeZ1ETWfkfVX2HItJ4vJx77pqC2xYsX1j2o+MY=;
        b=oN9I9UZIvcSg/9VuxpNWv0tRRxmy7rpIQCvMv9fVg+WA3vF3vwK5/ZtK+ngYfs3AG6
         Sm1w8Boey6LI6+dhss7HUWGy3VDGb69b0DASiNHn8LGLj28gQIbONWCdXr3DI6bUtMDI
         4IegYGe2J/Y8Gnok2QZ2kDBmb7BmRPBrbNxK6Z9pXx95nyp6ed253tozd4rI/ZeldS7F
         dUrV+jnCBnbg+KYv0G4JRcybhzUU6cNQz0eBsS9fEOzxtpoNcjCajGV6gO3ZakcpQEoG
         uo0xY1gclU2nMgQDdBGDGF1lCmRKTJiPP4JBtwKcOilUPz3KrB6DHefZoIZ67o11mZdE
         x3kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0qa5joeZ1ETWfkfVX2HItJ4vJx77pqC2xYsX1j2o+MY=;
        b=xfBVG4aPEt55GVOF6mJgRXQBTaCB9IOHjN/rrzBjIp34P0DTOzj665NLL1KzNr9Suo
         cmOK8HS8KJb9jGQNaNufh+dtGTauCAKovagOG+IGCU7Cj8QexE9KxRAD+eOoi/eYJO6p
         PgiQmq0tI3zkTmB9Klxh6Qg/RH/2HHP7SapZ0kydaCFkE/TjecFP9bwVPcG8UDT6NQBD
         bZ/JcNmqHVPu3maJ7Xbl5rgjtDn5cgNhXcPBE8pb/SXK9PPlaXzozsdlDsdArvduDRb8
         1C/1TLZJKSZdAUW5CwYMQNDyNr9PbDdlJ2cV9Ab/JDtX51q0pdBWgqKkwIKMKAekjgNt
         +w9Q==
X-Gm-Message-State: AOAM530nyBP/VYr5Be4txa2bqw+Mc8Rni0oHZBVANVKu9r4yWfocmz+i
	k71A8NAIxSCH1U0gTspoDKYg2kQeiMp/fkpYKmWE3w==
X-Google-Smtp-Source: 
 ABdhPJwTLK1fUPq+n1v8Gxj2If253VFyxmm4kz3g4BGIyRgcf7uRPONjnvZpCyK2LWA69yIzlxUVPSqZdh858dkBQvA=
X-Received: by 2002:a7b:c841:0:b0:389:864c:e715 with SMTP id
 c1-20020a7bc841000000b00389864ce715mr8171330wml.72.1649264288549; Wed, 06 Apr
 2022 09:58:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220406161440.2629415-1-ross.burton@arm.com>
 <20220406164457.GB41737@gmail.com>
In-Reply-To: <20220406164457.GB41737@gmail.com>
From: Ross Burton <ross@burtonini.com>
Date: Wed, 6 Apr 2022 17:57:57 +0100
Message-ID: 
 <CAAnfSTs302vYCb3JhFdwmY6_uPsPkO47jOyfU3xCMC3UKmSbaw@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] virt-what: add new recipe
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 06 Apr 2022 18:41:41 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7128

It pokes at /proc, /sys, and cpuid, so it should be initsystem agnostic.

Ross

On Wed, 6 Apr 2022 at 17:45, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
> I've always used systemd-detect-virt for this same use case.
>
> Can you confirm if it works both on sysvinit and systemd based
> init setups ?
>
> Bruce
>
> In message: [meta-virtualization] [PATCH] virt-what: add new recipe
> on 06/04/2022 Ross Burton wrote:
>
> > Signed-off-by: Ross Burton <ross.burton@arm.com>
> > ---
> >  recipes-extended/virt-what/virt-what_1.21.bb | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >  create mode 100644 recipes-extended/virt-what/virt-what_1.21.bb
> >
> > diff --git a/recipes-extended/virt-what/virt-what_1.21.bb b/recipes-extended/virt-what/virt-what_1.21.bb
> > new file mode 100644
> > index 0000000..aa235b3
> > --- /dev/null
> > +++ b/recipes-extended/virt-what/virt-what_1.21.bb
> > @@ -0,0 +1,11 @@
> > +SUMMARY = "Detect if we are running in a virtual machine"
> > +HOMEPAGE = "https://people.redhat.com/~rjones/virt-what/"
> > +LICENSE = "GPL-2.0-only"
> > +LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> > +
> > +SRC_URI = "https://people.redhat.com/~rjones/virt-what/files/${BP}.tar.gz"
> > +SRC_URI[sha256sum] = "12cb455334aa4cfd53ab78f27e2252e94d1f676dd093f48327ed94d8080d1f7b"
> > +
> > +DEPENDS = "perl-native"
> > +
> > +inherit autotools
> > --
> > 2.25.1
> >
>
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#7125): https://lists.yoctoproject.org/g/meta-virtualization/message/7125
> > Mute This Topic: https://lists.yoctoproject.org/mt/90293376/1050810
> > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>

