Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C5637E00A71; Wed,  5 Aug 2015 18:58:43 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 59AB9E00A01
	for <meta-virtualization@yoctoproject.org>;
	Wed,  5 Aug 2015 18:58:38 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="99320889"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 06 Aug 2015 10:02:04 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t761ugK5014537;
	Thu, 6 Aug 2015 09:56:42 +0800
Received: from G08CNEXMBPEKD03.g08.fujitsu.local ([10.167.33.86]) by
	G08CNEXCHPEKD02.g08.fujitsu.local ([10.167.33.83]) with mapi id
	14.03.0181.006; Thu, 6 Aug 2015 09:58:36 +0800
From: "Li, Xin" <lixin.fnst@cn.fujitsu.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>, Mark Asselstine
	<mark.asselstine@windriver.com>
Thread-Topic: [meta-virtualization] [m-c-s][PATCH 06/11] python-testtools:
	fix build error
Thread-Index: AQHQz+ThAPBxIWcSqEeD50unSRm65Z3+NRNw
Date: Thu, 6 Aug 2015 01:58:35 +0000
Message-ID: <A8FC939F80655644A89BB21CCD3741E8011BCB8F6E@G08CNEXMBPEKD03.g08.fujitsu.local>
References: <1438806592-32745-1-git-send-email-mark.asselstine@windriver.com>
	<1438806592-32745-7-git-send-email-mark.asselstine@windriver.com>
	<CADkTA4PzxM+HhWn-_55Gdcecn=+54fiySVFCe7=pyZjEbE_fKg@mail.gmail.com>
In-Reply-To: <CADkTA4PzxM+HhWn-_55Gdcecn=+54fiySVFCe7=pyZjEbE_fKg@mail.gmail.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.226.92]
MIME-Version: 1.0
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
X-List-Received-Date: Thu, 06 Aug 2015 01:58:43 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

Hi,
>-----Original Message-----
>From: meta-virtualization-bounces@yoctoproject.org
>[mailto:meta-virtualization-bounces@yoctoproject.org] On Behalf Of Bruce A=
shfield
>Sent: Thursday, August 06, 2015 9:12 AM
>To: Mark Asselstine
>Cc: meta-virtualization@yoctoproject.org
>Subject: Re: [meta-virtualization] [m-c-s][PATCH 06/11] python-testtools: =
fix build
>error
>
>On Wed, Aug 5, 2015 at 4:29 PM, Mark Asselstine <mark.asselstine@windriver=
.com>
>wrote:
>> Ran in to a build error:
>> distutils.errors.DistutilsError: Could not find suitable distribution
>> for Requirement.parse('pbr')
>> ERROR: python setup.py build execution failed.
>>
>> Fix by DEPENDing on python-pbr.
>>
If you build python-pbr first, and then build python-testtools,
The error will not happen.

Cherrs,
Li

