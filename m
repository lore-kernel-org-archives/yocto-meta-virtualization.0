Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f171.google.com (mail-lb0-f171.google.com
	[209.85.217.171])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E9F49E014FF
	for <meta-virtualization@yoctoproject.org>;
	Tue, 14 May 2013 06:22:45 -0700 (PDT)
Received: by mail-lb0-f171.google.com with SMTP id v20so608792lbc.16
	for <meta-virtualization@yoctoproject.org>;
	Tue, 14 May 2013 06:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=2OzbvUp77L9+nzdWDro4ymhV+zb/b1bM7c7EPxjsdVQ=;
	b=YskmlyXR3RdLDI1ntGpQztu2qHAAGCv282NrRNcvOEJFMDukMwF9n9Jw99uMktU1JN
	n4mGivexUREwMg4NxER5S5EzLm8kh8luTcdcYdF7HIaTpt456kYt6TvOU1XY9t8nnpUN
	nkw04P+vQWwc3pqpchx58fWK3YC6DVhzDRGbbI1/gBdSpAX0wqr3Wvl+h9Q9pLvoSe+/
	f75GSdzTOtdwhc9Tu5nJSFHy3NpV7xKledz6QclzvI1Ct/ojX8nGeGyu6b423vArhlYs
	h/ieVKvPKx5rvyakG+dTklL7HAKe3dCqfIGtfvzTbifsE0cdwF58MTtI7ZfJKJw94eNu
	EqvQ==
MIME-Version: 1.0
X-Received: by 10.112.159.136 with SMTP id xc8mr15040363lbb.57.1368537764593; 
	Tue, 14 May 2013 06:22:44 -0700 (PDT)
Received: by 10.112.234.166 with HTTP; Tue, 14 May 2013 06:22:44 -0700 (PDT)
In-Reply-To: <1368524911-9993-1-git-send-email-hong-hua.yin@freescale.com>
References: <1368524911-9993-1-git-send-email-hong-hua.yin@freescale.com>
Date: Tue, 14 May 2013 09:22:44 -0400
Message-ID: <CADkTA4P82x1rpGt0v204GcE1GXkLJDsMo3D+ardRhmvk2mYdyw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Olivia Yin <hong-hua.yin@freescale.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] libvirt: fix warning of sysctl.d/libvirtd.conf
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
X-List-Received-Date: Tue, 14 May 2013 13:22:46 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, May 14, 2013 at 5:48 AM, Olivia Yin <hong-hua.yin@freescale.com> wrote:
> WARNING: QA Issue: libvirt: Files/directories were installed but not shipped
>   /usr/lib
>   /usr/lib/sysctl.d
>   /usr/lib/sysctl.d/libvirtd.conf
>
> $(DESTDIR)$(prefix)/lib is hardcoded in libvirt Makefile due to following
> reason that is stated in the daemon/Makefile.in of libvirt.
>     # Use $(prefix)/lib rather than $(libdir), since man sysctl.d insists on
>     # /usr/lib/sysctl.d/ even when libdir is /usr/lib64
>     @WITH_LIBVIRTD_TRUE@@WITH_SYSCTL_TRUE@install-sysctl:
>     @WITH_LIBVIRTD_TRUE@@WITH_SYSCTL_TRUE@  $(MKDIR_P) $(DESTDIR)$(prefix)/lib/sysctl.d
>     @WI TH_LIBVIRTD_TRUE@@WITH_SYSCTL_TRUE@  $(INSTALL_DATA) $(srcdir)/libvirtd.sysctl \
>     @WITH_LIBVIRTD_TRUE@@WITH_SYSCTL_TRUE@    $(DESTDIR)$(prefix)/lib/sysctl.d/libvirtd.conf

Great commit log!

>
> Signed-off-by: Olivia Yin <hong-hua.yin@freescale.com>
> ---
>  recipes-extended/libvirt/libvirt_1.0.3.bb |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
>
> diff --git a/recipes-extended/libvirt/libvirt_1.0.3.bb b/recipes-extended/libvirt/libvirt_1.0.3.bb
> index 88cb018..f0683c8 100644
> --- a/recipes-extended/libvirt/libvirt_1.0.3.bb
> +++ b/recipes-extended/libvirt/libvirt_1.0.3.bb
> @@ -3,7 +3,7 @@ HOMEPAGE = "http://libvirt.org"
>  LICENSE = "GPLv2+"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=fb919cc88dbe06ec0b0bd50e001ccf1f"
>  SECTION = "console/tools"
> -PR = "r2"
> +PR = "r333"

Typo ? or is your keystuck ? :)

Resend with that fixed, and I have no objections.

Bruce

>
>  DEPENDS = "bridge-utils gnutls libxml2 lvm2 avahi parted curl libpcap util-linux e2fsprogs pm-utils \
>            iptables ebtables dnsmasq readline"
> @@ -87,6 +87,7 @@ FILES_${PN}-libvirtd = "${sysconfdir}/init.d \
>         ${sysconfdir}/sysctl.d \
>         ${sysconfdir}/logrotate.d \
>         ${sysconfdir}/libvirt/libvirtd.conf \
> +        /usr/lib/sysctl.d/libvirtd.conf \
>         ${sbindir}/libvirtd"
>
>  FILES_${PN}-virsh = "${bindir}/virsh"
> --
> 1.7.0.4
>
>
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



--
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

