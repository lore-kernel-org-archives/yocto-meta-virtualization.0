Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f43.google.com (mail-la0-f43.google.com
	[209.85.215.43])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 367D9E005B4
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Aug 2013 22:34:18 -0700 (PDT)
Received: by mail-la0-f43.google.com with SMTP id ep20so1160375lab.16
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Aug 2013 22:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=9dyfP62s/QmhVepA/vBvnXwC2AAcx7YxBWOM5IyMcEs=;
	b=ZUOZ86lg30LQ1XPnP430IsYygzZiohvgSyt1AqoJ+CSFMcb56sIl3t6LJ1TtWRe7hQ
	aNaOkJ+wlSpGt1meWVBVXqWfNL6HegqTTypFLBYIuBbQWShLfKze0u9+dN2MUvGffftz
	UC0E4FuyjG4+u8GWRMSXCbo5//tXsn7zmUFJiRPRnUGgpx/W7c/tjTmW+M3lv7P9UsPh
	W8zMRfpv7/kVZRIVKa4140swFLMro8GWFM808QQu9HEJjDekhzzo/+ZFfAeTMZYCMC+B
	r9M01h+MgnxryX8kip23cpQIaMqBbVCwVSMvwoaDvjD4I9zqK4nE4WBr4rxCFIB0/kUa
	LtiQ==
MIME-Version: 1.0
X-Received: by 10.152.228.130 with SMTP id si2mr351088lac.32.1377840857810;
	Thu, 29 Aug 2013 22:34:17 -0700 (PDT)
Received: by 10.112.12.103 with HTTP; Thu, 29 Aug 2013 22:34:17 -0700 (PDT)
In-Reply-To: <1377833844-14672-3-git-send-email-cjp256@gmail.com>
References: <1377833844-14672-1-git-send-email-cjp256@gmail.com>
	<1377833844-14672-3-git-send-email-cjp256@gmail.com>
Date: Fri, 30 Aug 2013 01:34:17 -0400
Message-ID: <CADkTA4MePwwura+-T402oqxa2L7kb804z+4mxWhvU95M+A0aWg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Chris Patterson <cjp256@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 2/4] linux-yocto: add optional support for aufs and xen using DISTRO_FEATURES.
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
X-List-Received-Date: Fri, 30 Aug 2013 05:34:19 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Aug 29, 2013 at 11:37 PM, Chris Patterson <cjp256@gmail.com> wrote:
> ---
>  recipes-kernel/linux/linux-yocto_3.4.bbappend |    6 ++++++
>  recipes-kernel/linux/linux-yocto_3.8.bbappend |    6 ++++++
>  2 files changed, 12 insertions(+)
>
> diff --git a/recipes-kernel/linux/linux-yocto_3.4.bbappend b/recipes-kernel/linux/linux-yocto_3.4.bbappend
> index 2893a01..2ada931 100644
> --- a/recipes-kernel/linux/linux-yocto_3.4.bbappend
> +++ b/recipes-kernel/linux/linux-yocto_3.4.bbappend
> @@ -11,3 +11,9 @@ KERNEL_FEATURES_append = " features/kvm/qemu-kvm-enable.scc"
>  module_autoload_kvm = "kvm"
>  module_autoload_kvm-amd = "kvm-amd"
>  module_autoload_kvm-intel = "kvm-intel"
> +
> +# aufs kernel support required for core-image-xen
> +KERNEL_FEATURES_append += "${@base_contains('DISTRO_FEATURES', 'aufs', ' features/aufs/aufs-enable.scc', '', d)}"
> +
> +# xen dom0 kernel support
> +SRC_URI += "${@base_contains('DISTRO_FEATURES', 'xen', ' file://xen.scc', '', d)}"

Also nice. I like the change. With my previous comment about pulling
the xen fragment into
the kernel itself, you'd be able to make these two lines consistent.

Moving up the chain to new kernels is simple after that, since I'll
pull it forward as I uprev
support. (in fact, we can also add a new 3.10 fragment along with
these changes now :)

Cheers,

Bruce

> diff --git a/recipes-kernel/linux/linux-yocto_3.8.bbappend b/recipes-kernel/linux/linux-yocto_3.8.bbappend
> index 2893a01..2ada931 100644
> --- a/recipes-kernel/linux/linux-yocto_3.8.bbappend
> +++ b/recipes-kernel/linux/linux-yocto_3.8.bbappend
> @@ -11,3 +11,9 @@ KERNEL_FEATURES_append = " features/kvm/qemu-kvm-enable.scc"
>  module_autoload_kvm = "kvm"
>  module_autoload_kvm-amd = "kvm-amd"
>  module_autoload_kvm-intel = "kvm-intel"
> +
> +# aufs kernel support required for core-image-xen
> +KERNEL_FEATURES_append += "${@base_contains('DISTRO_FEATURES', 'aufs', ' features/aufs/aufs-enable.scc', '', d)}"
> +
> +# xen dom0 kernel support
> +SRC_URI += "${@base_contains('DISTRO_FEATURES', 'xen', ' file://xen.scc', '', d)}"
> --
> 1.7.10.4
>
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

