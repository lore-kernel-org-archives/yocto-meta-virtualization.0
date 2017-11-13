Return-Path: <paul.eggleton@linux.intel.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 39D41E00C35; Sun, 12 Nov 2017 20:00:04 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [192.55.52.115 listed in list.dnswl.org]
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B0CE8E00BEA
	for <meta-virtualization@yoctoproject.org>;
	Sun, 12 Nov 2017 20:00:03 -0800 (PST)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Nov 2017 20:00:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,387,1505804400"; 
   d="scan'208";a="1248246"
Received: from mintingh-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.67.199])
	by FMSMGA003.fm.intel.com with ESMTP; 12 Nov 2017 19:59:59 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: mark.asselstine@windriver.com
Date: Mon, 13 Nov 2017 16:59:55 +1300
Message-ID: <3643043.t5deORmW9L@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
In-Reply-To: <CAPuovE+=FS96vc_V4BHhXr6iq4c0jy5hJkEWZQBs=35rK=zfdg@mail.gmail.com>
References: <20171030225413.938-1-paul.eggleton@linux.intel.com>
	<CADkTA4MnT-KcNSZzhvpU_dQKV0rvKGApKJB6CgF7OnsZP0t=RQ@mail.gmail.com>
	<CAPuovE+=FS96vc_V4BHhXr6iq4c0jy5hJkEWZQBs=35rK=zfdg@mail.gmail.com>
MIME-Version: 1.0
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] python-*: use https for pypi URLs
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
X-List-Received-Date: Mon, 13 Nov 2017 04:00:04 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday, 13 November 2017 2:28:34 PM NZDT Mark Asselstine wrote:
> On Sun, Nov 12, 2017 at 8:21 PM, Bruce Ashfield
> <bruce.ashfield@gmail.com> wrote:
> > First I've seen of this.  It was filed as spam by gmail.
> >
> > Was I actually copied on the original ? That's the best way to make
> > sure it doesn't
> > get lost.
> >
> > I'll have a look at it in the next day or so, now that it has been
> > yanked out of the bin :)
> 
> I have been moving things to inherit pypi while moving things to
> stable/pike. By doing so we can most often drop the SRC_URI line and
> in this way we *should* stay current with the pypi best practices.
> This commit will conflict with my webob update that off the top of my
> head you merged this week Bruce. Instead of merging this I will move
> any recipes that remain to inherit pypi if that is alright with the
> two of you.

Works for me too. Thanks!

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

