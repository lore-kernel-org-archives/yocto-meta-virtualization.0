Return-Path: <paul.eggleton@linux.intel.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1C037E00B1A; Mon, 20 Nov 2017 12:20:49 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.55.52.93 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6ABF3E009CB
	for <meta-virtualization@yoctoproject.org>;
	Mon, 20 Nov 2017 12:20:48 -0800 (PST)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Nov 2017 12:20:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,429,1505804400"; d="scan'208";a="10006295"
Received: from bplee1-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.64.234])
	by orsmga002.jf.intel.com with ESMTP; 20 Nov 2017 12:20:42 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>,
	Mark Asselstine <mark.asselstine@windriver.com>
Date: Tue, 21 Nov 2017 09:20:38 +1300
Message-ID: <1560592.BgqbcP64FP@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
In-Reply-To: <CADkTA4OjsZ5cRyzDDUOhgx8oYx97XH9WdzHCxngb9mfVo_F2WQ@mail.gmail.com>
References: <20171030225413.938-1-paul.eggleton@linux.intel.com>
	<CAAPZna2fMCQ6qxZEKek=RdBsC7MdyxpiPOpMv4-y+OoDehvbAw@mail.gmail.com>
	<CADkTA4OjsZ5cRyzDDUOhgx8oYx97XH9WdzHCxngb9mfVo_F2WQ@mail.gmail.com>
MIME-Version: 1.0
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>,
	Otavio Salvador <otavio@ossystems.com.br>
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
X-List-Received-Date: Mon, 20 Nov 2017 20:20:49 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday, 15 November 2017 6:33:31 AM NZDT Bruce Ashfield wrote:
> On Tue, Nov 14, 2017 at 12:14 PM, Fabio Berton
> <fabio.berton@ossystems.com.br> wrote:
> > Hi,
> >
> > We have a customer using krogoth branch and is failing to fetch from pypi.
> > And branches morty, pyro and rocko have http URLs for python recipes. This
> > patch can be backported to older branches?
> 
> Does the pypi class take care of things in the old branches as well ?
> If not, propose different patches for those branches, since as you'll
> see in the thread:
> 
> "Bruce. Instead of merging this I will move any recipes that remain to
> inherit pypi if that is alright with the two of you."
> 
> So that is the plan for master, not merging this patch as it sits.

The pypi class used https URLs back in morty, FYI.

So just to clarify - you want pypi inherit patches going back to morty? I can 
do that, but it's slightly less safe than just tweaking the URLs for the 
stable branches. Let me know what you'd like me to do.

Cheers,
Paul


-- 

Paul Eggleton
Intel Open Source Technology Centre

