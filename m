Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
 by mx.groups.io with SMTP id smtpd.web11.6752.1592398114402067755
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 17 Jun 2020 05:48:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bkPM21aS;
 spf=pass (domain: gmail.com, ip: 209.85.208.66, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f66.google.com with SMTP id c35so1836513edf.5
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 17 Jun 2020 05:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ic2jWc+RwBODhB8OZmg5r0q500GL3zAYV7yvP3NnJdg=;
        b=bkPM21aSmMKB5ac3xnLZS6ABES3VAMwDJuM1fI5XeoxzfGDyRuSlXHC1iJXCFRGj4l
         r23S6NAOAc8YQxJLutmR6+edzJ3bmwEASgipLxQHCeb40FQqAl80EZAWN2CGkywDzGG4
         qkjZeGfp8Vv+r8xBVbpefoc87TPSsan76h7eIfBtejiieffaGcanceP0jXIcPXv+zZIc
         z0iHXln+i+1izB3QpSgxpt5jvUilc7CZYvOJzDbLBmV4haKm+ma+AW5LmlrIaRxp4eJn
         nI3IFfzFJGVm0fOpgk6uNZve8lupxsGHdPW0bkhcLqtGevvgKFDAk23DskEb+o4wqURa
         fT3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ic2jWc+RwBODhB8OZmg5r0q500GL3zAYV7yvP3NnJdg=;
        b=s9Dr4bcqToRfGAJ6NENlc/fY2nRwsglzf+ztrHj4gqWUBryu/9GojcRZK/Go6tp8vb
         tw6xCjulhc4UQ6pd5whyGS0a65BVQfhXedU+/uLIE5nqQKPzuU905g8I0jquHI7lt/vz
         CnR01DnxlfYaAJvKXj21VLsSN7M9fHiZSZaK2OYNIVoxI7rmbuxy06lT7hIs2uOiz7V7
         7Az7yQaCbLHTxiDpkkKVrOD6stRut5+BIfgRLuzNs9wQ9eRsMc6RpmHnIFom+3GLiWhx
         h/D7ESTEuxMocx5AV+TXIFkb1FDy3rebAFe48Io2QrE0U7rfFjp/GUfQw+CcEG5kOYBw
         TCFw==
X-Gm-Message-State: AOAM533ZQHBe7lCUDHE/r1pzAKya7bq49guocMfKUy5WEq/V39941gpT
	JAnYRc37hy7Mlmc2m5oXCfw2Jon60YOF7TecAes=
X-Google-Smtp-Source: ABdhPJwESni0Tleum7o6e6BOETry3z1R9p7cdueLR7bYPu62XLJbqJFNmyU5+ttrysGW+ofbECZHWdJDwMiUKzPkMIo=
X-Received: by 2002:a50:c181:: with SMTP id m1mr6866124edf.27.1592398112716;
 Wed, 17 Jun 2020 05:48:32 -0700 (PDT)
MIME-Version: 1.0
References: <CY1P110MB05517012EA0DC0134F655D2A8C860@CY1P110MB0551.NAMP110.PROD.OUTLOOK.COM>
 <20200605211602.GO2903@minyard.net> <CADkTA4N7vqHMi8Fa5H1sRuX4ZnVrEiS4oso5TiObUu0thJGr5g@mail.gmail.com>
 <20200606005839.GR2903@minyard.net> <CACMJ4GYcc0v=Y8gJzhCfVrSq8J4J6V5iwMFwzMfOXit63yO2ww@mail.gmail.com>
 <CADkTA4N+-GrD8TnUUVMC3Hrj=1tR8rsyHj4gCsFvPKzJh9LKyg@mail.gmail.com>
 <CACMJ4GbZw2j4CZQ6ijDopT-cgoHeBjY87MouhFkL0DaCMBP=Kw@mail.gmail.com>
 <B7EF9851-B689-45A1-BCA1-167786E43A85@arm.com> <161955761BC8F01E.18675@lists.yoctoproject.org>
In-Reply-To: <161955761BC8F01E.18675@lists.yoctoproject.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Wed, 17 Jun 2020 08:48:21 -0400
Message-ID: <CADkTA4O1y+GHbnQyRie7iyWwCON_qc1zmHRAc7Hi0LwzcZ_pDw@mail.gmail.com>
Subject: Re: [meta-virtualization] Xen on Raspberry Pi 4 (was "How to resolve the ERROR: xen-image-minimal-1.0-r0 do_rootfs: Function failed: do_rootfs. and ERROR: xen-image-minimal-1.0-r0 do_rootfs: Could not invoke dnf. ERROR: xen-image-minimal-1.0-r0 do_rootf")
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, 
	Christopher Clark <christopher.w.clark@gmail.com>, Corey Minyard <cminyard@mvista.com>, 
	Siddhartha V <Siddhuvgowda.18695@gmail.com>, 
	Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>, 
	"meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 17, 2020 at 8:45 AM Bruce Ashfield via
lists.yoctoproject.org
<bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
>
> On Wed, Jun 17, 2020 at 4:29 AM Bertrand Marquis
> <Bertrand.Marquis@arm.com> wrote:
> >
> > Hi,
> >
> > > On 16 Jun 2020, at 22:43, Christopher Clark via lists.yoctoproject.o=
rg <christopher.w.clark=3Dgmail.com@lists.yoctoproject.org> wrote:
> > >
> > > On Mon, Jun 15, 2020 at 5:45 AM Bruce Ashfield <bruce.ashfield@gmail=
.com> wrote:
> > >> On Mon, Jun 15, 2020 at 5:11 AM Christopher Clark
> > >> <christopher.w.clark@gmail.com> wrote:
> > >>>
> > >>> On Fri, Jun 5, 2020 at 5:58 PM Corey Minyard <cminyard@mvista.com>=
 wrote:
> > >>>>
> > >>>> On Fri, Jun 05, 2020 at 07:53:53PM -0400, Bruce Ashfield wrote:
> > >>>>> On Fri, Jun 5, 2020 at 5:16 PM Corey Minyard <cminyard@mvista.co=
m> wrote:
> > >>>>>>
> > >>>>>> On Fri, Jun 05, 2020 at 07:55:37PM +0000, Stewart Hildebrand wr=
ote:
> > >>>>>>> + Corey
> > >>>>>>>
> > >>>>>>> On Friday, June 5, 2020 3:19 PM, Bruce Ashfield wrote:
> > >>>>>>>> On Fri, Jun 5, 2020 at 3:12 PM Stewart Hildebrand wrote:
> > >
> > >>>>>>> Corey: you are hereby encouraged to submit patches to meta-vir=
tualization.
> > >>>>>>
> > >>>>>> Ok.  The layer has the following basic pieces:
> > >>>
> > >>> Before we get to the other pieces, I'd like to cover the new "rpix=
en"
> > >>> MACHINE type that the layer introduces.
> > >>>
> > >>> My preference is for avoiding introduction of another MACHINE to
> > >>> reconfigure an existing one to run Xen, if possible, and use the
> > >>> existing "raspberrypi4-64". I'm hoping to avoid the pattern of
> > >>> creating a new machine for Xen for each board that we add support =
for.
> > >>> In meta-virtualization, there's the "xen" DISTRO_FEATURE, which is
> > >>> used to turn on Xen-specific functionality and compatibility, and =
I'd
> > >>> like to explore whether that can be made to be sufficient to enabl=
e
> > >>> what is needed.
> > >>>
> > >>> To that end, I've done an initial pass to see what it might take a=
nd
> > >>> the work-in-progress from that is posted here:
> > >>> https://github.com/dozylynx/meta-virtualization/tree/raspberry-pi4=
-initial-xen
> > >>>
> > >>> Some minor changes to other layers could assist - eg. to remove th=
e
> > >>> need for a guest filesystem to contain the hypervisor binary - and
> > >>> there's still some tidying to do.
> > >>>
> > >>>>>> 1 The xen patches for the Pi4, just a few patches.  As the Xen =
group
> > >>>>>>  fixes things, I keep adding :).
> > >>>
> > >>> Unfortunately I had to drop these patches from my local test to ge=
t it
> > >>> to boot. It could easily be a local build issue or a fault with th=
e
> > >>> one test I've run so far, but I did have success booting with just=
 Xen
