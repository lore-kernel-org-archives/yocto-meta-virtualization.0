Return-Path: <Zhe.He@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2445DE00A0A; Fri, 28 Sep 2018 19:01:51 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [192.103.53.11 listed in list.dnswl.org]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 17EABE009D9
	for <meta-virtualization@yoctoproject.org>;
	Fri, 28 Sep 2018 19:01:49 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w8T21CXa010181
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 28 Sep 2018 19:01:23 -0700
Received: from [128.224.162.216] (128.224.162.216) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Fri, 28 Sep 2018 19:01:02 -0700
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@gmail.com>
References: <1537961203-96269-1-git-send-email-zhe.he@windriver.com>
From: He Zhe <zhe.he@windriver.com>
Message-ID: <ec120586-08fb-f9a9-54e2-9f94b94c5702@windriver.com>
Date: Sat, 29 Sep 2018 10:00:59 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1537961203-96269-1-git-send-email-zhe.he@windriver.com>
X-Originating-IP: [128.224.162.216]
Subject: Re: [PATCH] kernel: forcedly load nf_conntrack_ipv6 to work around kernel module loading failure
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
X-List-Received-Date: Sat, 29 Sep 2018 02:01:51 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Kindly ping.

Zhe

On 2018年09月26日 19:26, zhe.he@windriver.com wrote:
> From: He Zhe <zhe.he@windriver.com>
>
> In the v4.18 kernel, there is a problem with the locking and init sequence of
> the kernel modules. This would cause nf_conntrack_ipv6 failed to be loaded.
>
> In kernel v4.19, nf_conntrack_ipv6 has been merged to nf_conntrack and the
> problematic code has gone. This patch just works around by forcedly loading
> nf_conntrack_ipv6.
>
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
>  recipes-kernel/linux/linux-yocto_virtualization.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-kernel/linux/linux-yocto_virtualization.inc b/recipes-kernel/linux/linux-yocto_virtualization.inc
> index c09b07c..5d3cbc6 100644
> --- a/recipes-kernel/linux/linux-yocto_virtualization.inc
> +++ b/recipes-kernel/linux/linux-yocto_virtualization.inc
> @@ -8,7 +8,7 @@ SRC_URI += "file://xt-checksum.scc \
>  	    "
>  KERNEL_FEATURES_append = " ${@bb.utils.contains('DISTRO_FEATURES', 'kvm', 'features/kvm/qemu-kvm-enable.scc', '', d)}"
>  
> -KERNEL_MODULE_AUTOLOAD += "openvswitch"
> +KERNEL_MODULE_AUTOLOAD += "nf_conntrack_ipv6 openvswitch"
>  KERNEL_MODULE_AUTOLOAD += "${@bb.utils.contains('DISTRO_FEATURES', 'kvm', 'kvm', '', d)}"
>  
>  # aufs kernel support required for xen-image-minimal


