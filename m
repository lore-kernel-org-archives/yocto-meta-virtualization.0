Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f49.google.com (mail-la0-f49.google.com
	[209.85.215.49])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A3C32E005B3
	for <meta-virtualization@yoctoproject.org>;
	Sun,  8 Sep 2013 20:14:40 -0700 (PDT)
Received: by mail-la0-f49.google.com with SMTP id ev20so4381453lab.22
	for <meta-virtualization@yoctoproject.org>;
	Sun, 08 Sep 2013 20:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=s+gnS0akqLSIHPq/bhKDdIhlyHtarm8MXfXshGfMFbM=;
	b=LL1UYc2EOp5h9yDrRQVPbFkYZ1JWERqVO31Lys5Ekr34TJPpXegEiUHF7rqB1s3beo
	Gqzc9oGcHFd+p3WEq+loHUb4swweeI0TwpU01ib465qJ3tGqpviT9ZFz8H4ccVDeRSEr
	/ucskzvlfKJexISvBPRBW7tSV19BICQlKM8lyTnQYlN6DB0zs8AYsp+G0LFqfrE5iT6C
	X4TscAPUdVTgz0yREfkOdQwG2bSKTGZkDjMpPXhIlw6F7P/7b9vgSDE0aOTGh0xJbBPQ
	ssd86s53EalV8MxhhFUdyKU4LfQWqVF2Y4p8nlwNE2ecbgFtAzECI1Q3B4Ka8lXVv6Yr
	pm2w==
MIME-Version: 1.0
X-Received: by 10.112.210.136 with SMTP id mu8mr601852lbc.25.1378696479066;
	Sun, 08 Sep 2013 20:14:39 -0700 (PDT)
Received: by 10.112.12.103 with HTTP; Sun, 8 Sep 2013 20:14:39 -0700 (PDT)
In-Reply-To: <CABZSBQf4Qejx8zf0Q4AZG3SQCHDWwen_6w-VEyBOKvzj-vyx-g@mail.gmail.com>
References: <1377833844-14672-1-git-send-email-cjp256@gmail.com>
	<1377833844-14672-2-git-send-email-cjp256@gmail.com>
	<CADkTA4MAHOGDS7=8VMQQuUYDq_uGXq04WRyGqhfkVw=NBLHxOA@mail.gmail.com>
	<CABZSBQf4Qejx8zf0Q4AZG3SQCHDWwen_6w-VEyBOKvzj-vyx-g@mail.gmail.com>
Date: Sun, 8 Sep 2013 23:14:39 -0400
Message-ID: <CADkTA4M-D=MzONSTYU62Mj0WEH4oePXxSyyEjxDckNqykL0jbg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Chris Patterson <cjp256@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 1/4] linux-yocto: add kernel fragment and scc for xen dom0 kernel support.
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Mon, 09 Sep 2013 03:14:42 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sun, Sep 8, 2013 at 10:23 PM, Chris Patterson <cjp256@gmail.com> wrote:
> Bruce,
>
> I'm working on a v2 of my patches and I was curious how would you like to
> handle the xen kernel fragment.
>
> Should I go back and make a patch suitable for linux-yocto and submit there?
> Or stage for meta-virtualization and submit again (with signoff and 3.10
> support)?

Let's keep it simple, submit everything here, and I can do the leg work to pull
it into linux-yocto as appropriate. It'll give me a goo chance to test
things as a
side effect!

Bruce

