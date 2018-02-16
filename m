Return-Path: <Randy.MacLeod@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E8570E00EB1; Fri, 16 Feb 2018 09:27:38 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E6B7AE00EAF;
	Fri, 16 Feb 2018 09:27:36 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w1GHRWxU007521
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 16 Feb 2018 09:27:33 -0800 (PST)
Received: from [172.25.44.7] (172.25.44.7) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Fri, 16 Feb 2018 09:27:18 -0800
To: "Vish (Vishwanath) Maram" <vishwanath.m@samsung.com>,
	"meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
References: <CGME20180207174542uscas1p1d90b8c053fae0c7fd56888830a22eb34@uscas1p1.samsung.com>
	<ce37211d0564452faec96b262fcfb720@samsung.com>
	<b62772be-7b4d-0ada-ac07-12771b7c1209@windriver.com>
	<46cc9fa1662f425c829905fa4134bf78@samsung.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <67517613-ba06-44b3-8fb4-bb1632255698@windriver.com>
Date: Fri, 16 Feb 2018 12:27:31 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <46cc9fa1662f425c829905fa4134bf78@samsung.com>
X-Originating-IP: [172.25.44.7]
Cc: "meta-xilinx@yoctoproject.org" <meta-xilinx@yoctoproject.org>
Subject: Re: Yocto Recipe for LibRXE.
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
X-List-Received-Date: Fri, 16 Feb 2018 17:27:39 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 2018-02-16 11:51 AM, Vish (Vishwanath) Maram wrote:
> Randy,
> 
> Yes, that's the librxe-dev I am interested in. I am new to devtools on FPGA, can you point me on how to generate a new recipe?
> 
> -Vish

As Ross suggested elsewhere, you can try starting with devtool.
If that doesn't work, the alternatives are explained in the
manual:
 
http://www.yoctoproject.org/docs/current/dev-manual/dev-manual.html#new-recipe-writing-a-new-recipe

If that's a problem there are commercial solutions:
   https://www.yoctoproject.org/ecosystem/showcase

Good luck,

../Randy
> 
> -----Original Message-----
> From: Randy MacLeod [mailto:randy.macleod@windriver.com]
> Sent: Friday, February 16, 2018 8:19 AM
> To: Vish (Vishwanath) Maram <vishwanath.m@samsung.com>; meta-virtualization@yoctoproject.org
> Cc: meta-xilinx@yoctoproject.org
> Subject: Re: [meta-virtualization] Yocto Recipe for LibRXE.
> 
> On 2018-02-07 12:45 PM, Vish (Vishwanath) Maram wrote:
>> Hi,
>>
>> I am looking for a yocto recipe of librxe? Right now I was able to get librdmacm and libibverbs, but librxe yocto is not there. Can someone help me in getting this?
> 
> It doesn't seem to exist yet:
>      http://layers.openembedded.org/layerindex/branch/master/recipes/?q=rxe
> 
> Is this what you're interested in?
>     https://github.com/SoftRoCE/librxe-dev
> 
> Can you write a recipe and submit it to meta-virt or meta-openembeded since it seems that no one else has needed to package it for OE.
> 
> ../Randy
> 
>>
>> Highly appreciate if I can get some info on the same.
>>
>> Thanks,
>> -Vish
>>
> 
> 
> 
> --
> # Randy MacLeod.  WR Linux
> # Wind River an Intel Company
> 


-- 
# Randy MacLeod.  WR Linux
# Wind River an Intel Company

