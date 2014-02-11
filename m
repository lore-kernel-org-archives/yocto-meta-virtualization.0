Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f177.google.com (mail-lb0-f177.google.com
	[209.85.217.177])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 18CDFE00799
	for <meta-virtualization@yoctoproject.org>;
	Tue, 11 Feb 2014 12:47:11 -0800 (PST)
Received: by mail-lb0-f177.google.com with SMTP id 10so4856086lbg.36
	for <meta-virtualization@yoctoproject.org>;
	Tue, 11 Feb 2014 12:47:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=EBIZe41UonFr0M8F6tzfjxwOjo5dXmd+uONqqRMJR24=;
	b=q52pEFzDUBc3d5Z3tpSJ4Yj3cnRAGSmuI3jsuD0CiqwyC08Bzl5N0w/QBHn0gzLVmq
	mTuvod0wfUbkegLD2SlF191NfHSwC+XH2WTK8P2/Dg1ReOqY8O9ii2hwOT7qRzjKtJFC
	ivZGVPpvN+WZ7uJc5hxdBy6mmhPDgU1hXsjLdBuHN4fc/cTqUIaX9kM/j9V/SeR78a2s
	YQPoRbkbXA5dbtagXw4P1wRoi9MlBZblhNlY0fXPU4AgVUinnJnibyJKLyUY0POZfhy/
	5JPlUCyXiKrcnCtd6n0mbRH/V/eJRBAb4QJn+OIUszjRX8GcnlCbW+yTfkZ2Uu6BxJCy
	R13g==
MIME-Version: 1.0
X-Received: by 10.112.66.168 with SMTP id g8mr23037lbt.91.1392151630270; Tue,
	11 Feb 2014 12:47:10 -0800 (PST)
Received: by 10.112.170.166 with HTTP; Tue, 11 Feb 2014 12:47:10 -0800 (PST)
In-Reply-To: <52F901A6.2000308@twobit.us>
References: <1391996719-14419-1-git-send-email-flihp@twobit.us>
	<1391996719-14419-3-git-send-email-flihp@twobit.us>
	<CABZSBQdqreuLav6Wq=6BjgdWsOr+0ezi6EV3_gi3adPLDBi6uw@mail.gmail.com>
	<52F901A6.2000308@twobit.us>
Date: Tue, 11 Feb 2014 15:47:10 -0500
Message-ID: <CADkTA4PirANHePU-vTkq04YcFvhNquaYN=PGbWUv2vjJhBLoaQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Philip Tricca <flihp@twobit.us>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 2/2] xen: Add RDEPENDS block for xendomains script.
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
X-List-Received-Date: Tue, 11 Feb 2014 20:47:18 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Feb 10, 2014 at 11:43 AM, Philip Tricca <flihp@twobit.us> wrote:
> Your guess is as good as mine. I've not had to dive into xl code. I'm
> just going on observed behavior right now. I spent a bunch of time just
> tracking down the 'dependency' as it seems to be quite unrelated.
>
> The hang only seems to be triggered when invoking 'xl create' in a
> subshell from the xendomains script. Just breaking this call out of the
> subshell gets everything back on track. I'm satisfied to write this off
> as a mystery for the time being. It moves the recipe forward with some
> better granularity in the runtime dependencies which was my main goal.
>
> Incremental progress is good right? :P

I'd agree with this .. and I took this discussion as not being an objection, so
went ahead and merged the patch.

Bruce

>
> Philip
>
> On 02/09/2014 09:57 PM, Chris Patterson wrote:
>> Perhaps something to do with udev rules (which may invoke the block
>> scripts)?
>>
>>
>> On Sun, Feb 9, 2014 at 8:45 PM, Philip Tricca <flihp@twobit.us
>> <mailto:flihp@twobit.us>> wrote:
>>
>>     I can't explain the dependency on xen-scripts-block as the xendomains
>>     script doesn't invoke any of these scripts directly. Still xendomains
>>     hangs indefinitely without them.
>>
>>     Signed-off-by: Philip Tricca <flihp@twobit.us <mailto:flihp@twobit.us>>
>>
>>     diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
>>     index bd2fc74..4c27497 100644
>>     --- a/recipes-extended/xen/xen.inc
>>     +++ b/recipes-extended/xen/xen.inc
>>     @@ -70,6 +70,13 @@ RDEPENDS_${PN}-xencommons = "\
>>          ${PN}-scripts-common \
>>          "
>>
>>     +RDEPENDS_${PN}-xendomains = "\
>>     +    ${PN}-console \
>>     +    ${PN}-scripts-block \
>>     +    ${PN}-scripts-common \
>>     +    ${PN}-xenstored \
>>     +    "
>>     +
>>      RDEPENDS_${PN}-xl = "libgcc"
>>
>>      PACKAGES = "\
>>     --
>>     1.7.10.4
>>
>>
>
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

