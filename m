Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f171.google.com (mail-lb0-f171.google.com
	[209.85.217.171])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6A4C4E00BD3
	for <meta-virtualization@yoctoproject.org>;
	Wed,  2 Apr 2014 06:05:25 -0700 (PDT)
Received: by mail-lb0-f171.google.com with SMTP id w7so133189lbi.30
	for <meta-virtualization@yoctoproject.org>;
	Wed, 02 Apr 2014 06:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=o7W25sooSPCrGYc8y9VB4HwCsVOZMKpfznNSp08WmxE=;
	b=IJOJ9golUnRaqp+ML6/AxXKwxFfJdjwYxTz7ll1KlEgXGzSX4zQomi8JVM8gBMkEHd
	PBYqmzTmtj0Fz9D4EBnTrxvjwHD4AGIqIzlteJr6YNPJ9plCBlf2JJSBftgGkbRgPDRr
	gLLZ9OeAOCRGVuL3sL/vSGxIl5LA215stwYfTjiZbtBCRXTHGmoaKi2/L4z84kgdDcoB
	FIDgyt5lhh5G0HG56BxjXRU4+g4QrpPk3hze6L/x+0AH571pC49z8bB1Ee8C2NSG9sOy
	rcwADL62nAqNHb6iSmkfDQdvz7W9Vge+VLdKDge0Cc59U7HtC9LuEV4z6bR+zHsNsnoG
	VzqA==
MIME-Version: 1.0
X-Received: by 10.152.199.104 with SMTP id jj8mr67938lac.70.1396443924246;
	Wed, 02 Apr 2014 06:05:24 -0700 (PDT)
Received: by 10.112.58.132 with HTTP; Wed, 2 Apr 2014 06:05:24 -0700 (PDT)
In-Reply-To: <1396425932-16233-1-git-send-email-cosmin.paraschiv@freescale.com>
References: <1396425932-16233-1-git-send-email-cosmin.paraschiv@freescale.com>
Date: Wed, 2 Apr 2014 09:05:24 -0400
Message-ID: <CADkTA4PuYsgwxxxJHO8Qbe5K4rTBCGeY8YpYOgaJFqQZbws7uA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Cosmin Paraschiv <cosmin.paraschiv@freescale.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] linux-yocto: Remove 3.8 kernel bbappend
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
X-List-Received-Date: Wed, 02 Apr 2014 13:05:29 -0000
Content-Type: text/plain; charset=ISO-8859-1

I already have this one queued up, and a 3.14 replacement, which I'll
push out later today.

Thanks for the reminder!

Bruce

On Wed, Apr 2, 2014 at 4:05 AM, Cosmin Paraschiv
<cosmin.paraschiv@freescale.com> wrote:
> Commit c565d76c from poky removed the 3.8 kernel
> from the list of supported kernels in Yocto 1.6.
>
> Signed-off-by: Cosmin Paraschiv <cosmin.paraschiv@freescale.com>
> ---
>  recipes-kernel/linux/linux-yocto_3.8.bbappend |   19 -------------------
>  1 file changed, 19 deletions(-)
>  delete mode 100644 recipes-kernel/linux/linux-yocto_3.8.bbappend
>
> diff --git a/recipes-kernel/linux/linux-yocto_3.8.bbappend b/recipes-kernel/linux/linux-yocto_3.8.bbappend
> deleted file mode 100644
> index c029c05..0000000
> --- a/recipes-kernel/linux/linux-yocto_3.8.bbappend
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> -
> -SRC_URI += "file://xt-checksum.scc \
> -            file://ebtables.scc \
> -           file://vswitch.scc \
> -           file://lxc.scc \
> -           "
> -module_autoload_openvswitch = "openvswitch"
> -KERNEL_FEATURES_append = " features/kvm/qemu-kvm-enable.scc"
> -
> -module_autoload_kvm = "kvm"
> -module_autoload_kvm-amd = "kvm-amd"
> -module_autoload_kvm-intel = "kvm-intel"
> -
> -# aufs kernel support required for xen-image-minimal
> -KERNEL_FEATURES_append += "${@base_contains('DISTRO_FEATURES', 'aufs', ' features/aufs/aufs-enable.scc', '', d)}"
> -
> -# xen kernel support
> -SRC_URI += "${@base_contains('DISTRO_FEATURES', 'xen', ' file://xen.scc', '', d)}"
> --
> 1.7.9.5
>
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

