Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C674AE00AAF; Mon,  9 Apr 2018 08:39:52 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.215.47 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f47.google.com (mail-lf0-f47.google.com
	[209.85.215.47])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id ED530E00994
	for <meta-virtualization@yoctoproject.org>;
	Mon,  9 Apr 2018 08:39:51 -0700 (PDT)
Received: by mail-lf0-f47.google.com with SMTP id c78-v6so7229855lfh.1
	for <meta-virtualization@yoctoproject.org>;
	Mon, 09 Apr 2018 08:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=mkSGS6TyMTKnP2KQp9VABDhBqdJDSaSp7N5+aIrj0OM=;
	b=bHh9oCmb5ySiFMpu/ol+Y4kbdMAgt37ewFFbT62CO/z74mScN+RoayX8985Qeqw+YB
	u5XvGeoZdvL74+9ew55AzgP9DentdwPRz59rZ6CtY+Ox9hJYA9J6MtFTTr0cA2pv/Q+5
	EHAPZ4w5PN2aG8BcyJO0pygxfpEAyuH60mXj1hgKyjJiZkyj32EGxrcU2NM6CvEOrEH1
	0Ygmv2DsDatwML5i/6R1t15j6ip/MG/pvLcgKMxB0HtzvKbL09ajiBG7zyBrK5NJxkol
	YcQl3mOnhu1mlKIp0Q4SKE1wk0lhi0/pg+1Kr5UE0ugjupn4P/2vx+lBzQR+gUtR3BkC
	w8vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=mkSGS6TyMTKnP2KQp9VABDhBqdJDSaSp7N5+aIrj0OM=;
	b=Zit+CxjzgL8Jo/1c4G80h8WyMm5Bja6/WjJlmLmndPRrOjh3+hmYm7qRLnvbbzCQlL
	1SdHQDdbI0fb6aMrQ6E2Nbtm9ZDOR6kvKcMj9VkYIGCPX6YqLdRgu442ht80lQ1lCpZU
	CN4V+FjQBCKInlyAiQ6LrSPOCL6iKyRJN66rCtpYGqtZQ/j+fGDljF0QCiehKAXf5sXO
	SXEAllv+8wAHw7GvCcAx4ErSmOKQiHBwdePdrlV2FdQeTU2V5HHsiWrtJ4YcAubBM4lM
	N5wQD8o2Uhr1Oju4yEGPrUPwuEdWEqpNusImDIDNmNZHB0LYSpq1/7AKJYvM4up+C81T
	AQHg==
X-Gm-Message-State: ALQs6tBGyqMgKmgLeG9XVnGQ6+7XzXpWCGGU24kAOzVc7JdSqXlBD0w4
	kgplko3ZjoeiLu4GwvuIBNr0AHVdV+wn5vZm3fg=
X-Google-Smtp-Source: AIpwx4+rvF/3AASiW0IOn+N+IsIu2zbALSdmM9C1timuKKGA8qRWSoerOYwrRh2wt5YV3ZCEFA7r7cuOXdzKwdWqq3M=
X-Received: by 10.46.154.145 with SMTP id p17mr22688684lji.28.1523288390477;
	Mon, 09 Apr 2018 08:39:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.25.8 with HTTP; Mon, 9 Apr 2018 08:39:49 -0700 (PDT)
In-Reply-To: <355BE46A91031048906B695426A8D8E617397B18@DEFTHW99EH4MSX.ww902.siemens.net>
References: <20180406134156.21533-1-pascal.bach@siemens.com>
	<CADkTA4OnjNg7NXbZ1GPWUv4Ajvim0TQBEr5dHc-pPo+2u0nYGw@mail.gmail.com>
	<355BE46A91031048906B695426A8D8E6173922CB@DEFTHW99EH4MSX.ww902.siemens.net>
	<CADkTA4NQGoRRsOxL9FisjV2Qz64AvmPRKiC5MxPK22hxF6bBSg@mail.gmail.com>
	<355BE46A91031048906B695426A8D8E617397B18@DEFTHW99EH4MSX.ww902.siemens.net>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 9 Apr 2018 11:39:49 -0400
Message-ID: <CADkTA4PXZ8GZMrBYqAoCDncOWpLCEBn_7=kE7Ux6fWuYG3O-dg@mail.gmail.com>
To: "Bach, Pascal" <pascal.bach@siemens.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 1/2] docker-proxy: add recipe for docker-proxy
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
X-List-Received-Date: Mon, 09 Apr 2018 15:39:52 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Apr 9, 2018 at 11:34 AM, Bach, Pascal <pascal.bach@siemens.com> wrote:
> Hi Bruce
>
>> >>
>> >> As I hinted, I'm going to figure out how to integrate / fix this in
>> >> the main docker recipe.
>> >>
>> >> Having the various SRCREVs managed in multiple recipes is a
>> >> maintenance pain and recipe for runtime errors.
>> >>
>> >> I'll dig into what the go class is doing that is so different from
>> >> what I've been trying.
>> >>
>> >> Can you provide the output of your properly linked docker-proxy, so I
>> >> can use it as a reference ?
>> >
>> > I'm not sure what you mean by output?
>>
>> I sorted things out using the libnetwork Make infrastructure and some
>> spelunking into go internals.
>> I now have it using the sysroot infrastructure, and I can follow along with
>> SRCREVs and any build internal changes to libnetwork:
>>
>> file bin/d*
>> bin/dnet--amd64:         ELF 64-bit LSB executable, x86-64, version 1
>> (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, for
>> GNU/Linux 3.2.0,
>> BuildID[sha1]=bc6059d72a9d6224049542214427bf3c62a41866, not stripped
>> bin/docker-proxy--amd64: ELF 64-bit LSB executable, x86-64, version 1
>> (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, for
>> GNU/Linux 3.2.0,
>> BuildID[sha1]=c52ed7c3b28284a683ade6b4c46ca4f6bad8d1fb, not stripped
>
> I can confirm that it is correctly linking now.
>
> Thanks for the fix.

And thanks for the report and pointers. Since it was running for me, I
probably wouldn't have noticed for ages (and remembered that I forgot
to remove that direct 'go' invocation!)

Cheers,

Bruce

>
> Pascal



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

