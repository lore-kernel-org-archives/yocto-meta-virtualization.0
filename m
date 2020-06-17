Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
 by mx.groups.io with SMTP id smtpd.web10.309.1592413224687369721
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 17 Jun 2020 10:00:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qYnn8KbP;
 spf=pass (domain: gmail.com, ip: 209.85.208.68, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f68.google.com with SMTP id y6so2563889edi.3
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 17 Jun 2020 10:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=uJPHkvdhK1ORyTaDbXp2U2HFGEnpEn4fttMAmdJWw6M=;
        b=qYnn8KbPSVs8zJ4etMnZdpD1aIpFz4o1VdCyMlABZ1F9WYb4kmFXjkU79M5SPuiR9o
         8FZRWfnaRiq9RgnTA6Hu0k4VnwU1DCyt3Ho3fZjnsoGl3N9tcmQlpGcGx8LYpQR3IEHv
         wCiqvsyjHBNyDiuRH65ZQX7mCkl7kFjazNCzDMZfsEP3vyABrW83MvFfm7h1wYT7e2e5
         J8NW8Oup1NH9GdgPIl6bCpnAvIQYq0NJzzIuvjhfCG/ngwcN0CBAJFU/7Os+IzIxgbmh
         qEWIDZPl70LrbL2NHn7RYNozoarp5g+0tIJUTLStd+Zr4oYcBry8N1PRhzZIdjI63TVX
         Bpyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=uJPHkvdhK1ORyTaDbXp2U2HFGEnpEn4fttMAmdJWw6M=;
        b=K5qszHw9bEs7ekS3ikZQOwxOfZ1MsdaWQfLHpgbX9Q++KH9nfOpHzcbJ/a7FhxvZHN
         nqb18zVjqVtVM9HoqLZH33DcB60omg8oHrfxKht/RkbpSuRzOzsGVB1DcOLlyv7/JJ4u
         aJO9xjwtLQR2g72w3ISRFLapkclSRA3JvDTxtfzE1N11BCHv7gMQFEAV6jZuTW+3WojH
         QQyJnG5KawodedlosR+f4mwzLDf538SAnej/IJmRYEKYao1ZYhsaiokYa3rJfk9Lfjps
         F11FA9M4C7P0DlSnYel0tC0mggMgSa2z3HNr9KPNVU0+U/zgYj99FS7c1jx/QkDzPYSo
         mqdA==
X-Gm-Message-State: AOAM530Tv2S0ZThnCdKMiwIDCUeRPZFT2QVRsk4ygxgSANaXWkyjA3z/
	notY64thvR/gN+CDG8nko5veBZeBa9Ru6ebvMLE=
X-Google-Smtp-Source: ABdhPJyNJVYBE6LvmPYfTWPqz3vxAZu9d9wburSAn70Vpn3IL/yOS3ntseNq5vPqo/ZOZie215kjGUpYCepPcDjf2MY=
X-Received: by 2002:aa7:d359:: with SMTP id m25mr76325edr.365.1592413222624;
 Wed, 17 Jun 2020 10:00:22 -0700 (PDT)
MIME-Version: 1.0
References: <CY1P110MB05517012EA0DC0134F655D2A8C860@CY1P110MB0551.NAMP110.PROD.OUTLOOK.COM>
 <20200605211602.GO2903@minyard.net> <CADkTA4N7vqHMi8Fa5H1sRuX4ZnVrEiS4oso5TiObUu0thJGr5g@mail.gmail.com>
 <20200606005839.GR2903@minyard.net> <CACMJ4GYcc0v=Y8gJzhCfVrSq8J4J6V5iwMFwzMfOXit63yO2ww@mail.gmail.com>
 <CADkTA4N+-GrD8TnUUVMC3Hrj=1tR8rsyHj4gCsFvPKzJh9LKyg@mail.gmail.com>
 <CACMJ4GbZw2j4CZQ6ijDopT-cgoHeBjY87MouhFkL0DaCMBP=Kw@mail.gmail.com>
 <B7EF9851-B689-45A1-BCA1-167786E43A85@arm.com> <161955761BC8F01E.18675@lists.yoctoproject.org>
 <CADkTA4O1y+GHbnQyRie7iyWwCON_qc1zmHRAc7Hi0LwzcZ_pDw@mail.gmail.com> <8E523F21-6597-4C12-B9A1-3E689C1C932D@arm.com>
In-Reply-To: <8E523F21-6597-4C12-B9A1-3E689C1C932D@arm.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Wed, 17 Jun 2020 13:00:11 -0400
Message-ID: <CADkTA4MHcCy52fYq1Q8wQTH_iHqMDPGXYD231XFkw-G_w2somg@mail.gmail.com>
Subject: Re: [meta-virtualization] Xen on Raspberry Pi 4 (was "How to resolve the ERROR: xen-image-minimal-1.0-r0 do_rootfs: Function failed: do_rootfs. and ERROR: xen-image-minimal-1.0-r0 do_rootfs: Could not invoke dnf. ERROR: xen-image-minimal-1.0-r0 do_rootf")
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>, nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 17, 2020 at 12:14 PM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
>
>
> > On 17 Jun 2020, at 13:48, Bruce Ashfield via lists.yoctoproject.org <b=
ruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
> >
> > On Wed, Jun 17, 2020 at 8:45 AM Bruce Ashfield via
> > lists.yoctoproject.org
> > <bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
> >>
> >> On Wed, Jun 17, 2020 at 4:29 AM Bertrand Marquis
> >> <Bertrand.Marquis@arm.com> wrote:
> >>>
> >>> Hi,
> >>>
> >>>> On 16 Jun 2020, at 22:43, Christopher Clark via lists.yoctoproject.=
org <christopher.w.clark=3Dgmail.com@lists.yoctoproject.org> wrote:
> >>>>
> >>>> On Mon, Jun 15, 2020 at 5:45 AM Bruce Ashfield <bruce.ashfield@gmai=
l.com> wrote:
> >>>>> On Mon, Jun 15, 2020 at 5:11 AM Christopher Clark
> >>>>> <christopher.w.clark@gmail.com> wrote:
> >>>>>>
> >>>>>> On Fri, Jun 5, 2020 at 5:58 PM Corey Minyard <cminyard@mvista.com=
> wrote:
> >>>>>>>
> >>>>>>> On Fri, Jun 05, 2020 at 07:53:53PM -0400, Bruce Ashfield wrote:
> >>>>>>>> On Fri, Jun 5, 2020 at 5:16 PM Corey Minyard <cminyard@mvista.c=
om> wrote:
> >>>>>>>>>
> >>>>>>>>> On Fri, Jun 05, 2020 at 07:55:37PM +0000, Stewart Hildebrand w=
rote:
> >>>>>>>>>> + Corey
> >>>>>>>>>>
> >>>>>>>>>> On Friday, June 5, 2020 3:19 PM, Bruce Ashfield wrote:
> >>>>>>>>>>> On Fri, Jun 5, 2020 at 3:12 PM Stewart Hildebrand wrote:
> >>>>
> >>>>>>>>>> Corey: you are hereby encouraged to submit patches to meta-vi=
rtualization.
> >>>>>>>>>
> >>>>>>>>> Ok.  The layer has the following basic pieces:
> >>>>>>
> >>>>>> Before we get to the other pieces, I'd like to cover the new "rpi=
xen"
> >>>>>> MACHINE type that the layer introduces.
> >>>>>>
> >>>>>> My preference is for avoiding introduction of another MACHINE to
> >>>>>> reconfigure an existing one to run Xen, if possible, and use the
> >>>>>> existing "raspberrypi4-64". I'm hoping to avoid the pattern of
> >>>>>> creating a new machine for Xen for each board that we add support=
 for.
> >>>>>> In meta-virtualization, there's the "xen" DISTRO_FEATURE, which i=
s
> >>>>>> used to turn on Xen-specific functionality and compatibility, and=
 I'd
> >>>>>> like to explore whether that can be made to be sufficient to enab=
le
> >>>>>> what is needed.
> >>>>>>
> >>>>>> To that end, I've done an initial pass to see what it might take =
and
> >>>>>> the work-in-progress from that is posted here:
> >>>>>> https://github.com/dozylynx/meta-virtualization/tree/raspberry-pi=
4-initial-xen
> >>>>>>
> >>>>>> Some minor changes to other layers could assist - eg. to remove t=
he
> >>>>>> need for a guest filesystem to contain the hypervisor binary - an=
d
> >>>>>> there's still some tidying to do.
> >>>>>>
> >>>>>>>>> 1 The xen patches for the Pi4, just a few patches.  As the Xen=
 group
> >>>>>>>>> fixes things, I keep adding :).
> >>>>>>
> >>>>>> Unfortunately I had to drop these patches from my local test to g=
et it
> >>>>>> to boot. It could easily be a local build issue or a fault with t=
he
> >>>>>> one test I've run so far, but I did have success booting with jus=
t Xen
> >>>>>> 4.13 and I'd like to get a bit more understanding and confidence =
in
> >>>>>> them before we bring them in.
> >>>>>>
> >>>>>>>>> 2 Hacks for getting the Pi4 kernel config right for xen.  This=
 should go
