Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
 by mx.groups.io with SMTP id smtpd.web11.907.1591401246415716923
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 05 Jun 2020 16:54:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HYlF6TBX;
 spf=pass (domain: gmail.com, ip: 209.85.218.65, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f65.google.com with SMTP id n24so11919542ejd.0
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 05 Jun 2020 16:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lSuwaAhJtb0PZpeAF5WRrPjYIS8vAt5DdfDXobgzFds=;
        b=HYlF6TBXIDNB+SJhdN5LuYHolVLJjoDEwSs2YZBfQn7sK5pQvaew4PJWWd/Fic/L3P
         EQkA2UOCppBEFqewMMVEnCyO9KllIskI8PjPDVlOn99z+7pbaQ410yRNNOQRPmXG9P+9
         D+LCXkr3BFfgtiqp0nC9jA5hNJK6ziOeKcuDX+SKSXCTKZCN/ofQrt4wRzyjRsgtrqnF
         a6WmDoYQ3CRkhMwKBkW47so0m37njsEEzckVMYHmDFJPrYfXuMqyFnGtUjMqLj0L3LwP
         yN/thOXEUbx8L6y0hPd3/cJM/2Mfp1Ihhp2TCF+DBddZ6FFF27bSwo0jnJXlhb8eu74F
         d4QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lSuwaAhJtb0PZpeAF5WRrPjYIS8vAt5DdfDXobgzFds=;
        b=h2LM9MLzl95lJYLVw1R90okp8rFCtcq79sBAJk2iqM/467YgY5yZ/emoKAuVFli83u
         x4uEFl8qCOUN365MJzLAsxLBHfPyPLFNZim0f+ZtH+TNpyrxFL7Pan0dOLQCYA+Qd56l
         jchqm1yGtRRK2Sw9psAtBeV6NDKvWF1WusVauz22/ZigNvZYPyjQ9D4NiyrVSUKbZMM7
         YMSDTHogoZs9WBKpdsvX+0cLVrTIBRFSU5/j26RybOjPTPJEgov7trnfXoy5vl2juKL0
         SzYRXGK5yIm/5uY/U8B1PucSGV+IGDsjv3O4CeDM4yOZrlTtMx20Aa3QgbmRiSyxPP8K
         nF0g==
X-Gm-Message-State: AOAM531Q7omJRCMsfGeqqxI3UutDYkuzNvEfgC+Wr8sHm5d88R0bYbNa
	flzHT159kTjtmqkvrMmTL1u1juP6d+toRHMUSeQ=
X-Google-Smtp-Source: ABdhPJyHd7IF8OquzsQIorXs8MNNVNcC9DYZPxZq7kgLiWqCJDj/O6sZwWRDf7gbH2O05u39Heg6yjioQ6Le7t6mq+g=
X-Received: by 2002:a17:907:4030:: with SMTP id nr24mr4092474ejb.247.1591401244764;
 Fri, 05 Jun 2020 16:54:04 -0700 (PDT)
MIME-Version: 1.0
References: <CY1P110MB05517012EA0DC0134F655D2A8C860@CY1P110MB0551.NAMP110.PROD.OUTLOOK.COM>
 <20200605211602.GO2903@minyard.net>
In-Reply-To: <20200605211602.GO2903@minyard.net>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Fri, 5 Jun 2020 19:53:53 -0400
Message-ID: <CADkTA4N7vqHMi8Fa5H1sRuX4ZnVrEiS4oso5TiObUu0thJGr5g@mail.gmail.com>
Subject: Re: [meta-virtualization] Xen on Raspberry Pi 4 (was "How to resolve the ERROR: xen-image-minimal-1.0-r0 do_rootfs: Function failed: do_rootfs. and ERROR: xen-image-minimal-1.0-r0 do_rootfs: Could not invoke dnf. ERROR: xen-image-minimal-1.0-r0 do_rootf")
To: Corey Minyard <cminyard@mvista.com>
Cc: Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>, 
	Christopher Clark <christopher.w.clark@gmail.com>, Siddhartha V <Siddhuvgowda.18695@gmail.com>, 
	"meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 5, 2020 at 5:16 PM Corey Minyard <cminyard@mvista.com> wrote:
>
> On Fri, Jun 05, 2020 at 07:55:37PM +0000, Stewart Hildebrand wrote:
> > + Corey
> >
> > On Friday, June 5, 2020 3:19 PM, Bruce Ashfield wrote:
> > >On Fri, Jun 5, 2020 at 3:12 PM Stewart Hildebrand wrote:
> > >> On Thursday, June 4, 2020 5:13 PM, Christopher Clark wrote:
> > >> > Hello Siddhartha,
> > >> >
> > >> > I am also interested in running Xen on the Raspberry Pi 4. I hope to have time next week to be able to look into it.
> > >> >
> > >> > Christopher
> > >> >
> > >> >
> > >> >> On Jun 4, 2020, at 5:05 AM, Siddhartha V wrote:
> > >> >>
> > >> >> Hello dear meta-virtualization team,
> > >> >> I am building the xen minimal image using yocto warrior ("bitbake xen-image-minimal") by giving the target machine as
> > >"raspberrypi4".
> > >>
> > >> Corey Minyard created a layer for Xen on Raspberry Pi 4 here https://github.com/MontaVista-OpenSourceTechnology/meta-
> > >raspberrypi-xen
> > >>
> > >
> > >Someone needs to lean on them to get patches submitted to meta-virt.
> >
> > Corey: you are hereby encouraged to submit patches to meta-virtualization.
>
> Ok.  The layer has the following basic pieces:
>
> 1 The xen patches for the Pi4, just a few patches.  As the Xen group
>   fixes things, I keep adding :).
> 2 Hacks for getting the Pi4 kernel config right for xen.  This should go
>   away if you don't use the kernel from the Pi4 yocto layer, as it
>   doesn't work like most kernels in yocto.

