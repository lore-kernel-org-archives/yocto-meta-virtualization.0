Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E61C1E0087C; Thu, 12 Feb 2015 09:50:21 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.215.51 listed in list.dnswl.org]
Received: from mail-la0-f51.google.com (mail-la0-f51.google.com
	[209.85.215.51])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9351AE007CF
	for <meta-virtualization@yoctoproject.org>;
	Thu, 12 Feb 2015 09:50:12 -0800 (PST)
Received: by labhz20 with SMTP id hz20so11590233lab.0
	for <meta-virtualization@yoctoproject.org>;
	Thu, 12 Feb 2015 09:50:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=EMj48kZeGSjCnqtuP4d/uX40OeBBN91mM3nM3mIspaU=;
	b=TomaP91MlGaethlGq99H7uiSqihJxKXhDjlxMkIj2b434OqhB5L2+VMiYu9aJs9F3a
	D6/t9qmDc6zlWd4vhGJHVrpGOVEJVmVZrAIjwK8OUgcn/WDqR3KZBVTCDtVT8vEIPa0B
	hdTy8w1hjFHnOCEB6joRrcBsEzojYw352k9psWkZ2aZ7GnwH0goeMoQtS2bYqCynij5L
	L3CfP0Q9J2yKwuN/KY7/dPFO4rVLL+wgHn1Rv5v00XokEXxxkk7gpR0BenTYVsfq3SJ+
	U0dPEMDxAIopX2cMc4HHgqcYW6KuqB8roG7Nl14xoo8ZFTQOqUvxO0H8DThQz4baFpDK
	npGQ==
MIME-Version: 1.0
X-Received: by 10.152.45.37 with SMTP id j5mr4479440lam.110.1423763410574;
	Thu, 12 Feb 2015 09:50:10 -0800 (PST)
Received: by 10.112.40.34 with HTTP; Thu, 12 Feb 2015 09:50:10 -0800 (PST)
In-Reply-To: <CAOWu+mA6+Lqsv6rpkh0xEVaTsW6AsUfsVKiUgz65Z+W-5qOTDg@mail.gmail.com>
References: <CAOWu+mA6+Lqsv6rpkh0xEVaTsW6AsUfsVKiUgz65Z+W-5qOTDg@mail.gmail.com>
Date: Thu, 12 Feb 2015 12:50:10 -0500
Message-ID: <CADkTA4OBoofV010dgCi4T+T7PVHCVzUUvFM=wQtw5w-zSx3K2w@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Rob Weiss <j105.rob@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [Bug 7313] dev86 source location patch
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
X-List-Received-Date: Thu, 12 Feb 2015 17:50:22 -0000
Content-Type: text/plain; charset=UTF-8

Can you fix up your patch to follow the standard conventions of a short log,
long log and a Signed-off-by:  ?

The change itself looks fine, but we need to do a bit of work on the patch
headers. meta-virtualization follows the same patch guidelines as the rest
of the oe ecosystem, so there are plenty of references floating around if
my description isn't clear.

Bruce

On Thu, Feb 12, 2015 at 11:48 AM, Rob Weiss <j105.rob@gmail.com> wrote:
> Regarding bug 7313 I have attached a patch for the new source location.
>
> --
>
> -----BEGIN PGP PUBLIC KEY BLOCK-----
> Version: GnuPG v1.4.12 (GNU/Linux)
>
> mQENBFKEwSUBCADi6r/xXH0QTgLbPg2EIQD86M+5w1PekvnLLxfUEficcvlTNrLW
> bBsGVCdksAymJdHuuLrrujnoQrd5REoTq7R6IZHFZ5SS7eRkfrG4eFImRoXmHHRq
> 71DPdZnlALoUXUS9lb1pY4AbMaF51pduGigGUrVSHaAH2aLQMz2k9C+Cox5QLghm
> 9M0vhwGXviJ2PEZZ2nc03YT2PTwqQQHYJI9rLRJQXOpl9nUZn4zLDJg9H8nkhm4b
> 8yj3MRW1FVfW1KqnCuRBnwKuXVmeaJ0aA0ZnXy4xb7sT7Gw92K2a6QJzFviCJfx4
> jAGB6wuRF9wFI2GswposLN4514FzyNSb+3BnABEBAAG0I1JvYmVydCBKIFdlaXNz
> IDxqMTA1LnJvYkBnbWFpbC5jb20+iQE4BBMBAgAiBQJShMElAhsDBgsJCAcDAgYV
> CAIJCgsEFgIDAQIeAQIXgAAKCRA7Vynrc6yHx2yyCACfv7iBr49MvbXMlkgeXk3T
> vsJGXhXS7ZuwjaGLY1jGRMgj9ir1gS3D8qJzcjNhofW52Kn2TWhPbh7ed9xpuDQp
> zk75Nw/TNT2FBerKF7d2s/v3qhpUUod72q7rTHBA3EMYDfUa+XsxfmI3TybOJn1N
> aSNS/7LyNqaJY1Mh+SbhmBppVZQJmmGAcq3g4WmDo9WXvL11nKEwHp5eVzH7u6E1
> HszjKTu26s+Vtre0dE2lq2EaatK88t+5aE8kQtTQ9oyTyeVikrJ40nqajRbZqAOH
> 1Kh0EWOrJvzjloeC33UPIqS7ITIBtDpzzQgjmh4KjLQhjYgg6abxOgbjmrDXif4H
> uQENBFKEwSUBCADqgJH5/im2YwGUxF8Hf2RF8Wd3G6tQHEIVl5DIsT6OAcL2/aLD
> J1V2gGkPzXltvf8sRWa8IdHoqLpe0RDEzxpjjP26BTq2UoQu1Hn44W19QM93EaFP
> M7vdQLWClmGzxNC2/Jw7nszm92QpxP/RWvWXJDxsa8cjrJCHBzQj74hMeMMCmK2O
> rCAUlH3q1iI9KAQAz6r+aIsQuaeXSNT5N7La4pBidooV8LxLI/zyPMJ42x4uSNbD
> 2KEpFrs6lYPiJDTcv2e8ZqTdbqR9JS6KopvJQzf31MfGZENZB6MqEjH92FQMtjl3
> Psx6PUhZlsOXBQkcexh4AYalolSYdgQU4lBTABEBAAGJAR8EGAECAAkFAlKEwSUC
> GwwACgkQO1cp63Osh8eQNwf+OTc1mOBCFUhdlMK1JCDFsBdFPmPICy3e/ZKSXgZu
> Ti9ywcIJrAmyjx6TPXLzoSB6VH+Qouq+dYlYCnm9rn2ljl8Ek0q0lCDAJKrVfIjy
> zErWLwkSFBaAg2BrmiQnDxrKV1ba1eubf8WJz7fDh9RX0NZwBjz+8BHoOiCz2iBD
> onFBrt0/v9D/aIiiTOSzKTNnipmPKldDVsseh02F3jTogUXcDoPFKD6terrF5mgD
> SHa5uGDy9MixlsVxptUTOyonFt8UKU6XCBvFCGUc4o6kT1IOPybqNxa/+b0LpEE0
> x6KyVLpc5VDkkhby/MI/lEnt7qPEct37NYBbaSf8348gKQ==
> =L0yr
> -----END PGP PUBLIC KEY BLOCK-----
>
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

