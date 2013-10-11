Return-Path: <flihp@twobit.us>
Received: from www.twobit.us (www.twobit.us [50.19.210.51])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1D170E011C5
	for <meta-virtualization@yoctoproject.org>;
	Fri, 11 Oct 2013 11:36:55 -0700 (PDT)
Received: from c-76-24-20-220.hsd1.ma.comcast.net ([76.24.20.220]
	helo=[10.79.148.145])
	by www.twobit.us with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <flihp@twobit.us>)
	id 1VUha0-0003mX-PG; Fri, 11 Oct 2013 18:36:53 +0000
Message-ID: <5258453A.3090408@twobit.us>
Date: Fri, 11 Oct 2013 14:36:42 -0400
From: Philip Tricca <flihp@twobit.us>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130922 Icedove/17.0.9
MIME-Version: 1.0
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <20131004163952.GA5669@longhaul.twobit.us>
	<524EF9AE.7090201@twobit.us> <52551E5A.4000204@gmail.com>
	<CADkTA4PvJVHCvLi7bG7Vckqv-8MqbWju3HwSvkc7eo8HE89Nzw@mail.gmail.com>
In-Reply-To: <CADkTA4PvJVHCvLi7bG7Vckqv-8MqbWju3HwSvkc7eo8HE89Nzw@mail.gmail.com>
X-Enigmail-Version: 1.5.1
X-SA-Exim-Connect-IP: 76.24.20.220
X-SA-Exim-Mail-From: flihp@twobit.us
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on www.twobit.us
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.1
X-SA-Exim-Version: 4.2.1 (built Mon, 22 Mar 2010 06:26:47 +0000)
X-SA-Exim-Scanned: Yes (on www.twobit.us)
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] Explicitly set CHECKPOLICY path to native sysroot.
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
X-List-Received-Date: Fri, 11 Oct 2013 18:36:58 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit

On 10/10/2013 11:21 PM, Bruce Ashfield wrote:
> On Wed, Oct 9, 2013 at 5:14 AM, David Nyström <david.c.nystrom@gmail.com> wrote:
>> On 10/04/2013 07:23 PM, Philip Tricca wrote:
>>>
>>> Probably should add that I'm not very fond of having the path hard coded
>>> like this. Makes for a dependency on the install location from the
>>> checkpolicy recipe. For the short term this fixes the immediate issue
>>> though. Feedback on the "right way" to reference / find this binary
>>> would be appreciated.
>>>
>>> Regards,
>>> - Philip
>>
>>
>> I suppose the correct way would be to patch the configure scripts and
>> upstream that patch to Xen. But I have no problems with this, as long as
>> chkconfig referenced from native sysroot is in DEPENDS, to avoid build race
>> conditions.
> 
> Which isn't the case at the moment.So this patch needs a bit more work.

So even doing this "the right way" by setting the variable and including
checkpolicy in the DEPENDS (using the selinux distro feature) won't fix
the immediate problem: the configure script and Makefile don't work
right so any user with /usr/bin/checkpolicy installed on their build
host will end up with the Xen recipe trying to build the FLASK policy
and it won't compile.

I'll start checking upstream to see if this was fixed recently or if I
have to start from scratch. Good data on how to handle the conditional
dependency though.

> Philip: Are you talking about the selinux checkpolicy here ? I assume you are,
> but want to be sure. If you are, not only do we need the package in the
> DEPENDS, we need meta-selinux in the README's layer dependency list for
> meta-virt.

That's the checkpolicy I'm talking about. The right way to add a
dependency on a new layer w/o forcing that layer on everyone wasn't
initially clear. I'll poke around the DISTRO_FEATURES stuff and com back
with a v2

Thanks,
- Philip


