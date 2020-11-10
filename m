Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
 by mx.groups.io with SMTP id smtpd.web10.26913.1605011573721391640
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 10 Nov 2020 04:32:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bo1BEyAy;
 spf=pass (domain: gmail.com, ip: 209.85.167.176, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-oi1-f176.google.com with SMTP id w145so14102265oie.9
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 10 Nov 2020 04:32:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8KRK21b+07gjS5IvWg3fYhTf++2keLCFxO6zC5seYh0=;
        b=bo1BEyAyD+dXIQ8pUoXdBMTF4a9sI6AqUAxHZEatYDC1Jq/y7GgyYWY0YV5uo7dxLz
         hg2iSKcXMW+TMMK1Oyvt/I1KfWszudaIVQELe9d8CV37S1C3VA7mzsKDN9OPgHSFK/hC
         nOlBFBfkjNJN5pyhaV7781cilwJpdowi5CYVKOiJrXW1URPUd4cwRbr8jwrDdfVp7r2u
         IlNJqFWVn37q8rGC4MKLuHEgRZ+icBYucPoopnmtNaDr6wb+9boxhPgMZs65nqo/cGEe
         7rTY1X9YSjUjXvjenWhcb/1KGu8AQ/U5wBNWQJusLRX1b2ctOLhJGApP1AvLCN+uEIB0
         Tf0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8KRK21b+07gjS5IvWg3fYhTf++2keLCFxO6zC5seYh0=;
        b=eCyGV3tHmgWzODkOrI2q6r+J5Fe1mZN6yR0xESF/GLcN1PqcCspJJYHZMuYpjFa9ES
         ZljprIIdz9KSF52+gd5U95WpCCpLWRcpu8oSkW7Z4mQXsaJ0PbqAD7oE2dqx2AUHFbXA
         iXSFYuBP0ZNycRc/uZ0Mdw6OG3KWsXcAyF5QemnqcjMzRfWQAOe6vo2ANhSyc1uqYUIQ
         8JkwtaCSwbILCEuBSablXHJdipsegdq5NGKzI13NKajWrcX6u530UhmJxmzxqG9GZHym
         Y/vh2eWK2q4SDb3l9AlnMlyuqeQlRGmpiSxRfgEmhxmB2t/ncQPuZkS7k89xCH+J/dLf
         KEhQ==
X-Gm-Message-State: AOAM530CEixr/4LKAL9/uyEkbaKrfXvlgWMGatmzACpgqJPPI+AY1oWY
	ZrZOUTSb4A3PncShSnMJ6pc1PkgmV6bWSbrT1fQ=
X-Google-Smtp-Source: ABdhPJyrh2MLIo9wn6OU5ZiDBUpaDZaz2/Tbvesso8+n/hamQEy0ATPrzZon8i/nDKlUrNoPF182EpKIiT/n/5+xHQo=
X-Received: by 2002:aca:d941:: with SMTP id q62mr2669411oig.33.1605011573096;
 Tue, 10 Nov 2020 04:32:53 -0800 (PST)
MIME-Version: 1.0
References: <cover.1604933003.git.bertrand.marquis@arm.com>
 <df132acec4c899d81d6a1b52746f0dc782c08e39.1604933003.git.bertrand.marquis@arm.com>
 <fe22da1f2e1be6076a47ac99189dcfbe321ff71a.1604933003.git.bertrand.marquis@arm.com>
In-Reply-To: <fe22da1f2e1be6076a47ac99189dcfbe321ff71a.1604933003.git.bertrand.marquis@arm.com>
From: "Christopher Clark" <christopher.w.clark@gmail.com>
Date: Tue, 10 Nov 2020 04:32:41 -0800
Message-ID: <CACMJ4Gbisz5QMH7kODhLe3u+thGccbq3K6g9CSgtkOfkR8+3Fw@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH 2/2] xen: Fix xenpmd compilation error on arm32
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 9, 2020 at 6:49 AM Bertrand Marquis
<bertrand.marquis@arm.com> wrote:
>
> Add patch merged in current Xen master to solve compilation errors on
> xenmpd when Xen is compiled for arm32.
>
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>

Reviewed-by: Christopher Clark <christopher.clark6@baesystems.com>

