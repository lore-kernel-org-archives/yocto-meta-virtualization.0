Return-Path: <paul.eggleton@linux.intel.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9AF6CE00C10; Wed, 31 Aug 2016 15:28:07 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [134.134.136.20 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 303B3E00BFF
	for <meta-virtualization@yoctoproject.org>;
	Wed, 31 Aug 2016 15:28:05 -0700 (PDT)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 31 Aug 2016 15:28:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,264,1470726000"; d="scan'208";a="1049862593"
Received: from clim59-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.178.177])
	by fmsmga002.fm.intel.com with ESMTP; 31 Aug 2016 15:28:02 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: meta-virtualization@yoctoproject.org
Date: Thu, 01 Sep 2016 10:28 +1200
Message-ID: <7329396.TWHmj0FE8o@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.6.7-200.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <CADkTA4P1D9_QqsweNfQPFWkKG4E-XwsE-GoQns9=_ipx0SD1eA@mail.gmail.com>
References: <1472667583-9767-1-git-send-email-mark.asselstine@windriver.com>
	<CADkTA4NhdqBgHBaSrGrYV-hKH15P8ro6g74GGu=DrEBcSMQWzw@mail.gmail.com>
	<CADkTA4P1D9_QqsweNfQPFWkKG4E-XwsE-GoQns9=_ipx0SD1eA@mail.gmail.com>
MIME-Version: 1.0
Cc: Mark Asselstine <mark.asselstine@windriver.com>
Subject: Re: [PATCH 2/2] docker: update license md5sum
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
X-List-Received-Date: Wed, 31 Aug 2016 22:28:07 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wed, 31 Aug 2016 17:17:00 Bruce Ashfield wrote:
> On Wed, Aug 31, 2016 at 5:13 PM, Bruce Ashfield <bruce.ashfield@gmail.com>
> wrote:
> > I just did a cleanall and re-build. The checksum matches.
> 
> ... and I just realized that cleanall doesn't get sstate, so I'd better
> remove that as well!

Just to clear up any confusion, -c cleanall *will* delete sstate artifacts in 
your local sstate-cache, since the do_cleanall task depends on do_cleansstate. 
However, if you are using SSTATE_MIRRORS pointing to a mirror server and that 
contains matching artifacts there's no way for those to be removed from the 
bitbake side - though if you need to you can alter the signatures by using 
-c <task> -f / -C <task> (or just making a trivial change to the metadata) and 
then those artifacts won't be used.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

