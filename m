Received: from mail.optimcloud.com (mail.optimcloud.com [46.23.86.243])
 by mx.groups.io with SMTP id smtpd.web10.985.1592412332615776627
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 17 Jun 2020 09:45:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: optimcloud.com, ip: 46.23.86.243, mailfrom: yocto@optimcloud.com)
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
	by mail.optimcloud.com (Postfix) with ESMTPA id 757F98002B
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 17 Jun 2020 16:45:25 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 17 Jun 2020 23:45:25 +0700
From: "Yocto" <yocto@optimcloud.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] Xen on Raspberry Pi 4 (was "How to resolve the ERROR: xen-image-minimal-1.0-r0 do_rootfs: Function failed: do_rootfs. and ERROR: xen-image-minimal-1.0-r0 do_rootfs: Could not invoke dnf. ERROR: xen-image-minimal-1.0-r0 do_rootf")
In-Reply-To: <84611057-227E-4A10-9ACC-4FD0416E25EB@arm.com>
References: <CY1P110MB05517012EA0DC0134F655D2A8C860@CY1P110MB0551.NAMP110.PROD.OUTLOOK.COM>
 <20200605211602.GO2903@minyard.net>
 <CADkTA4N7vqHMi8Fa5H1sRuX4ZnVrEiS4oso5TiObUu0thJGr5g@mail.gmail.com>
 <20200606005839.GR2903@minyard.net>
 <CACMJ4GYcc0v=Y8gJzhCfVrSq8J4J6V5iwMFwzMfOXit63yO2ww@mail.gmail.com>
 <CADkTA4N+-GrD8TnUUVMC3Hrj=1tR8rsyHj4gCsFvPKzJh9LKyg@mail.gmail.com>
 <CACMJ4GbZw2j4CZQ6ijDopT-cgoHeBjY87MouhFkL0DaCMBP=Kw@mail.gmail.com>
 <B7EF9851-B689-45A1-BCA1-167786E43A85@arm.com>
 <161955761BC8F01E.18675@lists.yoctoproject.org>
 <CADkTA4O1y+GHbnQyRie7iyWwCON_qc1zmHRAc7Hi0LwzcZ_pDw@mail.gmail.com>
 <84611057-227E-4A10-9ACC-4FD0416E25EB@arm.com>
Message-ID: <72ae07a9aa5c3771df2c5c67e0a641d4@optimcloud.com>
X-Sender: yocto@optimcloud.com
X-Spamd-Bar: +
X-Spam-Level: *
Authentication-Results: mail.optimcloud.com;
	auth=pass smtp.auth=yocto@optimcloud.com smtp.mailfrom=yocto@optimcloud.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2020-06-17 23:17, Bertrand Marquis wrote:
