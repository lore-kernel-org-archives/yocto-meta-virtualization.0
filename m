Return-Path: <Bruce.Ashfield@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D4DE5E00C20; Tue,  5 Apr 2016 08:17:20 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E5670E00B8C
	for <meta-virtualization@yoctoproject.org>;
	Tue,  5 Apr 2016 08:17:18 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u35FHIEd020522
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 5 Apr 2016 08:17:18 -0700
Received: from [147.11.118.125] (147.11.118.125) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 5 Apr 2016 08:17:17 -0700
To: <zhe.he@windriver.com>, <meta-virtualization@yoctoproject.org>
References: <cover.1459831866.git.zhe.he@windriver.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <5703D6FD.2090106@windriver.com>
Date: Tue, 5 Apr 2016 11:17:17 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <cover.1459831866.git.zhe.he@windriver.com>
Subject: Re: [PATCH 0/1] openvswitch: Fix ptest for v2.5
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
X-List-Received-Date: Tue, 05 Apr 2016 15:17:20 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 04/05/2016 12:59 AM, zhe.he@windriver.com wrote:
> From: He Zhe <zhe.he@windriver.com>
>
> - Copy certain files from srcdir since it has been different from
>    build directory.
> - Copy more necessary files for new added test cases.
> - Modify config files for running on target.
> - Add necessary RDEPENDS

merged.

Bruce

>
> testsuite.log on genericx86-64:
> ...
> ## ------------- ##
> ## Test results. ##
> ## ------------- ##
>
> 1731 tests behaved as expected.
> 2 tests were skipped.
>
> He Zhe (1):
>    openvswitch: Fix ptest for v2.5
>
>   ...-8c0b419a0b9ac0141d6973dcc80306dfc6a83d31.patch | 79 ++++++++++++++++------
>   recipes-networking/openvswitch/openvswitch_git.bb  |  3 +
>   2 files changed, 63 insertions(+), 19 deletions(-)
>


