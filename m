Received: from mail.optimcloud.com (mail.optimcloud.com [46.23.86.243])
 by mx.groups.io with SMTP id smtpd.web12.16141.1592222585435606872
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 15 Jun 2020 05:03:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: optimcloud.com, ip: 46.23.86.243, mailfrom: yocto@optimcloud.com)
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
	by mail.optimcloud.com (Postfix) with ESMTPA id E48668002B
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 15 Jun 2020 12:03:00 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 15 Jun 2020 19:03:00 +0700
From: "Yocto" <yocto@optimcloud.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] Xen on Raspberry Pi 4 (was "How to resolve the ERROR: xen-image-minimal-1.0-r0 do_rootfs: Function failed: do_rootfs. and ERROR: xen-image-minimal-1.0-r0 do_rootfs: Could not invoke dnf. ERROR: xen-image-minimal-1.0-r0 do_rootf")
In-Reply-To: <CACMJ4GYcc0v=Y8gJzhCfVrSq8J4J6V5iwMFwzMfOXit63yO2ww@mail.gmail.com>
References: <CY1P110MB05517012EA0DC0134F655D2A8C860@CY1P110MB0551.NAMP110.PROD.OUTLOOK.COM>
 <20200605211602.GO2903@minyard.net>
 <CADkTA4N7vqHMi8Fa5H1sRuX4ZnVrEiS4oso5TiObUu0thJGr5g@mail.gmail.com>
 <20200606005839.GR2903@minyard.net>
 <CACMJ4GYcc0v=Y8gJzhCfVrSq8J4J6V5iwMFwzMfOXit63yO2ww@mail.gmail.com>
Message-ID: <10891c1754707db5b215ccd90e7a3c29@optimcloud.com>
X-Sender: yocto@optimcloud.com
X-Spamd-Bar: +
X-Spam-Level: *
Authentication-Results: mail.optimcloud.com;
	auth=pass smtp.auth=yocto@optimcloud.com smtp.mailfrom=yocto@optimcloud.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2020-06-15 16:11, Christopher Clark wrote:
> On Fri, Jun 5, 2020 at 5:58 PM Corey Minyard <cminyard@mvista.com> 
> wrote:
>> 
>> On Fri, Jun 05, 2020 at 07:53:53PM -0400, Bruce Ashfield wrote:
>> > On Fri, Jun 5, 2020 at 5:16 PM Corey Minyard <cminyard@mvista.com> wrote:
>> > >
>> > > On Fri, Jun 05, 2020 at 07:55:37PM +0000, Stewart Hildebrand wrote:
>> > > > + Corey
>> > > >
>> > > > On Friday, June 5, 2020 3:19 PM, Bruce Ashfield wrote:
>> > > > >On Fri, Jun 5, 2020 at 3:12 PM Stewart Hildebrand wrote:
>> > > > >> On Thursday, June 4, 2020 5:13 PM, Christopher Clark wrote:
>> > > > >> > Hello Siddhartha,
>> > > > >> >
>> > > > >> > I am also interested in running Xen on the Raspberry Pi 4. I hope to have time next week to be able to look into it.
> 
> I can report success running Xen on my Raspberry Pi 4, after following
> Corey's work and I'm a fan of this effort - it's excellent to have
> this working and I want to make sure that we integrate what we need.
> There's quite a few moving parts involved with this, so my review took
> a little longer than I'd expected, but I'm making progress and have
> comments below.

Be nice to see this working on the NVIDIA Jetson Nano and Xavier NX 
too..... i can build XEN just cant figure out this u-boot / cboot stuff
to make it actually boot.


