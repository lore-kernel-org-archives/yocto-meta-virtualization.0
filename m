Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f51.google.com (mail-la0-f51.google.com
	[209.85.215.51])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 375C4E006C4
	for <meta-virtualization@yoctoproject.org>;
	Fri,  7 Feb 2014 14:23:57 -0800 (PST)
Received: by mail-la0-f51.google.com with SMTP id c6so3085311lan.24
	for <meta-virtualization@yoctoproject.org>;
	Fri, 07 Feb 2014 14:23:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=uXyc3TTy0TSCrpVaEk4Z39ccWRW1XZdvO2BHTyTbi3Q=;
	b=EVTX5Z7f8wQEMeUyEFlckIEh8exIs5SidpYtTPGsLYQ+QOpoLvrBM/r4mplHcyZPTq
	+3Y+/7qLtjH7hIodN/3z3W18d7BeWMle8sJTIHx0PJZdtKwdSnzCh6HvfXV6WOmTTgMz
	+DSZQ5HXbv1kSdCjepGtFvJmTcXBJ1KrxYrICqetT9yKX0se6Z4YGCWrRJQGobeJO5xD
	W5yMD/y4gyip+o46Fri38HtXxfa/a7mELUNkEw276FrabkH41Lf66YDuOZ/rGYacMJgK
	K5yyuLmb9FY+TBkENwGwafOO8t0LBnq91+5El4DFahhsGJQjVZB4A8yDCa2K0Lc9tNuM
	Uc/Q==
MIME-Version: 1.0
X-Received: by 10.112.137.65 with SMTP id qg1mr11173586lbb.7.1391811835925;
	Fri, 07 Feb 2014 14:23:55 -0800 (PST)
Received: by 10.112.170.166 with HTTP; Fri, 7 Feb 2014 14:23:55 -0800 (PST)
In-Reply-To: <3180433.Kj0SDgXkey@peggleto-mobl5.ger.corp.intel.com>
References: <1391807253-1423-1-git-send-email-mark.asselstine@windriver.com>
	<3180433.Kj0SDgXkey@peggleto-mobl5.ger.corp.intel.com>
Date: Fri, 7 Feb 2014 17:23:55 -0500
Message-ID: <CADkTA4M0DxX8yMT8LYxOo+_QpPq0Pxb9PZoH=9ZFYX8ApjC8nA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Mark Asselstine <mark.asselstine@windriver.com>,
	"meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [[meta-openstack][PATCH] python-dogpile: core: update SRC_URI* sums
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
X-List-Received-Date: Fri, 07 Feb 2014 22:24:02 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Feb 7, 2014 at 5:03 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> Hi Mark,
>
> On Friday 07 February 2014 16:07:33 Mark Asselstine wrote:
>> Attempting to build openstack-image-controller I was getting
>>
>>   'Fetcher failure ... /dogpile.core-0.4.1.tar.gz'. Checksum mismatch!
>>
>> Update the sums to match the expected values.
>
> So one of three things happened here:
>
> 1) The checksum was never right in the first place
>
> 2) The file upstream has changed "legitimately" (annoying, but sometimes
> happens)
>
> 3) The file upstream has been tampered with
>
> Are you sure it's not #3?

Agreed, we should look closer. I can assure that when I added the support, the
checksum matched what's in the recipe:

[/home/bruc.../downloads]> ls -alF | grep -w dogpile.core-0.4.1.tar.gz
-rw-r--r--  1 bruce users     99534 Jan 19  2013 dogpile.core-0.4.1.tar.gz
-rw-r--r--  1 bruce users         0 Feb  5 16:56 dogpile.core-0.4.1.tar.gz.done
[/home/bruc.../downloads]> md5sum dogpile.core-0.4.1.tar.gz
5f76cce023d505a5375b07e094c3260f  dogpile.core-0.4.1.tar.gz

So it's either #2 or #3.

Bruce

>
> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