> > >>> 4.13 and I'd like to get a bit more understanding and confidence i=
n
> > >>> them before we bring them in.
> > >>>
> > >>>>>> 2 Hacks for getting the Pi4 kernel config right for xen.  This =
should go
> > >>>>>>  away if you don't use the kernel from the Pi4 yocto layer, as =
it
> > >>>>>>  doesn't work like most kernels in yocto.
> > >>>>>
> > >>>>> I should take a look at the configs and see if I can create a fr=
agment
> > >>>>> or two, but I can take care of that.
> > >>>>
> > >>>> That shouldn't be necessary.  The standard fragments work, it's j=
ust
> > >>>> that the Pi kernel does not use them.  So this is really Pi+Xen
> > >>>> specific, and hopefully they can fix the Pi kernel to use the nor=
mal
> > >>>> fragments in the future.
> > >>>
> > >>> The linux-raspberrypi kernel does use linux-yocto; it's just that
> > >>> meta-virtualization
> > >>> needs a matching .inc file to be present for the kernel version th=
at
> > >>> you're using.
> > >>> Assuming you're using Linux 4.19 (which is what I've tested with) =
add this file:
> > >>>  meta-virtualization/recipes-kernel/linux/linux-yocto_4.19_virtual=
ization.inc
> > >>> containing just:
> > >>>  include linux-yocto_virtualization.inc
> > >>> which will then enable the linux-raspberrypi kernel to add the
> > >>> meta-virt Xen fragment.
> > >>>
> > >>> There are also two Linux patches:
> > >>> 1) Disable DMA in the SDHCI driver
> > >>> This one needs more information in the commit text to understand w=
hat
> > >>> is motivating doing this and what the effects of it are. Should it=
 go
