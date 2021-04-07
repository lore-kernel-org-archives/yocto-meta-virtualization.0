Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
 by mx.groups.io with SMTP id smtpd.web11.3216.1617775162570356042
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 06 Apr 2021 22:59:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IZdAjzSk;
 spf=pass (domain: gmail.com, ip: 209.85.210.47, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-ot1-f47.google.com with SMTP id h6-20020a0568300346b02901b71a850ab4so16975123ote.6
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 06 Apr 2021 22:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5H0GtW3qIt58yyDisuHDp/IqXsS5iAvmXESdhwOPSMg=;
        b=IZdAjzSkbW+J4HZlTUI/HWCPBlGioN3mZd6IhC6pkT/XoNOF6hgq4ky4vL3/8ivhWF
         E/8Y1ru9iPWRK8o1NR0aUTV53eI9gPzR+jD6TcMehHOyRugN1MtekO6wggcQCdEc4rxW
         AH1SY2jwnPKvCJGFMCqK/MW9TTpTO6VcI6xQx6KYdZVBy0d3gaWxXNWD564Pn4ogGVAP
         Dskl2O0qMbDEoNQ2Kt+DSQoYzLXbCu/LnHiRr9W59M5EuVGqL9RTh1IN7FZZxE8fBYIm
         0Dsw36wi1jwwrDYRU0mPwSOOHXmDnxSMVAuRJbfHeexGAgCGofrLzFhEFrk4cuulaj+p
         sztA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5H0GtW3qIt58yyDisuHDp/IqXsS5iAvmXESdhwOPSMg=;
        b=cOjv2e7ndeI+herEyszLCaF/Ff4i8xvwKmhgWIIAqZhYHz+1y3w2cIgCa0oxTTyTrh
         YVU99jhhzIJIrEiiVzxAMlZuxbsmc7a8eHknTC6MyrZ6hwDoeHie9cF7zD3Sqbw3f7zX
         ToLeD23TAZMMgEbf2u3NZ/NJUu/0qchx4TwfqEkJKBVylzs/BM0TEeciJsb6Gi+kuPOM
         MRnEZA/ZM7KYGH2aHKtiwQPfVWuatW92nEBvqcoGSzL+wTZ9kSaKxNUPnbF71PURHIWZ
         iHRbLR8Ol6S0hzb395GyZbWH1hXV6XtvmMTE3U7LwluVcSUwENmMicxDyvClcMGxMa3h
         7AcA==
X-Gm-Message-State: AOAM533vC8v4EY8g0ViL6WOSvB5F74DdQGUnh9fwkTLjIoEcdfpHlzaZ
	PUiW/1gWEl9VrtpO0AWNCG1fv+gs/ytENdqP1A4=
X-Google-Smtp-Source: ABdhPJy3mTaRcs1TQDvAAxMIZF7aH8LdaIV/88TbOrNpvBnHKFD2+CzTNYrllGqEYlQREVYSfUPNbmTu6+FUmuidk6I=
X-Received: by 2002:a9d:70ce:: with SMTP id w14mr1550586otj.183.1617775161872;
 Tue, 06 Apr 2021 22:59:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210404092619.2059377-1-Martin.Jansa@gmail.com>
In-Reply-To: <20210404092619.2059377-1-Martin.Jansa@gmail.com>
From: "Christopher Clark" <christopher.w.clark@gmail.com>
Date: Tue, 6 Apr 2021 22:59:10 -0700
Message-ID: <CACMJ4GaTFWE18fGWYPE0PWF1X=8gbGGWcp09bjc7fThc0sPcxg@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] xen: drop i686 support also from xen-tools/xen-python2
To: Martin Jansa <martin.jansa@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Sun, Apr 4, 2021 at 2:26 AM Martin Jansa <martin.jansa@gmail.com> wrote:
>
> * this commit seems no longer true for current version of xen:
>   commit a0964e2044cb1ccdd4f64173658ce7602257ff48
>   Author: Christopher Clark <christopher.w.clark@gmail.com>
>   Date:   Tue Feb 25 16:16:00 2020 -0800
>
>     xen, xen-tools: separate COMPATIBLE_HOST for hypervisor and tools
>
>     The tools have broader platform compatibility than the hypervisor.
>
> * xen-tools are failing to build for qemux86 as shown in:
>   http://errors.yoctoproject.org/Errors/Details/575367/
>
>   make[8]: Entering directory 'TOPDIR/tmp-glibc/work/core2-32-oe-linux/xen-tools/4.14+stableAUTOINC+ad844aa352-r0/git/tools/firmware/xen-dir/xen-root/xen'
>   echo "*** Xen x86/32 target no longer supported!"
>   *** Xen x86/32 target no longer supported!
>   make[8]: Leaving directory 'TOPDIR/tmp-glibc/work/core2-32-oe-linux/xen-tools/4.14+stableAUTOINC+ad844aa352-r0/git/tools/firmware/xen-dir/xen-root/xen'
>   ln -sf xen-root/xen/xen xen-shim
>   ln -sf xen-root/xen/xen-syms xen-shim-syms
>   ...
>   install: cannot stat 'xen-dir/xen-shim': No such file or directory
>   make[4]: *** [Makefile:51: install] Error 1
>
>   revert the commit and also drop i686 from map_xen_arch

