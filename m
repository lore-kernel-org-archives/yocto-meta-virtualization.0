Return-Path: <jori@enea.com>
Received: from mail.acc.umu.se (mail.acc.umu.se [130.239.18.156])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7C06AE0084C
	for <meta-virtualization@yoctoproject.org>;
	Thu, 27 Feb 2014 08:18:06 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by amavisd-new (Postfix) with ESMTP id 239FF88E;
	Thu, 27 Feb 2014 17:18:05 +0100 (MET)
X-Virus-Scanned: amavisd-new at acc.umu.se
Received: from sestows930 (sestofw01.enea.se [192.36.1.252])
	(using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
	(No client certificate requested) (Authenticated sender: zqad)
	by mail.acc.umu.se (Postfix) with ESMTPSA id 34B6188D;
	Thu, 27 Feb 2014 17:18:04 +0100 (MET)
Received: by sestows930 (Postfix, from userid 1000)
	id D9BFE181980; Thu, 27 Feb 2014 17:18:03 +0100 (CET)
Date: Thu, 27 Feb 2014 17:18:03 +0100
From: Jonas Eriksson <jonas.eriksson@enea.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Message-ID: <20140227161803.GA32615@enea.com>
References: <1393409277-17451-1-git-send-email-jonas.eriksson@enea.com>
	<CADkTA4OyZSxsTa3ffsqeQjRSZX+q+yEXS6TDRY6ogEkskKP7jQ@mail.gmail.com>
	<20140227080039.GA24265@enea.com>
MIME-Version: 1.0
In-Reply-To: <20140227080039.GA24265@enea.com>
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
X-List-Received-Date: Thu, 27 Feb 2014 16:18:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi again,

On Thu, Feb 27, 2014 at 09:00:39 +0100 Jonas Eriksson wrote:
> On Wed, Feb 26, 2014 at 14:33:21 -0500 Bruce Ashfield wrote:
> > I've never been particularly concerned about the extra functionality that is
> > introduced when meta-virt is added, since container support (and arguably
> > lxc if you are doing "virtualization") is a fairly basic feature.
> 
> I can see your concern, and it was something I weighed in when
> adding lxc to DISTRO_FEATURES. My train of thought ended up
> something like this:
> 
> - The LXC kernel conf parameters has some performance impact
> 
> - The Xen kernel conf parameters does too, and those are enabled
>   through DISTRO_FEATURES
> 
> - DISTRO_FEATURES it is

So, a follow-up on this. It seems that there were some confusion
around whether or not extra kernel configuration parameters where
needed to run LXC. It turns out that the answer is no, and that
the linux-yocto kernel by default has all the bells and whistles
needed for LXC as it is. This of course means that the need for
an extra *_FEATURES parameter simply disappeared.

Now the only question is why you did not yell at me for missing
this fact, Bruce ;)

I've now reposted the series without the offending patch.

Thanks and sorry for the confusion,
/Jonas

