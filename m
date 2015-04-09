Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A2D36E0098D; Thu,  9 Apr 2015 05:27:54 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.223.180 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-ie0-f180.google.com (mail-ie0-f180.google.com
	[209.85.223.180])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C768EE00957
	for <meta-virtualization@yoctoproject.org>;
	Thu,  9 Apr 2015 05:27:53 -0700 (PDT)
Received: by iebrs15 with SMTP id rs15so98984308ieb.3
	for <meta-virtualization@yoctoproject.org>;
	Thu, 09 Apr 2015 05:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=cUB895hitLsmacyKSwqK4KKbFjBkTrzB5hTX/m1KWuY=;
	b=u5HIhjVKhgMCguIRMiYpxOqyo7lq1A92FkA2kaayxQ1EfFyr5nHH2FHR3n35lpDrlY
	VoYzobYgMI5o9lh/hF5XPxa8yRKhgxNl2q3X+QkVeONG1HeKjt3zCXvKDl7+FyMHpl74
	vXZhBIomfvvSJYF+1FweOuaTqaS4DJLvXeXq9hEDFySSHQPzvpW801E7yH+swFsFTYHt
	8wCDUQOy2QCuzgplrkWnLkHG7Ty/llDZ2FV+SNEveUkh5cMyzjixYA1whieenJnqyZ/Z
	vK7I6bPpKmvtQGfuHjMKpA0c0tHBNC5xKAbpEJ0muo4FSNPr3amSIcw0t7k1L3a9rxUk
	Uq3Q==
MIME-Version: 1.0
X-Received: by 10.107.6.84 with SMTP id 81mr24775433iog.52.1428582473005; Thu,
	09 Apr 2015 05:27:53 -0700 (PDT)
Received: by 10.107.158.20 with HTTP; Thu, 9 Apr 2015 05:27:52 -0700 (PDT)
In-Reply-To: <CADGJdkkcPwagtoVa8uLexgOB6LkoG-8XiAWJ9E8X=MFPyRN3ig@mail.gmail.com>
References: <CADGJdkmNL4mG_XeRaaXaWvrLQ10KFo6LkjHHZgAhXa1c98Rj=A@mail.gmail.com>
	<CADkTA4ObJoGRoe7ss6pEL4JRNFoJBVf3B9PCmxb8VaBOHnZOMg@mail.gmail.com>
	<CADGJdkkcPwagtoVa8uLexgOB6LkoG-8XiAWJ9E8X=MFPyRN3ig@mail.gmail.com>
Date: Thu, 9 Apr 2015 08:27:52 -0400
Message-ID: <CADkTA4MnqESzrZnb-B=0p85_7Luo10jq4bezZr1Ziswxf+1LYA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Michael Matera <matera@lifealgorithmic.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: Error building libvirt with pcap development files installed.
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
X-List-Received-Date: Thu, 09 Apr 2015 12:27:54 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Apr 8, 2015 at 4:54 PM, Michael Matera
<matera@lifealgorithmic.com> wrote:
> Hi Bruce,
>
> Thanks for the patch. I'm having trouble getting it compiled. Can you tell
> me what versions you're using? I switched to the master branch but now I'm
> getting unrelated errors. Here's what I'm using:

I'm always working from master (unless otherwise stated). What exact error
did you see ? No compilation issues here!

Bruce

