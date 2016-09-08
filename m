Return-Path: <Jianchuan.Wang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 325C8E011BE; Wed,  7 Sep 2016 20:00:00 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B531CE00BFF
	for <meta-virtualization@yoctoproject.org>;
	Wed,  7 Sep 2016 19:59:58 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u882xurY026415
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 7 Sep 2016 19:59:56 -0700 (PDT)
Received: from [128.224.163.134] (128.224.163.134) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 7 Sep 2016 19:59:55 -0700
To: <venkat.mandela@ti.com>, <meta-virtualization@yoctoproject.org>
References: <20160908023234.15453-1-venkat.mandela@ti.com>
	<2da3580c-eae7-4298-5d90-6edbbfdfe317@windriver.com>
	<cf2a30f2-9652-3b85-29fc-244e01e4d009@ti.com>
From: Jianchuan Wang <Jianchuan.Wang@windriver.com>
Message-ID: <de7770ef-5615-f31f-5c37-895b8f5547c2@windriver.com>
Date: Thu, 8 Sep 2016 10:59:54 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <cf2a30f2-9652-3b85-29fc-244e01e4d009@ti.com>
Subject: Re: [PATCH 0/2] Upgrade protobuf and protobuf-c
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
X-List-Received-Date: Thu, 08 Sep 2016 03:00:00 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 09/08/2016 10:49 AM, Mandela, Venkateswara Rao wrote:
> Hi Jianchun,
>
> On Thursday 08 September 2016 08:16 AM, Jianchuan Wang wrote:
>>> criu-1.6 build will not work with these patches.
>> The criu-1.6 can work in my env after uprev protobuf and protobuf-c.
> What is the kernel and tool chain versions that you are using? i am trying with gcc-4.7 and kernel 3.14.

kernel version is 4.1/4.8
Gcc version is 6.1.1

Thanks,
Jianchuan
> regards,
> Venkat
>


