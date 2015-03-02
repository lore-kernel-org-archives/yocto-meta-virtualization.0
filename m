Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 43AB3E0077E; Mon,  2 Mar 2015 12:40:19 -0800 (PST)
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
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.215.41 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-la0-f41.google.com (mail-la0-f41.google.com
	[209.85.215.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2A946E003FA
	for <meta-virtualization@yoctoproject.org>;
	Mon,  2 Mar 2015 12:40:13 -0800 (PST)
Received: by lamq1 with SMTP id q1so9899711lam.0
	for <meta-virtualization@yoctoproject.org>;
	Mon, 02 Mar 2015 12:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=76s7aQCai289wKacp5le9nfWJ0sOZ2l7aqdBr+3i0rA=;
	b=PdlQJ2j2mZw35FG14PAcc6tr9+zkkh/Zk9r9QvzJOI5P4HkkiEYst/rwE+xZjDmiE9
	J3UY555iLaccY2g1Bo3YsfGPnAw0Kevy5v+tYJSYbrR1K/6uOeS44xVVvWd+2QUJAfcX
	8gMte+PxLy3QfZOznkP/MtO6HRUSfZaMb4seY3LZ2NbXFcP1bzkowRUbmDkKOTvEu0kq
	bNp8c4epUTVdg0xGhwEDiXHUvmyHYw75ADkWm+O0J2uq1SlA0+2ZSM2+AbXjCBQHsbfX
	yrXQnVkruYqk7tIfwQbxijktToMW5rs8KgoJG8q+rz37x0aMndgihKWHgSYRHZev21vB
	xuEA==
MIME-Version: 1.0
X-Received: by 10.112.155.98 with SMTP id vv2mr26101596lbb.121.1425328811666; 
	Mon, 02 Mar 2015 12:40:11 -0800 (PST)
Received: by 10.112.40.11 with HTTP; Mon, 2 Mar 2015 12:40:11 -0800 (PST)
In-Reply-To: <20150227214013.GA2160@windriver.com>
References: <20150227214013.GA2160@windriver.com>
Date: Mon, 2 Mar 2015 15:40:11 -0500
Message-ID: <CADkTA4N4nrxOz7R7MgQ11m9hXLO4=0O98jk2o2mDi=m-RzY3Lg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Amy Fong <amy.fong@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 0/5] Package docker + docker-registry
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
X-List-Received-Date: Mon, 02 Mar 2015 20:40:19 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Feb 27, 2015 at 4:40 PM, Amy Fong <amy.fong@windriver.com> wrote:
> This set of patches adds the packages docker, docker-registry
> and required dependencies/rdependencies.
>
> The following were added to my BBLAYERS on top
> of a basic yocto/poky build to compile these packages:
>
>   meta-virtualization \
>   meta-cloud-services/meta-openstack \

This is creating a circular dependency. Which recipes in particular do we
need from meta-openstack ?

We need to pull those recipes from meta-openstack to meta-virt, and then
I can take the submission.

Cheers.

Bruce

>   meta-openembedded/meta-oe \
>   meta-openembedded/meta-networking \
>   meta-openembedded/meta-python \
>   meta-openembedded/meta-filesystems \
>
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

