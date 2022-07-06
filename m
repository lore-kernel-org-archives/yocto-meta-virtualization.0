Return-Path: <christopher.w.clark@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27439C43334
	for <webhook@archiver.kernel.org>; Wed,  6 Jul 2022 05:26:01 +0000 (UTC)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com
 [209.85.217.53])
 by mx.groups.io with SMTP id smtpd.web09.2873.1657085159327127925
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 05 Jul 2022 22:25:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IIexw0Xt;
 spf=pass (domain: gmail.com, ip: 209.85.217.53,
 mailfrom: christopher.w.clark@gmail.com)
Received: by mail-vs1-f53.google.com with SMTP id 189so14073101vsh.2
        for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 05 Jul 2022 22:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TFfac8JAkKKoHHruThz2srt3+h/+etGwRuNZ/B1C/SM=;
        b=IIexw0XtAabrnfoU7FvRjdcLSeTiXQwBjS2JSKdAgFm1xv1xDoQBz5yFxQVj+oAfjR
         HYkOmAzk5g5kFiGadsbR8hE/N78OcNid7lK5jw9Dx8us4tQVWvXKuMuzZkXwv4yHSOv+
         uNW+zaPPQ9dUbyMwiy4U8Ha+uIqU2kcorEpsvqN+o7JCn1hJNUIK5rRfTibPt9zpUlN/
         XMKFmhSt8uw1xgyMw9+g2Sx0Fk20Wc9VULWVxGRncgL93yCeHYslh6kk71Nlq1V04ruE
         GpzRXKS/GglYw+H8RDMfGy/ovFzdCK7TWaOpy82nsDo16DO5zM7enm2uhou+o351rEzr
         P23g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TFfac8JAkKKoHHruThz2srt3+h/+etGwRuNZ/B1C/SM=;
        b=4dfj3jvjEYYvlH7MY9at0FbVahKA7cdHaWbsIEfwZptF5l/NEHnZ/wMWk+OvPhD28L
         mOIet1k4iDnik598UH7wwuW8fhMK5ynI6kNlH6bdZ1kAzKYdO4/aAezbwXS/GgxfuK6X
         R47i0REdjRguK69I6RQlRTg7FAGjwCY2+SwURXOxE+OjEaEor/vKgnkCdwViv3VjiCD6
         IyPrDNfNprWF5C3j/RWgrZD29eAj+dLXQVcXNEEeucIj6mMm6+tl8VRayRFAtrevX7RC
         CgiGV0cjOjwDcUxUrckfjiQgmINIaIH7EYuB1ByeVoU0dGig7cIzbB2wNDwixQX3+WAd
         O06g==
X-Gm-Message-State: AJIora/SQuTLliDCsf5wXSlhKd9V1FAJ3dZkgnQx+S13y40KP2eOxPgz
	imp8gtEp4soMF5Y8oIdktVgE+JK+lfAMxsBphFc=
X-Google-Smtp-Source: 
 AGRyM1tRFfK+8ZcaQVxdB1J/3gNuL/KAT8Q9WOdPbsmzHeMZGnQP8sHtFXySnhCYv+UQnyfksMVC0jo2qNhLRMtbWUo=
X-Received: by 2002:a67:e3da:0:b0:356:ba54:fc28 with SMTP id
 k26-20020a67e3da000000b00356ba54fc28mr8304137vsm.77.1657085158381; Tue, 05
 Jul 2022 22:25:58 -0700 (PDT)
MIME-Version: 1.0
References: 
 <09a42f2562420f11d3187606418a73af07690f98.1656417819.git.bertrand.marquis@arm.com>
 <20220705202907.GD24762@gmail.com>
In-Reply-To: <20220705202907.GD24762@gmail.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Tue, 5 Jul 2022 22:25:47 -0700
Message-ID: 
 <CACMJ4GanUow2NuysR-3bjU9+OFEcaST+6dY17kEfzw5rjWBQjw@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] xen/sysvinit: add hvc0 console only
 if not there already
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
 meta-virtualization@lists.yoctoproject.org,
	nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 06 Jul 2022 05:26:01 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7410

On Tue, Jul 5, 2022 at 1:29 PM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
> Looks ok to me. I'll give it another day to hear from Christopher, and then
> I'll do the merge.

Ack from me - thanks

Christopher

>
> Bruce
>
> In message: [meta-virtualization] [PATCH] xen/sysvinit: add hvc0 console only if not there already
> on 28/06/2022 Bertrand Marquis wrote:
>
> > The base inittab recipe is creating inittab entries for consoles listed
> > in SERIAL_CONSOLES.
> > For qemu, this contains "115200,hvc0" so an entry is created in inittab
> > for it.
> > Prevent to create a second entry if hvc0 is present in SERIAL_CONSOLES.
> >
> > On qemuarm, this solves issues with the console when starting on top of
> > Xen as dom0.
> >
> > Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> > ---
> >  recipes-core/sysvinit/sysvinit-inittab_xen.inc | 10 ++++++++--
> >  1 file changed, 8 insertions(+), 2 deletions(-)
> >
> > diff --git a/recipes-core/sysvinit/sysvinit-inittab_xen.inc b/recipes-core/sysvinit/sysvinit-inittab_xen.inc
> > index 7f92bd1..724f47d 100644
> > --- a/recipes-core/sysvinit/sysvinit-inittab_xen.inc
> > +++ b/recipes-core/sysvinit/sysvinit-inittab_xen.inc
> > @@ -1,4 +1,10 @@
> > +
> > +
> >  do_install:append() {
> > -                echo "" >> ${D}${sysconfdir}/inittab
> > -                echo "X0:12345:respawn:${base_sbindir}/getty-wrapper 115200 hvc0" >> ${D}${sysconfdir}/inittab
> > +    # if SERIAL_CONSOLES contains hvc0, it is already added in inittab so do
> > +    # not add it twice
> > +    if echo "${SERIAL_CONSOLES}" | grep -vq "hvc0"; then
> > +        echo "" >> ${D}${sysconfdir}/inittab
> > +        echo "X0:12345:respawn:${base_sbindir}/getty-wrapper 115200 hvc0" >> ${D}${sysconfdir}/inittab
> > +    fi
> >  }
> > --
> > 2.25.1
> >
>
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#7400): https://lists.yoctoproject.org/g/meta-virtualization/message/7400
> > Mute This Topic: https://lists.yoctoproject.org/mt/92046232/1050810
> > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>

