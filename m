Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f51.google.com (mail-la0-f51.google.com
	[209.85.215.51])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DD2F2E01487
	for <meta-virtualization@yoctoproject.org>;
	Wed, 17 Apr 2013 06:49:42 -0700 (PDT)
Received: by mail-la0-f51.google.com with SMTP id fo12so1482726lab.24
	for <meta-virtualization@yoctoproject.org>;
	Wed, 17 Apr 2013 06:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=fDwtbDYwJsc9T8hgqSN2J+9aRrRhHVr5EGkpKOyGqHU=;
	b=u5jxxGPtlq5LJQ+XwEFuYrrVxJzwtvLkeyoPl/sBNwPGhjoVrAyZrGnFmiH+wuiaQL
	6dT8izyysmVP9aCnkC68WZRVBRf7o1YYh22YOIRTfoWqgavrJUbvp1Y4ieCeKCW8T7dD
	B7YYqFRLS3qbvooG4zYQbpGQNheQz7iL1lsJW7PiQaYEtzY1MgOM8x7DK92VqrdeMxSZ
	2UXC9vSbZBDe5bFtAnYfXVsrEwoBUb2C79pmOf7RCmp6BxfozcDqlB2VHW4SmpWvX1G6
	4ZTmjeq8nBEM/JM+zYX00Qz0VhKRbIpuMpMIyTDMCbr5qmNnSPsv7HwEW1BJEahJTyvw
	ZUcQ==
MIME-Version: 1.0
X-Received: by 10.152.3.4 with SMTP id 4mr3570828lay.29.1366206581425; Wed, 17
	Apr 2013 06:49:41 -0700 (PDT)
Received: by 10.112.75.161 with HTTP; Wed, 17 Apr 2013 06:49:41 -0700 (PDT)
In-Reply-To: <1366184611-14137-1-git-send-email-b28495@freescale.com>
References: <1366184611-14137-1-git-send-email-b28495@freescale.com>
Date: Wed, 17 Apr 2013 09:49:41 -0400
Message-ID: <CADkTA4PC78nfhxBn=SOGAy+qnH2=q-HPw-OpzaSKmFX89kZjFw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: b28495@freescale.com
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>, b19537@freescale.com
Subject: Re: [PATCH] libvirt: add udev pkgconfig option
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
X-List-Received-Date: Wed, 17 Apr 2013 13:49:43 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Apr 17, 2013 at 3:43 AM,  <b28495@freescale.com> wrote:
> From: Ting Liu <b28495@freescale.com>
>
> libvirt depends on libpciaccess when udev was enabled.
>
> The configure log:
> | checking for UDEV... yes
> | configure: error: You must install the pciaccess module to build with udev
> | Configure failed. The contents of all config.log files follows to aid debugging
>

I have a similar change locally that I haven't sent out yet, I'll
merge this into
it and send a combined commit log.

Cheers,

Bruce

> Signed-off-by: Ting Liu <b28495@freescale.com>
> ---
>  recipes-extended/libvirt/libvirt_1.0.3.bb |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
>
> diff --git a/recipes-extended/libvirt/libvirt_1.0.3.bb b/recipes-extended/libvirt/libvirt_1.0.3.bb
> index c1c000e..f8bf79a 100644
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
>            iptables ebtables dnsmasq readline"
> @@ -129,6 +129,7 @@ PACKAGECONFIG[macvtap] = "--with-macvtap=yes,--with-macvtap=no,libnl,libnl"
>  PACKAGECONFIG[libvirtd] = "--with-libvirtd,--without-libvirtd"
>  PACKAGECONFIG[netcf] = "--with-netcf,--without-netcf,netcf,netcf"
>  PACKAGECONFIG[dtrace] = "--with-dtrace,--without-dtrace,,"
> +PACKAGECONFIG[udev] = "--with-udev,--without-udev,libpciaccess,"
>
>  # Enable the Python tool support
>  require libvirt-python.inc
> --
> 1.7.5.4
>
>
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



--
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

