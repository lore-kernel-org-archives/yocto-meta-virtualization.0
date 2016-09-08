Return-Path: <venkat.mandela@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6F4BEE011C1; Wed,  7 Sep 2016 19:50:16 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from bear.ext.ti.com (bear.ext.ti.com [198.47.19.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D5AA8E011BD
	for <meta-virtualization@yoctoproject.org>;
	Wed,  7 Sep 2016 19:50:13 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u882oAP9027634;
	Wed, 7 Sep 2016 21:50:10 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u882oAW2018348;
	Wed, 7 Sep 2016 21:50:10 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 7 Sep 2016 21:50:10 -0500
Received: from [172.24.145.235] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u882o6F1020285;
	Wed, 7 Sep 2016 21:50:09 -0500
References: <20160908023234.15453-1-venkat.mandela@ti.com>
	<2da3580c-eae7-4298-5d90-6edbbfdfe317@windriver.com>
To: Jianchuan Wang <Jianchuan.Wang@windriver.com>,
	<meta-virtualization@yoctoproject.org>
From: "Mandela, Venkateswara Rao" <venkat.mandela@ti.com>
Organization: Texas Instruments
Message-ID: <cf2a30f2-9652-3b85-29fc-244e01e4d009@ti.com>
Date: Thu, 8 Sep 2016 08:19:50 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:49.0) Gecko/20100101
	Thunderbird/49.0
MIME-Version: 1.0
In-Reply-To: <2da3580c-eae7-4298-5d90-6edbbfdfe317@windriver.com>
Subject: Re: [PATCH 0/2] Upgrade protobuf and protobuf-c
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: venkat.mandela@ti.com
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 08 Sep 2016 02:50:16 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

Hi Jianchun,

On Thursday 08 September 2016 08:16 AM, Jianchuan Wang wrote:
>> criu-1.6 build will not work with these patches.
>
> The criu-1.6 can work in my env after uprev protobuf and protobuf-c.
What is the kernel and tool chain versions that you are using? i am trying with gcc-4.7 and kernel 3.14.

regards,
Venkat

