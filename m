Return-Path: <christopher.w.clark@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1418EE00CA6; Wed, 23 Aug 2017 14:13:10 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (christopher.w.clark[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.161.195 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.161.195 listed in dnsbl.sorbs.net]
Received: from mail-yw0-f195.google.com (mail-yw0-f195.google.com
	[209.85.161.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D75ADE00C01
	for <meta-virtualization@yoctoproject.org>;
	Wed, 23 Aug 2017 14:13:07 -0700 (PDT)
Received: by mail-yw0-f195.google.com with SMTP id u133so464531ywc.0
	for <meta-virtualization@yoctoproject.org>;
	Wed, 23 Aug 2017 14:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=kwXVB+jzEuUw/aud59EZsiZVVmanTcQbEhLByYjLBtk=;
	b=Xsn7QRd+JHb1Qxn+Z8lfXWPmz8PPNJpCeIER7EUBDQ8gSOmiJdhwDP2CYslRtPJsaj
	ylvtM2TGsYmeF+ZrTca+T7zsCf4toORWdADP14JxbJjQ4FiwftooJiM68a7Oxu/lKzXa
	Gn4Ic4aT73r4bpNaiWoB0dtsvwQuZhrYRBh9XwtD2mZ5EFo1T0WaRI7ArXk7rB1Q5waI
	U+TFnH71qtiTxyuz31vFANBuFjGfgu7kHrcpOpA0yPH4pp4Nz8P6vX2JtG1mkb51atTX
	xzGHtV6LEsLLHOM6JRVi/aCv31XVVjmZH5UfwQrSWmDXEBuY2mpytwV9EkHtAI6ZXhaE
	hSmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=kwXVB+jzEuUw/aud59EZsiZVVmanTcQbEhLByYjLBtk=;
	b=IQk6+SvDvWmaacZQcYJGtwhyGCzQJZgTlwPuI9EENTONrZ8yeNhcmi6Qv9yl0gOS1N
	BA2MyDwr8NH6JWZi8UOrnc+m8keL/aBtiTLCP24Q3AqJvEnmNCZuN9nfDGuM01Wy4AEy
	PFL+qaVRrbfRaVWHCAv+03YNKfgsrZva31ceFuVgQJhAkWePv9+Q6RamtZ6y+/uEjjIC
	/Q6XVum8gDbZFSVzZSc2tGKznxT+IajVW3xQVpOhdfrRA46cgEkqApAKSP4/bAuzG7Xn
	n+Ep8PPiKibBRLkdjeXZbaFW9dfdJVxz2wJAXZtRyyR86GPCssukXtMsVUnqmyBbG7rx
	gWmw==
X-Gm-Message-State: AHYfb5jl7oFAdCWrmblzEarw/n0w0mIizHHShe4SY0iawHQbstA8LTHJ
	695tBZK57/Uwbsa7Z+kDgvKkC/rXbw==
X-Received: by 10.13.247.199 with SMTP id h190mr3312750ywf.352.1503522787061; 
	Wed, 23 Aug 2017 14:13:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.175.4 with HTTP; Wed, 23 Aug 2017 14:13:06 -0700 (PDT)
In-Reply-To: <CACMJ4GYuq01TGd3Py-Twhi4Hs5iWO9S85hsH9aVBU1WyuRap4w@mail.gmail.com>
References: <1503378503-23353-1-git-send-email-christopher.w.clark@gmail.com>
	<1503378503-23353-2-git-send-email-christopher.w.clark@gmail.com>
	<CADkTA4MGpGfw_-mByH=VyUeg1a6pfMugww4YkSS2PfxJ02e-tQ@mail.gmail.com>
	<CACMJ4GZumvFVR4FkJ9UO1b9SzL+fxwj4kcrGHsgayksOQcMngA@mail.gmail.com>
	<CADkTA4OOmrktgV+BHS=K2dEKUvJ_scO5mfk1nW5myNeS17VzLw@mail.gmail.com>
	<CACMJ4GYuq01TGd3Py-Twhi4Hs5iWO9S85hsH9aVBU1WyuRap4w@mail.gmail.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Wed, 23 Aug 2017 14:13:06 -0700
Message-ID: <CACMJ4Ga6aMP8=6B04TJ42S0nZTXkJ0b+aza4XaAMdXxEt4KN5w@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>, Doug Goldstein <cardoe@gentoo.org>
Subject: Re: [PATCH 1/4] vgabios : extract biossums tool and build it separately, native
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
X-List-Received-Date: Wed, 23 Aug 2017 21:13:10 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 23, 2017 at 1:18 PM, Christopher Clark
<christopher.w.clark@gmail.com> wrote:
> On Wed, Aug 23, 2017 at 5:54 AM, Bruce Ashfield
> <bruce.ashfield@gmail.com> wrote:
>>
>>
>> On Wed, Aug 23, 2017 at 2:43 AM, Christopher Clark
>> <christopher.w.clark@gmail.com> wrote:
>>>
>>> On Tue, Aug 22, 2017 at 7:42 PM, Bruce Ashfield
>>> <bruce.ashfield@gmail.com> wrote:
>>> > On Tue, Aug 22, 2017 at 1:08 AM, <christopher.w.clark@gmail.com> wrote:
>>> >> From: Christopher Clark <christopher.clark6@baesystems.com>
>>> >>
>>> >> The biossums tool is used to generate the vgabios build product.
>>> >>
>>> >> This patch:
>>> >> * adds a separate recipe "biossums" for the tool
>>> >> * makes the vgabios recipe depend upon biossums-native
>>> >> * makes the vgabios recipe use the native binary rather than a locally
>>> >> built one
>
>>> >> +
>>> >> +do_compile() {
>>> >> +    oe_runmake clean
>>> >
>>> >
>>> > What actually happens if the clean isn't run before each compile ?

I figured it out: a 32-bit biossums binary is distributed inside the
upstream source tarball, and make decides that it doesn't need to
rebuild it since the timestamp is newer than the source code file.

I think that makes the "clean" seem like a reasonable step to put
before compile.

Christopher

