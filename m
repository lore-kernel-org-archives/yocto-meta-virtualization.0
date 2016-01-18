Return-Path: <cjp256@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F20BEE0086B; Mon, 18 Jan 2016 12:37:07 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (cjp256[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.213.169 listed in list.dnswl.org]
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4A99EE007F2
	for <meta-virtualization@yoctoproject.org>;
	Mon, 18 Jan 2016 12:37:05 -0800 (PST)
Received: by mail-ig0-f169.google.com with SMTP id z14so63249978igp.0
	for <meta-virtualization@yoctoproject.org>;
	Mon, 18 Jan 2016 12:37:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=AY4TKQrWjfVuxHnbm6PiWPVuDtFHOngQCyL0vv8+ciU=;
	b=cQawt8wDfRxTWPEbgAhsHQsqiEf1rfsqQvfpd782qGO5zY02UQ+mHK3JLTTs8sMVFx
	+XMnQ9mq1LnZSUqfL/sAW5txxv0VCCgtvCAs/5+ctLB77owF+8JTIIah+jbxzY99Ni/5
	mq3XRIte/f+se1NDQyeKP+hZS5y1DchVATDqcJxRFW2E0ASv86U7sCkwcXGHdbe/7Soh
	SF5Xn5EbhP8/Jus/ntZjP/ea967qLKfoBjF2DCr/SIDaGAFS70VoiPvfQxOAqT0KsQVX
	fxY0WyXddTAFovyg4H13QaoEYPiROeKBP3jRm83UXouKgvJg2CyBzkyoVa2eULqkuo6K
	2HLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=AY4TKQrWjfVuxHnbm6PiWPVuDtFHOngQCyL0vv8+ciU=;
	b=f+dGTl/Q3ejOttlweYRKTlWTJN3BvLD0aWXL4FwCZHdsKqizEl6Rwz/QawL0TlmuHF
	0StbXzdcSsuNqw/pdF0jUIzJ0z70gTm9Dx92I6ZiS/AHs4NfmwFM+HKwN9BwTIOZ7+7B
	5X1CT6dIumm9XuqHHZuewDoBRpOKW5vNb0IspbL3HMOiK3YJiC0mF+Mjl0/SJPsQ4ot5
	3XR8OGdu1zu3FIqhbGMUEj8ZMX9ynbo3YZWC9qZWwQ7nwVHxLlr5YNWeDjV0ZCQa7m/J
	5k0kvMl5d7T0GicoBiWnFaIChLHNtY/rsMrsl1Ztp2zO2j4DHWTCrRaroa326TYLN4Cv
	H1+Q==
X-Gm-Message-State: AG10YOQZwk7lFIgISPHhK/F6pH3wlDncI7y2Exbp+FYdMxg/YJ5WM09GrNecgLyAcL4kYdo7wlVSwwaht5PxjQ==
MIME-Version: 1.0
X-Received: by 10.50.79.231 with SMTP id m7mr12628725igx.15.1453149425534;
	Mon, 18 Jan 2016 12:37:05 -0800 (PST)
Received: by 10.79.115.5 with HTTP; Mon, 18 Jan 2016 12:37:05 -0800 (PST)
In-Reply-To: <CADkTA4PFkbhtMk0FZdU9_11fu6L2P+UDr3hzy2fJ43MW3i9MRA@mail.gmail.com>
References: <569962FB.8070601@tycho.nsa.gov> <56996543.9070709@mvista.com>
	<569D0DBF.2020007@cardoe.com>
	<CADkTA4PFkbhtMk0FZdU9_11fu6L2P+UDr3hzy2fJ43MW3i9MRA@mail.gmail.com>
Date: Mon, 18 Jan 2016 15:37:05 -0500
Message-ID: <CABZSBQciLB0t5jn_FoHW6s8pD6PV8Q9S5h9z4t7k_--C++-5AQ@mail.gmail.com>
From: Chris Patterson <cjp256@gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: Error building xen-image-minimal
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
X-List-Received-Date: Mon, 18 Jan 2016 20:37:08 -0000
Content-Type: text/plain; charset=UTF-8

>> We might have to audit the different patches and make sure everything
>> has landed and if not repost them.
>
>
> Definitely do that audit! I was trying to track the various threads, but
> with the
> discussion and partially overlapping series, I very well could have missed
> some
> parts.
>

Everything looks good on my end.  Machon, can you confirm you are
up-to-date on master?

