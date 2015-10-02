Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 73E16E00D73; Fri,  2 Oct 2015 05:46:42 -0700 (PDT)
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
	*      [209.85.160.169 listed in list.dnswl.org]
Received: from mail-yk0-f169.google.com (mail-yk0-f169.google.com
	[209.85.160.169])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 36F6AE00AD9
	for <meta-virtualization@yoctoproject.org>;
	Fri,  2 Oct 2015 05:46:39 -0700 (PDT)
Received: by ykdg206 with SMTP id g206so107582131ykd.1
	for <meta-virtualization@yoctoproject.org>;
	Fri, 02 Oct 2015 05:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=fFhaT37ROuPIIL/PMn8RhYIggRuxzdR6W6bDwCXB9bw=;
	b=XaxxgTrM/i54cqaOOkP58toyemg/UXvTzYlPHf6M6MmUqhvmwpvw1QstHr94grXr7F
	W7hEOur5yOIcsxSRTJzwdN4cIPpspRn4BlwQifYNC1srwNA+OhrJwmSbVbCMLaSMwKsX
	f5gBNclPrwfwbe77b5Jj9dxjDDr4fbjnTVDrLCdW5FdfVZ2WDkCZR6dU6/KT0VBd9qPg
	eRHfzo6INXxXCZ2a3hXj86GvYhulQk7VE9ts9kUA9zrLGC8bfhEoeiya7iya3Oqf3PoQ
	tK3nnKOJ6ICn5JQ3z1S1rE4HKl6rLNkWHpgmrHPUmqmUw8j6flom2XYwKULTpPMNKgq9
	zxAQ==
MIME-Version: 1.0
X-Received: by 10.129.96.9 with SMTP id u9mr12495488ywb.13.1443789998850; Fri,
	02 Oct 2015 05:46:38 -0700 (PDT)
Received: by 10.13.217.201 with HTTP; Fri, 2 Oct 2015 05:46:38 -0700 (PDT)
In-Reply-To: <CAGMdoFnzx+hQyV1Gdd0CXAqbR7U7J_uhwcj3A3w6NZPACGX1eA@mail.gmail.com>
References: <CAGMdoFkAEUmvwC9fjCku-+g4KAu2FVomXKt-0B_S-A+c9Uhz_w@mail.gmail.com>
	<CAGMdoFnzx+hQyV1Gdd0CXAqbR7U7J_uhwcj3A3w6NZPACGX1eA@mail.gmail.com>
Date: Fri, 2 Oct 2015 08:46:38 -0400
Message-ID: <CADkTA4NwPcwtrniF3oqgtAPoaaM_79m+4rPPKpV19VZY52qzFw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Edward Wingate <edwingate8@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: python setuptools recipe
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
X-List-Received-Date: Fri, 02 Oct 2015 12:46:42 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Sep 30, 2015 at 3:03 PM, Edward Wingate <edwingate8@gmail.com> wrote:
> On Wed, Sep 30, 2015 at 11:10 AM, Edward Wingate <edwingate8@gmail.com> wrote:
>> I don't know what could be different about gevent-socketio.
>
> The setup.py for gevent-socketio has this line:
> setup_requires=('versiontools >= 1.7'),
>
> I manually removed that line and the recipe works now.  What should I
> do for permanent solution?  Create a patch?  Or how can I make it work
> even with this setup_requires?

Have you solved this yet ? I've never run into this myself, but maybe my
reply will jog the memory of someone that has.

Have you ruled out that the build is using a versiontools from your host
machine ? And that the versiontools is older than the 1.7 requirement ?

I don't see versiontools already in the layers, so if it is being picked up
from the host, then you very well could end up with this error.

I'd start by creating a versiontools 1.9.1 recipe, put it in the DEPENDS for
your recipe and see if everything is happy after that.

Bruce

> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

