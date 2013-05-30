Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f170.google.com (mail-lb0-f170.google.com
	[209.85.217.170])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C9199E014FD
	for <meta-virtualization@yoctoproject.org>;
	Wed, 29 May 2013 19:31:52 -0700 (PDT)
Received: by mail-lb0-f170.google.com with SMTP id t13so62072lbd.1
	for <meta-virtualization@yoctoproject.org>;
	Wed, 29 May 2013 19:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=76LIuZJTU6R2x8CPS+7tL610xDXVk/UcUDitfQTjyXk=;
	b=Gjy2ESj9Ysoyityw154wfrerIh1pV2kIu2M3bhbldv7zCkwdv5AWiAeU6I2qvyut/3
	pTtkwDIy/tGSiSFOfPayt6jpf0ubOAriszPQ4W0KlfZhQnWpCSYhoGp/AVTp1twfpQV6
	kvjEkovR3ZtSPAVQkCLDx8wO9EVCHeK6ZeXQo0182KmG0vWHqkvIL6XRfdV00bPQw6J+
	7pZx9wgPtO5i7slf5QgvVEVv98RUX1SbhYK7q4s9Ngigb4RKDRQhx5SzJR5RbwqVyDp9
	cNEFdyoByo2dMN+61XSn8cd6EcAT4TfRMy62lhXH8lfKLwBl47WtLCOnk3nwOxQ30p8x
	TTrA==
MIME-Version: 1.0
X-Received: by 10.112.146.233 with SMTP id tf9mr2733952lbb.33.1369881111736;
	Wed, 29 May 2013 19:31:51 -0700 (PDT)
Received: by 10.112.71.14 with HTTP; Wed, 29 May 2013 19:31:51 -0700 (PDT)
In-Reply-To: <1369810513-19253-1-git-send-email-lei.yang@windriver.com>
References: <1369810513-19253-1-git-send-email-lei.yang@windriver.com>
Date: Wed, 29 May 2013 22:31:51 -0400
Message-ID: <CADkTA4OL+3NRFUGmmCNMaD+Z9pez=aPqwi0am1dHbKRFhC8y4A@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: lei yang <lei.yang@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] libvirt: Enable selinux if selinux is available
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
X-List-Received-Date: Thu, 30 May 2013 02:31:53 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, May 29, 2013 at 2:55 AM,  <lei.yang@windriver.com> wrote:
> From: Lei Yang <lei.yang@windriver.com>
>
> Enable selinux when "DISTRO_FEATURES" contains selinux'

Looks good to me. Staged locally, I'll push it out soon.

Bruce

>
> Signed-off-by: Lei Yang <lei.yang@windriver.com>
> ---
>  recipes-extended/libvirt/libvirt_1.0.3.bb |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-extended/libvirt/libvirt_1.0.3.bb b/recipes-extended/libvirt/libvirt_1.0.3.bb
> index 989b8b1..b0a4e0a 100644
> --- a/recipes-extended/libvirt/libvirt_1.0.3.bb
> +++ b/recipes-extended/libvirt/libvirt_1.0.3.bb
> @@ -112,7 +112,7 @@ INITSCRIPT_PARAMS_${PN}-libvirtd = "defaults 72"
>
>  # full config
>  PACKAGECONFIG ??= "qemu yajl xen libxl xen-inotify uml openvz vmware vbox esx \
> -                  polkit lxc test remote macvtap libvirtd netcf udev python"
> +                  polkit lxc test remote macvtap libvirtd netcf udev python ${@base_contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)}"
>
>  PACKAGECONFIG[qemu] = "--with-qemu,--without-qemu,qemu"
>  PACKAGECONFIG[yajl] = "--with-yajl,--without-yajl,yajl,yajl"
> @@ -136,7 +136,7 @@ PACKAGECONFIG[libvirtd] = "--with-libvirtd,--without-libvirtd"
>  PACKAGECONFIG[netcf] = "--with-netcf,--without-netcf,netcf,netcf"
>  PACKAGECONFIG[dtrace] = "--with-dtrace,--without-dtrace,,"
>  PACKAGECONFIG[udev] = "--with-udev --with-pciaccess,--without-udev,udev libpciaccess,"
> -
> +PACKAGECONFIG[selinux] = "--with-selinux,--without-selinux,libselinux"
>  # Enable the Python tool support
>  require libvirt-python.inc
>
> --
> 1.7.1
>



--
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

