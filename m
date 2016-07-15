Return-Path: <Bruce.Ashfield@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B0AECE00F56; Fri, 15 Jul 2016 08:03:56 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E70F2E00F4F
	for <meta-virtualization@yoctoproject.org>;
	Fri, 15 Jul 2016 08:03:55 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u6FF3sQq008214
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Fri, 15 Jul 2016 08:03:54 -0700
Received: from [128.224.56.48] (128.224.56.48) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 15 Jul 2016 08:03:54 -0700
To: <fupan.li@windriver.com>, <jason.wessel@windriver.com>,
	<meta-virtualization@yoctoproject.org>
References: <1468577103-224321-1-git-send-email-fupan.li@windriver.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <5788FB59.3070908@windriver.com>
Date: Fri, 15 Jul 2016 11:03:53 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <1468577103-224321-1-git-send-email-fupan.li@windriver.com>
Subject: Re: [PATCH] lxc: fixes lxc segment fault issue on arm if it is compiled with GCC 5.2
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
X-List-Received-Date: Fri, 15 Jul 2016 15:03:56 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

merged.

Bruce

On 2016-07-15 06:05 AM, fupan.li@windriver.com wrote:
> From: fli <fupan.li@windriver.com>
>
> If the lxc is compiled with gcc 5.2 -O2 optimization on arm,
> lxc-console/lxc-stop command always produce segment fault.
>
> The same issue also occurred on systemd: [YOCTO #8291]
>
> For lxc, after several testing, it only needs to disable
> schedule-insns2 to fix the segment fault issue.
>
> Signed-off-by: fli <fupan.li@windriver.com>
> ---
>   recipes-containers/lxc/lxc_2.0.0.bb | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/recipes-containers/lxc/lxc_2.0.0.bb b/recipes-containers/lxc/lxc_2.0.0.bb
> index 5004b9e..e436057 100644
> --- a/recipes-containers/lxc/lxc_2.0.0.bb
> +++ b/recipes-containers/lxc/lxc_2.0.0.bb
> @@ -49,6 +49,9 @@ EXTRA_OECONF += "--enable-log-src-basename"
>
>   CFLAGS_append = " -Wno-error=deprecated-declarations"
>
> +# disable problematic GCC 5.2 optimizations [YOCTO #8291]
> +FULL_OPTIMIZATION_append_arm = " -fno-schedule-insns2"
> +
>   PACKAGECONFIG ??= "templates \
>       ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \
>   "
>


