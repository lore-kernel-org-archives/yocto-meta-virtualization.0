Return-Path: <Randy.MacLeod@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4711AE00E79; Fri, 16 Feb 2018 09:26:22 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [192.103.53.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C8F9BE00D5F;
	Fri, 16 Feb 2018 09:26:21 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w1GHQGgF003229
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Fri, 16 Feb 2018 09:26:17 -0800
Received: from [172.25.44.7] (172.25.44.7) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Fri, 16 Feb 2018 09:26:02 -0800
To: "Vish (Vishwanath) Maram" <vishwanath.m@samsung.com>, "Burton, Ross"
	<ross.burton@intel.com>
References: <CGME20180207174332uscas1p2c4d6e2933f469bb5e6d0cb2fe97e8b5a@uscas1p2.samsung.com>
	<7303d2119528406d838e7922fbadfa95@samsung.com>
	<CAJTo0La3_s=XkzVB0PRF3FB4VwY7LQ3kTQT1oQqVF+-gWMcOkw@mail.gmail.com>
	<f2355f750bd24ceaa0fa24eaf750e16e@samsung.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <fa4c6302-11d9-e34b-97d8-d3094b52966f@windriver.com>
Date: Fri, 16 Feb 2018 12:26:15 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <f2355f750bd24ceaa0fa24eaf750e16e@samsung.com>
X-Originating-IP: [172.25.44.7]
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	"meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [yocto] Yocto Recipe for LibRXE.
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
X-List-Received-Date: Fri, 16 Feb 2018 17:26:22 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 2018-02-16 11:49 AM, Vish (Vishwanath) Maram wrote:
> Ross,
> 
> Can you point me to what devtool you are talking about to generate the 
> recipe? I am in process of learning tools on FPGA, not sure on how to 
> generate as well?
> 
> -Vish
> 

See:
http://www.yoctoproject.org/docs/2.5/sdk-manual/sdk-manual.html#using-devtool-in-your-sdk-workflow

but you can also just copy a similar recipe and make changes as needed.
Give it a try!

-- 
# Randy MacLeod.  WR Linux
# Wind River an Intel Company

