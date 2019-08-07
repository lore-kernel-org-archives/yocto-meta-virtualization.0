Return-Path: <Zhe.He@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DC5B1E00DE3; Wed,  7 Aug 2019 01:18:27 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [192.103.53.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 14382E00DB6
	for <meta-virtualization@yoctoproject.org>;
	Wed,  7 Aug 2019 01:18:26 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x778HeVO008515
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 7 Aug 2019 01:18:16 -0700
Received: from [128.224.162.221] (128.224.162.221) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Wed, 7 Aug 2019 01:18:09 -0700
To: Bruce Ashfield <bruce.ashfield@windriver.com>,
	<meta-virtualization@yoctoproject.org>
References: <a1fa73d3-7dcd-b985-b092-5508c0c0de8b@windriver.com>
From: He Zhe <zhe.he@windriver.com>
Message-ID: <f6562849-276e-2f8a-a347-bb3f4b578265@windriver.com>
Date: Wed, 7 Aug 2019 16:18:07 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <a1fa73d3-7dcd-b985-b092-5508c0c0de8b@windriver.com>
X-Originating-IP: [128.224.162.221]
Subject: Re: docker used to depend on git
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
X-List-Received-Date: Wed, 07 Aug 2019 08:18:27 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 8/7/19 11:56 AM, He Zhe wrote:
> Hi Bruce,
>
> The package git was added as RDEPENDS of docker
> http://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/commit/?id=e8af6127743b0d32e1acecb2e5e165d6e7b7f031
> and was removed since
> http://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/commit/?id=4b6d33c87f368b22d75c7fea569797e9d852c31f
> , both without clarification.
>
> Is this what we expected?

docker build git://
may use git

Zhe

>
> Thanks,
> Zhe


