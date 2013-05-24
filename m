Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f44.google.com (mail-la0-f44.google.com
	[209.85.215.44])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 895BAE014E9
	for <meta-virtualization@yoctoproject.org>;
	Fri, 24 May 2013 09:35:05 -0700 (PDT)
Received: by mail-la0-f44.google.com with SMTP id fr10so4683248lab.3
	for <meta-virtualization@yoctoproject.org>;
	Fri, 24 May 2013 09:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=ZIBZrzobW6dUsaHZI7n0D/WRL1o8lRztdW9LQFgMGl4=;
	b=CYkwQFWRXpMJR2Rd/euWzCQgKmJYxKOC2fMYtO/Lv1KBEzXqdQz+/qaNg1T4mzNHYB
	1mfPVtLYuqYw3yEroXkVo4i7uUWH09lW88GingnH+cV0per8tYWPcfhOUQ1NHvJ3xq0l
	4bIqmAxXzeezy65yiWe5q/uIUxsWj0xhUNNex72pLsjZM5kWnaTZdqvNaFzD7F+FHIva
	xv+pgMf818DTJUTMRDvCeqZ7J9IBCmLebCsidrVkYEsHuj31t1u2Kh3BA5NaCfAY86ux
	VDjhZk5YRljB9wbvJYDYBYvyY7vXA4qQH6XLCRruzcRx1XavUviEHXTvfXKDjjRpfOM7
	ZZXQ==
MIME-Version: 1.0
X-Received: by 10.112.131.129 with SMTP id om1mr8637989lbb.45.1369413304237;
	Fri, 24 May 2013 09:35:04 -0700 (PDT)
Received: by 10.112.166.100 with HTTP; Fri, 24 May 2013 09:35:04 -0700 (PDT)
In-Reply-To: <1369303035-7326-1-git-send-email-b28495@freescale.com>
References: <1369303035-7326-1-git-send-email-b28495@freescale.com>
Date: Fri, 24 May 2013 12:35:04 -0400
Message-ID: <CADkTA4MCRTDKB4J=kWB4YVX4AwJ=84mYFRhdOoiTpX4TXPJvpw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: b28495@freescale.com
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>, b19537@freescale.com
Subject: Re: [PATCH] netcf: fix network driver check issue on opensuse
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
X-List-Received-Date: Fri, 24 May 2013 16:35:06 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, May 23, 2013 at 5:57 AM,  <b28495@freescale.com> wrote:
> From: Ting Liu <b28495@freescale.com>
>

Looks fine to me. I've staged the change.

Bruce

> Signed-off-by: Ting Liu <b28495@freescale.com>
> ---
>  ...ix-network-driver-check-issue-on-opensuse.patch |   28 ++++++++++++++++++++
>  recipes-networking/netcf/netcf_git.bb              |    6 +++-
>  2 files changed, 32 insertions(+), 2 deletions(-)
>  create mode 100644 recipes-networking/netcf/netcf/0001-fix-network-driver-check-issue-on-opensuse.patch
>
> diff --git a/recipes-networking/netcf/netcf/0001-fix-network-driver-check-issue-on-opensuse.patch b/recipes-networking/netcf/netcf/0001-fix-network-driver-check-issue-on-opensuse.patch
> new file mode 100644
> index 0000000..eef5b5c
> --- /dev/null
> +++ b/recipes-networking/netcf/netcf/0001-fix-network-driver-check-issue-on-opensuse.patch
> @@ -0,0 +1,28 @@
> +From 285871a2db42727665a2ab7fc16fa2fb8fa830d3 Mon Sep 17 00:00:00 2001
> +From: Ting Liu <b28495@freescale.com>
> +Date: Thu, 23 May 2013 17:39:35 +0800
> +Subject: [PATCH] fix network driver check issue on opensuse
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Ting Liu <b28495@freescale.com>
> +---
> + configure.ac |    2 +-
> + 1 files changed, 1 insertions(+), 1 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 3f30865..708eb28 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -77,7 +77,7 @@ fi
> + if test "x$with_driver" = "xcheck" && test -f /etc/ubuntu_version ; then
> +   with_driver=debian
> + fi
> +-if test "x$with_driver" = "xcheck" && test -f /etc/suse-release ; then
> ++if test "x$with_driver" = "xcheck" && (test -f /etc/suse-release || test -f /etc/SuSE-release) ; then
> +   with_driver=suse
> + fi
> + if test "x$with_driver" = "xcheck" ; then
> +--
> +1.7.3.4
> +
> diff --git a/recipes-networking/netcf/netcf_git.bb b/recipes-networking/netcf/netcf_git.bb
> index 60fc446..d380e95 100644
> --- a/recipes-networking/netcf/netcf_git.bb
> +++ b/recipes-networking/netcf/netcf_git.bb
> @@ -7,10 +7,12 @@ LICENSE = "LGPLv2.1"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=bbb461211a33b134d42ed5ee802b37ff"
>
>  SRCREV = "2b0d9ca226c13d7150382367f62b256bdb2db5ef"
> -PR = "r0"
> +PR = "r1"
>  PV = "0.2.2+git${SRCPV}"
>
> -SRC_URI = "git://git.fedorahosted.org/netcf.git;protocol=git"
> +SRC_URI = "git://git.fedorahosted.org/netcf.git;protocol=git \
> +           file://0001-fix-network-driver-check-issue-on-opensuse.patch \
> +"
>
>  DEPENDS += "augeas libnl libxslt libxml2"
>
> --
> 1.7.3.4
>
>
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



--
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

