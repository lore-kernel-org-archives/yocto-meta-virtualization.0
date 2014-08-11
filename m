Return-Path: <paul.eggleton@linux.intel.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BBC92E0078E; Mon, 11 Aug 2014 09:18:19 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [134.134.136.24 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9DA6EE004F2
	for <meta-virtualization@yoctoproject.org>;
	Mon, 11 Aug 2014 09:18:11 -0700 (PDT)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 11 Aug 2014 09:12:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,842,1400050800"; d="scan'208";a="586520958"
Received: from glucy-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.122.202])
	by orsmga002.jf.intel.com with ESMTP; 11 Aug 2014 09:17:57 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 11 Aug 2014 17:17:56 +0100
Message-ID: <3167746.0YZo51VxAQ@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.13.3 (Linux/3.15.8-200.fc20.x86_64; KDE/4.13.3; x86_64; ; )
In-Reply-To: <CADkTA4OcnP+Q3wvVatb-_Ny4nHjycnQ=FhMuCQwRD2p_cWqrbg@mail.gmail.com>
References: <2423043.jtrRQzBGRa@peggleto-mobl5.ger.corp.intel.com>
	<CADkTA4OcnP+Q3wvVatb-_Ny4nHjycnQ=FhMuCQwRD2p_cWqrbg@mail.gmail.com>
MIME-Version: 1.0
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: meta-openstack Python support recipes
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
X-List-Received-Date: Mon, 11 Aug 2014 16:18:19 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 11 August 2014 12:09:18 Bruce Ashfield wrote:
> On Mon, Aug 11, 2014 at 8:43 AM, Paul Eggleton
> <paul.eggleton@linux.intel.com> wrote:
> > There are quite a few Python support recipes in meta-openstack. Now that
> > the meta-python layer has been established, would it be reasonable to
> > move those that are generic and not related to virtualisation over to
> > meta-python and make meta-openstack depend upon that, so that those
> > recipes can be (a little) more easily reused by others?
> 
> At this point no. I intend to keep them all in meta-openstack, since the
> version and cadence is tightly coupled to the core components, and
> spreading them across multiple layers is a recipe for chaos.

OK, understood - so I guess that being the case we may end up having some 
duplication between there and meta-python. Not that I intend to do any 
wholesale copying, but if we need a dependency or if it makes sense to add a 
recipe currently in meta-openstack to meta-python for the purposes of making 
it more widely usable, I don't see much of an option but to have it in both 
places.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

