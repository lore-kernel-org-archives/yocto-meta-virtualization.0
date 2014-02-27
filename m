Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f54.google.com (mail-la0-f54.google.com
	[209.85.215.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AACBCE007E1
	for <meta-virtualization@yoctoproject.org>;
	Thu, 27 Feb 2014 11:39:06 -0800 (PST)
Received: by mail-la0-f54.google.com with SMTP id mc6so1986941lab.41
	for <meta-virtualization@yoctoproject.org>;
	Thu, 27 Feb 2014 11:39:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=/9WS+S5AtXoyVqcxpJemsu3z5TNpf2I1cPdFgjRcajY=;
	b=BPxpsOs7WE+ktUPi3uuGLiiEFZ9iPOeuY0hlBXN3cE0TWkB8IeEywVUROB946XQCtP
	jyr3eebDy6EJNb4lEfUyDSuL5VSt0lDBRIs4dDsndaxXfCNUiHwTjIGEPwnyjDTCXGSM
	wTDbpNd3JYJTl0oij0ewuBBGqEkqna5LipF9cJ8C2pJ8Zi1xnbMb5hwVgaZQVLSY8kZX
	MuTRznO9YgQBGGQmI4IRfdd66A61MZB3BTX7FNLe1eeS0bueaDKr0WN+get9VMQf4UNi
	0miCxxicuh8vkCQQ3J0HTa7fkDsUKtaJjo9DMmdawXP+5X+pstVxDGNxFz8pIHeVYFGE
	0PYw==
MIME-Version: 1.0
X-Received: by 10.152.5.136 with SMTP id s8mr2837832las.55.1393529944897; Thu,
	27 Feb 2014 11:39:04 -0800 (PST)
Received: by 10.112.170.166 with HTTP; Thu, 27 Feb 2014 11:39:04 -0800 (PST)
In-Reply-To: <20140227080039.GA24265@enea.com>
References: <1393409277-17451-1-git-send-email-jonas.eriksson@enea.com>
	<CADkTA4OyZSxsTa3ffsqeQjRSZX+q+yEXS6TDRY6ogEkskKP7jQ@mail.gmail.com>
	<20140227080039.GA24265@enea.com>
Date: Thu, 27 Feb 2014 14:39:04 -0500
Message-ID: <CADkTA4NvGp9ZJfjP7qbo6ZyY4TkOQCRuZHH-gANevQxcNfr+Pw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Jonas Eriksson <jonas.eriksson@enea.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 0/5] libvirt fixes and a kernel update
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
X-List-Received-Date: Thu, 27 Feb 2014 19:39:08 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Feb 27, 2014 at 3:00 AM, Jonas Eriksson <jonas.eriksson@enea.com> wrote:
> Hi,
>
> On Wed, Feb 26, 2014 at 14:33:21 -0500 Bruce Ashfield wrote:
>> On Wed, Feb 26, 2014 at 5:07 AM, Jonas Eriksson <jonas.eriksson@enea.com> wrote:
>> > The ultimate goal of this patch series was to use a DISTRO_FEATURE to include
>> > the lxc.scc configuration in the kernel to be built. This is done to avoid that
>> > the kernel configuration gets additional code paths ( =y options ) when adding
>> > the meta-virtualization layer. The configurations that enables modules are left
>> > untouched.
>>
>> I've never been particularly concerned about the extra functionality that is
>> introduced when meta-virt is added, since container support (and arguably
>> lxc if you are doing "virtualization") is a fairly basic feature.
>
> I can see your concern, and it was something I weighed in when
> adding lxc to DISTRO_FEATURES. My train of thought ended up
> something like this:

Glad to hear that it was thought about .. that's the important thing!

>
> - The LXC kernel conf parameters has some performance impact
>
> - The Xen kernel conf parameters does too, and those are enabled
>   through DISTRO_FEATURES

If you search the archives, you'll see where I've both suggested image
features and different machines to break up the Xen functionality. So
at least I'm consistent on that front :)

>
> - DISTRO_FEATURES it is
>
>> I'm concerned that within meta-virt we are creating an undocumented set of
>> DISTRO_FEATURES, and over using the concept. The items are already
>> controlled via PACKAGECONFIG, so users have flexibility from that point
>> of view.
>
> I'm not sure what your point is here, since you Ack:ed the other
> PACKAGECONFIG-@base_contains patches. But I would guess that it
> is to discourage from creating DISTRO_FEATURES just to create a
> nice default PACKAGECONFIG. As an answer to that, my concern was

Yes, that's pretty much it. And the existing ones are grandfathered in at
the moment :)

> mainly rooted in the performance impact of the LXC kernel
> configuration. After that, I just went with "It's there now,
> might as well use it" in the PACKAGECONFIG, like for the other
> patches.

I'd have done the same thing.

>
>> We could also use IMAGE_FEATURES as an alternative to distro features,
>> since we are really only coordinating libvirt and the kernel when "lxc" is a
>> distro feature .. which arguably isn't distro wide.
>
> True enough. Would this motivate a change for the current Xen
> DISTRO_FEATURE because of consistency? If anyone on the list
> thinks it's obvious why Xen should be a DISTRO_FEATURE and not an
> IMAGE_FEATURE, here would be a great place to explain it :-)

I'm hoping to hear as well, I've locally converted Xen to an image feature
and it worked fine :)

Bruce

>
>> Outside of the lxc change, everything looks pretty good, I'm going to ack
>> the individual patches to make it clear :)
>
> Great, thanks!
>
>> Don't misunderstand my comments, there's no white/black answer here, I'm
>> just trying to spark a discussion to make sure the direction is clear
>> and we have a pseudo-consensus :)
>
> Sounds like a good plan.
>
> So, the way forward. I can create a new IMAGE_FEATURES-based LXC
> patch and repost patches 3-5 in the series, unless there are some
> other comments before ~end of business at UTC+1.
>
> Thanks,
> /Jonas



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