> >>>>>>>>> away if you don't use the kernel from the Pi4 yocto layer, as =
it
> >>>>>>>>> doesn't work like most kernels in yocto.
> >>>>>>>>
> >>>>>>>> I should take a look at the configs and see if I can create a f=
ragment
> >>>>>>>> or two, but I can take care of that.
> >>>>>>>
> >>>>>>> That shouldn't be necessary.  The standard fragments work, it's =
just
> >>>>>>> that the Pi kernel does not use them.  So this is really Pi+Xen
> >>>>>>> specific, and hopefully they can fix the Pi kernel to use the no=
rmal
> >>>>>>> fragments in the future.
> >>>>>>
> >>>>>> The linux-raspberrypi kernel does use linux-yocto; it's just that
> >>>>>> meta-virtualization
> >>>>>> needs a matching .inc file to be present for the kernel version t=
hat
> >>>>>> you're using.
> >>>>>> Assuming you're using Linux 4.19 (which is what I've tested with)=
 add this file:
> >>>>>> meta-virtualization/recipes-kernel/linux/linux-yocto_4.19_virtual=
ization.inc
> >>>>>> containing just:
> >>>>>> include linux-yocto_virtualization.inc
> >>>>>> which will then enable the linux-raspberrypi kernel to add the
> >>>>>> meta-virt Xen fragment.
> >>>>>>
> >>>>>> There are also two Linux patches:
> >>>>>> 1) Disable DMA in the SDHCI driver
> >>>>>> This one needs more information in the commit text to understand =
what
> >>>>>> is motivating doing this and what the effects of it are. Should i=
t go
> >>>>>> into the standard Raspberry Pi kernel?
> >>>>>> 2) Fix PCIe in dom0 for RPi4
> >>>>>> Is this fixed upstream in more recent kernels? It would be good t=
o
> >>>>>> have a pointer to that if so.
> >>>>>>
> >>>>>> Bruce: To apply these to just the Raspberry Pi kernel when it's b=
eing
> >>>>>> used with Xen, a kernel bbappend in a raspberrypi dynamic-layers =
might
> >>>>>> be an option to consider - eg:
> >>>>>> https://github.com/dozylynx/meta-virtualization/tree/raspberry-pi=
4-initial-xen/dynamic-layers/raspberrypi/recipes-kernel/linux
> >>>>>
> >>>>> I can most likely live with that. I obviously make sure that the
> >>>>> reference linux-yocto kernel doesn't need anything to work out of =
the
> >>>>> box, but we can't (and shouldn't) enforce that choice on everyone.=
 I'd
