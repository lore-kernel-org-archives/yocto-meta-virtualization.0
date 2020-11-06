Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
 by mx.groups.io with SMTP id smtpd.web10.175.1604683568735311709
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 06 Nov 2020 09:26:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QP9OqZOQ;
 spf=pass (domain: gmail.com, ip: 209.85.166.176, mailfrom: alistair23@gmail.com)
Received: by mail-il1-f176.google.com with SMTP id a20so1697059ilk.13
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 06 Nov 2020 09:26:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jA2LLrjoWr3Oc61Q96Opk9q5To/RWlv/qZQgM51Ffjw=;
        b=QP9OqZOQjYO1mojOgjjhPDIgm8Sf16/lO+rhNeFl7AKXoKcatXXybF+dthvbnk/3pp
         1tZV/gTcFJ5iBXfHk0ZYBhwMmfjV4U+OVhYaCfY/cbawEq8ZyOwJk5sDG4iRA0NkorQ4
         UYoXdYH4UbKE0hbInnilEqROcOM3gw67TJMjSvDRKTLziiBv1/NG6dw9rhgNJjDiBJaU
         smqBpV0QvkMAaenaiiTFdCqCf9v1jOZJKt3hKMs9eK7mls1Oz1wmyYapGjmLbIHrP5aT
         FMZX0OLlcVv7xcOTeI6/0BXKE0rLhD/ecxUHZ7BrT+GZpulvhBOml7fbnvLWX9MmI30Y
         Rjhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jA2LLrjoWr3Oc61Q96Opk9q5To/RWlv/qZQgM51Ffjw=;
        b=ttvconLarBsfUZTvt2ck6y/2ig3/u4hYUVjFJk+9/YEdpnWffp5/rEVRdXxxpnH0xe
         vuKyhWuHtUdHmDzvY7PFBDrBmiOdT/zEB8w+n5ADbbuEsIQQ9xLDahm0BjqA4g42D8c9
         MJaIWgxR3bwM2S55fVjTCmKUmndGhyA1BQ61wm8HEZjh8DktUjZQ9WvbNIANeBDRs2ys
         hHdlvibMK5y2e6gE+LdB+ovYolcBL/awNsjmGuRiQflQzLS+BfmVwgV+LNDYwzCal5je
         eNMzIx2iRdZ2xZO9c+WCh+0TkImS/yBzkmF74fJnBdgATAu0GhUqz1SQZCF44B3bo4GH
         9gRw==
X-Gm-Message-State: AOAM531WI5jPgEjoQgMbVmbV2bwq/FyMW0FPknsu4Xj9a/1ReZwA/v1K
	nn8ShUuTCP7yUkk2KhbLyf9wpCh19s4azVuvV6M=
X-Google-Smtp-Source: ABdhPJyCQ2EWaW+9sh1Y2hqqAmShcI/YssfnO+4LHl6Nyoci9Q8lGGhplebDSh382lF6cEHxWMHFPQ/hi/xZ7ouPxy0=
X-Received: by 2002:a92:5eda:: with SMTP id f87mr2267098ilg.131.1604683568033;
 Fri, 06 Nov 2020 09:26:08 -0800 (PST)
