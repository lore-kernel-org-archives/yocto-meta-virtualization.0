Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f50.google.com (mail-la0-f50.google.com
	[209.85.215.50])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 986D1E006F8
	for <meta-virtualization@yoctoproject.org>;
	Thu, 27 Feb 2014 11:41:13 -0800 (PST)
Received: by mail-la0-f50.google.com with SMTP id y1so1985583lam.23
	for <meta-virtualization@yoctoproject.org>;
	Thu, 27 Feb 2014 11:41:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Y3mVJBFs37l8n9FxZtAUcCg40vNQqnkKA3S8Ch7i+WQ=;
	b=MePtZhYTFVO32OlG3K6CRvowf8WmkpwptKxH4bajuC0LQPdFwJCvt49Qa7ONCdgaLO
	VUELu0smlvW1Z8vOseVF/uNMoUyMknmvIeUCbSNVt/j+Ipy6hA+zJBvW5fgI7v7P6LzZ
	7sKCCTx6PrPw0LHIP+SKr2wSc+C718+S4HRxvRwHbQo05OH/Vp18B4kdLw9/xWxRZjqh
	i84hWR5O07zn4Uex1/MHibYnovK8u4g2GFYK3lrwl+LoZnnKAUJcK2lwjQ/xdpnYl/Xs
	QSkhQM/Xu3usAVzv/klzlqZBWJmhXnRDYO6foe39QuqcYV3WHiklCjemR93jOJUXZjTu
	+lqg==
MIME-Version: 1.0
X-Received: by 10.152.1.3 with SMTP id 3mr2828867lai.58.1393530072792; Thu, 27
	Feb 2014 11:41:12 -0800 (PST)
Received: by 10.112.170.166 with HTTP; Thu, 27 Feb 2014 11:41:12 -0800 (PST)
In-Reply-To: <20140227161803.GA32615@enea.com>
References: <1393409277-17451-1-git-send-email-jonas.eriksson@enea.com>
	<CADkTA4OyZSxsTa3ffsqeQjRSZX+q+yEXS6TDRY6ogEkskKP7jQ@mail.gmail.com>
	<20140227080039.GA24265@enea.com> <20140227161803.GA32615@enea.com>
Date: Thu, 27 Feb 2014 14:41:12 -0500
Message-ID: <CADkTA4PGYaOThFk2qjar8OXrKnO-9PWG_JCJRGsXrEB+rqUkXw@mail.gmail.com>
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
X-List-Received-Date: Thu, 27 Feb 2014 19:41:17 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Feb 27, 2014 at 11:18 AM, Jonas Eriksson
<jonas.eriksson@enea.com> wrote:
> Hi again,
>
> On Thu, Feb 27, 2014 at 09:00:39 +0100 Jonas Eriksson wrote:
>> On Wed, Feb 26, 2014 at 14:33:21 -0500 Bruce Ashfield wrote:
>> > I've never been particularly concerned about the extra functionality that is
>> > introduced when meta-virt is added, since container support (and arguably
>> > lxc if you are doing "virtualization") is a fairly basic feature.
>>
>> I can see your concern, and it was something I weighed in when
>> adding lxc to DISTRO_FEATURES. My train of thought ended up
>> something like this:
>>
>> - The LXC kernel conf parameters has some performance impact
>>
>> - The Xen kernel conf parameters does too, and those are enabled
>>   through DISTRO_FEATURES
>>
>> - DISTRO_FEATURES it is
>
> So, a follow-up on this. It seems that there were some confusion
> around whether or not extra kernel configuration parameters where
> needed to run LXC. It turns out that the answer is no, and that
> the linux-yocto kernel by default has all the bells and whistles
> needed for LXC as it is. This of course means that the need for
> an extra *_FEATURES parameter simply disappeared.

Right you are. We've beefed it up by default in many cases .. if
they are common enough.

>
> Now the only question is why you did not yell at me for missing
> this fact, Bruce ;)

:) we'll queue up some karma :)

>
> I've now reposted the series without the offending patch.

The series looks good, if no one objects by tomorrow .. I can do the merge.

Bruce

>
> Thanks and sorry for the confusion,
> /Jonas



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

