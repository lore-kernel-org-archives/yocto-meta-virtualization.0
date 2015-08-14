Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C3349E00A3C; Thu, 13 Aug 2015 20:43:30 -0700 (PDT)
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
	*      [209.85.160.170 listed in list.dnswl.org]
Received: from mail-yk0-f170.google.com (mail-yk0-f170.google.com
	[209.85.160.170])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4E0C8E00767
	for <meta-virtualization@yoctoproject.org>;
	Thu, 13 Aug 2015 20:43:28 -0700 (PDT)
Received: by ykek5 with SMTP id k5so7166945yke.2
	for <meta-virtualization@yoctoproject.org>;
	Thu, 13 Aug 2015 20:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=y8BYFhcsnF2znWDPUCZWS/G74k5z460VGIwZZFRDji4=;
	b=WXFz95Xa/7xzqsAaPf65TrHfRpetTuVAxBvckkMDJBRBX+wFDn0uNT/GxbMQ2eLV3U
	U+W+LDHZZtdrJa2saAaopn9efeMJxKy1L2oXaJq0lXapOjH4Fw9l3z6t3tGJbkgqo4hX
	zUMFthqbBqEYYh/i7u9mSYnHT/djfxweQJ4CZFhI+61d16q1p/+/2N9IMAOBWOgCla6j
	eqaIRxI6l5z3/G8jPdYsIDY4gQqi/+m3VEq8Uj4ZT24cVMN0HMBtkoxl+VKxr51w/elz
	GkTJ4kQUaVeCdq1jH75uEcVd4DHTOdXgJrFqQY5AhNmpKmAA7iN2LScrYUGQMFkZ6L5I
	Ku0w==
MIME-Version: 1.0
X-Received: by 10.129.130.69 with SMTP id s66mr42612150ywf.62.1439523808573;
	Thu, 13 Aug 2015 20:43:28 -0700 (PDT)
Received: by 10.13.216.216 with HTTP; Thu, 13 Aug 2015 20:43:28 -0700 (PDT)
In-Reply-To: <1439408879-8203-1-git-send-email-mark.asselstine@windriver.com>
References: <1439408879-8203-1-git-send-email-mark.asselstine@windriver.com>
Date: Thu, 13 Aug 2015 23:43:28 -0400
Message-ID: <CADkTA4MfnLOO9LH8ye=sQjFJB5twyA48j0=JD7ZwFXy26+APRg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [m-c-s][PATCH 00/3] Get keystone, glance and nova running
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
X-List-Received-Date: Fri, 14 Aug 2015 03:43:30 -0000
Content-Type: text/plain; charset=UTF-8

merged to master.

Bruce

On Wed, Aug 12, 2015 at 3:47 PM, Mark Asselstine
<mark.asselstine@windriver.com> wrote:
> I am continuing work to get 'master' functional again. That is we
> should be able to perform the steps in README.setup to prep and spin
> up and instance of the cirros image. With the commits in this series I
> have managed to restore some functionality to keystone, glance and
> nova.
>
> I am now able to execute 'keystone tenant-list', 'glance image-list'
> and many other commands without error.
>
> I will continue to work towards the goal of getting the basic
> openstack usecases running again so expect further commits or series
> of commits in the coming days. As usual some of these changes might
> apply to other branches, for now my focus is on master.
>
> Mark
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