> >>>>> rather have patches centralized in a topic layer like
> >>>>> meta-virtualization, so if we need to add a dynamic layer and a fe=
w
> >>>>> patches, that's a good place to be.
> >>>>
> >>>> please see my new comment below.
> >>>>
> >>>>>>>>> 5 A few Pi-specific hacks for config and u-boot.
> >>>>>>>>
> >>>>>>>> #5 does sound like BSP stuff. Is any of it destined for the rpi=
 layers
> >>>>>>>> ? Or is it both rpi AND xen specific, so doesn't really make se=
nse
> >>>>>>>> there either ?
> >>>>>>>
> >>>>>>> It's both Pi and Xen specific.  If everything gets put where it =
should
> >>>>>>> be, that would be the only thing left in this layer :).
> >>>>>>
> >>>>>> These are in recipes-bsp and I agree that they're both Pi and Xen
> >>>>>> specific. I think these are small enough pieces that keeping them=
 in
> >>>>>> meta-virtualization could be a reasonable call, since that's the =
layer
> >>>>>> where Xen support is focussed, and so they can be added to:
> >>>>>> dynamic-layers/raspberrypi/recipes-bsp
> >>>>>> which indicates their status as amendments to the meta-raspberryp=
i
> >>>>>> layer. Changes to them would then be easily coordinated with the =
Xen
> >>>>>> recipes.
> >>>>>
> >>>>> Agreed.
> >>>>
> >>>> Since I wrote this, we've seen some expressed interest in support f=
or
> >>>> running Xen on the NVIDIA Jetson Nano and Xavier NX boards, and on =
the
> >>>> xen-devel mailing list, a report of success running Xen on the Rock=
Pro64
> >>>> board:
> >>>> https://lists.xenproject.org/archives/html/xen-devel/2020-06/msg010=
67.html
> >>>>
> >>>> I've personally built Xen with meta-virtualization to run on the Cu=
bietruck for
> >>>> development and testing; the Odroid C2 and XU4 are of interest, as =
is the
> >>>> Xilinx Ultra-96-V2 board; and the NVidia Jetson TX1 at one point ha=
d some
> >>>> non-upstream patches available to enable Xen on it. PCEngines maint=
ains
> >>>> Xen compatibility for their APU2 in meta-pcengines.
> >>>>
> >>>> There are also some challenges being encountered in getting a more =
recent Linux
> >>>> kernel working as a dom0 on the Raspberry Pi 4 - eg. the Linux Foun=
dation Eve
> >>>> Project run their own patches for 5.6 here:
> >>>> https://github.com/lf-edge/eve/tree/master/pkg/new-kernel/patches-5=
.6.x
> >>>>
> >>>> All of this points towards it being a reasonable proposition to hav=
e a
> >>>> dedicated Xen hardware support Yocto layer, so that board-specific =
tweaks for
> >>>> hardware compatibility with Xen can be maintained without complicat=
ing
> >>>> meta-virtualization, while continuing to pool Xen-aware contributio=
ns in
> >>>> a centralized layer.
> >>>>
> >>>> I'd like to propose creating: 'meta-xen-bsp'; and I'm willing to wo=
rk on
> >>>> maintaining it. Feedback to this suggestion is welcome.
> >>>>
> >>>> Bruce: how does this sound to you?
> >>>
> >>> I had this problem working on some other BSPs to support Xen with me=
ta-virtualization (you can check this in meta-arm[1]).
> >>>
> >>> I would think the best way to handle this case is to use dynamic lay=
ers and push the required support inside the layer containing the BSP.
> >>> This would make the maintenance easier (for example when the kernel =
is changed).
> >>
> >> We've already been talking about dynamic layers, but they don't
> >> actually solve the issue of one source of truth for an entire stack
> >> that I'm talking about.
> >
> > And of course, at a glance, I already see two things that could have
> > easily been submitted to meta-virtualization. Which shows the point,
> > that once you have layers as a place to stash fixes/features, they
> > typically don't get submitted to the centralized layers.
>
> This is something we plan to fix in the next months and move some parts =
from meta-arm-autonomy to meta-virtualization.
>
> By curiosity, what are the 2 things you have in mind ?