>> On 17 Jun 2020, at 13:48, Bruce Ashfield via lists.yoctoproject.org 
>> <bruce.ashfield=gmail.com@lists.yoctoproject.org> wrote:
>> 
>> On Wed, Jun 17, 2020 at 8:45 AM Bruce Ashfield via
>> lists.yoctoproject.org
>> <bruce.ashfield=gmail.com@lists.yoctoproject.org> wrote:
>>> 
>>> On Wed, Jun 17, 2020 at 4:29 AM Bertrand Marquis
>>> <Bertrand.Marquis@arm.com> wrote:
>>>> 
>>>> Hi,
>>>> 
>>>>> On 16 Jun 2020, at 22:43, Christopher Clark via 
>>>>> lists.yoctoproject.org 
>>>>> <christopher.w.clark=gmail.com@lists.yoctoproject.org> wrote:
>>>>> 
>>>>> On Mon, Jun 15, 2020 at 5:45 AM Bruce Ashfield 
>>>>> <bruce.ashfield@gmail.com> wrote:
>>>>>> On Mon, Jun 15, 2020 at 5:11 AM Christopher Clark
>>>>>> <christopher.w.clark@gmail.com> wrote:
>>>>>>> 
>>>>>>> On Fri, Jun 5, 2020 at 5:58 PM Corey Minyard 
>>>>>>> <cminyard@mvista.com> wrote:
>>>>>>>> 
>>>>>>>> On Fri, Jun 05, 2020 at 07:53:53PM -0400, Bruce Ashfield wrote:
>>>>>>>>> On Fri, Jun 5, 2020 at 5:16 PM Corey Minyard 
>>>>>>>>> <cminyard@mvista.com> wrote:
>>>>>>>>>> 
>>>>>>>>>> On Fri, Jun 05, 2020 at 07:55:37PM +0000, Stewart Hildebrand 
>>>>>>>>>> wrote:
>>>>>>>>>>> + Corey
>>>>>>>>>>> 
>>>>>>>>>>> On Friday, June 5, 2020 3:19 PM, Bruce Ashfield wrote:
>>>>>>>>>>>> On Fri, Jun 5, 2020 at 3:12 PM Stewart Hildebrand wrote:
>>>>> 
>>>>>>>>>>> Corey: you are hereby encouraged to submit patches to 
>>>>>>>>>>> meta-virtualization.
>>>>>>>>>> 
>>>>>>>>>> Ok.  The layer has the following basic pieces:
>>>>>>> 
>>>>>>> Before we get to the other pieces, I'd like to cover the new 
>>>>>>> "rpixen"
>>>>>>> MACHINE type that the layer introduces.
>>>>>>> 
>>>>>>> My preference is for avoiding introduction of another MACHINE to
>>>>>>> reconfigure an existing one to run Xen, if possible, and use the
>>>>>>> existing "raspberrypi4-64". I'm hoping to avoid the pattern of
>>>>>>> creating a new machine for Xen for each board that we add support 
>>>>>>> for.
>>>>>>> In meta-virtualization, there's the "xen" DISTRO_FEATURE, which 
>>>>>>> is
>>>>>>> used to turn on Xen-specific functionality and compatibility, and 
>>>>>>> I'd
>>>>>>> like to explore whether that can be made to be sufficient to 
>>>>>>> enable
>>>>>>> what is needed.
>>>>>>> 
>>>>>>> To that end, I've done an initial pass to see what it might take 
>>>>>>> and
>>>>>>> the work-in-progress from that is posted here:
>>>>>>> https://github.com/dozylynx/meta-virtualization/tree/raspberry-pi4-initial-xen
>>>>>>> 
>>>>>>> Some minor changes to other layers could assist - eg. to remove 
>>>>>>> the
>>>>>>> need for a guest filesystem to contain the hypervisor binary - 
>>>>>>> and
>>>>>>> there's still some tidying to do.
>>>>>>> 
>>>>>>>>>> 1 The xen patches for the Pi4, just a few patches.  As the Xen 
>>>>>>>>>> group
>>>>>>>>>> fixes things, I keep adding :).
>>>>>>> 
>>>>>>> Unfortunately I had to drop these patches from my local test to 
>>>>>>> get it
>>>>>>> to boot. It could easily be a local build issue or a fault with 
>>>>>>> the
>>>>>>> one test I've run so far, but I did have success booting with 
>>>>>>> just Xen
>>>>>>> 4.13 and I'd like to get a bit more understanding and confidence 
>>>>>>> in
>>>>>>> them before we bring them in.
>>>>>>> 
>>>>>>>>>> 2 Hacks for getting the Pi4 kernel config right for xen.  This 
>>>>>>>>>> should go
>>>>>>>>>> away if you don't use the kernel from the Pi4 yocto layer, as 
>>>>>>>>>> it
>>>>>>>>>> doesn't work like most kernels in yocto.
>>>>>>>>> 
>>>>>>>>> I should take a look at the configs and see if I can create a 
>>>>>>>>> fragment
>>>>>>>>> or two, but I can take care of that.
>>>>>>>> 
>>>>>>>> That shouldn't be necessary.  The standard fragments work, it's 
>>>>>>>> just
>>>>>>>> that the Pi kernel does not use them.  So this is really Pi+Xen
>>>>>>>> specific, and hopefully they can fix the Pi kernel to use the 
>>>>>>>> normal
>>>>>>>> fragments in the future.
>>>>>>> 
>>>>>>> The linux-raspberrypi kernel does use linux-yocto; it's just that
>>>>>>> meta-virtualization
>>>>>>> needs a matching .inc file to be present for the kernel version 
>>>>>>> that
>>>>>>> you're using.
>>>>>>> Assuming you're using Linux 4.19 (which is what I've tested with) 
>>>>>>> add this file:
>>>>>>> meta-virtualization/recipes-kernel/linux/linux-yocto_4.19_virtualization.inc
>>>>>>> containing just:
>>>>>>> include linux-yocto_virtualization.inc
>>>>>>> which will then enable the linux-raspberrypi kernel to add the
>>>>>>> meta-virt Xen fragment.
>>>>>>> 
>>>>>>> There are also two Linux patches:
>>>>>>> 1) Disable DMA in the SDHCI driver
>>>>>>> This one needs more information in the commit text to understand 
>>>>>>> what
>>>>>>> is motivating doing this and what the effects of it are. Should 
>>>>>>> it go
>>>>>>> into the standard Raspberry Pi kernel?
>>>>>>> 2) Fix PCIe in dom0 for RPi4
>>>>>>> Is this fixed upstream in more recent kernels? It would be good 
>>>>>>> to
>>>>>>> have a pointer to that if so.
>>>>>>> 
>>>>>>> Bruce: To apply these to just the Raspberry Pi kernel when it's 
>>>>>>> being
>>>>>>> used with Xen, a kernel bbappend in a raspberrypi dynamic-layers 
>>>>>>> might
>>>>>>> be an option to consider - eg:
>>>>>>> https://github.com/dozylynx/meta-virtualization/tree/raspberry-pi4-initial-xen/dynamic-layers/raspberrypi/recipes-kernel/linux
>>>>>> 
>>>>>> I can most likely live with that. I obviously make sure that the
>>>>>> reference linux-yocto kernel doesn't need anything to work out of 
>>>>>> the
>>>>>> box, but we can't (and shouldn't) enforce that choice on everyone. 
>>>>>> I'd
>>>>>> rather have patches centralized in a topic layer like
>>>>>> meta-virtualization, so if we need to add a dynamic layer and a 
>>>>>> few
>>>>>> patches, that's a good place to be.
>>>>> 
>>>>> please see my new comment below.
>>>>> 
>>>>>>>>>> 5 A few Pi-specific hacks for config and u-boot.
>>>>>>>>> 
>>>>>>>>> #5 does sound like BSP stuff. Is any of it destined for the rpi 
>>>>>>>>> layers
>>>>>>>>> ? Or is it both rpi AND xen specific, so doesn't really make 
>>>>>>>>> sense
>>>>>>>>> there either ?
>>>>>>>> 
>>>>>>>> It's both Pi and Xen specific.  If everything gets put where it 
>>>>>>>> should
>>>>>>>> be, that would be the only thing left in this layer :).
>>>>>>> 
>>>>>>> These are in recipes-bsp and I agree that they're both Pi and Xen
>>>>>>> specific. I think these are small enough pieces that keeping them 
>>>>>>> in
>>>>>>> meta-virtualization could be a reasonable call, since that's the 
>>>>>>> layer
>>>>>>> where Xen support is focussed, and so they can be added to:
>>>>>>> dynamic-layers/raspberrypi/recipes-bsp
>>>>>>> which indicates their status as amendments to the 
>>>>>>> meta-raspberrypi
>>>>>>> layer. Changes to them would then be easily coordinated with the 
>>>>>>> Xen
>>>>>>> recipes.
>>>>>> 
>>>>>> Agreed.
>>>>> 
>>>>> Since I wrote this, we've seen some expressed interest in support 
>>>>> for
>>>>> running Xen on the NVIDIA Jetson Nano and Xavier NX boards, and on 
>>>>> the
>>>>> xen-devel mailing list, a report of success running Xen on the 
>>>>> RockPro64
>>>>> board:
>>>>> https://lists.xenproject.org/archives/html/xen-devel/2020-06/msg01067.html
>>>>> 
>>>>> I've personally built Xen with meta-virtualization to run on the 
>>>>> Cubietruck for
>>>>> development and testing; the Odroid C2 and XU4 are of interest, as 
>>>>> is the
>>>>> Xilinx Ultra-96-V2 board; and the NVidia Jetson TX1 at one point 
>>>>> had some
>>>>> non-upstream patches available to enable Xen on it. PCEngines 
>>>>> maintains
>>>>> Xen compatibility for their APU2 in meta-pcengines.

