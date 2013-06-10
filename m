Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f45.google.com (mail-la0-f45.google.com
	[209.85.215.45])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9AFACE01513
	for <meta-virtualization@yoctoproject.org>;
	Mon, 10 Jun 2013 08:25:25 -0700 (PDT)
Received: by mail-la0-f45.google.com with SMTP id fr10so5877813lab.18
	for <meta-virtualization@yoctoproject.org>;
	Mon, 10 Jun 2013 08:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=SK1oN9EtXjTrCakLNWQ78Q3kCoFqiI5f/udDgaGzD0s=;
	b=pHLFnD/NGC/5v0hBhW8HNkdmmrCoKV36cHKaRTl+cxc7d7ZNPy3qBooKUcA7KZiG78
	gcXdEszlgTfTiyBkCxgrLA+z2fhgUJ3bfAGJszJ0hjFY8a5skcSDkn72cebunWIBo+Wk
	VI3wX6Kj7ERiHU0ldwtVw4KLrgCqp8D4cfLP2QddbAGVUybrXKnV8d+dG/tfsFH+YlRx
	ZHVhKZs6s6jdhjqCpgqnjyC1kDcPK30x1BTiEvwgAU9LymmvpEIt3XRbA4Z86XeF/3eU
	XnnWV3gKz20nf1v0lb4dTJpcBxCpxz9BjstEWkUgxaTI5F+jTSA4TgfvDBznOHgFEHVn
	gZxg==
MIME-Version: 1.0
X-Received: by 10.112.169.5 with SMTP id aa5mr6642247lbc.71.1370877924009;
	Mon, 10 Jun 2013 08:25:24 -0700 (PDT)
Received: by 10.112.71.14 with HTTP; Mon, 10 Jun 2013 08:25:23 -0700 (PDT)
In-Reply-To: <1370573111-13102-1-git-send-email-b28495@freescale.com>
References: <1370573111-13102-1-git-send-email-b28495@freescale.com>
Date: Mon, 10 Jun 2013 11:25:23 -0400
Message-ID: <CADkTA4N=H5RUGCp-iL3ge_psPmpDPhbGTn2ywA3SOj6eo4bmwQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: b28495@freescale.com
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>, b19537@freescale.com
Subject: Re: [PATCH] libvirt: use libexecdir instead of hard code path
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
X-List-Received-Date: Mon, 10 Jun 2013 15:25:26 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Jun 6, 2013 at 10:45 PM,  <b28495@freescale.com> wrote:
> From: Ting Liu <b28495@freescale.com>

Thanks, I've staged the change locally. Will push it out shortly.

Bruce

>
> Signed-off-by: Ting Liu <b28495@freescale.com>
> ---
>  recipes-extended/libvirt/libvirt_1.0.3.bb |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-extended/libvirt/libvirt_1.0.3.bb b/recipes-extended/libvirt/libvirt_1.0.3.bb
> index b29c055..479ce7e 100644
> --- a/recipes-extended/libvirt/libvirt_1.0.3.bb
> +++ b/recipes-extended/libvirt/libvirt_1.0.3.bb
> @@ -3,7 +3,7 @@ HOMEPAGE = "http://libvirt.org"
>  LICENSE = "GPLv2+"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=fb919cc88dbe06ec0b0bd50e001ccf1f"
>  SECTION = "console/tools"
> -PR = "r5"
> +PR = "r6"
>
>  DEPENDS = "bridge-utils gnutls libxml2 lvm2 avahi parted curl libpcap util-linux e2fsprogs pm-utils \
>            iptables ebtables dnsmasq readline"
> @@ -149,5 +149,5 @@ do_install_append() {
>
>         # This will wind up in the libvirtd package, but will NOT be invoked by default.
>         #
> -       mv ${D}/usr/libexec/libvirt-guests.sh ${D}/${sysconfdir}/init.d
> +       mv ${D}/${libexecdir}/libvirt-guests.sh ${D}/${sysconfdir}/init.d
>  }
> --
> 1.7.9.7
>
>
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



--
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

