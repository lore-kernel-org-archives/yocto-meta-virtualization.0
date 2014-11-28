Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BC23FE008EA; Thu, 27 Nov 2014 21:51:38 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.215.50 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-la0-f50.google.com (mail-la0-f50.google.com
	[209.85.215.50])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6784EE0082F
	for <meta-virtualization@yoctoproject.org>;
	Thu, 27 Nov 2014 21:51:27 -0800 (PST)
Received: by mail-la0-f50.google.com with SMTP id pn19so4310995lab.23
	for <meta-virtualization@yoctoproject.org>;
	Thu, 27 Nov 2014 21:51:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=1fD7Yy0pjCQHHCDezktqgws4K4Vnb2bUD1wp3fql6kM=;
	b=nQ4u+D6GM+N4zhdUMlr9p26VXavuZSXYQjrF9A/O8TX3hD5tieUehT5VQwI+qVe/wB
	p3AKmb04z54t+xfxRGT8NlDkJgyUfR9ovvVYVMnFxvGsbNV0urwRDcQdLOfcNOJIFkM0
	kgiyUUi7hmAR/ZQTyLNBbqIxcMXFDBufWV4sU7cJ8/RFmw8LFp0Mrl48tV9UjTe0VdfY
	3ERhoePiuf7QegBz/8tVlWw55mSZJXzF3QquCxu4sFH8THeX6RQ916XOG84xpgb7TL04
	yglvue0UWE3PK7NpbN45w257t+uchS5gAjf81Zms7P/M5LpvPUKPauk5IpMxZUBDVaVA
	WIDA==
MIME-Version: 1.0
X-Received: by 10.152.238.1 with SMTP id vg1mr1669348lac.83.1417153885801;
	Thu, 27 Nov 2014 21:51:25 -0800 (PST)
Received: by 10.112.48.41 with HTTP; Thu, 27 Nov 2014 21:51:25 -0800 (PST)
In-Reply-To: <CAAKB1h0TCe6QhooxDGhKPbKs6295fQ-1ZLFxYsBtv5YtQFc8xA@mail.gmail.com>
References: <CAAKB1h0TCe6QhooxDGhKPbKs6295fQ-1ZLFxYsBtv5YtQFc8xA@mail.gmail.com>
Date: Fri, 28 Nov 2014 00:51:25 -0500
Message-ID: <CADkTA4MVJkRUeLW-1tdxF03YjbNh-h0CBhh7X0WX7ooqA3EmLg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: David Nystrom <david.c.nystrom@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: Maintainers
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
X-List-Received-Date: Fri, 28 Nov 2014 05:51:38 -0000
Content-Type: text/plain; charset=UTF-8

Ack'd.

Thanks for everything you've done getting meta-virt bootstrapped and to the
state it is today.

I'll definitely shout for help if things get busy/heavy.

Did you want to send a patch to remove yourself ? Or do you want me to take
care of it ?

Bruce

On Thu, Nov 27, 2014 at 12:45 PM, David Nystrom
<david.c.nystrom@gmail.com> wrote:
> Hi,
>
> Since I've been a ghost on this project for quite some time, and I think
> it's well overdue to remove me from the list of maintainers.
> If you (Bruce) need offloading I think Joseph can be of assistance.
>
> Br,
> David
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

