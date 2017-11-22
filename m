Return-Path: <christopher.w.clark@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 34591E00D73; Wed, 22 Nov 2017 11:42:39 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (christopher.w.clark[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.220.195 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D6612E00D95
	for <meta-virtualization@yoctoproject.org>;
	Wed, 22 Nov 2017 11:42:36 -0800 (PST)
Received: by mail-qk0-f195.google.com with SMTP id f63so18264386qke.8
	for <meta-virtualization@yoctoproject.org>;
	Wed, 22 Nov 2017 11:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=yK6v5WuVFGWv+SZS4C/sCAWKyZIoICwGCayII83gBqY=;
	b=AHZMKvoqn47HPThNZCM4hRY3FJV/XkAJ9Kdz++ZPFZP+BaChpjl3RruqCZDknFlExq
	ksjyquHLk54XYbiPPPlWLOqsxVYtUT1hOlRKl0C7HVYqld4CfTEXJ+4MUUaLMFmXBoBj
	QB0xkz7zpFgWe+TjLfx0ET+PYE07UTSPua546q8elLUolDewqh8WLa4rWanEInMpw25G
	3REnMAzUnEyQEiajqO3sAT3D2tWcDLteEtzGPXMXhBbqdvr5Xk9P9PLGnLeExB42XZ0B
	lveoVupI6JvpXKf3JqJHfFM85yLRvjb7yzDAY/03rZsiY5RbOhIcm2uO+yG61yKbh0Hd
	fnQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=yK6v5WuVFGWv+SZS4C/sCAWKyZIoICwGCayII83gBqY=;
	b=kLwSIGuqoGDHlFYlwkzPF9LXOCOepmnkwPasiWGx7eRHi/ZUZBW2SAKTa64mj3I2Jn
	2FAyxAz89FCSCPLNDs92LgzWo9g8hPw9VROseKBr8olJ2ZG+L/GVx/letW7FUTpPRvCF
	nu9aUb8lMEymHjoqkeA7sBzDY/1uk1bH+4pC6WqEhRyK5aHz7Tv4CfR6bJ+2AY0SOYJO
	Oz1x3Yq4sdFvc50ke25AJKXRtqrgfkNoPcy99RaqOUlY2+UzuerDOTKdsWGHtdXc8DlV
	ID2xjVgiAe+Mav96AU4XZ3G6WMfNmDUJjqC92dlumVANne4cx98IyhGzc0isPHTYs/hP
	t1Xg==
X-Gm-Message-State: AJaThX6tKvwxPOXbC6Af19H91ZfoTiwxIqOajFG7HoiHuCcBSRSm8Rap
	V1M2m0/9BI9N69eNdr6NKIw2PykkVZDvH5A13v1uMw==
X-Google-Smtp-Source: AGs4zMa/sf04Pe6lZugQxLsoUzS9zmcwBawJRHADHtIlHEujvmBzcKQ491bZ5C6AROPk775HHNwF2N/d4kazKU1H878=
X-Received: by 10.55.130.3 with SMTP id e3mr34043256qkd.248.1511379755982;
	Wed, 22 Nov 2017 11:42:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.86.169 with HTTP; Wed, 22 Nov 2017 11:42:35 -0800 (PST)
In-Reply-To: <CAKmqyKPs1j3Jty04wvCG_wyxHhhJyBSCxSObBzn-4kSuC+JwKw@mail.gmail.com>
References: <20171116224123.28383-1-alistair.francis@xilinx.com>
	<CADkTA4PjjqEU-wj7qJnEnn2B-WpGpVVTqU1c-wD3A-Z-uxjNzw@mail.gmail.com>
	<CACMJ4Gb+vO47iWNV9qiedWXuDSKjeo0t1NNUuuE+x+5eWSVPuw@mail.gmail.com>
	<CAKmqyKPs1j3Jty04wvCG_wyxHhhJyBSCxSObBzn-4kSuC+JwKw@mail.gmail.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Wed, 22 Nov 2017 11:42:35 -0800
Message-ID: <CACMJ4GbTNu1AfFJAmcakhZaWFEJzZU_XSBQSYj160P+hL0ThZg@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [RFC] xen: Enable compilation with external source
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
X-List-Received-Date: Wed, 22 Nov 2017 19:42:39 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 21, 2017 at 4:35 PM, Alistair Francis <alistair23@gmail.com> wrote:
> On Tue, Nov 21, 2017 at 12:53 PM, Christopher Clark
> <christopher.w.clark@gmail.com> wrote:
>> On Tue, Nov 21, 2017 at 12:07 PM, Bruce Ashfield
>> <bruce.ashfield@gmail.com> wrote:
>>>
>>> On Thu, Nov 16, 2017 at 5:41 PM, Alistair Francis
>>> <alistair.francis@xilinx.com> wrote:
>>>>
>>>> When building Xen from an external source the compile step fails as
>>>> there is no Makefile (or anything else) copied into the Yocto
>>>> build directories.
>>>
>>> When you say 'external source' are you talking about
>>> the oe-core "externalsrc" concept, or some Xen specific thing ?
>
> I'm talking about the OE external source, it's not a Xen specific thing.
>
>> There's a comment at the top of the externalsrc.bbclass file
>> that indicates that a second variable (EXTERNALSRC_BUILD_pn-myrecipe)
>> could be used to set the build directory to be the same as the source
>> directory -- does using that give the behaviour that you're looking
>> for, without needing this cp added to do_compile?
>
> Ah, that is what I needed. That at least allows me to build Xen, but I
> see all these weird QA issues now.
>
> WARNING: xen-4.9.0-r0 do_package: QA Issue: xen: Files/directories
> were installed but not shipped in any package:
>   /usr/lib/libxentoolcore.so.1.0
>   /usr/lib/libxentoolcore.so
>   /usr/lib/libxentoolcore.so.1
>   /usr/sbin/xen-diag
>   /usr/share/pkgconfig/xentoolcore.pc
> Please set FILES such that these items are packaged. Alternatively if
> they are unneeded, avoid installing them or delete them within
> do_install.

OK, these errors are just because the Xen tree that you're building
with is a Xen 4.10 RC, whereas the current meta-virtualization recipe
is written for Xen 4.9 and earlier.

Xen 4.10 introduces a new library: xentoolcore, which needs to be
packaged, so xen.inc needs some added statements. If you look at the
sections in xen.inc that handle "xentoollog", that looks similar to
what will be needed for xentoolcore. In addition to that, "xen-diag"
probably needs one line to add it to the -misc package, the same way
that "xenlockprof" is packaged in there.

Christopher

