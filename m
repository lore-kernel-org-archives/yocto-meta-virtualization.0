Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DE40DE00563; Tue, 29 Jul 2014 07:06:55 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.217.169 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lb0-f169.google.com (mail-lb0-f169.google.com
	[209.85.217.169])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0DD60E00558
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 Jul 2014 07:06:47 -0700 (PDT)
Received: by mail-lb0-f169.google.com with SMTP id s7so7045400lbd.28
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 Jul 2014 07:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=kfqloiB5q4wUjLruqlaO2LusRqRSKljtzTpU9+b9c/w=;
	b=0y8PNIIlqGeffeJdSdGAjC6PlD8riEyvyC+3DW2olh+NJpIaij1Ac+SU+DNLExp8Bf
	JnBDpJNsCbaa0Yx5iyaXWov3beJx3shcjY856VnaxaNrL0jhzLPduuRKNEgLsrL8tmVh
	yPCHOSYTFj0QCLcVYe4nXtWLvgz4sIOzQGdivMytHtwMgAGB1IghRwpNKBaLfPg8qZ9b
	S9/mPKF9dNyTCHa+w+GJI/dlXD3eVYEFujT/KF1gMYbEzbUa6I9FCN2BQSpZ0aguvm4h
	9FkAkaqVj3duvevaNwwVq+H1pmXfTIwzc7z1ValnsQPFJ15gzb7zrgstdtIHTYqJKNkA
	d0KQ==
MIME-Version: 1.0
X-Received: by 10.112.124.148 with SMTP id mi20mr2381117lbb.73.1406642806345; 
	Tue, 29 Jul 2014 07:06:46 -0700 (PDT)
Received: by 10.112.202.67 with HTTP; Tue, 29 Jul 2014 07:06:46 -0700 (PDT)
In-Reply-To: <1406634994-37663-1-git-send-email-maxin.john@enea.com>
References: <1406634994-37663-1-git-send-email-maxin.john@enea.com>
Date: Tue, 29 Jul 2014 10:06:46 -0400
Message-ID: <CADkTA4PvyfBhpYBaJPfcUFnRFYaHRYvrFb8Do5OqiOPF0EwPaA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: "Maxin B. John" <maxin.john@enea.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] netcf: remove recipe
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
X-List-Received-Date: Tue, 29 Jul 2014 14:06:55 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jul 29, 2014 at 7:56 AM, Maxin B. John <maxin.john@enea.com> wrote:
> meta-networking layer includes a newer version (0.2.3) of netcf recipe.
> Since meta-virtualization layer depends on meta-oe/meta-networking layer,
> we can avoid duplication by removing this recipe.

agreed. I see no reason to tightly control the version or capabilities
for netcf, so
I've merged this change.

Bruce

>
> Signed-off-by: Maxin B. John <maxin.john@enea.com>
> ---
>  ...ix-network-driver-check-issue-on-opensuse.patch | 28 ----------------------
>  recipes-networking/netcf/netcf_git.bb              | 27 ---------------------
>  2 files changed, 55 deletions(-)
>  delete mode 100644 recipes-networking/netcf/netcf/0001-fix-network-driver-check-issue-on-opensuse.patch
>  delete mode 100644 recipes-networking/netcf/netcf_git.bb
>
> diff --git a/recipes-networking/netcf/netcf/0001-fix-network-driver-check-issue-on-opensuse.patch b/recipes-networking/netcf/netcf/0001-fix-network-driver-check-issue-on-opensuse.patch
> deleted file mode 100644
> index eef5b5c..0000000
> --- a/recipes-networking/netcf/netcf/0001-fix-network-driver-check-issue-on-opensuse.patch
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -From 285871a2db42727665a2ab7fc16fa2fb8fa830d3 Mon Sep 17 00:00:00 2001
> -From: Ting Liu <b28495@freescale.com>
> -Date: Thu, 23 May 2013 17:39:35 +0800
> -Subject: [PATCH] fix network driver check issue on opensuse
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Ting Liu <b28495@freescale.com>
> ----
> - configure.ac |    2 +-
> - 1 files changed, 1 insertions(+), 1 deletions(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index 3f30865..708eb28 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -77,7 +77,7 @@ fi
> - if test "x$with_driver" = "xcheck" && test -f /etc/ubuntu_version ; then
> -   with_driver=debian
> - fi
> --if test "x$with_driver" = "xcheck" && test -f /etc/suse-release ; then
> -+if test "x$with_driver" = "xcheck" && (test -f /etc/suse-release || test -f /etc/SuSE-release) ; then
> -   with_driver=suse
> - fi
> - if test "x$with_driver" = "xcheck" ; then
> ---
> -1.7.3.4
> -
> diff --git a/recipes-networking/netcf/netcf_git.bb b/recipes-networking/netcf/netcf_git.bb
> deleted file mode 100644
> index 218cd17..0000000
> --- a/recipes-networking/netcf/netcf_git.bb
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -SUMMARY = "netcf"
> -DESCRIPTION = "netcf is a cross-platform network configuration library."
> -HOMEPAGE = "https://fedorahosted.org/netcf/"
> -SECTION = "console/tools"
> -LICENSE = "LGPLv2.1"
> -
> -LIC_FILES_CHKSUM = "file://COPYING;md5=bbb461211a33b134d42ed5ee802b37ff"
> -
> -SRCREV = "2b0d9ca226c13d7150382367f62b256bdb2db5ef"
> -PR = "r1"
> -PV = "0.2.2+git${SRCPV}"
> -
> -SRC_URI = "git://git.fedorahosted.org/netcf.git;protocol=git \
> -           file://0001-fix-network-driver-check-issue-on-opensuse.patch \
> -"
> -
> -DEPENDS += "augeas libnl libxslt libxml2"
> -
> -S = "${WORKDIR}/git"
> -
> -inherit gettext autotools-brokensep
> -
> -do_configure_prepend() {
> -       cd ${S}
> -       ./bootstrap
> -}
> -
> --
> 1.9.1
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

