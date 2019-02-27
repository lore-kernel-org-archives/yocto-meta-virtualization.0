Return-Path: <Zhe.He@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 04679E00D04; Tue, 26 Feb 2019 23:45:34 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A3607E00A0C
	for <meta-virtualization@yoctoproject.org>;
	Tue, 26 Feb 2019 23:45:33 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x1R7iuj4010956
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 26 Feb 2019 23:45:06 -0800
Received: from [128.224.162.180] (128.224.162.180) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.435.0;
	Tue, 26 Feb 2019 23:44:45 -0800
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@gmail.com>
References: <1551253291-173385-1-git-send-email-zhe.he@windriver.com>
	<1551253291-173385-2-git-send-email-zhe.he@windriver.com>
From: He Zhe <zhe.he@windriver.com>
Message-ID: <c0fda049-b986-e512-e745-73348f3a0ae1@windriver.com>
Date: Wed, 27 Feb 2019 15:44:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <1551253291-173385-2-git-send-email-zhe.he@windriver.com>
X-Originating-IP: [128.224.162.180]
Subject: Re: [meta-cloud-services] [PATCH] kernel: Remove redundant config fragment
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
X-List-Received-Date: Wed, 27 Feb 2019 07:45:34 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-US

happened to duplicate this mail, no difference.

Thanks,
Zhe

On 2/27/19 3:41 PM, zhe.he@windriver.com wrote:
> From: He Zhe <zhe.he@windriver.com>
>
> This fixes 01a28c32acb2 ("linux/nf.cfg: CONFIG_NF_CONNTRACK_IPV4 was replaced by
> CONFIG_NF_CONNTRACK") which duplicates a config fragment and causes the
> following warning.
>
> Warning: Value of CONFIG_NF_CONNTRACK is defined multiple times within fragment
> tmp-glibc/work-shared/intel-x86-64/kernel-source/.kernel-meta/configs/v4.19/standard/intel-x86/nf.cfg:
> CONFIG_NF_CONNTRACK=y
> CONFIG_NF_CONNTRACK=y
>
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
>  meta-openstack/recipes-kernel/linux/linux-yocto/nf.cfg | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/meta-openstack/recipes-kernel/linux/linux-yocto/nf.cfg b/meta-openstack/recipes-kernel/linux/linux-yocto/nf.cfg
> index 1bf82ea..676a091 100644
> --- a/meta-openstack/recipes-kernel/linux/linux-yocto/nf.cfg
> +++ b/meta-openstack/recipes-kernel/linux/linux-yocto/nf.cfg
> @@ -2,7 +2,6 @@ CONFIG_NF_CONNTRACK=y
>  CONFIG_NF_NAT=m
>  CONFIG_NF_NAT_NEEDED=y
>  CONFIG_NF_NAT_PROTO_SCTP=m
> -CONFIG_NF_CONNTRACK=y
>  CONFIG_NF_CONNTRACK_PROC_COMPAT=y
>  CONFIG_NF_NAT_IPV4=m
>  CONFIG_IP_NF_NAT=m


