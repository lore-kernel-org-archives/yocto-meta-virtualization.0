Return-Path: <Bruce.Ashfield@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AB054E00D53; Wed,  8 Nov 2017 11:18:47 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C6BB7E00D4E
	for <meta-virtualization@yoctoproject.org>;
	Wed,  8 Nov 2017 11:18:33 -0800 (PST)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vA8JIXht026481
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 8 Nov 2017 11:18:33 -0800 (PST)
Received: from server.local (128.224.20.254) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 8 Nov 2017 11:18:32 -0800
To: Mark Asselstine <mark.asselstine@windriver.com>,
	<meta-virtualization@yoctoproject.org>
References: <1510086435-19586-1-git-send-email-mark.asselstine@windriver.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <15b9b5a1-3383-0088-96f0-6e8fc533df12@windriver.com>
Date: Wed, 8 Nov 2017 14:18:31 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:52.0)
	Gecko/20100101 Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <1510086435-19586-1-git-send-email-mark.asselstine@windriver.com>
Subject: Re: [m-c-s][PATCH 1/2] python-xstatic-jquery-tablesorter: rename to python-xstatic-jquery.tablesorter
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
X-List-Received-Date: Wed, 08 Nov 2017 19:18:47 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2017-11-07 3:27 PM, Mark Asselstine wrote:
> By renaming we match the upstream naming convention. This allows for
> better automation around dependencies and requirements.txt.
> 

both merged.

Bruce

> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>   ...lesorter_2.14.5.1.bb => python-xstatic-jquery.tablesorter_2.14.5.1.bb} | 0
>   1 file changed, 0 insertions(+), 0 deletions(-)
>   rename meta-openstack/recipes-devtools/python/{python-xstatic-jquery-tablesorter_2.14.5.1.bb => python-xstatic-jquery.tablesorter_2.14.5.1.bb} (100%)
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-jquery-tablesorter_2.14.5.1.bb b/meta-openstack/recipes-devtools/python/python-xstatic-jquery.tablesorter_2.14.5.1.bb
> similarity index 100%
> rename from meta-openstack/recipes-devtools/python/python-xstatic-jquery-tablesorter_2.14.5.1.bb
> rename to meta-openstack/recipes-devtools/python/python-xstatic-jquery.tablesorter_2.14.5.1.bb
> 


