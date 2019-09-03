Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 307CAE00DA7; Tue,  3 Sep 2019 13:00:48 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	https://www.dnswl.org/, no *      trust
	*      [209.85.167.67 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7C9A7E00D68
	for <meta-virtualization@yoctoproject.org>;
	Tue,  3 Sep 2019 13:00:44 -0700 (PDT)
Received: by mail-lf1-f67.google.com with SMTP id j4so13910967lfh.8
	for <meta-virtualization@yoctoproject.org>;
	Tue, 03 Sep 2019 13:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=yjG2p0ky0du4AH2XUrM8jv2BBCK606ia33ETEyr5kFM=;
	b=QRAxcOpV6rSkswXbRJw4sVfjpCY5qEgLrRLWODYwxRuex/zuzcuzi2K8+oh7ZdcufS
	m34szy3jH4BcA+4ZTdNqF/YH5iw/0XWThzLxNEKO23nb4PcWTaibU6kGDw4RUnvB02aE
	L64ANuJ0ps+A+uQ6a+Icc6K6PAqnMrNdYQYif/yKh8WMp2vn/dLwrOUOz4BmWTWmGOl3
	wxPggZtnQpp4swmRb4fe0N/ad8La+QgxROMEpB28wGS9S6cj5uoiEz+PpQbz92BUyt1l
	sD/p99g7NV+B2RxWuxxLUnfxGyHCWh7Ge7IfhDjQdnBjpNz7UALdC/sucJB/Xqd0op2M
	l/IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=yjG2p0ky0du4AH2XUrM8jv2BBCK606ia33ETEyr5kFM=;
	b=gmYV47GpV8nlnpnq8/xaEaIhtw0VClfCfnvwXI0krGd+WL+DdY5MK0QPpbpPEHzV03
	GDiwU34SNJOsDSe19nGk1KaGzz88PhUBxyAS0al5PLjvmszf5K0oP8nGcLcYWG0gTInp
	XJJo6CPOj0GrSH/rT9kOnkd31iaBYInav5U1zMEIMMPXF4tY3ccNBDPXlYuGa6CLDC1v
	r96SNw+g1uVthweqXiDSIm0oCruEm77ov9eGlJaMEi3FPm0028/6pfeUrXbe+IS8VB7W
	LkWYg0nXjFlJQxqNAI69Kng4T4TTMHIq3HvZFxjoGRhRzGZ6EVtnO316mhNRmfySt+FN
	h/8g==
X-Gm-Message-State: APjAAAWlN1mKlUaDvIm03xxEqPj7UgmiG5IuCttQZLze++5rqdGPaxbP
	SuAnRq8yp2Az1OiFwCDbFYCRf/1cmirwqrvYRTj7XLsa
X-Google-Smtp-Source: APXvYqzXVP/LH1gtyoNUswc2QYX9AJfzpWpHJY/i3EbgVy4aXr8z2ceK9UrBRGWHKEgF+SN4XekrsdJ42tsGlyi1RhI=
X-Received: by 2002:ac2:4117:: with SMTP id b23mr6462702lfi.36.1567540843471; 
	Tue, 03 Sep 2019 13:00:43 -0700 (PDT)
MIME-Version: 1.0
References: <1567145853-76109-1-git-send-email-changqing.li@windriver.com>
	<1567145853-76109-2-git-send-email-changqing.li@windriver.com>
In-Reply-To: <1567145853-76109-2-git-send-email-changqing.li@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 3 Sep 2019 16:00:32 -0400
Message-ID: <CADkTA4P58sLyWgf+z+xNKFjZuHW=bdwiSM8C0KX4k0+akA9TxA@mail.gmail.com>
To: changqing.li@windriver.com
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH 2/2] diod: support usrmerge
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
X-List-Received-Date: Tue, 03 Sep 2019 20:00:48 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Fri, Aug 30, 2019 at 2:20 AM <changqing.li@windriver.com> wrote:
>
> From: Changqing Li <changqing.li@windriver.com>
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  recipes-extended/diod/diod_1.0.24.bb               |  3 ++
>  ...0001-drod-add-option-to-config-systemddir.patch | 51 ++++++++++++++++++++++
>  2 files changed, 54 insertions(+)
>  create mode 100644 recipes-extended/diod/files/0001-drod-add-option-to-config-systemddir.patch
>
> diff --git a/recipes-extended/diod/diod_1.0.24.bb b/recipes-extended/diod/diod_1.0.24.bb
> index bb5707e..a4a8528 100644
> --- a/recipes-extended/diod/diod_1.0.24.bb
> +++ b/recipes-extended/diod/diod_1.0.24.bb
> @@ -16,9 +16,12 @@ SRC_URI = "git://github.com/chaos/diod.git;protocol=git \
>             file://0001-build-allow-builds-to-work-with-separate-build-dir.patch \
>             file://0002-auto.diod.in-remove-bashisms.patch \
>             file://0001-diod-ops.c-add-header-file-for-makedev.patch \
> +           file://0001-drod-add-option-to-config-systemddir.patch \
>            "
>  DEPENDS = "libcap ncurses tcp-wrappers lua"
>
> +EXTRA_OECONF = "--with-systemddir=${systemd_unitdir}/system"
> +
>  S = "${WORKDIR}/git"
>
>  inherit autotools systemd
> diff --git a/recipes-extended/diod/files/0001-drod-add-option-to-config-systemddir.patch b/recipes-extended/diod/files/0001-drod-add-option-to-config-systemddir.patch
> new file mode 100644
> index 0000000..8b70d8f
> --- /dev/null
> +++ b/recipes-extended/diod/files/0001-drod-add-option-to-config-systemddir.patch
> @@ -0,0 +1,51 @@
> +From 365159534b1981dfe291ecc05d2455f32652a166 Mon Sep 17 00:00:00 2001
> +From: Changqing Li <changqing.li@windriver.com>
> +Date: Mon, 26 Aug 2019 18:00:39 +0800
> +Subject: [PATCH] drod: add option to config systemddir
> +
> +Upstream-Status: Pending
> +
> +Not need to send upstream, since upstream have refactor
> +related code, but not released. and this version release
> +4 years ago, not proper to just backport one or more
> +commits, this patch maybe could be dropped after upgrade.
> +
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +---
> + configure.ac        | 9 +++++++++
> + scripts/Makefile.am | 2 +-
> + 2 files changed, 10 insertions(+), 1 deletion(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 1cb8579..3e4a5ec 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -25,6 +25,15 @@ AC_DEFINE([_GNU_SOURCE], 1,
> +           [Define _GNU_SOURCE so that we get all necessary prototypes])
> +
> + ##
> ++#Add option to config systemddir
> ++##
> ++AC_ARG_WITH([systemddir],
> ++  [AS_HELP_STRING([--with-systemddir=DIR], [systemd dir])],
> ++  [systemddir=$withval],
> ++  [systemddir="/lib/systemd/system"])
> ++AC_SUBST([systemddir], [$systemddir])
> ++
> ++##
> + # Checks for programs
> + ##
> + AC_PROG_CC
> +diff --git a/scripts/Makefile.am b/scripts/Makefile.am
> +index 2aba728..40822b7 100644
> +--- a/scripts/Makefile.am
> ++++ b/scripts/Makefile.am
> +@@ -1,4 +1,4 @@
> +-systemddir=/lib/systemd/system
> ++systemddir=@systemddir@
> +
> + install-data-local:
> +       $(top_srcdir)/config/install-sh -m 755 ./auto.diod \
> +--
> +2.7.4
> +
> --
> 2.7.4
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

