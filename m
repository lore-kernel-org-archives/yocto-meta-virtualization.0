Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 606CEE006C6; Mon, 30 Jun 2014 21:37:49 -0700 (PDT)
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
	*      [209.85.217.176 listed in list.dnswl.org]
Received: from mail-lb0-f176.google.com (mail-lb0-f176.google.com
	[209.85.217.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E1E02E0053A
	for <meta-virtualization@yoctoproject.org>;
	Mon, 30 Jun 2014 21:37:42 -0700 (PDT)
Received: by mail-lb0-f176.google.com with SMTP id w7so6408742lbi.7
	for <meta-virtualization@yoctoproject.org>;
	Mon, 30 Jun 2014 21:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=bExKroT5/kajMTQ+3tP6bp96qrsI/0WQQSCCa2emZLg=;
	b=sr21E6QzGVHufUTQ5INMEpZ1WwVKL73SJYLjhyX1Wh67bDsfNuw5/1Tr6+VRCHhqBK
	+8DXfzr3f50HMWBfytONiObXmc/6orpleYp3X055dOW4C5iF4KN7coZwpXABGDtghgGa
	8XbbgKDLL1Lm0JF1VgJBPtK6qR76XfMTEh5jI1YTHeOdboCAf1U2PgXIs7jRQxY7xnUs
	Xr1W3UIdLrgwDa+FmZE4zZf4rT3DOYxUzn0cnBr+bfAjaB0/YJnFEEdDQQhX02ZK2Qw5
	Jb0upFkZ/T8QvtML+8I193MoLIeVfg4MkaLV53uhVVXbIQ7jndmACU6B3fuZplgCJCBW
	dSfg==
MIME-Version: 1.0
X-Received: by 10.112.173.201 with SMTP id bm9mr32051382lbc.16.1404189461896; 
	Mon, 30 Jun 2014 21:37:41 -0700 (PDT)
Received: by 10.112.124.137 with HTTP; Mon, 30 Jun 2014 21:37:41 -0700 (PDT)
In-Reply-To: <53B1CEA8.2020107@mvista.com>
References: <53B1CEA8.2020107@mvista.com>
Date: Tue, 1 Jul 2014 00:37:41 -0400
Message-ID: <CADkTA4MJ35jxX9CkZPs1oYz0LwEb=NWjO=JiMymsVCRxFs81KA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: akuster <akuster@mvista.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: meta-cloud-services
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
X-List-Received-Date: Tue, 01 Jul 2014 04:37:49 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jun 30, 2014 at 4:55 PM, akuster <akuster@mvista.com> wrote:
>
> Hello Bruce,
>
> 1) what is the purpose of 'recipes-dangling'?

They are bbappends for different versions of oe-core/meta-networking, etc, that
I know are in use. I carry them in meta-cloud-services versus forcing all those
other projects to keep them locally.

>
> 2) I notice several "WARNING: Use of PRINC 1 was detected in the recipe" in
> the meta-cloud-services, is anyone working on correcting those? if not, I
> can submit patches.

I already have patches for these, at the moment, I'm tolerating the warnings
until some base layers are updated.

>
> 3) I also noticed several "WARNING: No recipes available for.." in this
> layer as well. If no one is working on patches for these, I will send fixes
> as well. I believe these fixes might be the 'wild card' if applicable.

No patches for these, and no wildcards at the moment. I use the branches
branch for many different versions of oe-core, hence why I'm still leaving
these around.

In the next six months, I'll retire the non-wildcard appends, dangling appends
and other cruft, but for now they stay.

Cheers,

Bruce

>
> kind regards,
> Armin
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

