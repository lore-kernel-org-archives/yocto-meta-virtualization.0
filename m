Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 18B6BE00A4C; Sun, 22 Jul 2018 20:13:29 -0700 (PDT)
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
	*      [209.85.208.196 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 09AD7E00874
	for <meta-virtualization@yoctoproject.org>;
	Sun, 22 Jul 2018 20:13:27 -0700 (PDT)
Received: by mail-lj1-f196.google.com with SMTP id 203-v6so15537999ljj.13
	for <meta-virtualization@yoctoproject.org>;
	Sun, 22 Jul 2018 20:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=BLGv91UlLnS5PxPtfOf4cjpGTpHYh6hrINBiItMEzBg=;
	b=qTVwzk+ANsKmlfO5JDSpjFgnMF1/ZFuHxe9dlfD6LEeAk5wYD5K10fNuh9iRkTazD0
	2KCB4iOExo0x/KLyd/s9naRQ5mmCgu4pwveTMaITKTxunESgqjQMabIthqbXwV2VwgMp
	NjkzM7UM8vse7FJf2HuYa+W3OA+06Sbi/xF2mAds6Cf6FtTiAGXMuJ+vaTUfKFUmuwnG
	sXEMMf85+33O1bVED4VI0LjHGnPVFktinJGQY9wIXzFqnACTafsbsVaySwNNN6ZN/jL/
	tZbjbREAXhWQWmr7m0eq3D+udET3C9H52ZvpELdciY4CfUFRZdRNoALjFxdLA35U62bY
	5e8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BLGv91UlLnS5PxPtfOf4cjpGTpHYh6hrINBiItMEzBg=;
	b=TPRbiE7Ajnl0VyAiwZrmiB35pxijP/ntfgOoimzt0GiZ/nyTyLHE5ljrgYMRw97RHP
	bHHcWNfCDqBSvjehLLTpGKi0pXhy2QAyEyh2zA2saSpZWqfKFcARuk4emVcspyVjftf7
	jzH9K9AyL0DLpe20gFJyO+U8uG4sPqLyfWxMU+T17FxIDXWn9/rn1RAy3cSQ2lton9KB
	VzzyzewBLnyzVW632tsY5lPHZ4HkFEkTzt5TVwEksJNlkti4xz2O2Twd38960lkKUCZi
	rct30kKvUw8jyJuLUT+4gzM94AikgJIfqJ+ASELT5BnUDdg5jQUNMv8xgXQzNgm65hiI
	hLlg==
X-Gm-Message-State: AOUpUlHG125rB5U5oqFFH3DKuo8dfDmQJwsDF4zU9cgOLYJ7g+ExQ0xV
	ePvssUwU7SsztQIJxaYQJ7wvCEY7yozutKmCWP8=
X-Google-Smtp-Source: AAOMgpdeWTNTR66CtjapmFQFXO4hFz/hDUYlqMQnTM9mMPMbyvLUS/3w0wMx7VRmarXCoItnI8PJXz7UHUqBVJL0E64=
X-Received: by 2002:a2e:2d2:: with SMTP id
	y79-v6mr7157472lje.100.1532315606700; 
	Sun, 22 Jul 2018 20:13:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:9acd:0:0:0:0:0 with HTTP; Sun, 22 Jul 2018 20:13:26
	-0700 (PDT)
In-Reply-To: <CACMJ4GbRicDU5iMyLyYN8QrzbYTvZq-+R4uDAMsDREzxU3VcmA@mail.gmail.com>
References: <1531951428-28983-1-git-send-email-christopher.w.clark@gmail.com>
	<CACMJ4GbRicDU5iMyLyYN8QrzbYTvZq-+R4uDAMsDREzxU3VcmA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 22 Jul 2018 23:13:26 -0400
Message-ID: <CADkTA4OTWriB2wZ-NzFPa1b1mfs0_-g4SVoFpszfQHr0NVkwuQ@mail.gmail.com>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: meta-virtualization@yoctoproject.org, Doug Goldstein <cardoe@gentoo.org>
Subject: Re: [PATCH 0/7] Xen: upgrade to 4.11.0
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
X-List-Received-Date: Mon, 23 Jul 2018 03:13:29 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 20, 2018 at 8:25 PM, Christopher Clark
<christopher.w.clark@gmail.com> wrote:
>
>
> On Wed, Jul 18, 2018 at 3:03 PM, <christopher.w.clark@gmail.com> wrote:
>>
>> From: Christopher Clark <christopher.w.clark@gmail.com>
>>
>> This patch series:
>> * Fixes Xen recipe compatibility with gcc 8.1
>> * Adds the Xen recipe for Xen's current version: 4.11.0
>> * Upgrades the existing Xen recipe from 4.10.0 to 4.10.1
>>     - provided to ease backport to older branches (eg. sumo)
>> * Removes the 4.10.1 and 4.9.1 recipes
>>     - superceded by version 4.11.0
>> * Upgrades the vtpm stubdomains to Xen version 4.11.0
>> * Applies a bug fix patch to the tpm emulator
>> * Fixes whitespace patch fuzz on a vtpm patch
>>
>> Christopher Clark (7):
>>   xen: upgrade to 4.10.1, and apply patches for gcc 8.1 compatibility
>>   xen: add recipe for 4.11.0
>>   tpm-emulator: apply patch to fix memcmp defect found by gcc
>>   xen-vtpm,mini-os : upgrade to Xen 4.11.0
>>   xen-vtpm : fix patch fuzz, whitespace-only change
>>   xen: remove 4.9.1 recipe and patches
>>   xen: remove 4.10.1 recipe and patches
>>
>
> Please hold off on merging this series for now as I'm intending to send a
> slightly updated version of it (should be next week).

Sounds good.

I was letting it sit on the list for comments, so now I'll wait for
the next revision instead!

Cheers,

Bruce

>
> Christopher
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

