Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EC6FFE00BAF; Fri, 12 Apr 2019 07:54:46 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.208.195 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C6F95E00A84
	for <meta-virtualization@yoctoproject.org>;
	Fri, 12 Apr 2019 07:54:44 -0700 (PDT)
Received: by mail-lj1-f195.google.com with SMTP id v22so9131641lje.9
	for <meta-virtualization@yoctoproject.org>;
	Fri, 12 Apr 2019 07:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=64nPJf+iHsDsaxa6WQO5f6SiVIQ6jdRDs+DNKl7Owlg=;
	b=TW5vsBIlCpih4+MZ5zrqelo9QlymJK/ONO4E7S8gg34SMqDXpXX891MO3mKIQxyCJz
	kxuIHQbQchklspWxInyiaGoTeGY40sVhSXZY9E1EhG52rFwP00OMGKLBNxLyqlRGuzXb
	P+OXgZBhE+qsb29+sdWi3Oak+WrpplENbXklZslvtjaviLv0w6jIofZnryP42h9N4XBL
	MMxCQBb4EyZhlE8JPj9CUGXYWuN/bbbjKdydC+ckA6JjRDktOpbWfqq76dtE8jivdhRR
	UrcXzSsIqgdLofITtQ/+mdjp7AIzA0FVHXSLvbmT8uiPOR4cpQf3VDqu1kfcCgTB5WKA
	3KsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=64nPJf+iHsDsaxa6WQO5f6SiVIQ6jdRDs+DNKl7Owlg=;
	b=JplHmq444cjP5mZA0mDvxFKXAYLYK8QDyYFrpfy/CcWcxjT8Q4yKza+K0YgEVDLa87
	gVSzXOzCFnFBHVL0nbI7DsosAZJ28tKYC/G5HGqwX+TSXGoXnFOj6exnv+kfKpzpxZTL
	8PrSWVAYt5Q+sywOwfL477oHJYnTE+21ZTs0rmBX8CKySMPJDRzUJV+hOtXS2m7FJE79
	tTG7s9fGcwgSurBYdC2gRYm+NUJW8G+i+JdYb1Ddkj13/8j0fnCLS6JiK5h3DdyeA5O0
	Duv3rw533FpTscQObjeF8rMFGPsyYqlKxRxfFYxTrbD3fDMrQaSlTPsy8Vkn8kBc67dY
	3eTQ==
X-Gm-Message-State: APjAAAX8frNC5SPHAfBoXC7vR9VjjACQVHvIWsO7CoPE+qnUC72Ykk8b
	VxK/3+PfdCfuZ5yiHKcF04DOb1HQCL+XdnrCwHhLNmqj
X-Google-Smtp-Source: APXvYqxfLAwbVYL8umq6aJi/r7cp05PpdCcMNdkK43iiFaL5FQNy1+RwEoQ70g0F1OYyXwU9HRfXrP4ztfuP18CPQug=
X-Received: by 2002:a2e:2a03:: with SMTP id q3mr30485750ljq.56.1555080883933; 
	Fri, 12 Apr 2019 07:54:43 -0700 (PDT)
MIME-Version: 1.0
References: <AM6PR08MB36060562D712E3220B157DDA8F500@AM6PR08MB3606.eurprd08.prod.outlook.com>
	<CADkTA4NirbuwMTw-ZpuSqz548qbUMZu-3rqw0Uk6Z8w2kRqQeA@mail.gmail.com>
	<CF877014-38CB-405B-9DCB-99E957BA0339@arm.com>
	<CADkTA4MwZoAEpNpm2bLtziN=vUrWCWMkkDJawxm9Zcr4Z6nXDQ@mail.gmail.com>
	<BYAPR02MB600588C5E1DE4A6768FC9298B92E0@BYAPR02MB6005.namprd02.prod.outlook.com>
