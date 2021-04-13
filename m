Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web09.8299.1618316631219466646
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 13 Apr 2021 05:23:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Hdw5fzoJ;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id r12so25605497ejr.5
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 13 Apr 2021 05:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4smfmtUYxZKRl2g62er0CDDDYw0uoiXfvLB8wdOo2Z0=;
        b=Hdw5fzoJuGNqXzf+OhKxjxe18o84+P1+p0yC1SK38DVRJbHUqOH22Z6C4kAs0zs8bv
         xQgIvs7vdFpwFZR8QeKfluWzdarXtPxXE6yanxdjpzxt81VoZMwpX3FGj3131XKwcQFg
         I4lfO2ca62XnUiD4EFR2aSfhrdI9iBVG3r4v7dr9fXVPY++3htfAWJZyjJrM27jA0Ioe
         7arNDaluYLBiCbsA+pHJOCCt3jc84UQXQ1DhC01jz3i6K7FdO6dZm7AWAaaYmo9hT4tq
         TWZAwQDXVo91/OlTvq4CBOpaaHhAx9teNttVPL9h1YYGomBS37hjTXmvrrrGJjAg0yUl
         I1mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4smfmtUYxZKRl2g62er0CDDDYw0uoiXfvLB8wdOo2Z0=;
        b=SejCVuyeGkKtM7rucTd1wk3D9uvMt1vabfWuZrOm/RtBZHjBq7KqZC6GCxmozKUysK
         JB4fOC4cujOWnabbTzY6hqRZjcYMIL26QQWKHddHnHcN+8OETORcA0TyHM8e/u5BT8zS
         nX774sGGcbE9wbAEjOnhpKzeSj5wiwGfAzzGCnfGPZ6ge/W+GLtRDGEbCMnwzEwZVwPX
         8+4bY6mECOqBL/msgi6pxQhROm9MlBO4Y2lprXSVguRQcdOeoV8KRCgkPDEPCAwSFZTa
         pabR4UOgYxsfaER2fMegISgz82qXplvQAWUrnPfLGCYbIlE94RFcGSIhihKU/3cuXK2N
         2x6w==
X-Gm-Message-State: AOAM532P6y8FWXpYmhnRePmW6vny3CnDwX3y6IA7L8SOMuvKd/GjyRNm
	KwRLbaALm6U4UxmXUskomz/oHxTsVNFJtp6Jj70=
X-Google-Smtp-Source: ABdhPJy1PmbbeKnme4ghHAPlxH55aRzmpWzyLYFqwaZsihrePEqJ7pnxSE1N+jmlTBu+y/UGqWf6C1Iqbk1tjkHVopE=
X-Received: by 2002:a17:906:f210:: with SMTP id gt16mr14082321ejb.22.1618316629696;
 Tue, 13 Apr 2021 05:23:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210413064332.42502-1-christopher.w.clark@gmail.com> <20210413064332.42502-2-christopher.w.clark@gmail.com>
In-Reply-To: <20210413064332.42502-2-christopher.w.clark@gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 13 Apr 2021 08:23:38 -0400
Message-ID: <CADkTA4NW2NFiZkwqo3QvU6VV6+2YsO37aXqRFvoquwc11pyqbw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 2/2] xtf-image: add a new image for the Xen Test Framework
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org, 
	Doug Goldstein <cardoe@gentoo.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 13, 2021 at 2:44 AM Christopher Clark
<christopher.w.clark@gmail.com> wrote:
>
> Testing the Xen hypervisor, with the qemux86-64 MACHINE:
>     runqemu xtf-image nographic slirp
>         (login as root)
>         cd /usr/libexec/xtf
>         ./xtf-runner --list pv
>         # run an example test:
>         ./xtf-runner test-pv64-livepatch-priv-check
>

I like it!

But I'm not all that bright at times, and forget things in about a month.

Can you put the description of the image and how to run it in the .bb
itself ? That way when I pop it open, I'll remember what  it was.

Bruce

> Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
> ---
>  recipes-extended/images/xtf-image.bb | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>  create mode 100644 recipes-extended/images/xtf-image.bb
>
> diff --git a/recipes-extended/images/xtf-image.bb b/recipes-extended/images/xtf-image.bb
> new file mode 100644
> index 0000000..24bf504
> --- /dev/null
> +++ b/recipes-extended/images/xtf-image.bb
> @@ -0,0 +1,14 @@
> +require recipes-extended/images/xen-image-minimal.bb
> +
> +IMAGE_NAME="xtf"
> +
> +IMAGE_INSTALL_append = " xtf"
> +
> +WKS_FILE_DEPENDS_remove = "grub-efi"
> +
> +QB_DEFAULT_FSTYPE = "wic"
> +
> +# Set the dom0 memory level lower than that assigned to qemu
> +# to leave enough free for the XTF microkernels to run.
> +QB_MEM = "-m 400"
> +SYSLINUX_XEN_ARGS_append = " dom0_mem=256M"
> --
> 2.25.1
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
