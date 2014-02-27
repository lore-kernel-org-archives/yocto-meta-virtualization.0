Return-Path: <jori@enea.com>
Received: from mail.acc.umu.se (mail.acc.umu.se [130.239.18.156])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6CDD4E004F1
	for <meta-virtualization@yoctoproject.org>;
	Thu, 27 Feb 2014 03:31:19 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by amavisd-new (Postfix) with ESMTP id 2B59AAE4
	for <meta-virtualization@yoctoproject.org>;
	Thu, 27 Feb 2014 12:31:17 +0100 (MET)
X-Virus-Scanned: amavisd-new at acc.umu.se
Received: from sestows930 (sestofw01.enea.se [192.36.1.252])
	(using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
	(No client certificate requested) (Authenticated sender: zqad)
	by mail.acc.umu.se (Postfix) with ESMTPSA id 4C0FBAE3
	for <meta-virtualization@yoctoproject.org>;
	Thu, 27 Feb 2014 12:31:14 +0100 (MET)
Received: by sestows930 (Postfix, from userid 1000)
	id BDB57181985; Thu, 27 Feb 2014 12:31:13 +0100 (CET)
Resent-From: Jonas Eriksson <jonas.eriksson@enea.com>
Resent-Date: Thu, 27 Feb 2014 12:31:13 +0100
Resent-Message-ID: <20140227113113.GC28070@enea.com>
Resent-To: meta-virtualization@yoctoproject.org
Date: Thu, 27 Feb 2014 09:00:39 +0100
From: Jonas Eriksson <jonas.eriksson@enea.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Message-ID: <20140227080039.GA24265@enea.com>
References: <1393409277-17451-1-git-send-email-jonas.eriksson@enea.com>
	<CADkTA4OyZSxsTa3ffsqeQjRSZX+q+yEXS6TDRY6ogEkskKP7jQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADkTA4OyZSxsTa3ffsqeQjRSZX+q+yEXS6TDRY6ogEkskKP7jQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
X-List-Received-Date: Thu, 27 Feb 2014 11:31:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Wed, Feb 26, 2014 at 14:33:21 -0500 Bruce Ashfield wrote:
> On Wed, Feb 26, 2014 at 5:07 AM, Jonas Eriksson <jonas.eriksson@enea.com> wrote:
> > The ultimate goal of this patch series was to use a DISTRO_FEATURE to include
> > the lxc.scc configuration in the kernel to be built. This is done to avoid that
> > the kernel configuration gets additional code paths ( =y options ) when adding
> > the meta-virtualization layer. The configurations that enables modules are left
> > untouched.
> 
> I've never been particularly concerned about the extra functionality that is
> introduced when meta-virt is added, since container support (and arguably
> lxc if you are doing "virtualization") is a fairly basic feature.

I can see your concern, and it was something I weighed in when
adding lxc to DISTRO_FEATURES. My train of thought ended up
something like this:

- The LXC kernel conf parameters has some performance impact

- The Xen kernel conf parameters does too, and those are enabled
  through DISTRO_FEATURES

- DISTRO_FEATURES it is

> I'm concerned that within meta-virt we are creating an undocumented set of
> DISTRO_FEATURES, and over using the concept. The items are already
> controlled via PACKAGECONFIG, so users have flexibility from that point
> of view.

I'm not sure what your point is here, since you Ack:ed the other
PACKAGECONFIG-@base_contains patches. But I would guess that it
is to discourage from creating DISTRO_FEATURES just to create a
nice default PACKAGECONFIG. As an answer to that, my concern was
mainly rooted in the performance impact of the LXC kernel
configuration. After that, I just went with "It's there now,
might as well use it" in the PACKAGECONFIG, like for the other
patches.

> We could also use IMAGE_FEATURES as an alternative to distro features,
> since we are really only coordinating libvirt and the kernel when "lxc" is a
> distro feature .. which arguably isn't distro wide.

True enough. Would this motivate a change for the current Xen
DISTRO_FEATURE because of consistency? If anyone on the list
thinks it's obvious why Xen should be a DISTRO_FEATURE and not an
IMAGE_FEATURE, here would be a great place to explain it :-)

> Outside of the lxc change, everything looks pretty good, I'm going to ack
> the individual patches to make it clear :)

Great, thanks!

> Don't misunderstand my comments, there's no white/black answer here, I'm
> just trying to spark a discussion to make sure the direction is clear
> and we have a pseudo-consensus :)

Sounds like a good plan.

So, the way forward. I can create a new IMAGE_FEATURES-based LXC
patch and repost patches 3-5 in the series, unless there are some
other comments before ~end of business at UTC+1.

Thanks,
/Jonas

