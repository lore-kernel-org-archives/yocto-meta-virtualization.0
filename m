Return-Path: <Dengke.Du@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A079FE00D59; Wed, 15 May 2019 18:15:48 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [192.103.53.11 listed in list.dnswl.org]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 32841E00CB3
	for <meta-virtualization@yoctoproject.org>;
	Wed, 15 May 2019 18:15:47 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x4G1FR3s010681
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 15 May 2019 18:15:37 -0700
Received: from [128.224.162.135] (128.224.162.135) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Wed, 15 May 2019 18:15:16 -0700
To: <meta-virtualization@yoctoproject.org>
References: <1557907645-31352-1-git-send-email-dengke.du@windriver.com>
From: ddu <dengke.du@windriver.com>
Message-ID: <4e442d33-3b70-caf8-3e65-b63d80ad68d6@windriver.com>
Date: Thu, 16 May 2019 09:15:13 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1557907645-31352-1-git-send-email-dengke.du@windriver.com>
X-Originating-IP: [128.224.162.135]
Subject: Re: [PATCH] libvirt: remove numactl configure for arm
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
X-List-Received-Date: Thu, 16 May 2019 01:15:48 -0000
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Please ignore this, thanks.

ÔÚ 2019/5/15 ÏÂÎç4:07, Dengke Du Ð´µÀ:
> Because arm didn't support NUMA currently.
>
> Signed-off-by: Dengke Du <dengke.du@windriver.com>
> ---
>   recipes-extended/libvirt/libvirt_5.3.0.bb | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/recipes-extended/libvirt/libvirt_5.3.0.bb b/recipes-extended/libvirt/libvirt_5.3.0.bb
> index 30bb44c..157127b 100644
> --- a/recipes-extended/libvirt/libvirt_5.3.0.bb
> +++ b/recipes-extended/libvirt/libvirt_5.3.0.bb
> @@ -189,7 +189,6 @@ PACKAGECONFIG ??= "qemu yajl openvz vmware vbox esx iproute2 lxc test \
>                      ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux audit libcap-ng', '', d)} \
>                      ${@bb.utils.contains('DISTRO_FEATURES', 'xen', 'libxl', '', d)} \
>                      ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'polkit', '', d)} \
> -                   ${@bb.utils.contains('KARCH', 'arm', '', 'numactl', d)} \
>                     "
>   
>   # qemu is NOT compatible with mips64

