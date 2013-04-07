Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f52.google.com (mail-la0-f52.google.com
	[209.85.215.52])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4B6FFE006CB
	for <meta-virtualization@yoctoproject.org>;
	Sat,  6 Apr 2013 20:52:04 -0700 (PDT)
Received: by mail-la0-f52.google.com with SMTP id ej20so229986lab.39
	for <meta-virtualization@yoctoproject.org>;
	Sat, 06 Apr 2013 20:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=VVi9pSe0mtgJPaFiKE/4+iKIGyBoa7qVPHKtfGA2a8k=;
	b=Fy9OjdrXdDhBq1rWE0vC5P2hQvbvDsIG6XhVnS5N6BAtn/0StsAc7zHJ0n0jy2T/6j
	QwDvPK5py51Z9KUUyMgiKTFF78xZPQoaIcgZP34tNF6Rys17x5QEXVOFN5D7hebBq5oW
	neGMyITyDAm7fRtuMdqocQh597Dd2oiheP+DVd3yAMypFACKM8ANFn1OlAgXYGO2pWq/
	g5A7qPXSa7Xa4NQ7tiQUh8NKYybhv8RW91YgacZpCvYsiTV4kR34Ted/oIcASwQL1D2d
	prMS4N1gHpvOSYMzmjPuKv9+fRvmV8Iu4GJzZe3WjBjq6YKl0eKMyMAmYVRgT9NigtFe
	M6fg==
MIME-Version: 1.0
X-Received: by 10.152.110.167 with SMTP id ib7mr9330938lab.22.1365306722653;
	Sat, 06 Apr 2013 20:52:02 -0700 (PDT)
Received: by 10.112.61.3 with HTTP; Sat, 6 Apr 2013 20:52:02 -0700 (PDT)
In-Reply-To: <1364397914-17992-2-git-send-email-b28495@freescale.com>
References: <1364397914-17992-1-git-send-email-b28495@freescale.com>
	<1364397914-17992-2-git-send-email-b28495@freescale.com>
Date: Sat, 6 Apr 2013 23:52:02 -0400
Message-ID: <CADkTA4O7ZFHG7eZn7-RrMZufJ0Fa5W=HdNJYB4pCmfuj2D39qw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: b28495@freescale.com
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>, b19537@freescale.com
Subject: Re: [PATCH 1/2] libvirt: add dependency on libpciaccess
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
X-List-Received-Date: Sun, 07 Apr 2013 03:52:04 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Mar 27, 2013 at 11:25 AM,  <b28495@freescale.com> wrote:
> From: Ting Liu <b28495@freescale.com>
>
> The configure log:
> | checking for UDEV... yes
> | configure: error: You must install the pciaccess module to build with udev
> | Configure failed. The contents of all config.log files follows to aid debugging
>
> Signed-off-by: Ting Liu <b28495@freescale.com>
> ---
>  recipes-extended/libvirt/libvirt_1.0.3.bb |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-extended/libvirt/libvirt_1.0.3.bb b/recipes-extended/libvirt/libvirt_1.0.3.bb
> index 372e874..ae2a9df 100644
> --- a/recipes-extended/libvirt/libvirt_1.0.3.bb
> +++ b/recipes-extended/libvirt/libvirt_1.0.3.bb
> @@ -3,10 +3,10 @@ HOMEPAGE = "http://libvirt.org"
>  LICENSE = "GPLv2+"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=fb919cc88dbe06ec0b0bd50e001ccf1f"
>  SECTION = "console/tools"
> -PR = "r0"
> +PR = "r1"
>
>  DEPENDS = "bridge-utils gnutls libxml2 lvm2 avahi parted curl libpcap util-linux e2fsprogs pm-utils \
> -          iptables ebtables dnsmasq readline"
> +          iptables ebtables dnsmasq readline libpciaccess"

This adds a hard dependency on something that is detected/optional.
libvirt has a
udev flag (--with-udev), it would be better to make this a PACKAGECONFIG
setting, and add the dependency only when udev was enabled.

Cheers,

Bruce

>
>  # These might be included by PACKAGECONFIG
>  #RRECOMMENDS+= "polkit qemu yajl libnl lxc netcf"
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

