Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
 by mx.groups.io with SMTP id smtpd.web11.179.1600804149801173965
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 22 Sep 2020 12:49:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tW98XSi/;
 spf=pass (domain: gmail.com, ip: 209.85.218.68, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f68.google.com with SMTP id z23so24511137ejr.13
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 22 Sep 2020 12:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=hzsWuPm8Zfsy6vK4DQ4JWh14tGdqDF+bLz4bjyBK0RM=;
        b=tW98XSi/WndbPEdiHOmpEvikAbWWjDGt2SwUQd+e70tL18kgm7iFZGIXe7W89zg7J/
         XujH5X7oVrNZPe81BAHFX7VVNHsBXyuvctLjWwR1t7n1eLlLPVcbUBY5ZSwMvDSgXGXN
         4Fd9kbDQLkJ+CoTulSyAPhXB5XCFLlwAG3tmkTdMimp9o5UNoLUoLmrUFMZYm0gTqN1B
         hAyPmJ5UbOXrpFpzVCcKAg6ljd6V3QhWeEg3WswLRjAXCOnIqDck/T2JXfCY72cYhOd/
         srx+gvSpqzJp4z+VthtXA/bDkTbtOdIj7R3Si6wjRF1Ltn32aJIbKF3PhmpNEAGVSuDy
         RVeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=hzsWuPm8Zfsy6vK4DQ4JWh14tGdqDF+bLz4bjyBK0RM=;
        b=CgSfFVFEdowArCCxmomAhd2od8L9Um7JnSpk3sdHyBgoSIM9wc2geCUhpSnaOf44CV
         3DcmGfpYMpbyKEXHo8g6jgvINe8iZAtO08zcWblDzGaBMM1wvCR4ReePOV5l92HQZDKy
         AGWcazPXI037G0LnRp2afbNXLcWaRc9SX0GxLmun1qCx0k/otEPpNMya1Div3jCtD/Pa
         aLHBu9WsQXnJc7tLANvZpeFj3QUShuL8OwGVVafRy7hlk2uR5Mv1VLWHV9ERqaz56ep6
         oCMn9FX5Gqy/UYP8dOrkhm4Qi8EHCWlvsEGItiyM6g+f6OI4ef6AfD4vvJIOTZbpbc23
         kTng==
X-Gm-Message-State: AOAM530Mmfp3YPkQl4GBskWL/gshw6OS2BjvXtqQu36mHzB+kTmV37y7
	GtqfjbxohK4YI2vAq+k4E2NrCCoavZgYGfZp2435UqEA30o=
X-Google-Smtp-Source: ABdhPJwfQxCgumxC2alGUaE9vOApQzpV3ZdQ88j96ai85AfP5dGZJeFU7i4oUmN/VyyYsnd+17rZw/0IbncSbL/XrD8=
X-Received: by 2002:a17:906:1e11:: with SMTP id g17mr6465234ejj.298.1600804147866;
 Tue, 22 Sep 2020 12:49:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200922194539.51933-1-bruce.ashfield@gmail.com> <20200922194539.51933-2-bruce.ashfield@gmail.com>
In-Reply-To: <20200922194539.51933-2-bruce.ashfield@gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 22 Sep 2020 15:48:56 -0400
Message-ID: <CADkTA4PCTO_iUFDAc1udvt_WwbbqZJ6bfCsUk9RhDTKXegKspg@mail.gmail.com>
Subject: Re: [PATCH 2/7] xen: make kernel modules an override possible variable
To: meta-virtualization@lists.yoctoproject.org, 
	Christopher Clark <christopher.w.clark@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Christopher:

I pushed an earlier Xen commit by mistake (make QB assignments weak),
but I wanted to bring this one to your attention.

I've been fixing the support for Xen on some Xilinx SOCs and these are
my commits to do so.

There's a new dynamic layer for xilinx, and just the one Xen tweak to
adjust to some kernel details (when not using linux-yocto).

Let me know if you think it'll cause problems for you .. the default
isn't changed, but you never know what you miss when mucking with this
stuff.

Bruce

On Tue, Sep 22, 2020 at 3:45 PM <bruce.ashfield@gmail.com> wrote:
>
> From: Bruce Ashfield <bruce.ashfield@xilinx.com>
>
> Sometimes Xen is built with different mixes of kernel modules and
> built-in values. If we put our expected/default modules in a
> variable, they can be overriden by a different kernel provider
> as required
>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@xilinx.com>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  recipes-extended/images/xen-image-minimal.bb | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/recipes-extended/images/xen-image-minimal.bb b/recipes-extended/images/xen-image-minimal.bb
> index 1b45397..6733801 100644
> --- a/recipes-extended/images/xen-image-minimal.bb
> +++ b/recipes-extended/images/xen-image-minimal.bb
> @@ -2,16 +2,16 @@ DESCRIPTION = "A minimal xen image"
>
>  INITRD_IMAGE = "core-image-minimal-initramfs"
>
> +XEN_KERNEL_MODULES ?= "kernel-module-xen-blkback kernel-module-xen-gntalloc \
> +                       kernel-module-xen-gntdev kernel-module-xen-netback kernel-module-xen-wdt \
> +                       ${@bb.utils.contains('MACHINE_FEATURES', 'pci', "${XEN_PCIBACK_MODULE}", '', d)} \
> +                       ${@bb.utils.contains('MACHINE_FEATURES', 'acpi', 'kernel-module-xen-acpi-processor', '', d)} \
> +                      "
> +
>  IMAGE_INSTALL += " \
>      packagegroup-core-boot \
>      packagegroup-core-ssh-openssh \
> -    ${@bb.utils.contains('MACHINE_FEATURES', 'acpi', 'kernel-module-xen-acpi-processor', '', d)} \
> -    kernel-module-xen-blkback \
> -    kernel-module-xen-gntalloc \
> -    kernel-module-xen-gntdev \
> -    kernel-module-xen-netback \
> -    ${@bb.utils.contains('MACHINE_FEATURES', 'pci', "${XEN_PCIBACK_MODULE}", '', d)} \
> -    kernel-module-xen-wdt \
> +    ${XEN_KERNEL_MODULES} \
>      xen-tools \
>      qemu \
>      "
> --
> 2.19.1
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