> Change-Id: Ifd94aa30e1b3a1016156ead395688f594ad2711d
> ---
>  ...ls-xenpmd-Fix-gcc10-snprintf-warning.patch | 60 +++++++++++++++++++
>  recipes-extended/xen/xen-tools_4.14.bb        |  1 +
>  recipes-extended/xen/xen-tools_git.bb         |  1 +
>  3 files changed, 62 insertions(+)
>  create mode 100644 recipes-extended/xen/files/0001-tools-xenpmd-Fix-gcc10-snprintf-warning.patch
>
> diff --git a/recipes-extended/xen/files/0001-tools-xenpmd-Fix-gcc10-snprintf-warning.patch b/recipes-extended/xen/files/0001-tools-xenpmd-Fix-gcc10-snprintf-warning.patch
> new file mode 100644
> index 0000000..0a136c9
> --- /dev/null
> +++ b/recipes-extended/xen/files/0001-tools-xenpmd-Fix-gcc10-snprintf-warning.patch
> @@ -0,0 +1,60 @@
> +From 0dfddb2116e3757f77a691a3fe335173088d69dc Mon Sep 17 00:00:00 2001
> +Message-Id: <0dfddb2116e3757f77a691a3fe335173088d69dc.1604734077.git.bertrand.marquis@arm.com>
> +From: Bertrand Marquis <bertrand.marquis@arm.com>
> +Date: Thu, 15 Oct 2020 10:16:09 +0100
> +Subject: [PATCH] tools/xenpmd: Fix gcc10 snprintf warning
> +
> +Add a check for snprintf return code and ignore the entry if we get an
> +error. This should in fact never happen and is more a trick to make gcc
> +happy and prevent compilation errors.
> +
> +This is solving the following gcc warning when compiling for arm32 host
> +platforms with optimization activated:
> +xenpmd.c:92:37: error: '%s' directive output may be truncated writing
> +between 4 and 2147483645 bytes into a region of size 271
> +[-Werror=format-truncation=]
> +
> +This is also solving the following Debian bug:
> +https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=970802
> +
> +Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> +Acked-by: Wei Liu <wl@xen.org>
> +---
> +Upstream-status: Backport from 4.15
> +---
> + tools/xenpmd/xenpmd.c | 9 +++++++--
> + 1 file changed, 7 insertions(+), 2 deletions(-)
> +
> +diff --git a/tools/xenpmd/xenpmd.c b/tools/xenpmd/xenpmd.c
> +index 35fd1c931a..12b82cf43e 100644
> +--- a/tools/xenpmd/xenpmd.c
> ++++ b/tools/xenpmd/xenpmd.c
> +@@ -102,6 +102,7 @@ FILE *get_next_battery_file(DIR *battery_dir,
> +     FILE *file = 0;
> +     struct dirent *dir_entries;
> +     char file_name[284];
> ++    int ret;
> +
> +     do
> +     {
> +@@ -111,11 +112,15 @@ FILE *get_next_battery_file(DIR *battery_dir,
> +         if ( strlen(dir_entries->d_name) < 4 )
> +             continue;
> +         if ( battery_info_type == BIF )
> +-            snprintf(file_name, sizeof(file_name), BATTERY_INFO_FILE_PATH,
> ++            ret = snprintf(file_name, sizeof(file_name), BATTERY_INFO_FILE_PATH,
> +                      dir_entries->d_name);
> +         else
> +-            snprintf(file_name, sizeof(file_name), BATTERY_STATE_FILE_PATH,
> ++            ret = snprintf(file_name, sizeof(file_name), BATTERY_STATE_FILE_PATH,
> +                      dir_entries->d_name);
> ++        /* This should not happen but is needed to pass gcc checks */
> ++        if (ret < 0)
> ++            continue;
> ++        file_name[sizeof(file_name) - 1] = '\0';
> +         file = fopen(file_name, "r");
> +     } while ( !file );
> +
> +--
> +2.17.1
> +
> diff --git a/recipes-extended/xen/xen-tools_4.14.bb b/recipes-extended/xen/xen-tools_4.14.bb
> index 4119190..73a52bc 100644
> --- a/recipes-extended/xen/xen-tools_4.14.bb
> +++ b/recipes-extended/xen/xen-tools_4.14.bb
> @@ -7,6 +7,7 @@ SRC_URI = " \
>      git://xenbits.xen.org/xen.git;branch=${XEN_BRANCH} \
>      file://0001-python-pygrub-pass-DISTUTILS-xen-4.14.patch \
>      file://0001-xen-build-temporarily-inhibit-Werror-4.14.patch \
> +    file://0001-tools-xenpmd-Fix-gcc10-snprintf-warning.patch \
>      "
>
>  LIC_FILES_CHKSUM ?= "file://COPYING;md5=419739e325a50f3d7b4501338e44a4e5"
> diff --git a/recipes-extended/xen/xen-tools_git.bb b/recipes-extended/xen/xen-tools_git.bb
> index 71aeeed..1f6be1d 100644
> --- a/recipes-extended/xen/xen-tools_git.bb
> +++ b/recipes-extended/xen/xen-tools_git.bb
> @@ -7,6 +7,7 @@ SRC_URI = " \
>      git://xenbits.xen.org/xen.git;branch=${XEN_BRANCH} \
>      file://0001-python-pygrub-pass-DISTUTILS-xen-4.14.patch \
>      file://0001-xen-build-temporarily-inhibit-Werror-4.14.patch \
> +    file://0001-tools-xenpmd-Fix-gcc10-snprintf-warning.patch \
>      "
>
>  LIC_FILES_CHKSUM ?= "file://COPYING;md5=419739e325a50f3d7b4501338e44a4e5"
> --
> 2.17.1
>
>
> 
>
