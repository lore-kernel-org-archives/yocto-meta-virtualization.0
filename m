Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f54.google.com (mail-la0-f54.google.com
	[209.85.215.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 29719E01248
	for <meta-virtualization@yoctoproject.org>;
	Sat,  6 Apr 2013 20:53:56 -0700 (PDT)
Received: by mail-la0-f54.google.com with SMTP id gw10so4494269lab.13
	for <meta-virtualization@yoctoproject.org>;
	Sat, 06 Apr 2013 20:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=suzkaLk5btVgX0eneTYzCNcN6X5ODP7TLt7fCg2JLUU=;
	b=ULP/7MIrnS64QAdZ6/bxWUEf+mjBicffCE73kd8LNAov52/wwLETaBCuqO4EjTVRaC
	qwtwM3zaf8/6RQTyfz6MPdevnoKh2N+QMVe1XEvwbfj2EQ0GGj1GLGACD6hepjFmcB+A
	eYF/S2bDy/KhPWzQQAFkpdK1KOc9MNV1JOTfmolROCY7KOo5cl2z8YBQp7lPBdZZr0U5
	tcI8C8/uEH5oo9PTATS09/pLU4lXNGBqm07234ywtEUwLleRVB5wSoNGXbnfnFL9fEqd
	SvkLO8U1IZ90ZILGWgwTjlQdGVRiMfJh6eIK6l3EnVla4+NVaNer46I9JrykFQ1tH+hJ
	g5Iw==
MIME-Version: 1.0
X-Received: by 10.152.134.164 with SMTP id pl4mr9325553lab.54.1365306835817;
	Sat, 06 Apr 2013 20:53:55 -0700 (PDT)
Received: by 10.112.61.3 with HTTP; Sat, 6 Apr 2013 20:53:55 -0700 (PDT)
In-Reply-To: <1364397914-17992-3-git-send-email-b28495@freescale.com>
References: <1364397914-17992-1-git-send-email-b28495@freescale.com>
	<1364397914-17992-3-git-send-email-b28495@freescale.com>
Date: Sat, 6 Apr 2013 23:53:55 -0400
Message-ID: <CADkTA4Phs7GRJpfrQHP6pu1nR4NQiW==d36WkxVXLfYAyvTtdg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: b28495@freescale.com
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>, b19537@freescale.com
Subject: Re: [PATCH 2/2] libvirt: package .debug and .a files in lock-driver
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
X-List-Received-Date: Sun, 07 Apr 2013 03:53:57 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Mar 27, 2013 at 11:25 AM,  <b28495@freescale.com> wrote:
> From: Ting Liu <b28495@freescale.com>
>
> Fix ERROR: QA Issue: non -staticdev package contains static .a
> library: libvirt path '.../packages-split/libvirt/usr/lib/libvirt/lock-driver/lockd.a'
> ERROR: QA Issue: non debug package contains .debug directory:
> libvirt path .../packages-split/libvirt/usr/lib/libvirt/lock-driver/.debug/lockd.so
> ERROR: QA run found fatal errors. Please consider fixing them.
> ERROR: Function failed: do_package_qa

This looks fine to me.

I've grabbed it and queued it here, if no one else has issues with it,
I'll push it early
next week.

Cheers,

Bruce

>
> Signed-off-by: Ting Liu <b28495@freescale.com>
> ---
>  recipes-extended/libvirt/libvirt_1.0.3.bb |    6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/recipes-extended/libvirt/libvirt_1.0.3.bb b/recipes-extended/libvirt/libvirt_1.0.3.bb
> index ae2a9df..e3cc22f 100644
> --- a/recipes-extended/libvirt/libvirt_1.0.3.bb
> +++ b/recipes-extended/libvirt/libvirt_1.0.3.bb
> @@ -3,7 +3,7 @@ HOMEPAGE = "http://libvirt.org"
>  LICENSE = "GPLv2+"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=fb919cc88dbe06ec0b0bd50e001ccf1f"
>  SECTION = "console/tools"
> -PR = "r1"
> +PR = "r2"
>
>  DEPENDS = "bridge-utils gnutls libxml2 lvm2 avahi parted curl libpcap util-linux e2fsprogs pm-utils \
>            iptables ebtables dnsmasq readline libpciaccess"
> @@ -94,8 +94,8 @@ FILES_${PN} += "${libdir}/libvirt/connection-driver \
>             ${datadir}/augeas \
>             ${datadir}/polkit-1"
>
> -FILES_${PN}-dbg += "${libdir}/libvirt/connection-driver/.debug"
> -FILES_${PN}-staticdev += "${libdir}/*.a ${libdir}/libvirt/connection-driver/*.a"
> +FILES_${PN}-dbg += "${libdir}/libvirt/connection-driver/.debug ${libdir}/libvirt/lock-driver/.debug"
> +FILES_${PN}-staticdev += "${libdir}/*.a ${libdir}/libvirt/connection-driver/*.a ${libdir}/libvirt/lock-driver/*.a"
>
>  INITSCRIPT_PACKAGES = "${PN}-libvirtd"
>  INITSCRIPT_NAME_${PN}-libvirtd = "libvirtd"
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

