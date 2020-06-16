Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com [209.85.167.196])
 by mx.groups.io with SMTP id smtpd.web11.2452.1592343796849770922
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 16 Jun 2020 14:43:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mRvY0aM3;
 spf=pass (domain: gmail.com, ip: 209.85.167.196, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-oi1-f196.google.com with SMTP id t25so20675720oij.7
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 16 Jun 2020 14:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uFhRuqKUey8ST9RYJKgviEQPYfhzdZrGw1wRxKMEGOo=;
        b=mRvY0aM3GSGv03E3+zxKuVoHcETrdB66LTQxterZMuVLaAIFqELMWOaIIyOummWiQN
         LUjrL3rMtzC3jSIr9oeCpcsnR/nAgdi6EbMUfTj8Hl8AIJ2hHuA3jKj78r+vTwcA3DCJ
         BZOgjbBlteAjX8ijfloGIi4PbBks4L1y0gaQ0c3vfmHarTKB9K2enE7FZlxqNV7UZToW
         95j7xdL/xR70KgH5qtt+8C+0aaznzQ6ioVXD9wb6+mXgizmUFwkYaANz2hoUEzIrYnCX
         whzb8cPSTOACS+3UllXiJfWY4PP6PPT1xNC+2uPnBMdjtyYfJtxQN8b5saMlV7kbN2v9
         aZOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uFhRuqKUey8ST9RYJKgviEQPYfhzdZrGw1wRxKMEGOo=;
        b=c5ayvEI6gOEnINcVuT8r1PN8bVRYbvp0QoyIZWBBmIobHUnOltuJUbp/JhU2+u9iFG
         FzpXfHnLq+eSbMMG3kvKWyvcVCSe8HaNUiwoOpop2sPwqfVpN2h030P6VVgBbgvacNCM
         Xzer4BojqyW5qGCMFs0KCNzuvxga8XzGgS9fbQPw7YmdQEw/6/BN7R95M/p2cjGyIRVv
         FUQw3cIUmXevwbjr87PNlKWnRdfUdeUkUMYhxA2y0sp2slT5B3OTQDfWx5RSM+w3Q0qq
         qOqxQISLm561sg737WK5K30UzhRt6vJGZoAk6DnVXKxIxVIGqdF0mdf3tE1TDFV9+M50
         XimQ==
X-Gm-Message-State: AOAM530TOVdHFTRb+svp/+Rv0NzvzCYe88i6R4PN5xCbans+boHQ7EMb
	LaJs9tQsTI/AjMnRPVTIwiPkU2wUI4gt77aYfGQ=
X-Google-Smtp-Source: ABdhPJzQT0lABPP21iBu04h6H+FDrDmCREzDVM/B5+IuSgck3gb06JTV/eQUyLOdbKXijHUISbeUSHmobJQEt114tv4=
X-Received: by 2002:aca:498f:: with SMTP id w137mr5257575oia.28.1592343796098;
 Tue, 16 Jun 2020 14:43:16 -0700 (PDT)
MIME-Version: 1.0
References: <CY1P110MB05517012EA0DC0134F655D2A8C860@CY1P110MB0551.NAMP110.PROD.OUTLOOK.COM>
 <20200605211602.GO2903@minyard.net> <CADkTA4N7vqHMi8Fa5H1sRuX4ZnVrEiS4oso5TiObUu0thJGr5g@mail.gmail.com>
 <20200606005839.GR2903@minyard.net> <CACMJ4GYcc0v=Y8gJzhCfVrSq8J4J6V5iwMFwzMfOXit63yO2ww@mail.gmail.com>
 <CADkTA4N+-GrD8TnUUVMC3Hrj=1tR8rsyHj4gCsFvPKzJh9LKyg@mail.gmail.com>
In-Reply-To: <CADkTA4N+-GrD8TnUUVMC3Hrj=1tR8rsyHj4gCsFvPKzJh9LKyg@mail.gmail.com>
From: "Christopher Clark" <christopher.w.clark@gmail.com>
Date: Tue, 16 Jun 2020 14:43:02 -0700
Message-ID: <CACMJ4GbZw2j4CZQ6ijDopT-cgoHeBjY87MouhFkL0DaCMBP=Kw@mail.gmail.com>
Subject: Re: [meta-virtualization] Xen on Raspberry Pi 4 (was "How to resolve the ERROR: xen-image-minimal-1.0-r0 do_rootfs: Function failed: do_rootfs. and ERROR: xen-image-minimal-1.0-r0 do_rootfs: Could not invoke dnf. ERROR: xen-image-minimal-1.0-r0 do_rootf")
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Corey Minyard <cminyard@mvista.com>, Siddhartha V <Siddhuvgowda.18695@gmail.com>, 
	Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>, 
	"meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 15, 2020 at 5:45 AM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> On Mon, Jun 15, 2020 at 5:11 AM Christopher Clark
> <christopher.w.clark@gmail.com> wrote:
> >
> > On Fri, Jun 5, 2020 at 5:58 PM Corey Minyard <cminyard@mvista.com> wrote:
> > >
> > > On Fri, Jun 05, 2020 at 07:53:53PM -0400, Bruce Ashfield wrote:
> > > > On Fri, Jun 5, 2020 at 5:16 PM Corey Minyard <cminyard@mvista.com> wrote:
> > > > >
> > > > > On Fri, Jun 05, 2020 at 07:55:37PM +0000, Stewart Hildebrand wrote:
> > > > > > + Corey
> > > > > >
> > > > > > On Friday, June 5, 2020 3:19 PM, Bruce Ashfield wrote:
> > > > > > >On Fri, Jun 5, 2020 at 3:12 PM Stewart Hildebrand wrote:

> > > > > > Corey: you are hereby encouraged to submit patches to meta-virtualization.
> > > > >
> > > > > Ok.  The layer has the following basic pieces:
> >
> > Before we get to the other pieces, I'd like to cover the new "rpixen"
> > MACHINE type that the layer introduces.
> >
> > My preference is for avoiding introduction of another MACHINE to
> > reconfigure an existing one to run Xen, if possible, and use the
> > existing "raspberrypi4-64". I'm hoping to avoid the pattern of
> > creating a new machine for Xen for each board that we add support for.
> > In meta-virtualization, there's the "xen" DISTRO_FEATURE, which is
> > used to turn on Xen-specific functionality and compatibility, and I'd
> > like to explore whether that can be made to be sufficient to enable
> > what is needed.
> >
> > To that end, I've done an initial pass to see what it might take and
> > the work-in-progress from that is posted here:
> > https://github.com/dozylynx/meta-virtualization/tree/raspberry-pi4-initial-xen
> >
> > Some minor changes to other layers could assist - eg. to remove the
> > need for a guest filesystem to contain the hypervisor binary - and
> > there's still some tidying to do.
> >
> > > > > 1 The xen patches for the Pi4, just a few patches.  As the Xen group
> > > > >   fixes things, I keep adding :).
> >
> > Unfortunately I had to drop these patches from my local test to get it
> > to boot. It could easily be a local build issue or a fault with the
> > one test I've run so far, but I did have success booting with just Xen
> > 4.13 and I'd like to get a bit more understanding and confidence in
> > them before we bring them in.
> >
> > > > > 2 Hacks for getting the Pi4 kernel config right for xen.  This should go
> > > > >   away if you don't use the kernel from the Pi4 yocto layer, as it
> > > > >   doesn't work like most kernels in yocto.
> > > >
> > > > I should take a look at the configs and see if I can create a fragment
> > > > or two, but I can take care of that.
> > >
> > > That shouldn't be necessary.  The standard fragments work, it's just
> > > that the Pi kernel does not use them.  So this is really Pi+Xen
> > > specific, and hopefully they can fix the Pi kernel to use the normal
> > > fragments in the future.
> >
> > The linux-raspberrypi kernel does use linux-yocto; it's just that
> > meta-virtualization
> > needs a matching .inc file to be present for the kernel version that
> > you're using.
> > Assuming you're using Linux 4.19 (which is what I've tested with) add this file:
> >   meta-virtualization/recipes-kernel/linux/linux-yocto_4.19_virtualization.inc
> > containing just:
> >   include linux-yocto_virtualization.inc
> > which will then enable the linux-raspberrypi kernel to add the
> > meta-virt Xen fragment.
> >
> > There are also two Linux patches:
> > 1) Disable DMA in the SDHCI driver
> > This one needs more information in the commit text to understand what
> > is motivating doing this and what the effects of it are. Should it go
> > into the standard Raspberry Pi kernel?
> > 2) Fix PCIe in dom0 for RPi4
> > Is this fixed upstream in more recent kernels? It would be good to
> > have a pointer to that if so.
> >
> > Bruce: To apply these to just the Raspberry Pi kernel when it's being
> > used with Xen, a kernel bbappend in a raspberrypi dynamic-layers might
> > be an option to consider - eg:
> > https://github.com/dozylynx/meta-virtualization/tree/raspberry-pi4-initial-xen/dynamic-layers/raspberrypi/recipes-kernel/linux
>
> I can most likely live with that. I obviously make sure that the
> reference linux-yocto kernel doesn't need anything to work out of the
> box, but we can't (and shouldn't) enforce that choice on everyone. I'd
> rather have patches centralized in a topic layer like
> meta-virtualization, so if we need to add a dynamic layer and a few
> patches, that's a good place to be.