Thanks for reporting this, Martin. I need to look into this. I can see
why this particular part of the tools build is not suitable for x86/32
but I don't think that it necessarily means that the entire suite of
xen-tools should be removed with it for x86/32, and if not then this
won't be the change that we will want to fix this build issue.

Christopher


>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  recipes-extended/xen/xen-arch.inc       | 3 +--
>  recipes-extended/xen/xen-hypervisor.inc | 3 ---
>  recipes-extended/xen/xen-python2.bb     | 3 ---
>  recipes-extended/xen/xen-tools.inc      | 2 --
>  recipes-extended/xen/xen.inc            | 2 ++
>  5 files changed, 3 insertions(+), 10 deletions(-)
>
> diff --git a/recipes-extended/xen/xen-arch.inc b/recipes-extended/xen/xen-arch.inc
> index fb0093e..9676045 100644
> --- a/recipes-extended/xen/xen-arch.inc
> +++ b/recipes-extended/xen/xen-arch.inc
> @@ -8,8 +8,7 @@ def map_xen_arch(a, d):
>      import re
>      valid_archs = d.getVar('valid_xen_archs').split()
>
> -    if   re.match("i.86", a):        return "x86_32"
> -    elif re.match("x86.64", a):      return "x86_64"
> +    if re.match("x86.64", a):      return "x86_64"
>      elif re.match("arm.*", a):       return "arm32"
>      elif re.match("aarch64.*", a):   return "arm64"
>      elif a in valid_archs:           return a
> diff --git a/recipes-extended/xen/xen-hypervisor.inc b/recipes-extended/xen/xen-hypervisor.inc
> index 916bd3c..d8e57e2 100644
> --- a/recipes-extended/xen/xen-hypervisor.inc
> +++ b/recipes-extended/xen/xen-hypervisor.inc
> @@ -6,9 +6,6 @@ DESCRIPTION = "The Xen hypervisor"
>  # this allows for varying the target architecture or toolchain used
>  # to build the different components. eg. 32-bit tools and a 64-bit hypervisor.
>
> -# The Xen hypervisor has a narrower compatible platform range than the Xen tools
> -COMPATIBLE_HOST = '(x86_64.*).*-linux|aarch64.*-linux|arm-.*-linux-gnueabi'
> -
>  inherit deploy python3native cml1
>
>  PACKAGES = " \
> diff --git a/recipes-extended/xen/xen-python2.bb b/recipes-extended/xen/xen-python2.bb
> index ad3c1fd..08d8e92 100644
> --- a/recipes-extended/xen/xen-python2.bb
> +++ b/recipes-extended/xen/xen-python2.bb
> @@ -6,9 +6,6 @@ SECTION = "console/tools"
>
>  SRCREV ?= "a5fcafbfbee55261853fba07149c1c795f2baf58"
>
> -# The same restriction as xen-tools.inc, because of the dependency on xen-tools-xentrace from xen-tools-xentrace-format
> -COMPATIBLE_HOST = 'i686-.*-linux|(x86_64.*).*-linux|aarch64.*-linux|arm-.*-linux-gnueabi'
> -
>  XEN_REL ?= "4.12"
>  XEN_BRANCH ?= "stable-4.12"
>
> diff --git a/recipes-extended/xen/xen-tools.inc b/recipes-extended/xen/xen-tools.inc
> index 722c503..35d0c58 100644
> --- a/recipes-extended/xen/xen-tools.inc
> +++ b/recipes-extended/xen/xen-tools.inc
> @@ -1,8 +1,6 @@
>  SUMMARY = "Xen hypervisor tools"
>  DESCRIPTION = "Tools and utility software for the Xen hypervisor"
>
> -COMPATIBLE_HOST = 'i686-.*-linux|(x86_64.*).*-linux|aarch64.*-linux|arm-.*-linux-gnueabi'
> -
>  inherit setuptools3 update-rc.d systemd deploy
>  require xen-blktap.inc
>
> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
> index 9e8fcad..8277939 100644
> --- a/recipes-extended/xen/xen.inc
> +++ b/recipes-extended/xen/xen.inc
> @@ -2,6 +2,8 @@ HOMEPAGE = "http://xen.org"
>  LICENSE = "GPLv2"
>  SECTION = "console/tools"
>
> +COMPATIBLE_HOST = '(x86_64.*).*-linux|aarch64.*-linux|arm-.*-linux-gnueabi'
> +
>  inherit autotools-brokensep
>
>  require xen-arch.inc
> --
> 2.30.2
>
