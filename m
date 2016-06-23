Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CF321E00BF8; Wed, 22 Jun 2016 18:59:00 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.213.42 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-vk0-f42.google.com (mail-vk0-f42.google.com
	[209.85.213.42])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0298DE00B74
	for <meta-virtualization@yoctoproject.org>;
	Wed, 22 Jun 2016 18:58:58 -0700 (PDT)
Received: by mail-vk0-f42.google.com with SMTP id d185so86682238vkg.0
	for <meta-virtualization@yoctoproject.org>;
	Wed, 22 Jun 2016 18:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=+HjxaCGkLhZL6dmigt2GxsSIaoXAAubpjeS1NzeyZD4=;
	b=YEVClbEEkkGczi9q8I3h2c/e7BWmBsxjQE1uFHRjaZjYjXx1kCyzfjfD5ozYDzY6dr
	olrHGvdlZ0umha7iLQVZwZ12tHCvjwYYNW8NPnTuOQehrzCocAgvKqyhDTbG5OaVcItK
	pqcYAzsG3iZbQ6wlSZqYxghcWbRMUKJOBb33vgSJTG1PlZmxDJTTz+eYbbVK7YHASSvI
	hJWp3kw78pefS7s6k/GE/Ugu5elTHqYH2uKkt/sYHPMSU4sYTKEOYARl8i+/enIxzYIy
	PGI6OU+GxLTJtHbLwkFLmA5ZpGPJvJftGVk/hiz45lnN96tuBnmOUfjn9c695dNbVrMe
	VkUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=+HjxaCGkLhZL6dmigt2GxsSIaoXAAubpjeS1NzeyZD4=;
	b=MLvWno5kDdLL42rRbNdoC2S2IE58xq0+f6meckZJwbLWVmvnQ7KHyTfbGwIybNRPqy
	arn8uy2p309r/RcDKLnyzpoRwSIgK/iztje0lrtGc516ApASwNMRaPheSt0FXIVNAxj8
	naDEQb9IRj4gOSzhKDnC1dc+f4P+NkRNKTWw1iyBDXW6yewrZM6UjQq+sHD+SNSTIKwg
	Ktz+3V4LsfAAB7jK+2B2Q0PVhEh5LAy/NxcpaHlIFN8SC7l4nxIoOzOjxgwUEoFcatCU
	0uVipwV1ZNf5H/+mmLsDLg/JiOavhC3FTF/r6xr0feS6P98m2et8O8aBfMMwp8kIdKRr
	6gDQ==
X-Gm-Message-State: ALyK8tIuFQegrIyC+ZMDAHI9Xbnnr+WrGNZ5U7+dELabCqtPYH/Z2CaleO3U6Q/B9kuagzouTEmEu+qnqEMsog==
X-Received: by 10.31.52.69 with SMTP id b66mr11595487vka.16.1466647137913;
	Wed, 22 Jun 2016 18:58:57 -0700 (PDT)
MIME-Version: 1.0
Sender: asselsm@gmail.com
Received: by 10.159.35.161 with HTTP; Wed, 22 Jun 2016 18:58:57 -0700 (PDT)
In-Reply-To: <CADkTA4M38pcOVFatxRLpmCPn0OTc12uNCfChs0spzeYMMk0sXA@mail.gmail.com>
References: <20160619095507.4c1f84cd@nuc.betafive.co.uk>
	<CADkTA4M38pcOVFatxRLpmCPn0OTc12uNCfChs0spzeYMMk0sXA@mail.gmail.com>
From: "M. Asselstine" <asselsm@mcmaster.ca>
Date: Wed, 22 Jun 2016 21:58:57 -0400
X-Google-Sender-Auth: gvjajmLuHBG-vNiXQaoWiglff7Y
Message-ID: <CAPuovEKvZnZbt_Y1nK8kRoKX_-auKR3eibuiObfo_zUyS6CbGQ@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: Dependency on oe-meta-go
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
X-List-Received-Date: Thu, 23 Jun 2016 01:59:00 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jun 20, 2016 at 8:11 AM, Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
>
>
> On Sun, Jun 19, 2016 at 4:55 AM, Paul Barker <paul@paulbarker.me.uk> wrote:
>>
>> Hi all,
>>
>> The meta-virtualization README file says that one of the dependencies
>> is:
>>
>>         URI: git://github.com/errordeveloper/oe-meta-go.git
>>         branch: master
>>         revision: HEAD
>>
>> However, that repository seems a bit out-of-date and I can build the
>> software I'm using from meta-virtualization without using that layer.
>>
>> Is this still a valid dependency or does the README need an update?
>>
>
> It is still the goal that it is a valid dependency. We've have trouble
> getting changes into
> that layer (or in a timely fashion) ..

The maintainer just recently did a bunch of pending merges and reached out
about layer maintenance, so hopefully this is a signal of better things to come
for oe-meta-go.

Mark


> so instead things have been flowing
> into meta-virt.
>
> But yes, you can build without it present due to the amount of changes we've
> queued.
>
> I'll keep that dependency around for a little bit longer, as a show of good
> faith :D
>
> Bruce
>
>>
>> Thanks,
>> Paul Barker
>> --
>> _______________________________________________
>> meta-virtualization mailing list
>> meta-virtualization@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee at
> its end"
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>