please see my new comment below.

> > > > > 5 A few Pi-specific hacks for config and u-boot.
> > > >
> > > > #5 does sound like BSP stuff. Is any of it destined for the rpi layers
> > > > ? Or is it both rpi AND xen specific, so doesn't really make sense
> > > > there either ?
> > >
> > > It's both Pi and Xen specific.  If everything gets put where it should
> > > be, that would be the only thing left in this layer :).
> >
> > These are in recipes-bsp and I agree that they're both Pi and Xen
> > specific. I think these are small enough pieces that keeping them in
> > meta-virtualization could be a reasonable call, since that's the layer
> > where Xen support is focussed, and so they can be added to:
> >   dynamic-layers/raspberrypi/recipes-bsp
> > which indicates their status as amendments to the meta-raspberrypi
> > layer. Changes to them would then be easily coordinated with the Xen
> > recipes.
>
> Agreed.

Since I wrote this, we've seen some expressed interest in support for
running Xen on the NVIDIA Jetson Nano and Xavier NX boards, and on the
xen-devel mailing list, a report of success running Xen on the RockPro64
board:
https://lists.xenproject.org/archives/html/xen-devel/2020-06/msg01067.html

I've personally built Xen with meta-virtualization to run on the Cubietruck for
development and testing; the Odroid C2 and XU4 are of interest, as is the
Xilinx Ultra-96-V2 board; and the NVidia Jetson TX1 at one point had some
non-upstream patches available to enable Xen on it. PCEngines maintains
Xen compatibility for their APU2 in meta-pcengines.

There are also some challenges being encountered in getting a more recent Linux
kernel working as a dom0 on the Raspberry Pi 4 - eg. the Linux Foundation Eve
Project run their own patches for 5.6 here:
https://github.com/lf-edge/eve/tree/master/pkg/new-kernel/patches-5.6.x

All of this points towards it being a reasonable proposition to have a
dedicated Xen hardware support Yocto layer, so that board-specific tweaks for
hardware compatibility with Xen can be maintained without complicating
meta-virtualization, while continuing to pool Xen-aware contributions in
a centralized layer.

I'd like to propose creating: 'meta-xen-bsp'; and I'm willing to work on
maintaining it. Feedback to this suggestion is welcome.

Bruce: how does this sound to you?

Christopher
