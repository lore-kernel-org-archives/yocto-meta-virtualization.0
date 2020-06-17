Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
 by mx.groups.io with SMTP id smtpd.web10.2011.1592353641081214140
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 16 Jun 2020 17:27:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Kce5F8lB;
 spf=pass (domain: gmail.com, ip: 209.85.218.67, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f67.google.com with SMTP id f7so349918ejq.6
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 16 Jun 2020 17:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Jdlc7eV1pL76vylrAzHaEWoZbQdlleCLPDNwuL9s1KQ=;
        b=Kce5F8lBN7W/pTl1fZgQTusMMOqOizZiofzUYKAOrAXw8C3LwBvCY5KaqcifcEqLfD
         /C34wrwS6FTfV1V26dgEASPFFGqf4P8uEGObkh6LvzD5ujj63SYX2k80U3/OGz/927hc
         cBgS6MAPKhtTU9ntuxai9qQe3uf6ag3x7BwvNZz5Dz/r/OhQHdykjvPlrzRnreBiKQFF
         EJGAxjK6B5qjY79PPP2zr0iKquI87PTjC0MyRCS66bW9S8ThByGuUuHAV10P2C6QxFgz
         51hoVkQpc7iV6t9L9SRLFEnzH6BNmEHp70mXGqshtJ6Svp0EIl8dw934ImoQJ++8pg8i
         mUJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Jdlc7eV1pL76vylrAzHaEWoZbQdlleCLPDNwuL9s1KQ=;
        b=JiqVFNoE4Y0LZWjMktA9n6Kmnbn/Ssnc/8RlKHGkfK6S2b1QHrOBITZWz9X0V8S3pK
         PfcM4FmbtFt6T4z7kYxE2vUSlOTQCVlE89m5PoLLqpnD2GVygao378im8EULQM/S4Kf0
         jRIj9swBu7Qrn9AN1zDSZPWMJuTgQCYeNqY/tpxGdNuXIjS0GInXk/wQg8qZg4BPCJJN
         HCDlN1sRZgu4n8owVw+k8vCqoSU/rAPyPWfZts0nRG6IgkZiupK1LSM/rE2zCtOmqhOh
         Lj2pyCOHmqVNXb1V/kbH2YjUj4Gt83rDZgMK4aeVueFywCSQ0ZqB33xxSb09dLGuhHO+
         +/yA==
X-Gm-Message-State: AOAM531ceRMcX+aUSW08/0da9LbLuQ7pdmzAid8dxvH8nEmr9i+vh6cG
	Y/mfb3t22RvJCm0NDEd8CR3Scz1ErQju48zpAPs=
X-Google-Smtp-Source: ABdhPJy1r2fig95czYbSK5tBSPRnHD9vbjismVl1WvCj3WkPpvfHP3pmFCns4o6MRLLeTRl8Lqodu66HE03Hku5dfWE=
X-Received: by 2002:a17:907:9495:: with SMTP id dm21mr5027735ejc.357.1592353639428;
 Tue, 16 Jun 2020 17:27:19 -0700 (PDT)
MIME-Version: 1.0
References: <CY1P110MB05517012EA0DC0134F655D2A8C860@CY1P110MB0551.NAMP110.PROD.OUTLOOK.COM>
 <20200605211602.GO2903@minyard.net> <CADkTA4N7vqHMi8Fa5H1sRuX4ZnVrEiS4oso5TiObUu0thJGr5g@mail.gmail.com>
 <20200606005839.GR2903@minyard.net> <CACMJ4GYcc0v=Y8gJzhCfVrSq8J4J6V5iwMFwzMfOXit63yO2ww@mail.gmail.com>
 <CADkTA4N+-GrD8TnUUVMC3Hrj=1tR8rsyHj4gCsFvPKzJh9LKyg@mail.gmail.com> <CACMJ4GbZw2j4CZQ6ijDopT-cgoHeBjY87MouhFkL0DaCMBP=Kw@mail.gmail.com>
In-Reply-To: <CACMJ4GbZw2j4CZQ6ijDopT-cgoHeBjY87MouhFkL0DaCMBP=Kw@mail.gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 16 Jun 2020 20:26:56 -0400
Message-ID: <CADkTA4M2QoYjStaepoAF_cCy4Rz04buXEtPj2SW9ep4FTrDXCQ@mail.gmail.com>
Subject: Re: [meta-virtualization] Xen on Raspberry Pi 4 (was "How to resolve the ERROR: xen-image-minimal-1.0-r0 do_rootfs: Function failed: do_rootfs. and ERROR: xen-image-minimal-1.0-r0 do_rootfs: Could not invoke dnf. ERROR: xen-image-minimal-1.0-r0 do_rootf")
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: Corey Minyard <cminyard@mvista.com>, Siddhartha V <Siddhuvgowda.18695@gmail.com>, 
	Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>, 
	"meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 16, 2020 at 5:43 PM Christopher Clark
<christopher.w.clark@gmail.com> wrote:
>
> On Mon, Jun 15, 2020 at 5:45 AM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> > On Mon, Jun 15, 2020 at 5:11 AM Christopher Clark
> > <christopher.w.clark@gmail.com> wrote:
> > >
> > > On Fri, Jun 5, 2020 at 5:58 PM Corey Minyard <cminyard@mvista.com> wrote:
> > > >
> > > > On Fri, Jun 05, 2020 at 07:53:53PM -0400, Bruce Ashfield wrote:
> > > > > On Fri, Jun 5, 2020 at 5:16 PM Corey Minyard <cminyard@mvista.com> wrote:
> > > > > >
> > > > > > On Fri, Jun 05, 2020 at 07:55:37PM +0000, Stewart Hildebrand wrote:
> > > > > > > + Corey
> > > > > > >
> > > > > > > On Friday, June 5, 2020 3:19 PM, Bruce Ashfield wrote:
> > > > > > > >On Fri, Jun 5, 2020 at 3:12 PM Stewart Hildebrand wrote:
>
> > > > > > > Corey: you are hereby encouraged to submit patches to meta-virtualization.
> > > > > >
> > > > > > Ok.  The layer has the following basic pieces:
> > >
> > > Before we get to the other pieces, I'd like to cover the new "rpixen"
> > > MACHINE type that the layer introduces.
> > >
> > > My preference is for avoiding introduction of another MACHINE to
> > > reconfigure an existing one to run Xen, if possible, and use the
> > > existing "raspberrypi4-64". I'm hoping to avoid the pattern of
> > > creating a new machine for Xen for each board that we add support for.
> > > In meta-virtualization, there's the "xen" DISTRO_FEATURE, which is
> > > used to turn on Xen-specific functionality and compatibility, and I'd
> > > like to explore whether that can be made to be sufficient to enable
> > > what is needed.
> > >
> > > To that end, I've done an initial pass to see what it might take and
> > > the work-in-progress from that is posted here:
> > > https://github.com/dozylynx/meta-virtualization/tree/raspberry-pi4-initial-xen
> > >
> > > Some minor changes to other layers could assist - eg. to remove the
> > > need for a guest filesystem to contain the hypervisor binary - and
> > > there's still some tidying to do.
> > >
> > > > > > 1 The xen patches for the Pi4, just a few patches.  As the Xen group
> > > > > >   fixes things, I keep adding :).
> > >
> > > Unfortunately I had to drop these patches from my local test to get it
> > > to boot. It could easily be a local build issue or a fault with the
> > > one test I've run so far, but I did have success booting with just Xen
> > > 4.13 and I'd like to get a bit more understanding and confidence in
> > > them before we bring them in.
> > >
> > > > > > 2 Hacks for getting the Pi4 kernel config right for xen.  This should go
> > > > > >   away if you don't use the kernel from the Pi4 yocto layer, as it
> > > > > >   doesn't work like most kernels in yocto.
> > > > >
> > > > > I should take a look at the configs and see if I can create a fragment
> > > > > or two, but I can take care of that.
> > > >
> > > > That shouldn't be necessary.  The standard fragments work, it's just
> > > > that the Pi kernel does not use them.  So this is really Pi+Xen
> > > > specific, and hopefully they can fix the Pi kernel to use the normal
> > > > fragments in the future.
> > >
> > > The linux-raspberrypi kernel does use linux-yocto; it's just that
> > > meta-virtualization
> > > needs a matching .inc file to be present for the kernel version that
> > > you're using.
> > > Assuming you're using Linux 4.19 (which is what I've tested with) add this file:
> > >   meta-virtualization/recipes-kernel/linux/linux-yocto_4.19_virtualization.inc
> > > containing just:
> > >   include linux-yocto_virtualization.inc
> > > which will then enable the linux-raspberrypi kernel to add the
> > > meta-virt Xen fragment.
> > >
> > > There are also two Linux patches:
> > > 1) Disable DMA in the SDHCI driver
> > > This one needs more information in the commit text to understand what
> > > is motivating doing this and what the effects of it are. Should it go
> > > into the standard Raspberry Pi kernel?
> > > 2) Fix PCIe in dom0 for RPi4
> > > Is this fixed upstream in more recent kernels? It would be good to
> > > have a pointer to that if so.
> > >
> > > Bruce: To apply these to just the Raspberry Pi kernel when it's being
> > > used with Xen, a kernel bbappend in a raspberrypi dynamic-layers might
> > > be an option to consider - eg:
> > > https://github.com/dozylynx/meta-virtualization/tree/raspberry-pi4-initial-xen/dynamic-layers/raspberrypi/recipes-kernel/linux
> >
> > I can most likely live with that. I obviously make sure that the
> > reference linux-yocto kernel doesn't need anything to work out of the
> > box, but we can't (and shouldn't) enforce that choice on everyone. I'd
> > rather have patches centralized in a topic layer like
> > meta-virtualization, so if we need to add a dynamic layer and a few
> > patches, that's a good place to be.
>
> please see my new comment below.
>
> > > > > > 5 A few Pi-specific hacks for config and u-boot.
> > > > >
> > > > > #5 does sound like BSP stuff. Is any of it destined for the rpi layers
> > > > > ? Or is it both rpi AND xen specific, so doesn't really make sense
> > > > > there either ?
> > > >
> > > > It's both Pi and Xen specific.  If everything gets put where it should
> > > > be, that would be the only thing left in this layer :).
> > >
> > > These are in recipes-bsp and I agree that they're both Pi and Xen
> > > specific. I think these are small enough pieces that keeping them in
> > > meta-virtualization could be a reasonable call, since that's the layer
> > > where Xen support is focussed, and so they can be added to:
> > >   dynamic-layers/raspberrypi/recipes-bsp
> > > which indicates their status as amendments to the meta-raspberrypi
> > > layer. Changes to them would then be easily coordinated with the Xen
> > > recipes.
> >
> > Agreed.
>
> Since I wrote this, we've seen some expressed interest in support for
> running Xen on the NVIDIA Jetson Nano and Xavier NX boards, and on the
> xen-devel mailing list, a report of success running Xen on the RockPro64
> board:
> https://lists.xenproject.org/archives/html/xen-devel/2020-06/msg01067.html
>
> I've personally built Xen with meta-virtualization to run on the Cubietruck for
> development and testing; the Odroid C2 and XU4 are of interest, as is the
> Xilinx Ultra-96-V2 board; and the NVidia Jetson TX1 at one point had some
> non-upstream patches available to enable Xen on it. PCEngines maintains
> Xen compatibility for their APU2 in meta-pcengines.
>
> There are also some challenges being encountered in getting a more recent Linux
> kernel working as a dom0 on the Raspberry Pi 4 - eg. the Linux Foundation Eve
> Project run their own patches for 5.6 here:
> https://github.com/lf-edge/eve/tree/master/pkg/new-kernel/patches-5.6.x
>
> All of this points towards it being a reasonable proposition to have a
> dedicated Xen hardware support Yocto layer, so that board-specific tweaks for
> hardware compatibility with Xen can be maintained without complicating
> meta-virtualization, while continuing to pool Xen-aware contributions in
> a centralized layer.
>
> I'd like to propose creating: 'meta-xen-bsp'; and I'm willing to work on
> maintaining it. Feedback to this suggestion is welcome.
>
> Bruce: how does this sound to you?

For meta-virtualization reference builds, I still want them to go
against linux-yocto as a reference kernel, but yes, Xen is a bit
different. Which leaves me cherry picking patches into linux-yocto for
support, but that is something I'm used to doing.

So my concern is that we sacrifice the single source of truth and we
end up with the wild west of kernels and versions. That's why we have
the vertically integrated references in oe-core and what I've always
tried to do with meta-virtualization. Basically, I'm a fan of having
like parts for an end to end solution, in the same place. It's why
when I created the meta-openstack bits, I did deployment sub-layers
that targeted different boards.

You quickly end up with instructions like: "oh yah, it's easy. Just
take these 8 layers, and this BSP layer. Oh, that's a different kernel
version, so you need these config tweaks or these runtime changes
...etc". And I won't be able to test any of them when doing
integration, since the test matrix gets huge very quickly. And non hw
changes start getting squirreled away in the various other layers
"because it is easier".

Don't take that as me not being supportive, but just that I need to
think more about it, and it never is as cut and dry as we'd like :D As
long as I can keep a working linux-yocto reference qemu*64 working out
of meta-virt, I'll probably be ok.

Bruce

>
> Christopher



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