In-Reply-To: <BYAPR02MB600588C5E1DE4A6768FC9298B92E0@BYAPR02MB6005.namprd02.prod.outlook.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 12 Apr 2019 10:54:32 -0400
Message-ID: <CADkTA4N_VzHT8NCKi2WoNKfMevq_rgsEnxrZSAurW+KaagKeyA@mail.gmail.com>
To: Manjukumar Harthikote Matha <MANJUKUM@xilinx.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>, nd <nd@arm.com>
Subject: Re: Issues with 50cdecc sysvinit-inittab_xen.inc: fix hypervisor console
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
X-List-Received-Date: Fri, 12 Apr 2019 14:54:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 10, 2019 at 1:06 AM Manjukumar Harthikote Matha
<MANJUKUM@xilinx.com> wrote:
>
> Hi Bruce,
>
> > -----Original Message-----
> > From: Bruce Ashfield [mailto:bruce.ashfield@gmail.com]
> > Sent: Monday, April 8, 2019 4:34 AM
> > To: Sathees Balya <Sathees.Balya@arm.com>
> > Cc: Filipe Rinaldi <Filipe.Rinaldi@arm.com>; meta-
> > virtualization@yoctoproject.org; Manjukumar Harthikote Matha
> > <MANJUKUM@xilinx.com>; nd <nd@arm.com>
> > Subject: Re: [meta-virtualization] Issues with 50cdecc sysvinit-inittab=
_xen.inc: fix
> > hypervisor console
> >
> > On Mon, Apr 8, 2019 at 7:26 AM Sathees Balya <Sathees.Balya@arm.com>
> > wrote:
> > >
> > > Hi Bruce,
> > >
> > > We reverted the commit "50cdecca7b2a0e1bb5eacbec132f26b802f950fc" and
> > the console starts as expected. Thanks.
> > >
>
> We should revert this commit, and we can update the patch later after tes=
ting it out on different cases.

ok, I can do that. As long as you are ok with your issue popping back up!

I've pushed the revert.

Bruce

>
> Thanks,
> Manju
>
> >
> > We had already established that without the commit things start, they w=
ere
> > starting before we made that change. It was for fixing a different issu=
e and for
> > standardizing on the use of the variable.
> >
> > I'm trying to find out if we change the startup check, if the console s=
till works.
> >
> > Bruce
> >
> > >
> > > Regards,
> > > Sathees
> > >
> > > =EF=BB=BFOn 08/04/2019, 04:12, "Bruce Ashfield" <bruce.ashfield@gmail=
.com> wrote:
> > >
> > >     On Thu, Apr 4, 2019 at 4:11 PM Filipe Rinaldi <Filipe.Rinaldi@arm=
.com>
> > wrote:
> > >     >
> > >     > Hi,
> > >     >
> > >     >
> > >     > With regards commit "50cdecc sysvinit-inittab_xen.inc: fix hype=
rvisor
> > console"...
> > >     >
> > >     >
> > >     > We are having issues with this patch. When using start_getty (a=
 wrapper to
> > getty) it will first check if the console device is a "serial" device d=
river [1]. It then
> > fails because hvc0 is a "system" device, not a "serial" [2].
> > >     >
> > >     >
> > >     > [1] https://github.com/openembedded/openembedded-
> > core/blob/master/meta/recipes-core/sysvinit/sysvinit-inittab/start_gett=
y#L11
> > >     >
> > >     > [2]
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/drivers/tt
> > y/hvc/hvc_console.c#n1036
> > >     >
> > >     >
> > >     > Any thoughts?
> > >
> > >     Can you confirm that if that check is removed that the console st=
ill
> > >     functions as expected ?
> > >
> > >     Rather than bouncing back and forth between fixing one issue, and
> > >     creating another, I'm tempted to just bbappend and patch the
> > >     problematic check out of the startup. But I'm not currently setup=
 to
> > >     test the issue.
> > >
> > >     Bruce
> > >
> > >     >
> > >     >
> > >     > Cheers,
> > >     >
> > >     > Filipe
> > >     >
> > >     >
> > >     > IMPORTANT NOTICE: The contents of this email and any attachment=
s are
> > confidential and may also be privileged. If you are not the intended re=
cipient,
> > please notify the sender immediately and do not disclose the contents t=
o any
> > other person, use it for any purpose, or store or copy the information =
in any
> > medium. Thank you.
> > >     > --
> > >     > _______________________________________________
> > >     > meta-virtualization mailing list
> > >     > meta-virtualization@yoctoproject.org
> > >     > https://lists.yoctoproject.org/listinfo/meta-virtualization
> > >
> > >
> > >
> > >     --
> > >     - Thou shalt not follow the NULL pointer, for chaos and madness a=
wait
> > >     thee at its end
> > >     - "Use the force Harry" - Gandalf, Star Trek II
> > >
> > >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await t=
hee at
> > its end
> > - "Use the force Harry" - Gandalf, Star Trek II



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

