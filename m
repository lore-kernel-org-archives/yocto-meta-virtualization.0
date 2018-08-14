Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 797BDE009C2; Tue, 14 Aug 2018 10:03:02 -0700 (PDT)
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
	*      [209.85.167.65 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AD471E00519
	for <meta-virtualization@yoctoproject.org>;
	Tue, 14 Aug 2018 10:03:00 -0700 (PDT)
Received: by mail-lf1-f65.google.com with SMTP id f18-v6so14309216lfc.2
	for <meta-virtualization@yoctoproject.org>;
	Tue, 14 Aug 2018 10:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=gd/tyhPfx7HIgCpgWoNDd5G4rsrxhyJz9nZUAbHG08A=;
	b=QbQPSzSZkuA4o6BPyhRLEvB5TcuOiBNJy0p9g8QXTgl1caDkwPRu+PP11yoFkCMJzW
	e2q0cavXNwhsgp/Zduosyly0V+mYC/TuVcL5TruDPLzSO00BEqcsRpYeLEFTOJPtGlSO
	0VYamF1g4Bo5xfVHPWWZn2M7nfXQ7KrUwHP4Jv5KA6+78Nj3xj1HbTk/eqSDuuBM5xd5
	8MiuE0gELcmsb9NuKm8z6hbH5yGTIljt7lyhIL9FGdx01/UwWF7HnDDE6JSEnGhQ9zCp
	jst50B63N1YkJwU0E7FdtVdqjtqXXaorn9mvFJe5vKIGqKVnsV1Fx5uItdwWPV9rhduB
	tIuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=gd/tyhPfx7HIgCpgWoNDd5G4rsrxhyJz9nZUAbHG08A=;
	b=s9i18lEWR5gEBgP65COt4iLiEOmI0Vq7d5vlDpgDfVlJESXA2AHEjtKj9g0O245pKY
	tsIh2V8ncdxkaS3P0g0ydvutfqMvDRjITKqpvSIFaFY44VBTav2HNshWxiO/lUmoSiVU
	qs5h7UVodWD9s9Sy+CE1RFYAz/ICN/Go1Sp9k+pYUy6KekK5mKcC1aSn8rgNXXLKD9EG
	nvO2uGiwzrJgNnN3gtULsN0I8D4EgAxoOpKZ6doyE+vCqcsIeZhttmaAzgqjWgcCvuam
	PeskhnB8Dv4/ayO0Q9CQWMaJ5J5xHIFZJnY2IlyDqzGhwWNbczzL11Wq7IXC4ekx5dMX
	QaDA==
X-Gm-Message-State: AOUpUlGJ8EgcEQk2as6w+BRvNoeMezXSP/Yfkpg0vey7paTb2/KnJVHu
	YAVEBWMB1gVa0ISc8d8YZg5fj71vnIrLlC1Mhlc=
X-Google-Smtp-Source: AA+uWPzyoIC1YrpLCI9ZkmUkLdOGS7evLWlq8VJlJHTe3Ld9HQe9IbA/UERP8h+JXIqw1MuZ4zubcQn5VsBkp76TkH0=
X-Received: by 2002:a19:9481:: with SMTP id
	o1-v6mr15309550lfk.38.1534266179845; 
	Tue, 14 Aug 2018 10:02:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:9acd:0:0:0:0:0 with HTTP; Tue, 14 Aug 2018 10:02:59
	-0700 (PDT)
In-Reply-To: <CACMJ4GbzhGhOve-iY8gYGFNOwemuh0X88RwBS+Djw6h3YnZQBA@mail.gmail.com>
References: <1533065750-25786-1-git-send-email-christopher.w.clark@gmail.com>
	<CADkTA4MaDs7ondvm=qko7NdumuOb5OKo-xQ8MZnOXuYQUtopsA@mail.gmail.com>
	<CACMJ4GbzhGhOve-iY8gYGFNOwemuh0X88RwBS+Djw6h3YnZQBA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 14 Aug 2018 13:02:59 -0400
Message-ID: <CADkTA4OD2f++=eA2iQidxb1S_4_DQVjRUHqEkBFeH+TQbpB=yQ@mail.gmail.com>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: meta-virtualization@yoctoproject.org, Doug Goldstein <cardoe@gentoo.org>
Subject: Re: [PATCH v2 0/9] Xen: upgrade to 4.11.0
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
X-List-Received-Date: Tue, 14 Aug 2018 17:03:02 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 14, 2018 at 12:25 AM, Christopher Clark
<christopher.w.clark@gmail.com> wrote:
>
>
> On Thu, Aug 2, 2018 at 7:59 PM, Bruce Ashfield <bruce.ashfield@gmail.com>
> wrote:
>>
>> On Tue, Jul 31, 2018 at 4:35 PM,  <christopher.w.clark@gmail.com> wrote:
>> > From: Christopher Clark <christopher.w.clark@gmail.com>
>> >
>> > This patch series:
>> > * Fixes Xen recipe compatibility with gcc 8.1
>> > * Adds the Xen recipe for Xen's current version: 4.11.0
>> > * Upgrades the existing Xen recipe from 4.10.0 to 4.10.1
>> >     - provided to ease backport to older branches (eg. sumo)
>>
>> This looks sane to me, and the series is now merged to master.
>>
>> If it is indeed needed on other branches, or specific patches should
>> be backported, let me know.
>
>
> For sumo: these three should go in:
>
> commit 6160783cc05769784781ecac7e04dbd4a15ad8f0
>     xen-vtpm : fix patch fuzz, whitespace-only change
>
> commit f9650d8997505796883d0ef61bd8ad2a87c2b36e
>     tpm-emulator: apply patch to fix memcmp defect found by gcc
>
> commit 9955e81b23eb6bb264b32c5bb02b326097a4ec02
>     xen: upgrade to 4.10.1, and apply patches for gcc 8.1 compatibility

These have been cherry picked and pushed.

Bruce

>
> thanks
>
> Christopher
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