I should take a look at the configs and see if I can create a fragment
or two, but I can take care of that.

> 3 The addition of xen-tools.  This seems somewhat controversial from a
>   naming point of view, at least.  But all the major distros seem to
>   have it, and it does make things easier.  It brings along a boatload
>   of perl recipes.
> 4 Something to make bridges easier to manage.  Distros have another tool
>   to do this (bridge-utils), but that ties into systemd/initd and would
>   have been rather complex to integrate into yocto.  Plus it requires
>   rebooting to change anything.  The one I created is far simpler and
>   works just as well, maybe better.
> 5 A few Pi-specific hacks for config and u-boot.
>
> 1 is a no brainer, and 2 shouldn't matter in the future.  I guess the
> questionable ones are 3 and 4.

Christopher might have a better idea about #3, but if the
functionality is useful, I'm all for having it close to the other Xen
components.

We've put similar things like #4 into the layer before. Witness
cgroups-lite and some of the other semi-custom and more lightweight
things. But yah, just a judgement call if they may or may not be
useful in other scenarios.

#5 does sound like BSP stuff. Is any of it destined for the rpi layers
? Or is it both rpi AND xen specific, so doesn't really make sense
there either ?

Thanks for the info, most appreciated.

Bruce

>
> -corey
>
> >
> > >Having a layer like that, with fixes missing from meta-virt, makes no sense.
> > >
> > >Bruce
> >
> > meta-virtualization seems to be using Xen 4.12 at the moment.
> >
> > Corey's meta-raspberrypi-xen layer uses Xen 4.13. The Xen patches are based on Xen 4.13. Between Xen 4.12 and 4.13 there are a few additional patches that are required for running on Raspberry Pi 4.
> >
> > Would you rather uprev meta-virtualization to Xen 4.13, or backport the patches and identify additional backports required for running Xen 4.12 on Raspberry Pi 4?
> >
> > Stew



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
