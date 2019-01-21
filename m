Return-Path: <Hongzhi.Song@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A58BAE00BD5; Mon, 21 Jan 2019 01:00:56 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5B60FE00BC6
	for <meta-virtualization@yoctoproject.org>;
	Mon, 21 Jan 2019 01:00:56 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x0L90Fvv024886
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 21 Jan 2019 01:00:45 -0800
Received: from [128.224.163.204] (128.224.163.204) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Mon, 21 Jan 2019 01:00:03 -0800
To: <meta-virtualization@yoctoproject.org>
References: <1548060938-262139-1-git-send-email-hongzhi.song@windriver.com>
From: "Hongzhi, Song" <hongzhi.song@windriver.com>
Message-ID: <85822b46-3492-47f7-368e-e82a585a015b@windriver.com>
Date: Mon, 21 Jan 2019 17:00:00 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <1548060938-262139-1-git-send-email-hongzhi.song@windriver.com>
X-Originating-IP: [128.224.163.204]
Subject: Re: [PATCH] linux/nf.cfg: CONFIG_NF_CONNTRACK_IPV4 was replaced by CONFIG_NF_CONNTRACK
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
X-List-Received-Date: Mon, 21 Jan 2019 09:00:56 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Sorry, this patch should be merge to meta-cloud-services.


--Hongzhi


On 01/21/2019 04:55 PM, Hongzhi.Song wrote:
> >From kernel:
>
> commit ID: [a0ae2562c]
> commit log:
> [netfilter: conntrack: remove l3proto abstraction
>
> This unifies ipv4 and ipv6 protocol trackers and removes the l3proto
> abstraction.
> ...]
>
> Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
> ---
>   meta-openstack/recipes-kernel/linux/linux-yocto/nf.cfg | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-openstack/recipes-kernel/linux/linux-yocto/nf.cfg b/meta-openstack/recipes-kernel/linux/linux-yocto/nf.cfg
> index 223210c..1bf82ea 100644
> --- a/meta-openstack/recipes-kernel/linux/linux-yocto/nf.cfg
> +++ b/meta-openstack/recipes-kernel/linux/linux-yocto/nf.cfg
> @@ -2,7 +2,7 @@ CONFIG_NF_CONNTRACK=y
>   CONFIG_NF_NAT=m
>   CONFIG_NF_NAT_NEEDED=y
>   CONFIG_NF_NAT_PROTO_SCTP=m
> -CONFIG_NF_CONNTRACK_IPV4=y
> +CONFIG_NF_CONNTRACK=y
>   CONFIG_NF_CONNTRACK_PROC_COMPAT=y
>   CONFIG_NF_NAT_IPV4=m
>   CONFIG_IP_NF_NAT=m