> 
>> > > > >> >> On Jun 4, 2020, at 5:05 AM, Siddhartha V wrote:
>> > > > >> >>
>> > > > >> >> Hello dear meta-virtualization team,
>> > > > >> >> I am building the xen minimal image using yocto warrior ("bitbake xen-image-minimal") by giving the target machine as
>> > > > >"raspberrypi4".
> 
> Siddhartha: There are some other pieces that you will need, but as a
> starting point I would suggest
>     MACHINE = "raspberrypi4-64"
> to use the 64-bit version instead.
> 
>> > > > >> Corey Minyard created a layer for Xen on Raspberry Pi 4 here
>> > > > >> https://github.com/MontaVista-OpenSourceTechnology/meta-raspberrypi-xen
> 
> Thanks for making this available, Corey. I've made my way through this
> - it's good work and very helpful - looking to see what pieces are
> involved and what should go where as part of integrating the
> capabilities upstream.
> 
>> > > > >Someone needs to lean on them to get patches submitted to meta-virt.
>> > > >
>> > > > Corey: you are hereby encouraged to submit patches to meta-virtualization.
>> > >
>> > > Ok.  The layer has the following basic pieces:
> 
> Before we get to the other pieces, I'd like to cover the new "rpixen"
> MACHINE type that the layer introduces.
> 
> My preference is for avoiding introduction of another MACHINE to
> reconfigure an existing one to run Xen, if possible, and use the
> existing "raspberrypi4-64". I'm hoping to avoid the pattern of
> creating a new machine for Xen for each board that we add support for.
> In meta-virtualization, there's the "xen" DISTRO_FEATURE, which is
> used to turn on Xen-specific functionality and compatibility, and I'd
> like to explore whether that can be made to be sufficient to enable
> what is needed.
> 
> To that end, I've done an initial pass to see what it might take and
> the work-in-progress from that is posted here:
> https://github.com/dozylynx/meta-virtualization/tree/raspberry-pi4-initial-xen
> 
> Some minor changes to other layers could assist - eg. to remove the
> need for a guest filesystem to contain the hypervisor binary - and
> there's still some tidying to do.
> 
>> > > 1 The xen patches for the Pi4, just a few patches.  As the Xen group
>> > >   fixes things, I keep adding :).
> 
> Unfortunately I had to drop these patches from my local test to get it
> to boot. It could easily be a local build issue or a fault with the
> one test I've run so far, but I did have success booting with just Xen
> 4.13 and I'd like to get a bit more understanding and confidence in
> them before we bring them in.
> 
>> > > 2 Hacks for getting the Pi4 kernel config right for xen.  This should go
>> > >   away if you don't use the kernel from the Pi4 yocto layer, as it
>> > >   doesn't work like most kernels in yocto.
>> >
>> > I should take a look at the configs and see if I can create a fragment
>> > or two, but I can take care of that.
>> 
>> That shouldn't be necessary.  The standard fragments work, it's just
>> that the Pi kernel does not use them.  So this is really Pi+Xen
>> specific, and hopefully they can fix the Pi kernel to use the normal
>> fragments in the future.
> 
> The linux-raspberrypi kernel does use linux-yocto; it's just that
> meta-virtualization
> needs a matching .inc file to be present for the kernel version that
> you're using.
> Assuming you're using Linux 4.19 (which is what I've tested with) add 
> this file:
>   
> meta-virtualization/recipes-kernel/linux/linux-yocto_4.19_virtualization.inc
> containing just:
>   include linux-yocto_virtualization.inc
> which will then enable the linux-raspberrypi kernel to add the
> meta-virt Xen fragment.
> 
> There are also two Linux patches:
> 1) Disable DMA in the SDHCI driver
> This one needs more information in the commit text to understand what
> is motivating doing this and what the effects of it are. Should it go
> into the standard Raspberry Pi kernel?
> 2) Fix PCIe in dom0 for RPi4
> Is this fixed upstream in more recent kernels? It would be good to
> have a pointer to that if so.
> 
> Bruce: To apply these to just the Raspberry Pi kernel when it's being
> used with Xen, a kernel bbappend in a raspberrypi dynamic-layers might
> be an option to consider - eg:
> https://github.com/dozylynx/meta-virtualization/tree/raspberry-pi4-initial-xen/dynamic-layers/raspberrypi/recipes-kernel/linux
> 
>> > > 3 The addition of xen-tools.  This seems somewhat controversial from a
>> > >   naming point of view, at least.  But all the major distros seem to
>> > >   have it, and it does make things easier.  It brings along a boatload
>> > >   of perl recipes.
> 
>> > Christopher might have a better idea about #3, but if the
>> > functionality is useful, I'm all for having it close to the other Xen
>> > components.
> 
> I think if there's users wanting it, it's worth considering and I
> agree with Bruce that meta-virtualization will be the right layer. I
> think the name chosen by the software authors is somewhat unfortunate,
> so getting sign off from the Xen Community Manager about whether the
> use of the trademark is OK would be sensible for Yocto's license
> compliance; but from my (basic) understanding of the policy, it should
> be fine.
> 
> I think it's appropriate to retain the 'xen-tools' package name in
> Yocto for the tools provided by the Xen Project source code, since
> those are core Xen system components, with wider Xen community
> involvement in their development and use than these perl system
> management scripts. I don't mind the recipe/package for these perl
> tools being called xen-tools-extra, but getting thumbs up from the Xen
> Community Manager would be best.
> 
> Out of curiosity, do these tools work OK with Yocto guests?
> 
>> > > 4 Something to make bridges easier to manage.  Distros have another tool
>> > >   to do this (bridge-utils), but that ties into systemd/initd and would
>> > >   have been rather complex to integrate into yocto.  Plus it requires
>> > >   rebooting to change anything.  The one I created is far simpler and
>> > >   works just as well, maybe better.
> 
>> > We've put similar things like #4 into the layer before. Witness
>> > cgroups-lite and some of the other semi-custom and more lightweight
>> > things. But yah, just a judgement call if they may or may not be
>> > useful in other scenarios.
>> 
>> I would like to see it go in, as I couldn't find anything to do this,
>> and it's really simple.
> 
> On this one: could you tell us what the issue that you found with
> using the busybox ifupdown implementation is? I noticed that you add a
> dependency to pull in the full version, rather than keep the busybox
> one.
> 
> For your bridge-ifupdown script: if this is just a general bridge
> up/down script, should it go into a layer closer to core? I haven't
> studied it closely yet though. Would be interested to know if it is
> agnostic to hypervisor or useful with QEMU, etc.
> 
>> > > 5 A few Pi-specific hacks for config and u-boot.
>> >
>> > #5 does sound like BSP stuff. Is any of it destined for the rpi layers
>> > ? Or is it both rpi AND xen specific, so doesn't really make sense
>> > there either ?
>> 
>> It's both Pi and Xen specific.  If everything gets put where it should
>> be, that would be the only thing left in this layer :).
> 
> These are in recipes-bsp and I agree that they're both Pi and Xen
> specific. I think these are small enough pieces that keeping them in
> meta-virtualization could be a reasonable call, since that's the layer
> where Xen support is focussed, and so they can be added to:
>   dynamic-layers/raspberrypi/recipes-bsp
> which indicates their status as amendments to the meta-raspberrypi
> layer. Changes to them would then be easily coordinated with the Xen
> recipes.
> 
> To Siddhartha: I had success building xen-image-minimal that boots on
> the Pi4 with the following:
> In local.conf:
> MACHINE = "raspberrypi4-64"
> DISTRO_FEATURES_append = " virtualization xen"
> QEMU_TARGETS = "i386 x86_64 aarch64 arm"
> PACKAGECONFIG_pn-qemu += " xen fdt"
> PACKAGECONFIG_remove_pn-qemu += " sdl"
> PREFERRED_VERSION_linux-raspberrypi = "4.19.%"
> IMAGE_FSTYPES = "tar.xz tar.bz2 ext3 rpi-sdimg"
> 
> and using the following revisions on the master branch of each of these 
> layers:
> git://git.yoctoproject.org/poky
>   18b6b2ae819cbf0ef3858944b4cd02ab74df6607
> git://git.openembedded.org/meta-openembedded
>   463f9a3ef0935d772a0be0437a8c09df64ed2f07
> git://git.yoctoproject.org/meta-raspberrypi
>   e589e0f3fda8f15f1093909328605e0bb6516d94
> plus my local fork of meta-virtualization:
> https://github.com/dozylynx/meta-virtualization
>   0c809ead05224a61a784744240bb9c125990c481
> 
> -- that should get you to a bootable SD card image.
> 
> Christopher
> 
> 
