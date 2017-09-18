Return-Path: <alistair23@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A06ADE00C82; Mon, 18 Sep 2017 13:18:16 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (alistair23[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [74.125.82.65 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [74.125.82.65 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EC7C2E009F5
	for <meta-virtualization@yoctoproject.org>;
	Mon, 18 Sep 2017 13:18:15 -0700 (PDT)
Received: by mail-wm0-f65.google.com with SMTP id r136so1960794wmf.3
	for <meta-virtualization@yoctoproject.org>;
	Mon, 18 Sep 2017 13:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=mNgroVF+IZR/F9f8rFZcYE9SeJJjxFb8HNSW6JKEPcA=;
	b=mtTZ8e7BvakDKwVH/kaQo9z2qotOUtnaop7nxP17nM287TK6LxBric3quk/o1Pa7L7
	t6Rf62U9B2lkLhqcV3NsB8OChLZff53xYFlyTyPq56eBL72HEAQA6vOmdc6UT0/CMZdE
	ca32+VG3X+z/rOuhgt6XpMTswyTRlSakY1hwc3mGs0Ynaj6IdYmNPFquV7EiEEw2mhHH
	HwDGsBHS/m7DXbfp+xWEq6d74PpNWpBmUhG1deQt7iOH1HB0Iki01ICyy+NzMgOdZez2
	A5sSCVyj5BwdCKGsSL0zjb8t4BfrRgAUPuG5uYErkx11OLwnCdfI+DPCPeAfIQelx00f
	q66w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=mNgroVF+IZR/F9f8rFZcYE9SeJJjxFb8HNSW6JKEPcA=;
	b=ZAXlf0GjDlM7nCmVQdZLW817L0XoiYs+2av4LL45MpiM3ac9lOGEE2hv1gX8+shGBk
	XTxwOqlA4OnyCBvsZIQXrSznkaM8PGdLub/uGRjN9+plk8e2QkjD2LFQtqWrdtZqdyTP
	BIKEfB+fRsdxZdRfH3GWPTU09jNrqb4pnk2Zw+S9JRhPkEbLbZdcdqENHFtVd7J52Ol3
	vTZJ19W98PJ+uiFSmercwAvrH3IvUfzekb6szl/EIf1QzfoXtJaayE0LwdiSl8O66Oe0
	mgF7vCv9UV0RbMC6x40CbnMEi2oolK4FBUhaiVZtpt3XxEikMCqddPly6nYjFMg9sRmu
	9Ufw==
X-Gm-Message-State: AHPjjUgu9gNShzcvxef9bgk30e9eu3Y569ud5sKLmGkAyvIzKitrQ8Ch
	uYjnSRYg3igkd/Q4c/u0LY9YFOQCjzWssJIYCmU=
X-Google-Smtp-Source: AOwi7QD/Mqi8XP0m7xV6XRRR+dblwNaBgqcY+3dIFh9ySoBtGItMcVu6zzXkrVPYQ4R9RuHGu6++5LDjpXG0QRdsN8g=
X-Received: by 10.28.135.209 with SMTP id j200mr9270365wmd.40.1505765894773;
	Mon, 18 Sep 2017 13:18:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.191.130 with HTTP; Mon, 18 Sep 2017 13:17:44 -0700 (PDT)
In-Reply-To: <1505697753-19300-1-git-send-email-christopher.w.clark@gmail.com>
References: <1505697753-19300-1-git-send-email-christopher.w.clark@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 18 Sep 2017 13:17:44 -0700
Message-ID: <CAKmqyKP_xL0-Y=1m+CE1dHgcLWkD3Gib_fJmF-sGCF8vxhigTQ@mail.gmail.com>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: nathan.studer@dornerworks.com, meta-virtualization@yoctoproject.org,
	cardoe@gentoo.org
Subject: Re: [PATCH] xen: patch to fix ARM libxc missing variable init
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
X-List-Received-Date: Mon, 18 Sep 2017 20:18:16 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Sep 17, 2017 at 6:22 PM,  <christopher.w.clark@gmail.com> wrote:
> From: Christopher Clark <christopher.w.clark@gmail.com>
>
> Fix Xen 4.9.0 build error on ARM architecture with gcc 7:
> Import upstream Xen patch 88bfbf90e35f1213f9967a97dee0b2039f9998a4
>
> Error was:
> xc_dom_arm.c:229:31: error: 'domctl.u.address_size.size' may be used
> uninitialized in this function [-Werror=maybe-uninitialized]
>
> Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>
Tested-by: Alistair Francis <alistair.francis@xilinx.com>

Thanks,
Alistair

> ---
>
> This patch has been requested for inclusion in the upstream 4.9 branch
> and later Xen 4.9 releases.
>
> Please use my gmail address for any correspondence.
>
>  ...x-libxc-xc_dom_arm-missing-initialization.patch | 36 ++++++++++++++++++++++
>  recipes-extended/xen/xen_4.9.0.bb                  |  2 ++
>  2 files changed, 38 insertions(+)
>  create mode 100644 recipes-extended/xen/files/fix-libxc-xc_dom_arm-missing-initialization.patch
>
> diff --git a/recipes-extended/xen/files/fix-libxc-xc_dom_arm-missing-initialization.patch b/recipes-extended/xen/files/fix-libxc-xc_dom_arm-missing-initialization.patch
> new file mode 100644
> index 0000000..05016a7
> --- /dev/null
> +++ b/recipes-extended/xen/files/fix-libxc-xc_dom_arm-missing-initialization.patch
> @@ -0,0 +1,36 @@
> +commit 88bfbf90e35f1213f9967a97dee0b2039f9998a4
> +Author: Bernd Kuhls <bernd.kuhls@t-online.de>
> +Date:   Sat Aug 19 16:21:42 2017 +0200
> +
> +    tools/libxc/xc_dom_arm: add missing variable initialization
> +
> +    The variable domctl.u.address_size.size may remain uninitialized if
> +    guest_type is not one of xen-3.0-aarch64 or xen-3.0-armv7l. And the
> +    code precisely checks if this variable is still 0 to decide if the
> +    guest type is supported or not.
> +
> +    This fixes the following build failure with gcc 7.x:
> +
> +    xc_dom_arm.c:229:31: error: 'domctl.u.address_size.size' may be used uninitialized in this function [-Werror=maybe-uninitialized]
> +         if ( domctl.u.address_size.size == 0 )
> +
> +    Patch originally taken from
> +    https://www.mail-archive.com/xen-devel@lists.xen.org/msg109313.html.
> +
> +    Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> +    Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> +    Acked-by: Wei Liu <wei.liu2@citrix.com>
> +
> +diff --git a/tools/libxc/xc_dom_arm.c b/tools/libxc/xc_dom_arm.c
> +index e7d4bd0..e669fb0 100644
> +--- a/tools/libxc/xc_dom_arm.c
> ++++ b/tools/libxc/xc_dom_arm.c
> +@@ -223,6 +223,8 @@ static int set_mode(xc_interface *xch, domid_t domid, char *guest_type)
> +
> +     domctl.domain = domid;
> +     domctl.cmd    = XEN_DOMCTL_set_address_size;
> ++    domctl.u.address_size.size = 0;
> ++
> +     for ( i = 0; i < ARRAY_SIZE(types); i++ )
> +         if ( !strcmp(types[i].guest, guest_type) )
> +             domctl.u.address_size.size = types[i].size;
> diff --git a/recipes-extended/xen/xen_4.9.0.bb b/recipes-extended/xen/xen_4.9.0.bb
> index 0b20936..8e9c802 100644
> --- a/recipes-extended/xen/xen_4.9.0.bb
> +++ b/recipes-extended/xen/xen_4.9.0.bb
> @@ -1,7 +1,9 @@
> +FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
>  require xen.inc
>
>  SRC_URI = " \
>      https://downloads.xenproject.org/release/xen/${PV}/xen-${PV}.tar.gz \
> +    file://fix-libxc-xc_dom_arm-missing-initialization.patch \
>      "
>
>  SRC_URI[md5sum] = "f0a753637630f982dfbdb64121fd71e1"
> --
> 2.7.4
>

