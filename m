Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D93FEC1114
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 17:43:33 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.337.1771868609566014639
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 23 Feb 2026 09:43:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Mc2mE/Z2;
 spf=pass (domain: gmail.com, ip: 209.85.160.177, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-506bad34f51so38704141cf.2
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 23 Feb 2026 09:43:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771868608; x=1772473408; darn=lists.yoctoproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AL0TSJaRuk0M2uurXjNV3tPfFH1PAxpW9kjvkExtrQI=;
        b=Mc2mE/Z2erYN0JJziryiFuT6sHXnownYG5TItMMknEqdGPV6U3wb7z1eqLYK1yAQt9
         lm3oNA2bwX912tsk8Kn1ZBGWhkvpOrR4uRT4UyFrxMgHJKaCLi9q6/9eOb9iRPVW13oM
         mQ0yS1RqokABLwuny+Zg+sv+UTyB971dcSKnYzWUyvb3mXfg/xDty7rIYvPtxBC78g7+
         Wp5DGuGUJRxF/rI/sbn3qcM/62yKmOGPQt+iDw1UwRHAyCfwl7mrotQriywNNoTrYg3P
         e4IzzEbgL7/bIN4W506a3fLEGLRU43D4+Kizd/zluvaExT8hje5HIM5Asx+BTenlTspr
         0x5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771868608; x=1772473408;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AL0TSJaRuk0M2uurXjNV3tPfFH1PAxpW9kjvkExtrQI=;
        b=cq8acXNXc846AWvaLqX8z8AEKBuRjanG0DGd+3H/Gs3wpP8eh2zprtdJVMxGCpVzx0
         0qyVRKi+CtF7Y2DEoPajZsFZhERD74xIEse3/0gFUCY7PKAsC5UFBD4acWmmf0eetOpD
         Af9imkKhEfVXWDPBWt6GV/tfh3IPqN8KnuwC7Saz723J+yr/BMWYUHnse1JvTcjxfRQL
         VUc6Q1f7Ee0wI15OTmIpBFEM1dAN7Bl3WRw+maTe1LXywkA+TPj6Cu0AB5fcT923fz/8
         5jWA+9PPpbFZ0X5xGwX0eindpcA8fhYw/fkdIEAjfyO8GrojsYzV+qTRyAU1oBSNLAVp
         nk7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVfP6o9nrywoWOhyUHpQEuLDzh08Mb2Q4bjLfseE6uu/wwmoG0ZL8FFMxm/gNHvVHl/yoFr3JC/Im6ufTahiSbAvgjo@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YwTVV1kzaKxTFu/7+ZWj8N3W6BPeGopAk60FLuwADbdYhucbOuF
	ycgPurEDfOr7SmATqLpLNka1XKWFtW5U3/fBVX08K4WCZI7rshpnaf73
X-Gm-Gg: AZuq6aLSS10Qo3xQnqAzx5etTJKHWYiJhu8QtfuxKYGWYVMD4RG7x+xqW1Ko7o5Uy7k
	fjDiGDIpPJ9xEWWeUBodQCjEM3MiKpEOmNNP/cbZ5ou/qXpZ/9yHGTzjqGsDXZklIX36sgwkdSb
	5oaYHgjECQ4hVQhuACGomYSvbTRcwCA993tr3mSJl58AbQ1EslsGUdMF95XXS134M5lB7lAkuFr
	2xxmtxCDzfOI1zm+aUF8s7BolfnYSCm1UVwjlFEICOxo+F43vCASWRrG9g/4E/NDwooLyEgOM7y
	JWZQfMk8dv/k6fv6mimoxbRtRBQc3fhQMmJ4MLdiuh+1vm2FIVisucCM4BnDUmpiiFjFASXv2Df
	Rd2qwRb1o4VkT2hTHWkFJEhBnMUiX5oexCqFVS92xPxK+n26mf+xSq/Ls5qF0me+Ny83+9/cJlU
	SG4N7+ivDz5HBRLRBPSu/6LQgs+YG0hyp6Ni+kAN0dwo9vu0SC0GOwKvndSdrsGgckkgdPtpPSw
	wjiJfoq6OJtAkdSk3if+B+IdFFdpjiSlk2j
X-Received: by 2002:ac8:7f8f:0:b0:504:3c8f:f9bf with SMTP id d75a77b69052e-5070bcf2106mr138936101cf.74.1771868608409;
        Mon, 23 Feb 2026 09:43:28 -0800 (PST)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cb8d0460c9sm887016285a.5.2026.02.23.09.43.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 09:43:27 -0800 (PST)
Date: Mon, 23 Feb 2026 17:43:26 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Keerthivasan Raghavan <kraghava@qti.qualcomm.com>
Cc: Anuj Mittal <anujmitt@qti.qualcomm.com>,
	Viswanath Kraleti <vkraleti@qti.qualcomm.com>,
	Sourabh Banerjee <sbanerje@qti.qualcomm.com>,
	"meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Subject: Re: [PATCH v4 1/1] crosvm: add recipe for ChromeOS Virtual Machine
 Monitor (VMM)
Message-ID: <aZyRvhuhadIsvDhJ@gmail.com>
References: <20260219113015.3269886-1-kraghava@qti.qualcomm.com>
 <20260219113015.3269886-2-kraghava@qti.qualcomm.com>
 <aZvDGPW1kT_ZVu_h@gmail.com>
 <BL0PR02MB38446DEFF4AB9BC4C90B4C91F377A@BL0PR02MB3844.namprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BL0PR02MB38446DEFF4AB9BC4C90B4C91F377A@BL0PR02MB3844.namprd02.prod.outlook.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 23 Feb 2026 17:43:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9610

In message: Re: [PATCH v4 1/1] crosvm: add recipe for ChromeOS Virtual Machine Monitor (VMM)
on 23/02/2026 Keerthivasan Raghavan wrote:

> > We can drop the "meta-virtualization layer" from the description,
> > we know the layer just by it being here :)
> 
> Ack.
> 
> > We can drop the marketing for crosvm from the commit. Users
> > will make their own choice on what they want to use, so we
> > don't need the elevator pitch.
> 
> Ack.
> 
> > Which unfortunately means I'd have no way of being able to
> > build and test it myself. Getting this working under
> > genericarm64 or better qemuarm64 machine definitions (at list
> > minimal functionality is critical for being able to support
> > it).
> 
> Ack. I will try to run the arm64 guest image(generated from yocto using a generic arm64 machine)
> that exposes /dev/kvm on top of an arm64 host(my target with native arm64 cpu). I am banking on
> using nested kvm virtualization to get this to work(and hopefully it will) as the guest image
> containing the crosvm is the end goal to reproduce a consistent test environment.
> Should I add this test image into meta-virtualization provided it works out ?

