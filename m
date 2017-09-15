Return-Path: <Bruce.Ashfield@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 367F8E00D32; Fri, 15 Sep 2017 12:19:15 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 09A0EE00D0F
	for <meta-virtualization@yoctoproject.org>;
	Fri, 15 Sep 2017 12:19:06 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v8FJJ6HC013130
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Fri, 15 Sep 2017 12:19:06 -0700 (PDT)
Received: from server.local (128.224.21.239) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Fri, 15 Sep 2017 12:19:05 -0700
To: Mark Asselstine <mark.asselstine@windriver.com>,
	<meta-virtualization@yoctoproject.org>
References: <1505493145-28718-1-git-send-email-mark.asselstine@windriver.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <0cf19320-23c7-4688-c7f8-cd0887f9a253@windriver.com>
Date: Fri, 15 Sep 2017 15:19:05 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:52.0)
	Gecko/20100101 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1505493145-28718-1-git-send-email-mark.asselstine@windriver.com>
Subject: Re: [m-c-s][PATCH] meta-openstack: qemu: match spice arch restrictions
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
X-List-Received-Date: Fri, 15 Sep 2017 19:19:15 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

merged.

Bruce

On 2017-09-15 12:32 PM, Mark Asselstine wrote:
> The spice recipe is restricted to Intel x86 and x86-64 so keep 'spice'
> out of the PACKAGECONFIG unless we are using one of these ARCHs.
> 
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>   meta-openstack/recipes-devtools/qemu/qemu_2.%.bbappend | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-openstack/recipes-devtools/qemu/qemu_2.%.bbappend b/meta-openstack/recipes-devtools/qemu/qemu_2.%.bbappend
> index 9d774c4..ad1ea25 100644
> --- a/meta-openstack/recipes-devtools/qemu/qemu_2.%.bbappend
> +++ b/meta-openstack/recipes-devtools/qemu/qemu_2.%.bbappend
> @@ -1,6 +1,9 @@
>   PACKAGECONFIG[spice] = "--enable-spice,--disable-spice,spice,"
>   PACKAGECONFIG[libseccomp] = "--enable-seccomp,--disable-seccomp,libseccomp,libseccomp"
>   
> -PACKAGECONFIG ?= "fdt spice virtfs libcap-ng"
> +PACKAGECONFIG ?= "fdt virtfs libcap-ng"
> +PACKAGECONFIG_x86 ?= "fdt spice virtfs libcap-ng"
> +PACKAGECONFIG_x86-64 ?= "fdt spice virtfs libcap-ng"
> +
>   PACKAGECONFIG_class-native = "fdt"
>   PACKAGECONFIG_class-nativesdk = "fdt"
> 


