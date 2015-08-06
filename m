Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9C18DE009B8; Thu,  6 Aug 2015 05:39:41 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 77EC6E00867
	for <meta-virtualization@yoctoproject.org>;
	Thu,  6 Aug 2015 05:39:39 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t76CdTG3009992
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 6 Aug 2015 05:39:29 -0700 (PDT)
Received: from yow-masselst-d1.localnet (128.224.56.91) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.235.1; Thu, 6 Aug 2015 05:39:28 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: "Li, Xin" <lixin.fnst@cn.fujitsu.com>
Date: Thu, 6 Aug 2015 08:40:45 -0400
Message-ID: <2578271.4gndBy4T4K@yow-masselst-d1>
Organization: Wind River Internation Inc.
User-Agent: KMail/4.13.3 (Linux/3.13.0-52-generic; KDE/4.13.3; x86_64; ; )
In-Reply-To: <A8FC939F80655644A89BB21CCD3741E8011BCB8F6E@G08CNEXMBPEKD03.g08.fujitsu.local>
References: <1438806592-32745-1-git-send-email-mark.asselstine@windriver.com>
	<CADkTA4PzxM+HhWn-_55Gdcecn=+54fiySVFCe7=pyZjEbE_fKg@mail.gmail.com>
	<A8FC939F80655644A89BB21CCD3741E8011BCB8F6E@G08CNEXMBPEKD03.g08.fujitsu.local>
MIME-Version: 1.0
X-Originating-IP: [128.224.56.91]
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [m-c-s][PATCH 06/11] python-testtools: fix build error
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
X-List-Received-Date: Thu, 06 Aug 2015 12:39:41 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On August 6, 2015 01:58:35 Li, Xin wrote:
> Hi,
> 
> >-----Original Message-----
> >From: meta-virtualization-bounces@yoctoproject.org
> >[mailto:meta-virtualization-bounces@yoctoproject.org] On Behalf Of Bruce
> >Ashfield Sent: Thursday, August 06, 2015 9:12 AM
> >To: Mark Asselstine
> >Cc: meta-virtualization@yoctoproject.org
> >Subject: Re: [meta-virtualization] [m-c-s][PATCH 06/11] python-testtools:
> >fix build error
> >
> >On Wed, Aug 5, 2015 at 4:29 PM, Mark Asselstine
> ><mark.asselstine@windriver.com>>
> >wrote:
> >> Ran in to a build error:
> >> distutils.errors.DistutilsError: Could not find suitable distribution
> >> for Requirement.parse('pbr')
> >> ERROR: python setup.py build execution failed.
> >> 
> >> Fix by DEPENDing on python-pbr.
> 
> If you build python-pbr first, and then build python-testtools,
> The error will not happen.

This is by definition a DEPENDS.

Mark

> 
> Cherrs,
> Li