The two that I noticed were the qemu split (I did something similar
for runX, but it would be nice to consolidate them). There were also
some config/console changes for Xen that I noticed which could be in
the main layer.

We also haven't recently revisited the image definitions and it would
be interesting to see if we could provide some easily extendable base
images .. but that's not what I noticed in my quick glance earlier,
just something I thought of since.

I'm currently having some build issues with qemuarm64 and Xen in
master, so I'm trying to fight through that before I can try much else
out.

Cheers,

Bruce


>
> Cheers
> Bertrand
>
> >
> > Cheers,
> >
> > Bruce
> >
> >>
> >> Cheers,
> >>
> >> Bruce
> >>
> >>>
> >>> If you want an example of how to use dynamic layers you can check me=
ta-arm-autonomy sub layer of meta-arm [1] (which also contains other intere=
sting bits related to using Xen with Yocto).
> >>>
> >>> Cheers
> >>> Bertrand
> >>>
> >>>
> >>>
> >>> IMPORTANT NOTICE: The contents of this email and any attachments are=
 confidential and may also be privileged. If you are not the intended recip=
ient, please notify the sender immediately and do not disclose the contents=
 to any other person, use it for any purpose, or store or copy the informat=
ion in any medium. Thank you.
> >>
> >>
> >>
> >> --
> >> - Thou shalt not follow the NULL pointer, for chaos and madness await
> >> thee at its end
> >> - "Use the force Harry" - Gandalf, Star Trek II
> >>
> >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
> >=20
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