>
> meta
> meta-yocto
> meta-yocto-bsp    = "master:d6d2dd5c9e06c54ff336b44d54f01b4fe24903ed"
> meta-virtualization = "master:40dcc06946b0ef46286ae8982565cfa72c972d07"
> meta-python
> meta-oe
> meta-networking
> meta-filesystems  = "master:f3092a6766a3004a6fc9e2eef937a40508e97c44"
>
> Cheers
> ./m
>
>
> On Wed, Apr 8, 2015 at 10:24 AM, Bruce Ashfield <bruce.ashfield@gmail.com>
> wrote:
>>
>> On Wed, Apr 8, 2015 at 1:14 AM, Michael Matera
>> <matera@lifealgorithmic.com> wrote:
>> > Hello folks!
>> >
>> > This is my first post so I'll try to make it a good one. I ran into some
>>
>> :). welcome!
>>
>> > trouble building kvm-image-minimal on Ubuntu 14.04 I suspect because I
>> > have
>> > the libpcap0.80-dev package installed on my build host. Here's some
>> > details:
>> >
>> > BB_VERSION        = "1.24.0"
>> > BUILD_SYS         = "x86_64-linux"
>> > NATIVELSBSTRING   = "Ubuntu-14.04"
>> > TARGET_SYS        = "x86_64-poky-linux"
>> > MACHINE           = "genericx86-64"
>> > DISTRO            = "poky"
>> > DISTRO_VERSION    = "1.7.1"
>> > TUNE_FEATURES     = "m64 core2"
>> > TARGET_FPU        = ""
>> > meta
>> > meta-yocto
>> > meta-yocto-bsp    = "dizzy:ec75238f6cc2d2d8d40e0268f6d2acc070cbe9a4"
>> > meta-virtualization = "dizzy:8ec8270017fbeae8fcb8c2d82a60a9f5116b0cf2"
>> > meta-python
>> > meta-oe
>> > meta-networking
>> > meta-filesystems  = "dizzy:2ebb8752f378c9987b0ece5a14915d703b872c1d"
>> >
>> > Looking in the log I see:
>> >
>> >   /usr/lib/x86_64-linux-gnu/libdevmapper.so: undefined reference to
>> > `matchpathcon'
>> >
>> > It seems that the compiler already warned me about this:
>> >
>> >   warning: library search path "/usr/lib/x86_64-linux-gnu" is unsafe for
>> > cross-compilation
>> >
>> > Going back to log.do_configure, I see:
>> >
>> >   configure:     pcap: -I/usr/include -L/usr/lib/x86_64-linux-gnu
>> > -lpcap
>> >
>> > This is clearly not right and it shows me that libvirt needs to be
>> > configured with a specific location for libpcap. My fix, if you can call
>> > it
>> > that, is to pass --without-pcap to configure. I did that by adding the
>> > following line to libvirt_1.2.8.bb:
>> >
>> > PACKAGECONFIG[libpcap] =
>> > "--with-libpcap=MIKEKNOWSNOT,--without-libpcap,libpcap,"
>>
>> We have libpcap as a dependency for libvirt, so while the package config
>> value works to disable the option, what we need is to point libvirt's
>> configuration
>> phase to the sysroot, where our target version of libpcap can be found.
>>
>> That's fundamentally the same thing you are asking above, just without
>> packageconfig injecting it into the configuration phase.
>>
>> .. I went and had a look at how libvirt deals with libpcap and that flag
>> doesn't do what you expect in the --with usage .. it only points to a
>> different
>> location for pcap-config. pcap-config is stubbed out in our system, so
>> that
>> will never work.
>>
>> As it turns out, everyone has had a floating or mis identified libcap (my
>> config.log doesn't find it, and hence just has 'no').
>>
>> I pulled together the attached patch, it allows my libpcap from the
>> sysroot
>> to be found and used for the build.
>>
>> I didn't do any runtime testing, but if it works for you, I'll push it
>> to the tree
>> shortly.
>>
>> Cheers,
>>
>> Bruce
>>
>> >
>> > I'm new to Yocto so I haven't read the 2,000 page reference manual
>> > closely
>> > enough to properly formulate a better PACKAGECONFIG line. Perhaps you
>> > could
>> > help me with that. :-) In any case, libvirt compiles fine without
>> > libpcap
>> > and kvm-image-minimal is now built. I'm looking forward to testing it.
>> >
>> > Cheers
>> > ./m
>> >
>> >
>> >
>> > --
>> > _______________________________________________
>> > meta-virtualization mailing list
>> > meta-virtualization@yoctoproject.org
>> > https://lists.yoctoproject.org/listinfo/meta-virtualization
>> >
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