Possibly, yes.

I'd like to do the same for the VMMs that I've done for containers
and just define a VMM_PROFILE that is selected, and that configures
everything we need. That would allow me to collapse all the specific
host images into one (just like I did with container-image-host).

But leave that part to me, as I'd be pretty specific about how I'd
want it done. Define a minimal image for it, and then I can look for
a pattern later and refactor/consolidate things.

> 
> The bellow ascii diagram captures the intent:
> 
> +==================================================================================================+
> |                               L0: ARM64 HOST (Generic Armv8 CPU)
> +==================================================================================================+
> |  Hardware
> |    - Armv8-A CPU
> |    - EL2 virtualization support
> |    - (must support nested virtualization for L1)
> ----------------------------------------------------------------------------------------------------
> |  Host Linux Kernel
> |    - KVM host support
> |    - /dev/kvm
> ----------------------------------------------------------------------------------------------------
> |  Userspace
> |    - qemu-system-aarch64
> |    - accel: KVM
> |    - cpu: host
> |    - machine: virt,virtualization=on
> ----------------------------------------------------------------------------------------------------
> |                                      Runs the L1 VM
> +-----------------------------------------------+--------------------------------------------------+
>                                                 |
>                                                 v
> +==================================================================================================+
> |                        L1: ARM64 GUEST (Yocto Test Appliance, generic Armv8)
> +==================================================================================================+
> |  Guest Kernel
> |    - AArch64
> |    - KVM guest support enabled
> |    - /dev/kvm  <-- present only if nested virtualization is supported by L0
> ----------------------------------------------------------------------------------------------------
> |  Rootfs (Yocto-built)
> |    - crosvm
> |    - test orchestration / CI hooks
> |
> |    - Packaged L2 artifacts
> |        /opt/l2/
> |          ├── Image            (L2 kernel, generic Armv8)
> |          ├── rootfs.ext4      (L2 root filesystem)
> |          ├── initrd.img       (optional)
> |          ├── *.dtb            (optional)
> |          └── cmdline.txt      (optional)
> +-----------------------------------------------+--------------------------------------------------+
>                                                 |
>                                                 v
> +==================================================================================================+
> |                          L2: NESTED GUEST VM (generic Armv8, test target)
> +==================================================================================================+
> |  Booted by crosvm using packaged artifacts
> |  Ideally KVM-accelerated via nested virtualization
> ----------------------------------------------------------------------------------------------------
> |  Test boot to shell of the VM.
> +==================================================================================================+
> 
> NOTE: The above was generated using gen AI, due credits to M365.

I'm about to push a complete re-working of the Xen guest
image bundling to match the container image bundling. So
for now, ignore/skip the need to provide / build the guest
images and bundles in meta-virtualization. Since they'd
need to follow a pattern that isn't quite visible yet (I'm
just chasing a few regressions on container bundling).