MIME-Version: 1.0
References: <20201106140519.765558-1-Martin.Jansa@gmail.com>
In-Reply-To: <20201106140519.765558-1-Martin.Jansa@gmail.com>
From: "Alistair Francis" <alistair23@gmail.com>
Date: Fri, 6 Nov 2020 09:25:39 -0800
Message-ID: <CAKmqyKOY5D3nfP-qKyxdW-HZj2PJW6P8WUSKFD_8C+wzKTSNKg@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] xvisor: fix build with gcc-10
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 6, 2020 at 6:05 AM Martin Jansa <Martin.Jansa@gmail.com> wrote:
>
> * with gcc-10 (which doesn't include -fcommon by default) it fails like this:
>   aarch64-oe-linux-ld: error: TOPDIR/BUILD/work/raspberrypi3_64-oe-linux/xvisor/git-r0/git/build/drivers/mmc/core/mmc.o: multiple definition of 'sdio_func_type'
>   aarch64-oe-linux-ld: error: TOPDIR/BUILD/work/raspberrypi3_64-oe-linux/xvisor/git-r0/git/build/drivers/mmc/core/sdio_bus.o: multiple definition of 'sdio_func_type'
>   aarch64-oe-linux-ld: error: TOPDIR/BUILD/work/raspberrypi3_64-oe-linux/xvisor/git-r0/git/build/drivers/mmc/core/sdio_io.o: multiple definition of 'sdio_func_type'
>   aarch64-oe-linux-ld: error: TOPDIR/BUILD/work/raspberrypi3_64-oe-linux/xvisor/git-r0/git/build/drivers/mmc/core/sdio.o: multiple definition of 'sdio_func_type'
>   aarch64-oe-linux-ld: TOPDIR/BUILD/work/raspberrypi3_64-oe-linux/xvisor/git-r0/git/build/drivers/mmc/core/core.o: previous definition here
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  ...-Allow-Xvisor-to-compile-with-gcc-10.patch | 55 +++++++++++++++++++
>  recipes-extended/xvisor/xvisor_git.bb         |  5 +-
>  2 files changed, 58 insertions(+), 2 deletions(-)
>  create mode 100644 recipes-extended/xvisor/files/0001-EMULATORS-Allow-Xvisor-to-compile-with-gcc-10.patch
>
> diff --git a/recipes-extended/xvisor/files/0001-EMULATORS-Allow-Xvisor-to-compile-with-gcc-10.patch b/recipes-extended/xvisor/files/0001-EMULATORS-Allow-Xvisor-to-compile-with-gcc-10.patch
> new file mode 100644
> index 0000000..221a314
> --- /dev/null
> +++ b/recipes-extended/xvisor/files/0001-EMULATORS-Allow-Xvisor-to-compile-with-gcc-10.patch
> @@ -0,0 +1,55 @@
> +From 417184cc41cfd33ae7b4c11c8396e0f47f43e2ba Mon Sep 17 00:00:00 2001
> +From: Jean-Christophe Dubois <jcd@tribudubois.net>
> +Date: Fri, 8 May 2020 15:17:36 +0200
> +Subject: [PATCH] EMULATORS: Allow Xvisor to compile with gcc 10.
> +
> +With gcc 10 because some header files do not declare some variable
> +definition as extern, the variable get duplicated in all files
> +using it.
> +
> +This patch allow xvisor to compile with the latest gcc.
> +
> +Signed-off-by: Jean-Christophe Dubois <jcd@tribudubois.net>
> +Reviewed-by: Anup Patel <anup@brainfault.org>
> +---
> + drivers/mmc/core/core.h    |  2 +-
> + emulators/display/drawfn.h | 10 +++++-----
> + 2 files changed, 6 insertions(+), 6 deletions(-)
> +
> +diff --git a/drivers/mmc/core/core.h b/drivers/mmc/core/core.h
> +index d75d135a..e2ca3141 100644
> +--- a/drivers/mmc/core/core.h
> ++++ b/drivers/mmc/core/core.h
> +@@ -64,7 +64,7 @@ int mmc_go_idle(struct mmc_host *host);
> +  * Note: Must be called with host->lock held.
> +  */
> + extern struct vmm_bus sdio_bus_type;
> +-struct vmm_device_type sdio_func_type;
> ++extern struct vmm_device_type sdio_func_type;
> +
> + int __sdio_attach(struct mmc_host *host);
> +
> +diff --git a/emulators/display/drawfn.h b/emulators/display/drawfn.h
> +index f9163cff..385deaf6 100644
> +--- a/emulators/display/drawfn.h
> ++++ b/emulators/display/drawfn.h
> +@@ -69,14 +69,14 @@ typedef void (*drawfn)(struct vmm_surface *,
> +                                DRAWFN_ORDER_MAX * \
> +                                DRAWFN_FORMAT_MAX)
> +
> +-drawfn drawfn_surface_fntable_8[DRAWFN_FNTABLE_SIZE];
> ++extern drawfn drawfn_surface_fntable_8[DRAWFN_FNTABLE_SIZE];
> +
> +-drawfn drawfn_surface_fntable_15[DRAWFN_FNTABLE_SIZE];
> ++extern drawfn drawfn_surface_fntable_15[DRAWFN_FNTABLE_SIZE];
> +
> +-drawfn drawfn_surface_fntable_16[DRAWFN_FNTABLE_SIZE];
> ++extern drawfn drawfn_surface_fntable_16[DRAWFN_FNTABLE_SIZE];
> +
> +-drawfn drawfn_surface_fntable_24[DRAWFN_FNTABLE_SIZE];
> ++extern drawfn drawfn_surface_fntable_24[DRAWFN_FNTABLE_SIZE];
> +
> +-drawfn drawfn_surface_fntable_32[DRAWFN_FNTABLE_SIZE];
> ++extern drawfn drawfn_surface_fntable_32[DRAWFN_FNTABLE_SIZE];
> +
> + #endif
> diff --git a/recipes-extended/xvisor/xvisor_git.bb b/recipes-extended/xvisor/xvisor_git.bb
> index 64b0f22..50323d7 100644
> --- a/recipes-extended/xvisor/xvisor_git.bb
> +++ b/recipes-extended/xvisor/xvisor_git.bb
> @@ -11,8 +11,9 @@ inherit autotools-brokensep
>  # This version support the RISC-V v0.5.0 Hypervisor extensions
>  SRCREV = "b3dac5b1f61f23f21dc59b3880897cff78f3b618"
>  SRC_URI = "git://github.com/avpatel/xvisor-next.git \
> -           file://0001-TESTS-Don-t-specify-mabi-or-march-for-RISC-V.patch \
> -          "
> +    file://0001-TESTS-Don-t-specify-mabi-or-march-for-RISC-V.patch \
> +    file://0001-EMULATORS-Allow-Xvisor-to-compile-with-gcc-10.patch \
> +"
>
>  S = "${WORKDIR}/git"
>
> --
> 2.27.0
>
>
> 
>
