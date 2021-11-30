Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web10.77470.1638282689889030701
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 30 Nov 2021 06:31:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MBl+tzLv;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id z5so22400445edd.3
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 30 Nov 2021 06:31:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KHGtKQZ3mEQo27hZ6XX1spjmFOKUwEcQvvsDs0i5Obg=;
        b=MBl+tzLvKRxnQimraSk/pxds2buIUV445TUY0CQ5q7O816sm7G3+JDFlRzHlpvXzT3
         Q2VF4uJhPLbYRS08CoFBXaaMkC7u7x1j7lMgyzTPqSUPBXtDNgmLZIqI5Fhe0SgLj+5l
         0Y23cM3QiiJLZKpCBVcQjWaro5DYpBR2lOKvK8mZNujqZGa8CKfagyNt4d4JfTHG+kb9
         obZ3Hx3guZtg9QYEalEMEt464j4W6YBvsfUs7jOMCVe8ZkAMgK5nYnfEjL6yJDG1fJXJ
         Ivmq29WV3q5/W8a7CCwoN7VooXLC4gL9C0P765lyocOXfFKr+w7oaOVn2f5Pn9dHyqK7
         E0Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KHGtKQZ3mEQo27hZ6XX1spjmFOKUwEcQvvsDs0i5Obg=;
        b=5L6v9cQDtqYIRpBd+/2r1pkPoZF3zenWDqnxObFAE8nhEkftjA2SSLyECl1iFC1Ly5
         iQBNVHKpPIlXxTrLvJdcSWH7Wzoc03/7bfnndGNIy+7de49sRNtQy462UK9k7rLqFKqC
         eqzyHox+qR66UIQ9jONjAeo24bD9yxJ4hw7yNkeUpmBleeiOFj781Gv4ZmilkadOjo3p
         uGLdN/ZEm69Q+AnZrh9//+7xHiQC7xdYeEDqnUGRNdMJ3rOw4hF/3c3DrqLj3i338VRp
         IbfiLq8+rsD7zn/1w6ZBco1IF6l8bs7DsRE2RsWjPcIzg+vkGP8S4RbUeiAKprOFwCAO
         Qb2w==
X-Gm-Message-State: AOAM531SVEu5Y5pVct/QqcqxTOK8CrsZ/BBEHpWlKdl7FXUAfUXWThZa
	O6PiMLmnt1xk8jmVkiyeLeUWtU+TGe1OaMiWugPTcujO+Hk=
X-Google-Smtp-Source: ABdhPJwPTUwbBWrU8AN+3aZbKtaTHmvagSIzAAktX5CRdLJKNLUEE2VWt5ZTWeZnZ/MIOHEmYnuMz1W+OkTnMf4zw/Y=
X-Received: by 2002:a17:906:48cd:: with SMTP id d13mr66225287ejt.35.1638282687958;
 Tue, 30 Nov 2021 06:31:27 -0800 (PST)
MIME-Version: 1.0
References: <20211130140908.33560-1-Martin.Jansa@gmail.com>
In-Reply-To: <20211130140908.33560-1-Martin.Jansa@gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 30 Nov 2021 09:31:16 -0500
Message-ID: <CADkTA4MKWKmYihECD7m8ZTeOd-RdpNdY5ZiGHJXQJkPKtTqvYA@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] singularity: fix build with automake-1.16.5
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

Looks good to me, fix confirmed on my builder.

Merged.

Bruce

On Tue, Nov 30, 2021 at 9:09 AM Martin Jansa <Martin.Jansa@gmail.com> wrote:
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  ...nfigure.ac-drop-2nd-AM_INIT_AUTOMAKE.patch | 34 +++++++++++++++++++
>  .../singularity/singularity_git.bb            |  1 +
>  2 files changed, 35 insertions(+)
>  create mode 100644 recipes-containers/singularity/singularity/0001-configure.ac-drop-2nd-AM_INIT_AUTOMAKE.patch
>
> diff --git a/recipes-containers/singularity/singularity/0001-configure.ac-drop-2nd-AM_INIT_AUTOMAKE.patch b/recipes-containers/singularity/singularity/0001-configure.ac-drop-2nd-AM_INIT_AUTOMAKE.patch
> new file mode 100644
> index 0000000..d5744a2
> --- /dev/null
> +++ b/recipes-containers/singularity/singularity/0001-configure.ac-drop-2nd-AM_INIT_AUTOMAKE.patch
> @@ -0,0 +1,34 @@
> +From 13ee3e016490e74868b64e3a07dcccf9feafebdf Mon Sep 17 00:00:00 2001
> +From: Martin Jansa <Martin.Jansa@gmail.com>
> +Date: Tue, 30 Nov 2021 05:59:06 -0800
> +Subject: [PATCH] configure.ac: drop 2nd AM_INIT_AUTOMAKE
> +
> +* automake-1.16.5 introduced in oe-core:
> +  https://git.openembedded.org/openembedded-core/commit/?id=851167b3a41b1728407d331c1666827fb730daa1
> +  doesn't like this after:
> +  http://git.savannah.gnu.org/cgit/automake.git/commit/?id=f4a3a70f69e1dbccb6578f39ef47835098a04624
> +
> +  and do_configure fails with:
> +  configure.ac:38: error: AM_INIT_AUTOMAKE expanded multiple times
> +
> +  There is no point in upstreaming this, because singularity-2.3.1 is very old and
> +  whole autotools support is removed in version 3 (currently 3.8.5) with:
> +  https://github.com/hpcng/singularity/commit/a06e3d13a822080d7a9bc55085ee1bb32026a96e
> +
> +Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> +---
> + configure.ac | 7 +++----
> + 1 file changed, 3 insertions(+), 4 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 8ffa5ab32..a5a35c43a 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -35,7 +35,6 @@ AC_GNU_SOURCE
> + AC_PROG_INSTALL
> + AC_PROG_LIBTOOL
> + AC_PROG_CC
> +-AM_INIT_AUTOMAKE
> + AM_PROG_CC_C_O
> + AC_ENABLE_SHARED
> + AC_PROG_LIBTOOL(libtool)
> diff --git a/recipes-containers/singularity/singularity_git.bb b/recipes-containers/singularity/singularity_git.bb
> index f729657..321a9a6 100644
> --- a/recipes-containers/singularity/singularity_git.bb
> +++ b/recipes-containers/singularity/singularity_git.bb
> @@ -12,6 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYRIGHT.md;md5=be78c34e483dd7d8439358b1e024b294 \
>
>  SRC_URI = "git://github.com/singularityware/singularity.git;protocol=https;branch=master \
>      file://0001-Use-python3.patch \
> +    file://0001-configure.ac-drop-2nd-AM_INIT_AUTOMAKE.patch \
>  "
>  PV = "2.3.1+git${SRCPV}"
>  SRCREV = "e214d4ebf0a1274b1c63b095fd55ae61c7e92947"
> --
> 2.32.0
>
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