> 
> My pessimism originates dues to the levels of nested virtualization, but given that
> cloud providers like AWS have introduced nested virtualization for its ec2/compute instances
> (I came across a post on LinkedIn that announced this, will need to check the offcial ec2 doc),
> I think this is a good enough generic test-setup arch that one uses to test userspace vmm solutions.
> What remains is to prove this works as a stable test infra setup without jitter of random failures due to
> environment/machine drift, across the 2/3 layers of virtualization.

It should work, or at least I've been using nested virtualization
in the meta-virtualization context for over a decade to test Xen
and the container stacks. There may need to be some additions to
the host kernel, etc, to make it work, but that is something
we can solve and key off the distro feature.

It does need to use the OEcore and meta-virtualization components
for the kernel, etc, otherwise, we have depdendencies and a
test matrix that is getting larger. For things that absolutely
need hardware, there are the dynamic layers, but I don't use those
for core functionality testing.

> 
> > I've started creating a pytest infrastructure for new packages
> > (and eventually the old ones) in the layer. If we get a machine
> > working that is more generic, we can add those. At a minimum
> > a README along side the recipe with testing instructions should
> > be done.
> 
> Ack. Will get the README based on the above diagram that captures testing.
> Can you please provide some references or pointers on the pytest aspect.
> It looks like a we trying to automate the end to end test functionality 
> of userspace virtual machine monitor recipes ? I can maybe follow this up
> with the test cases that can be plugged into this pytest setup.

Yes, there are some end to end tests for containers and I'm
adding them for Xen right now. Even just basic boot to prompt
is good enough for a start, it doesn't have to be elaborate.
That gets us build, kernel, packaging and a runtime smoke test.

> 
> > crossvm is a little bit short for SUMMARY :)
> 
> Ack. Will think of a few appropriate words.
> 
> > With that many crates. Are there really no variation in
> > the license at all ? Note: other recipes are guilty of this as
> > well, and it's on my list to fix the up as well.
> 
> It is what is available in the crosvm codebase and I think the recipe should
> reflect the same. Here is the reference: https://github.com/google/crosvm/blob/main/LICENSE
> Could you please provide insights on what you meant by "variations" ? (or)
> what "variations" were you expecting that would seem appropriate to model this
> composite sw ?

I mean that do all the crates it is pulling in for the build
really all have the exact same license ? There's no variations
in the open source license at all ?

Some of the recent rust recipes in various layers have been
scanning all the crates for their licenses and doing a combined
license in the main recipe.

> 
> > I'm on the record as really not liking gitsm fetched repos
> > (see the ones I've expanded in meta-virtualization previously),
> > since it makes it very hard to bump the components of have
> > visibility into what is being cloned.
> 
> > I probably won't insist on it, but have you tried breaking
> > this down into the individual clones ?
> 
> No. Git submodules exposes
> the commits, so I do not understand what you mean by "lack of
> visibility". Judging by the context you meant at the
> level of the "recipe". Will stick to "gitscm" as it
> is a more of a recommendation. But I would like to read your
> insights on judging why it makes things difficult.

I don't like to pull the main git repository and have the
iteration and chaining to the submodes within the fetcher and
not visible in the main recipe.

I want all the git:// repositories visible, with commit
hashes that can be tweaked. Even if that means duplicating
the information from the git submodules, it is my preference
as I've been biten many times with updating gitsm based
recipes.


> 
> > I think there are some stragglers in the layer, and maybe it
> > is my memory of PV crossing with PKGV (I prefer we use PV), but
> > do we need the ${SRCPV} ? the +git normally triggers it to
> > be filled in.
> 
> Need to do some digging on this. Will get back to you on this in another reply.
> 
> > With the hard dependency on wayland, is this always graphical ?
> 
> There are many cargo feature flags that need a recipe level
> package config mapped to the cargo feature flags. The default
> target builds graphical support. So I left it at that. I do not have
> much clarity on this due the flag explosion. Maybe follow the initial
> commit with support for granular feature selection ?

That's fine with me.

> 
> > Why the native variant ?
> 
> Well, it is a guilty pleasure that one day maybe it becomes a ||le
> alternative to qemu for testing the created distro, referring to the
> "run qemu" scripts that oe provides. It is an indicator/signal that this
> would be possible, nothing more. Also was easy to test x86-64 builds,
> not the runtime though.

There's been requests for kvmtool for this sort of thing before
and it is what I did with some of the recent container work. There's
no harm in putting it there for now, but having a unified way to
allow runqemu variation would be required once I've collected up
all the options. It just won't be tested right now, and that's
fine. No worries if you leave it.

Bruce

> 
> Thank you, Bruce.
> 
> Looking forward to your reply.
> 
> Thank you,
> Keerthivasan Raghavan

