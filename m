Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
 by mx.groups.io with SMTP id smtpd.web11.17752.1599078759031763848
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 02 Sep 2020 13:32:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HlPLUz0s;
 spf=pass (domain: gmail.com, ip: 209.85.160.194, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f194.google.com with SMTP id e7so209678qtj.11
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 02 Sep 2020 13:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=hgeYsIUF19AlrUZM4tz5tvzSa3fcrzPHpvbrzZVGppU=;
        b=HlPLUz0sDfKVThaMaz1c3vYj0KcyNBMb6JG3CUwpLL3+4cIzjWr0FtS15GO4Zecq7K
         mYNOX2ItYFMPdlgI2Luipvt1jGXGj+HDdoec4X9eJv5SHGPx0naCCikiwxe4M71KE472
         HCrj7uft86wp4VtZwxckxDY/EbtJctjmfr4d0jbxZceGW+b6aLllKAUgI9gBRkR+xi6I
         XndfB1Yy3idy2LvQla9m9jMaT14mkms2rL5CBaq4BLycjZJqsLHrCCMc3CLK4OvY/iF+
         o0Sld0yPUWFLkdYbYgXwhHnJPrdviWDH+WPIZo/9erZ4GszECMymH5t5ny62420hEQyE
         xmxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=hgeYsIUF19AlrUZM4tz5tvzSa3fcrzPHpvbrzZVGppU=;
        b=EPM3hc12F1LQ+rYJ3RnEWOURm7LPgWt73I/Eogzg8CMH5c7XaS3sZxr21WrRHLPD1Y
         kBL14dsBOTsYNwkMR/unkPwDtqUmXzVZXP+VxDFvJh7wnThQNGBMXY4q+9hvkA+LmA4q
         8cd+DINUpjcIr8b2xYL9iuYt6Bdl1bhSknISfruCdQXCPvqD/T+cAFABjW7WFprLkXJC
         TiWK785NskbfV1zY/IaixeBV+wN97xzCWGPsF62i166w/rEUdS9Qq9TQW6tDS1xHWVbW
         pUUbcXGpmDMlEo8djlsdQLl8uU0sUtZLKAi7+q/j2BgMjsvbrmUMv1kepiwBcMDsYEXg
         M8Fw==
X-Gm-Message-State: AOAM5307CToZQrZRQYhGmu7nh36MrAFhoDL0X5V0tEHYQ45ywAVpWotL
	PPDA2uL7FINK/qbyBN/ysY5u22cOV41JQQ==
X-Google-Smtp-Source: ABdhPJwQ2QGYSKms8YCMxT7l7XR+JjsmyQxaq499qt1zJDFeJRWwa5og1XqDKQAWkEvydmp7JATHRQ==
X-Received: by 2002:ac8:6c5d:: with SMTP id z29mr36804qtu.244.1599078758084;
        Wed, 02 Sep 2020 13:32:38 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id v185sm598060qki.128.2020.09.02.13.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 13:32:37 -0700 (PDT)
Date: Wed, 2 Sep 2020 16:32:35 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][m-c-s][PATCH] glusterfs: backport patch to fix failure for gcc-10
Message-ID: <20200902203232.GA18324@gmail.com>
References: <20200901052622.98891-1-Qi.Chen@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20200901052622.98891-1-Qi.Chen@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged

Bruce

In message: [meta-virtualization][m-c-s][PATCH] glusterfs: backport patch to fix failure for gcc-10
on 31/08/2020 Chen Qi wrote:

> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  ...fns-of-cli_default_conn_timeout-and-.patch | 106 ++++++++++++++++++
>  recipes-extended/glusterfs/glusterfs.inc      |   1 +
>  2 files changed, 107 insertions(+)
>  create mode 100644 recipes-extended/glusterfs/files/0001-cli-duplicate-defns-of-cli_default_conn_timeout-and-.patch
> 
> diff --git a/recipes-extended/glusterfs/files/0001-cli-duplicate-defns-of-cli_default_conn_timeout-and-.patch b/recipes-extended/glusterfs/files/0001-cli-duplicate-defns-of-cli_default_conn_timeout-and-.patch
> new file mode 100644
> index 00000000..79a55b33
> --- /dev/null
> +++ b/recipes-extended/glusterfs/files/0001-cli-duplicate-defns-of-cli_default_conn_timeout-and-.patch
> @@ -0,0 +1,106 @@
> +From f66bd85af09397300ad434655fc68861f48c2e3c Mon Sep 17 00:00:00 2001
> +From: "Kaleb S. KEITHLEY" <kkeithle@redhat.com>
> +Date: Thu, 2 Jan 2020 07:46:23 -0500
> +Subject: [PATCH] cli: duplicate defns of cli_default_conn_timeout and
> + cli_ten_minutes_timeout
> +
> +Winter is coming. So is gcc-10.
> +
> +Compiling with gcc-10-20191219 snapshot reveals dupe defns of
> +cli_default_conn_timeout and cli_ten_minutes_timeout in
> +.../cli/src/cli.[ch] due to missing extern decl.
> +
> +There are many changes coming in gcc-10 described in
> +https://gcc.gnu.org/gcc-10/changes.html
> +
> +compiling cli.c with gcc-9 we see:
> +   ...
> +        .quad   .LC88
> +        .comm   cli_ten_minutes_timeout,4,4
> +        .comm   cli_default_conn_timeout,4,4
> +        .text
> +   .Letext0:
> +   ...
> +
> +and with gcc-10:
> +   ...
> +        .quad   .LC88
> +        .globl  cli_ten_minutes_timeout
> +        .bss
> +        .align 4
> +        .type   cli_ten_minutes_timeout, @object
> +        .size   cli_ten_minutes_timeout, 4
> +   cli_ten_minutes_timeout:
> +        .zero   4
> +        .globl  cli_default_conn_timeout
> +        .align 4
> +        .type   cli_default_conn_timeout, @object
> +        .size   cli_default_conn_timeout, 4
> +   cli_default_conn_timeout:
> +        .zero   4
> +        .text
> +   .Letext0:
> +   ...
> +
> +which is reflected in the .o file as (gcc-9):
> +...
> +0000000000000004 C cli_ten_minutes_timeout
> +0000000000000004 C cli_default_conn_timeout
> +...
> +
> +and (gcc-10):
> +...
> +0000000000000020 B cli_ten_minutes_timeout
> +0000000000000024 B cli_default_conn_timeout
> +...
> +
> +See nm(1) and ld(1) for a description C (common) and B (BSS) and how
> +they are treated by the linker.
> +
> +Note: there is still a small chance that gcc-10 will land in Fedora-32,
> +despite 31 Dec. 2019 having been the deadline for that to happen.
> +
> +Change-Id: I54ea485736a4910254eeb21222ad263721cdef3c
> +Fixes: bz#1193929
> +Signed-off-by: Kaleb S. KEITHLEY <kkeithle@redhat.com>
> +
> +Upstream-Status: Backport [https://review.gluster.org/#/c/glusterfs/+/23956/]
> +
> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> +---
> + cli/src/cli.c | 3 +++
> + cli/src/cli.h | 4 ++--
> + 2 files changed, 5 insertions(+), 2 deletions(-)
> +
> +diff --git a/cli/src/cli.c b/cli/src/cli.c
> +index cb425c84b..2c96b7ae6 100644
> +--- a/cli/src/cli.c
> ++++ b/cli/src/cli.c
> +@@ -84,6 +84,9 @@ rpc_clnt_prog_t *cli_rpc_prog;
> + 
> + extern struct rpc_clnt_program cli_prog;
> + 
> ++int cli_default_conn_timeout = 120;
> ++int cli_ten_minutes_timeout = 600;
> ++
> + static int
> + glusterfs_ctx_defaults_init(glusterfs_ctx_t *ctx)
> + {
> +diff --git a/cli/src/cli.h b/cli/src/cli.h
> +index 81f75a0b4..cd4db3dac 100644
> +--- a/cli/src/cli.h
> ++++ b/cli/src/cli.h
> +@@ -40,8 +40,8 @@ enum argp_option_keys {
> +     ARGP_PORT_KEY = 'p',
> + };
> + 
> +-int cli_default_conn_timeout;
> +-int cli_ten_minutes_timeout;
> ++extern int cli_default_conn_timeout;
> ++extern int cli_ten_minutes_timeout;
> + 
> + typedef enum {
> +     COLD_BRICK_COUNT,
> +-- 
> +2.21.0
> +
> diff --git a/recipes-extended/glusterfs/glusterfs.inc b/recipes-extended/glusterfs/glusterfs.inc
> index c209baa6..91fc1c61 100644
> --- a/recipes-extended/glusterfs/glusterfs.inc
> +++ b/recipes-extended/glusterfs/glusterfs.inc
> @@ -19,6 +19,7 @@ SRC_URI += "file://glusterd.init \
>              file://libglusterfs-Don-t-link-against-libfl.patch \
>              file://glusterd-change-port-range.patch \
>              file://configure.ac-allow-PYTHON-values-to-be-passed-via-en.patch \
> +            file://0001-cli-duplicate-defns-of-cli_default_conn_timeout-and-.patch \
>             "
>  
>  LICENSE = "(LGPLv3+ | GPLv2) & GPLv3+ & LGPLv3+ & GPLv2+ & LGPLv2+ & LGPLv2.1+ & Apache-2.0"
> -- 
> 2.21.0
> 

> 

