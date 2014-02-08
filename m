Return-Path: <asselsm@gmail.com>
Received: from mail-ie0-f173.google.com (mail-ie0-f173.google.com
	[209.85.223.173])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1A3C2E00706
	for <meta-virtualization@yoctoproject.org>;
	Fri,  7 Feb 2014 19:25:09 -0800 (PST)
Received: by mail-ie0-f173.google.com with SMTP id e14so2265585iej.32
	for <meta-virtualization@yoctoproject.org>;
	Fri, 07 Feb 2014 19:25:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:reply-to:sender:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=H75zLTl081W21/wQEtUCycC2BBso4azTH9YI+C4wtgc=;
	b=ViJvpKmciaHFS7Gdcq9qb4fzwqMA/2YyV34RWFo1f0LvCek7GFsPfFfmfsRzCn5gis
	fqD9TIAj/LwMjOrYeNnqzUnQk7vO8Ht+w+lOl56tlhONvXEDlXN+cw8pOGx+pz9XnUY3
	inq+20ExcVN0hqO1LhjSdLSuEMg53sQpyvIVTNX2BSrJwgAyMBKRy+uRqv+8pa3+ynSZ
	SJGhAKXmOoUMXMFFVDJaVyZQmsJoEUD3qMYOVHcVq5CycULncOzo6iAE15bLr03YlUXT
	tXqdRYf0oSxzEJlwCgTeImtZuxFl3BdI4w9phK/X+dCoiIOfDEALfgvK03Gu3jaoul/S
	LviA==
MIME-Version: 1.0
X-Received: by 10.50.117.5 with SMTP id ka5mr3246517igb.3.1391829908774; Fri,
	07 Feb 2014 19:25:08 -0800 (PST)
Sender: asselsm@gmail.com
Received: by 10.43.178.134 with HTTP; Fri, 7 Feb 2014 19:25:08 -0800 (PST)
In-Reply-To: <CADkTA4M0DxX8yMT8LYxOo+_QpPq0Pxb9PZoH=9ZFYX8ApjC8nA@mail.gmail.com>
References: <1391807253-1423-1-git-send-email-mark.asselstine@windriver.com>
	<3180433.Kj0SDgXkey@peggleto-mobl5.ger.corp.intel.com>
	<CADkTA4M0DxX8yMT8LYxOo+_QpPq0Pxb9PZoH=9ZFYX8ApjC8nA@mail.gmail.com>
Date: Fri, 7 Feb 2014 22:25:08 -0500
X-Google-Sender-Auth: XRKP_gMtYlYyaYk70HnacwF9up8
Message-ID: <CAPuovEJkvHc8dU6Tcs0XHacZp7wfD57_GA9p2XRTQ8+pFt5Dog@mail.gmail.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [[meta-openstack][PATCH] python-dogpile: core: update SRC_URI* sums
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: mark.asselstine@windriver.com
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Sat, 08 Feb 2014 03:25:14 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Feb 7, 2014 at 5:23 PM, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> On Fri, Feb 7, 2014 at 5:03 PM, Paul Eggleton
> <paul.eggleton@linux.intel.com> wrote:
>> Hi Mark,
>>
>> On Friday 07 February 2014 16:07:33 Mark Asselstine wrote:
>>> Attempting to build openstack-image-controller I was getting
>>>
>>>   'Fetcher failure ... /dogpile.core-0.4.1.tar.gz'. Checksum mismatch!
>>>
>>> Update the sums to match the expected values.
>>
>> So one of three things happened here:
>>
>> 1) The checksum was never right in the first place
>>
>> 2) The file upstream has changed "legitimately" (annoying, but sometimes
>> happens)
>>
>> 3) The file upstream has been tampered with
>>
>> Are you sure it's not #3?
>
> Agreed, we should look closer. I can assure that when I added the support, the
> checksum matched what's in the recipe:
>
> [/home/bruc.../downloads]> ls -alF | grep -w dogpile.core-0.4.1.tar.gz
> -rw-r--r--  1 bruce users     99534 Jan 19  2013 dogpile.core-0.4.1.tar.gz
> -rw-r--r--  1 bruce users         0 Feb  5 16:56 dogpile.core-0.4.1.tar.gz.done
> [/home/bruc.../downloads]> md5sum dogpile.core-0.4.1.tar.gz
> 5f76cce023d505a5375b07e094c3260f  dogpile.core-0.4.1.tar.gz
>
> So it's either #2 or #3.

It's #2. I had looked quickly before sending the update but you are
right in that I should have looked more closely and included a note in
the commit log.

According to here:
https://pypi.python.org/pypi/dogpile.core

A new upload was provided on 2013-11-15. The md5sum matches what is
present on the page. Looking at the contents of the tarball there are
about 5 files modified on that date, all related to the Python Egg.

What I haven't been able to find is any mailing list, bug report etc.
describing what/why the change. The files modified in the tarball are
not part of the projects source repo, so no commit logs or other
breadcrumbs. Do we need anything more definitive than the webpage?

Bruce, do you want an updated commit log with some of this information captured?

Mark



>
> Bruce
>
>>
>> Cheers,
>> Paul
>>
>> --
>>
>> Paul Eggleton
>> Intel Open Source Technology Centre
>> _______________________________________________
>> meta-virtualization mailing list
>> meta-virtualization@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