>
> Thanks,
> -Chris
>
>
> On Fri, Aug 30, 2013 at 1:32 AM, Bruce Ashfield <bruce.ashfield@gmail.com>
> wrote:
>>
>> On Thu, Aug 29, 2013 at 11:37 PM, Chris Patterson <cjp256@gmail.com>
>> wrote:
>> > ---
>> >  recipes-kernel/linux/linux-yocto/xen.cfg |   53
>> > ++++++++++++++++++++++++++++++
>> >  recipes-kernel/linux/linux-yocto/xen.scc |    4 +++
>> >  2 files changed, 57 insertions(+)
>> >  create mode 100644 recipes-kernel/linux/linux-yocto/xen.cfg
>> >  create mode 100644 recipes-kernel/linux/linux-yocto/xen.scc
>> >
>> > diff --git a/recipes-kernel/linux/linux-yocto/xen.cfg
>> > b/recipes-kernel/linux/linux-yocto/xen.cfg
>> > new file mode 100644
>> > index 0000000..f9cfb6a
>> > --- /dev/null
>> > +++ b/recipes-kernel/linux/linux-yocto/xen.cfg
>>
>> Nice. The fragment looks good. I'd actually like to bump this up to the
>> level of
>> in-tree support that we have for KVM.
>>
>> And by that, I mean that I can merge this to the meta branch of the
>> linux-yocto
>> kernel (and also found in the tracking yocto-kernel-cache repository).
>>
>> Once there, it can be built and tested standalone, as well as shared by
>> other
>> feature fragments. You'd then be able to just enable it via a
>> KERNEL_FEATURES
>> entry, just like KVM.
>>
>> Cheers,
>>
>> Bruce
>>
>> > @@ -0,0 +1,53 @@
>> >
>> > +..........................................................................
>> > +.                                WARNING
>> > +.
>> > +. This file is a kernel configuration fragment, and not a full kernel
>> > +. configuration file.  The final kernel configuration is made up of
>> > +. an assembly of processed fragments, each of which is designed to
>> > +. capture a specific part of the final configuration (e.g. platform
>> > +. configuration, feature configuration, and board specific hardware
>> > +. configuration).  For more information on kernel configuration, please
>> > +. consult the product documentation.
>> > +.
>> >
>> > +..........................................................................
>> > +
>> > +CONFIG_PARAVIRT_GUEST=y
>> > +# CONFIG_PARAVIRT_TIME_ACCOUNTING is not set
>> > +CONFIG_XEN=y
>> > +CONFIG_XEN_DOM0=y
>> > +CONFIG_XEN_PRIVILEGED_GUEST=y
>> > +CONFIG_XEN_PVHVM=y
>> > +CONFIG_XEN_MAX_DOMAIN_MEMORY=500
>> > +CONFIG_XEN_SAVE_RESTORE=y
>> > +# CONFIG_XEN_DEBUG_FS is not set
>> > +CONFIG_PARAVIRT=y
>> > +# CONFIG_PARAVIRT_SPINLOCKS is not set
>> > +CONFIG_PARAVIRT_CLOCK=y
>> > +# CONFIG_PARAVIRT_DEBUG is not set
>> > +CONFIG_PCI_XEN=y
>> > +CONFIG_XEN_PCIDEV_FRONTEND=m
>> > +CONFIG_XEN_BLKDEV_FRONTEND=m
>> > +CONFIG_XEN_BLKDEV_BACKEND=m
>> > +CONFIG_XEN_NETDEV_FRONTEND=m
>> > +CONFIG_XEN_NETDEV_BACKEND=m
>> > +CONFIG_INPUT_XEN_KBDDEV_FRONTEND=y
>> > +CONFIG_HVC_XEN=y
>> > +CONFIG_HVC_XEN_FRONTEND=y
>> > +CONFIG_XEN_WDT=m
>> > +CONFIG_XEN_FBDEV_FRONTEND=y
>> > +# Xen driver support
>> > +CONFIG_XEN_BALLOON=y
>> > +CONFIG_XEN_SCRUB_PAGES=y
>> > +CONFIG_XEN_DEV_EVTCHN=m
>> > +CONFIG_XEN_BACKEND=y
>> > +CONFIG_XENFS=m
>> > +CONFIG_XEN_COMPAT_XENFS=y
>> > +CONFIG_XEN_SYS_HYPERVISOR=y
>> > +CONFIG_XEN_XENBUS_FRONTEND=y
>> > +CONFIG_XEN_GNTDEV=m
>> > +CONFIG_XEN_GRANT_DEV_ALLOC=m
>> > +CONFIG_SWIOTLB_XEN=y
>> > +CONFIG_XEN_PCIDEV_BACKEND=y
>> > +CONFIG_XEN_PRIVCMD=m
>> > +CONFIG_XEN_ACPI_PROCESSOR=m
>> > +CONFIG_PCI_STUB=y
>> > diff --git a/recipes-kernel/linux/linux-yocto/xen.scc
>> > b/recipes-kernel/linux/linux-yocto/xen.scc
>> > new file mode 100644
>> > index 0000000..6c68bda
>> > --- /dev/null
>> > +++ b/recipes-kernel/linux/linux-yocto/xen.scc
>> > @@ -0,0 +1,4 @@
>> > +define KFEATURE_DESCRIPTION "Xen Dom0 Support"
>> > +define KFEATURE_COMPATIBILITY board
>> > +
>> > +kconf non-hardware xen.cfg
>> > --
>> > 1.7.10.4
>> >
>> > _______________________________________________
>> > meta-virtualization mailing list
>> > meta-virtualization@yoctoproject.org
>> > https://lists.yoctoproject.org/listinfo/meta-virtualization
>>
>>
>>
>> --
>> "Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end"
>
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