I did express interest in getting it running on the NVIDIA NANO and 
Xavier NX. I did build it
from meta-virtualization and its in the final yocto image fine, i just 
cant seem to figure out the
cboot/u-boot on the NVIDIAs to make it boot into XEN itself.

>>>>> 
>>>>> There are also some challenges being encountered in getting a more 
>>>>> recent Linux
>>>>> kernel working as a dom0 on the Raspberry Pi 4 - eg. the Linux 
>>>>> Foundation Eve
>>>>> Project run their own patches for 5.6 here:
>>>>> https://github.com/lf-edge/eve/tree/master/pkg/new-kernel/patches-5.6.x
>>>>> 
>>>>> All of this points towards it being a reasonable proposition to 
>>>>> have a
>>>>> dedicated Xen hardware support Yocto layer, so that board-specific 
>>>>> tweaks for
>>>>> hardware compatibility with Xen can be maintained without 
>>>>> complicating
>>>>> meta-virtualization, while continuing to pool Xen-aware 
>>>>> contributions in
>>>>> a centralized layer.
>>>>> 
>>>>> I'd like to propose creating: 'meta-xen-bsp'; and I'm willing to 
>>>>> work on
>>>>> maintaining it. Feedback to this suggestion is welcome.
>>>>> 
>>>>> Bruce: how does this sound to you?
>>>> 
>>>> I had this problem working on some other BSPs to support Xen with 
>>>> meta-virtualization (you can check this in meta-arm[1]).
>>>> 
>>>> I would think the best way to handle this case is to use dynamic 
>>>> layers and push the required support inside the layer containing the 
>>>> BSP.
>>>> This would make the maintenance easier (for example when the kernel 
>>>> is changed).
>>> 
>>> We've already been talking about dynamic layers, but they don't
>>> actually solve the issue of one source of truth for an entire stack
>>> that I'm talking about.
>> 
>> And of course, at a glance, I already see two things that could have
>> easily been submitted to meta-virtualization. Which shows the point,
>> that once you have layers as a place to stash fixes/features, they
>> typically don't get submitted to the centralized layers.
> 
> If someone is developing a BSP in his own layer and has some specific
> patches to make this BSP work with Xen and meta-virtualization, I
> would create a dynamic layer in his BSP Layer so that including this
> layer would give me full support for the BSP.
> How would you suggest to handle such a scenario ?
> 
> Of course if the fixes are generic then those should be pushed to
> meta-virtualization.
> 
> As an example: where should I put a xen .config file and the bbappend
> to apply it during compilation for my BSP ?
> 
> Cheers
> Bertrand
> 
> 
> 
