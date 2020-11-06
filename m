Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
 by mx.groups.io with SMTP id smtpd.web11.193.1604683648119364943
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 06 Nov 2020 09:27:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IRTRIjB9;
 spf=pass (domain: gmail.com, ip: 209.85.166.45, mailfrom: alistair23@gmail.com)
Received: by mail-io1-f45.google.com with SMTP id r12so2256128iot.4
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 06 Nov 2020 09:27:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PsoGDgzu/urNhVFzhNPUrf9OHKCgkKIeLIRAgUVKFjw=;
        b=IRTRIjB91Brdt7ELpSXwgw/Ypnc+reyLUzE2qRpGAu4+PnTzNvB8F55omnIAXXiWmL
         8c9TvQlhDY11BWJzENO6JMSAw7rcZGzmg4549GlAPox+bj5T0JlJPe+pnjsKRuI5e8oA
         zydwb4e2EYKc+BFjdJqQDYBinzugYtOepYhmVV0n3oqyEKGwPmTh/njAl8itwSBcBc5S
         vrcOhjjBmIIQEBNWd4cECpx3zXOqPFBr2p4zqSik/g0sXYgCIEDV4hWxcbkwEuX+j0oL
         L2v741MG8AKU30HwvXk+RsMLbyxiUzXI7U4MllKyj3q8Z+8tHiG8MJ2dGgJnIKdFYp1k
         peOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PsoGDgzu/urNhVFzhNPUrf9OHKCgkKIeLIRAgUVKFjw=;
        b=hPn3UdRQuSQFcWBR/ivvmBjKcrDmmnYvcoBxa5B5X5qzg7/m6v99hwZmbkOyOG3daj
         WyKLx8Mep14p4apAJ0TxRPOBU4a317m/Pmv/SUMfo37k5iZL8mfksi3HzUzmP2f2qsJM
         lLX047SaArJldGFT4tKvykM8NYQ0fOMbgsG3O+GNF4/6uFoytFWvi2V83crEKG/gVNwM
         Azw7KKonY4q54K2HRlGBNHm3DdvxcdnDznhnZKaHGzM0fST3X7G6krnDkjSel58/8/P0
         stk2OuMnXFi7nGivdxD/AudPc7BChta+1hrpqw/PiSK2JTrGAUtoUWrMjQTeiJmbPaal
         mEEw==
X-Gm-Message-State: AOAM532X1IQW5yk7uu86mSMofohw7MbjqWjvsd6Br4F0E1c+UTd15XwD
	AWdP6RvBdKXSiBXSNkYl9LMhK2dPS7bgDGvDUOE=
X-Google-Smtp-Source: ABdhPJychrMHclYNPO0R7KQIL4zbpHPnhtowTc3f4FaB9WYFe2VFdtGIMP3JKMPb9ElF7cj1zKEE17eew+hFalPnVfc=
X-Received: by 2002:a5d:9d58:: with SMTP id k24mr2209137iok.118.1604683647597;
 Fri, 06 Nov 2020 09:27:27 -0800 (PST)
MIME-Version: 1.0
References: <20201106140937.765868-1-Martin.Jansa@gmail.com>
In-Reply-To: <20201106140937.765868-1-Martin.Jansa@gmail.com>
From: "Alistair Francis" <alistair23@gmail.com>
Date: Fri, 6 Nov 2020 09:26:59 -0800
Message-ID: <CAKmqyKN7HsWL1X5YfDPGZKmzD89cYDD35FGH4P-Y8X1JDPK3wg@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] xvisor: skip QA checks ldflags and textrel
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 6, 2020 at 6:09 AM Martin Jansa <Martin.Jansa@gmail.com> wrote:
>
> * feel free to fix it properly, I don't use xvisor at all
>   it just shown these 2 errors in my aarch64 world builds
>   and this recipe needs more love than just these 2 issues
>   like setting PV to something better than "git"
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Just FYI when the next QEMU release happens I'll update Xvisor. At
that time I can try and cleanup the recipe a bit more to improve some
of these errors.

Alistair

> ---
>  recipes-extended/xvisor/xvisor_git.bb | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/recipes-extended/xvisor/xvisor_git.bb b/recipes-extended/xvisor/xvisor_git.bb
> index 50323d7..831c943 100644
> --- a/recipes-extended/xvisor/xvisor_git.bb
> +++ b/recipes-extended/xvisor/xvisor_git.bb
> @@ -49,3 +49,7 @@ FILES_${PN} += "/*.dtb"
>
>  COMPATIBLE_HOST = "(aarch64|riscv64|riscv32).*"
>  INHIBIT_PACKAGE_STRIP = "1"
> +
> +# ERROR: xvisor-git-r0 do_package_qa: QA Issue: File /vmm.elf in package xvisor doesn't have GNU_HASH (didn't pass LDFLAGS?) [ldflags]
> +# ERROR: xvisor-git-r0 do_package_qa: QA Issue: xvisor: ELF binary /vmm.elf has relocations in .text [textrel]
> +INSANE_SKIP_${PN} += "ldflags textrel"
> --
> 2.27.0
>
>
> 
>