> > >>> into the standard Raspberry Pi kernel?
> > >>> 2) Fix PCIe in dom0 for RPi4
> > >>> Is this fixed upstream in more recent kernels? It would be good to
> > >>> have a pointer to that if so.
> > >>>
> > >>> Bruce: To apply these to just the Raspberry Pi kernel when it's be=
ing
> > >>> used with Xen, a kernel bbappend in a raspberrypi dynamic-layers m=
ight
> > >>> be an option to consider - eg:
> > >>> https://github.com/dozylynx/meta-virtualization/tree/raspberry-pi4=
-initial-xen/dynamic-layers/raspberrypi/recipes-kernel/linux
> > >>
> > >> I can most likely live with that. I obviously make sure that the
> > >> reference linux-yocto kernel doesn't need anything to work out of t=
he
> > >> box, but we can't (and shouldn't) enforce that choice on everyone. =
I'd
> > >> rather have patches centralized in a topic layer like
> > >> meta-virtualization, so if we need to add a dynamic layer and a few
> > >> patches, that's a good place to be.
> > >
> > > please see my new comment below.
> > >
> > >>>>>> 5 A few Pi-specific hacks for config and u-boot.
> > >>>>>
> > >>>>> #5 does sound like BSP stuff. Is any of it destined for the rpi =
layers
> > >>>>> ? Or is it both rpi AND xen specific, so doesn't really make sen=
se
> > >>>>> there either ?
> > >>>>
> > >>>> It's both Pi and Xen specific.  If everything gets put where it s=
hould
> > >>>> be, that would be the only thing left in this layer :).
> > >>>
> > >>> These are in recipes-bsp and I agree that they're both Pi and Xen
> > >>> specific. I think these are small enough pieces that keeping them =
in
> > >>> meta-virtualization could be a reasonable call, since that's the l=
ayer
> > >>> where Xen support is focussed, and so they can be added to:
> > >>>  dynamic-layers/raspberrypi/recipes-bsp
> > >>> which indicates their status as amendments to the meta-raspberrypi
> > >>> layer. Changes to them would then be easily coordinated with the X=
en
> > >>> recipes.
> > >>
> > >> Agreed.
> > >
> > > Since I wrote this, we've seen some expressed interest in support fo=
r
> > > running Xen on the NVIDIA Jetson Nano and Xavier NX boards, and on t=
he
> > > xen-devel mailing list, a report of success running Xen on the RockP=
ro64
> > > board:
> > > https://lists.xenproject.org/archives/html/xen-devel/2020-06/msg0106=
7.html
> > >
> > > I've personally built Xen with meta-virtualization to run on the Cub=
ietruck for
> > > development and testing; the Odroid C2 and XU4 are of interest, as i=
s the
> > > Xilinx Ultra-96-V2 board; and the NVidia Jetson TX1 at one point had=
 some
> > > non-upstream patches available to enable Xen on it. PCEngines mainta=
ins
> > > Xen compatibility for their APU2 in meta-pcengines.
> > >
> > > There are also some challenges being encountered in getting a more r=
ecent Linux
> > > kernel working as a dom0 on the Raspberry Pi 4 - eg. the Linux Found=
ation Eve
> > > Project run their own patches for 5.6 here:
> > > https://github.com/lf-edge/eve/tree/master/pkg/new-kernel/patches-5.=
6.x
> > >
> > > All of this points towards it being a reasonable proposition to have=
 a
> > > dedicated Xen hardware support Yocto layer, so that board-specific t=
weaks for
> > > hardware compatibility with Xen can be maintained without complicati=
ng
> > > meta-virtualization, while continuing to pool Xen-aware contribution=
s in
> > > a centralized layer.
> > >
> > > I'd like to propose creating: 'meta-xen-bsp'; and I'm willing to wor=
k on
> > > maintaining it. Feedback to this suggestion is welcome.
> > >
> > > Bruce: how does this sound to you?
> >
> > I had this problem working on some other BSPs to support Xen with meta=
-virtualization (you can check this in meta-arm[1]).
> >
> > I would think the best way to handle this case is to use dynamic layer=
s and push the required support inside the layer containing the BSP.
> > This would make the maintenance easier (for example when the kernel is=
 changed).
>
> We've already been talking about dynamic layers, but they don't
> actually solve the issue of one source of truth for an entire stack
> that I'm talking about.

And of course, at a glance, I already see two things that could have
easily been submitted to meta-virtualization. Which shows the point,
that once you have layers as a place to stash fixes/features, they
typically don't get submitted to the centralized layers.

Cheers,

Bruce

>
> Cheers,
>
> Bruce
>
> >
> > If you want an example of how to use dynamic layers you can check meta=
-arm-autonomy sub layer of meta-arm [1] (which also contains other interest=
ing bits related to using Xen with Yocto).
> >
> > Cheers
> > Bertrand
> >
> >
> >
> > IMPORTANT NOTICE: The contents of this email and any attachments are c=
onfidential and may also be privileged. If you are not the intended recipie=
nt, please notify the sender immediately and do not disclose the contents t=
o any other person, use it for any purpose, or store or copy the informatio=
n in any medium. Thank you.
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>=20



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
