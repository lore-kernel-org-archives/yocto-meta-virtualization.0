Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
 by mx.groups.io with SMTP id smtpd.web12.6040.1590113498485059317
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 21 May 2020 19:11:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Jf1Sbj9t;
 spf=pass (domain: gmail.com, ip: 209.85.208.65, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f65.google.com with SMTP id l5so8148679edn.7
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 21 May 2020 19:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BWaR+syjbsZzPv39Ld6q07PYiiy9nX0J0gM1eB+Na9k=;
        b=Jf1Sbj9tAAKupw4HCrNhD4YP6VV1Hy1ca0KE6cG1+HLr+Kaz+pLnNrwPwNS7DjWrK/
         mKE4mkCOdlul6VQVGE7+rnEvuYyJfvernn2KSgio5f7NhsmUnJZ0vjuEE5mJaWuCD7MD
         ngqa5UgynNjxMeKxMCRWpu6nUMmbIBpYuJDU2J2fhDPC9065l9+NSIwpZVlKDWMKzDRB
         268yIoJ2D6eqTlyHI+BA47Iw3iLGmOsTBXL6az9yz+3uOtJmqACylhiRBAsEyosAinq+
         jOzqraU+0SksJMW1cC/FnPkmsdbanWFsXVvR2URLiPdz/Ye3agHp95c06R5FH9mXMCLk
         2ozA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BWaR+syjbsZzPv39Ld6q07PYiiy9nX0J0gM1eB+Na9k=;
        b=lJfNNOl+r8Do1NHYbxGHAnnbqNFM8m6wIw4hbzwR91gyWw/9KYi2U+cKh6Inv5/D2s
         RbifkBSwO8ShOHtcTaL4tW4LkQPeCrW7jupZhFEDzycyGtlK7bZWk6/PYGhvoJgurCUW
         olrZpdqkjl9/3Iz6XYRCAo0pyxX0lDRrWtMs9hyBqfbGHAUeToICHBIqKPgGEtYTlxq8
         cf89wrQqF+NHgTqaFOCOJ0nLOsCKGehKg58UaXPiwYX5rHDZGDhHyw4wSbz07UUSeUIU
         fjlkqng7PnH0TiW1TkxjRxoON3Aoj6znNh9jIicIEuRciF0TJXedHJ6C6Uhrd0HtbVFV
         SYag==
X-Gm-Message-State: AOAM532ZLYjpcgeZOj5HkGZTIns1LDbtxs7m5kEINFmmx83vbo35Drie
	MlzmNKr0iO9b2zIxx926Wr8hVvTo0RNDyH/gfuk=
X-Google-Smtp-Source: ABdhPJwhvR2+v+4QBOY5sMHPICrSJMBuzPamyma73E74fTmuSHWechg/RQOX3Ex54sVyP4V3O8O6Qg396OgTt5og1JA=
X-Received: by 2002:a50:c314:: with SMTP id a20mr1245538edb.352.1590113496738;
 Thu, 21 May 2020 19:11:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200521122342.2354674-1-Martin.Jansa@gmail.com>
In-Reply-To: <20200521122342.2354674-1-Martin.Jansa@gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 21 May 2020 22:11:25 -0400
Message-ID: <CADkTA4PSfMiZRtv9UWBePJO43DEWtJpRTaeCgh9PPv2m30Jd+A@mail.gmail.com>
Subject: Re: [meta-virtualization][dunfell][master][PATCH] singularity: fix build with python3
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Thu, May 21, 2020 at 8:23 AM Martin Jansa <Martin.Jansa@gmail.com> wrote:
>
> * Fix python3native inherit added in:
>   https://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/commit/?id=a1e3f5c92cdee7c4259b7be643bd829ce7c1efa3
>   to actually work
> * also remove the work arounds for /usr/bin/python being python3
>   on the target device
> * I haven't tested this in runtime - I don't use it, it was just
>   showing that do_configure error in "bitbake world" builds, the
>   scripts might need some changes to be really compatible with
>   python3, but it was broken already, now it at least builds

Definitely an improvement .. My effort only made it parse :D

I've reached out to see if I can get some runtime testing help on this
one, and will see about the uprev.

Thanks for the fixup, it is now merged to the two branches.

Bruce


> * upgrade to new version with
>   https://github.com/hpcng/singularity/pull/1762/commits/3c05f06e6a1c490a4b4714bcdf5a0ce2b2498bb5
>   would be nice by someone who actually uses this
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  .../singularity/0001-Use-python3.patch        | 148 ++++++++++++++++++
>  .../singularity/singularity_git.bb            |  12 +-
>  2 files changed, 151 insertions(+), 9 deletions(-)
>  create mode 100644 recipes-containers/singularity/singularity/0001-Use-python3.patch
>
> diff --git a/recipes-containers/singularity/singularity/0001-Use-python3.patch b/recipes-containers/singularity/singularity/0001-Use-python3.patch
> new file mode 100644
> index 0000000..dbfe06e
> --- /dev/null
> +++ b/recipes-containers/singularity/singularity/0001-Use-python3.patch
> @@ -0,0 +1,148 @@
> +From 758c1edc7bf3d2a023954f4fcc9ddf46fd370272 Mon Sep 17 00:00:00 2001
> +From: Martin Jansa <Martin.Jansa@gmail.com>
> +Date: Thu, 21 May 2020 14:14:56 +0200
> +Subject: [PATCH] Use python3
> +
> +* without /usr/bin/python this just fails to configure with:
> +  | checking for python... no
> +  | configure: error: Please install python before installing.
> +  | WARNING: exit code 1 from a shell command.
> +
> +Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> +---
> + configure.ac                           | 6 +++---
> + etc/configure_transform.py             | 2 +-
> + libexec/python/helpers/json/add.py     | 2 +-
> + libexec/python/helpers/json/delete.py  | 2 +-
> + libexec/python/helpers/json/dump.py    | 2 +-
> + libexec/python/helpers/json/get.py     | 2 +-
> + libexec/python/helpers/json/inspect.py | 2 +-
> + libexec/python/import.py               | 2 +-
> + libexec/python/pull.py                 | 2 +-
> + libexec/python/shub/api.py             | 2 +-
> + libexec/python/size.py                 | 2 +-
> + 11 files changed, 13 insertions(+), 13 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 8ffa5ab32..71a1605b2 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -251,15 +251,15 @@ fi
> + # PYTHON
> + # ---------------------------------------------------------------------
> +
> +-AC_CHECK_PROG(PYTHON_CHECK,python,yes)
> ++AC_CHECK_PROG(PYTHON_CHECK,python3,yes)
> + if test x"$PYTHON_CHECK" != x"yes" ; then
> +-    AC_MSG_ERROR([Please install python before installing.])
> ++    AC_MSG_ERROR([Please install python3 before installing.])
> + else
> +
> +     PYTHON_MODULES="base64 datetime glob hashlib io itertools json math multiprocessing pickle pwd re shutil signal subprocess stat sys tarfile tempfile time"
> +     for PYTHON_MODULE in $PYTHON_MODULES; do
> +         AC_MSG_CHECKING([for the $PYTHON_MODULE python module])
> +-          python_module_result=`python -c "import $PYTHON_MODULE" 2>&1`
> ++          python_module_result=`python3 -c "import $PYTHON_MODULE" 2>&1`
> +           if test -z "$python_module_result"; then
> +               AC_MSG_RESULT([yes])
> +           else
> +diff --git a/etc/configure_transform.py b/etc/configure_transform.py
> +index a1ff5c427..9ec445d21 100755
> +--- a/etc/configure_transform.py
> ++++ b/etc/configure_transform.py
> +@@ -1,4 +1,4 @@
> +-#!/usr/bin/env python
> ++#!/usr/bin/env python3
> + #
> + # Copyright (c) 2017, SingularityWare, LLC. All rights reserved.
> + #
> +diff --git a/libexec/python/helpers/json/add.py b/libexec/python/helpers/json/add.py
> +index b24aec75a..22abbbeb9 100644
> +--- a/libexec/python/helpers/json/add.py
> ++++ b/libexec/python/helpers/json/add.py
> +@@ -1,4 +1,4 @@
> +-#!/usr/bin/env python
> ++#!/usr/bin/env python3
> +
> + '''
> +
> +diff --git a/libexec/python/helpers/json/delete.py b/libexec/python/helpers/json/delete.py
> +index 0975e4e60..07e255228 100644
> +--- a/libexec/python/helpers/json/delete.py
> ++++ b/libexec/python/helpers/json/delete.py
> +@@ -1,4 +1,4 @@
> +-#!/usr/bin/env python
> ++#!/usr/bin/env python3
> +
> + '''
> +
> +diff --git a/libexec/python/helpers/json/dump.py b/libexec/python/helpers/json/dump.py
> +index ddba06e4a..37a8edf70 100644
> +--- a/libexec/python/helpers/json/dump.py
> ++++ b/libexec/python/helpers/json/dump.py
> +@@ -1,4 +1,4 @@
> +-#!/usr/bin/env python
> ++#!/usr/bin/env python3
> +
> + '''
> +
> +diff --git a/libexec/python/helpers/json/get.py b/libexec/python/helpers/json/get.py
> +index 355be9040..d1d822aea 100644
> +--- a/libexec/python/helpers/json/get.py
> ++++ b/libexec/python/helpers/json/get.py
> +@@ -1,4 +1,4 @@
> +-#!/usr/bin/env python
> ++#!/usr/bin/env python3
> +
> + '''
> +
> +diff --git a/libexec/python/helpers/json/inspect.py b/libexec/python/helpers/json/inspect.py
> +index 65772a4ef..61c723495 100644
> +--- a/libexec/python/helpers/json/inspect.py
> ++++ b/libexec/python/helpers/json/inspect.py
> +@@ -1,4 +1,4 @@
> +-#!/usr/bin/env python
> ++#!/usr/bin/env python3
> +
> + '''
> +
> +diff --git a/libexec/python/import.py b/libexec/python/import.py
> +index 2ec208417..1c58eda5c 100644
> +--- a/libexec/python/import.py
> ++++ b/libexec/python/import.py
> +@@ -1,4 +1,4 @@
> +-#!/usr/bin/env python
> ++#!/usr/bin/env python3
> +
> + '''
> +
> +diff --git a/libexec/python/pull.py b/libexec/python/pull.py
> +index 1cd705c90..4431023f3 100644
> +--- a/libexec/python/pull.py
> ++++ b/libexec/python/pull.py
> +@@ -1,4 +1,4 @@
> +-#!/usr/bin/env python
> ++#!/usr/bin/env python3
> +
> + '''
> +
> +diff --git a/libexec/python/shub/api.py b/libexec/python/shub/api.py
> +index 850d167e7..3c8313ad5 100644
> +--- a/libexec/python/shub/api.py
> ++++ b/libexec/python/shub/api.py
> +@@ -1,4 +1,4 @@
> +-#!/usr/bin/env python
> ++#!/usr/bin/env python3
> +
> + '''
> +
> +diff --git a/libexec/python/size.py b/libexec/python/size.py
> +index 34331fd27..99581ce52 100644
> +--- a/libexec/python/size.py
> ++++ b/libexec/python/size.py
> +@@ -1,4 +1,4 @@
> +-#!/usr/bin/env python
> ++#!/usr/bin/env python3
> +
> + '''
> +
> diff --git a/recipes-containers/singularity/singularity_git.bb b/recipes-containers/singularity/singularity_git.bb
> index a265352..103270d 100644
> --- a/recipes-containers/singularity/singularity_git.bb
> +++ b/recipes-containers/singularity/singularity_git.bb
> @@ -3,9 +3,6 @@
>  INSANE_SKIP_${PN} += "dev-so"
>
>  RDEPENDS_${PN} += "glibc python3 ca-certificates openssl bash e2fsprogs-mke2fs"
> -# Singularity expects to find python3 under the name python, therefore both
> -# cannot be installed at the same time.
> -RCONFLICTS_${PN} = "python"
>
>  LICENSE = "BSD"
>  LIC_FILES_CHKSUM = "file://COPYRIGHT.md;md5=be78c34e483dd7d8439358b1e024b294 \
> @@ -13,7 +10,9 @@ LIC_FILES_CHKSUM = "file://COPYRIGHT.md;md5=be78c34e483dd7d8439358b1e024b294 \
>                      file://LICENSE.md;md5=df4326b473db6424033f1d98a5645e30 \
>                      file://debian/copyright;md5=ed267cf386d9b75ab1f27f407e935b10"
>
> -SRC_URI = "git://github.com/singularityware/singularity.git;protocol=https"
> +SRC_URI = "git://github.com/singularityware/singularity.git;protocol=https \
> +    file://0001-Use-python3.patch \
> +"
>  PV = "2.3.1+git${SRCPV}"
>  SRCREV = "e214d4ebf0a1274b1c63b095fd55ae61c7e92947"
>
> @@ -23,11 +22,6 @@ inherit python3native autotools-brokensep
>  EXTRA_OECONF = "--prefix=/usr/local"
>
>  pkg_postinst_${PN}() {
> -    # Singularity requires "python" to resolve to "python3" within the commandline.
> -    # This creates a symbolic link from python3 to python. A side-effect of this is
> -    # that scripts which expect Python 2 may fail to run correctly.
> -    ln -sr $D${bindir}/python3 $D${bindir}/python
> -
>      # python3 expects CA certificates to be installed in a different place to where
>      # they are actually installed. These lines link the two locations.
>      rm -r $D${libdir}/ssl/certs
> --
> 2.25.1
>
> 



--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
