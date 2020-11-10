Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com [209.85.167.195])
 by mx.groups.io with SMTP id smtpd.web10.24738.1604994458660984062
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 09 Nov 2020 23:47:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lLyaNN7V;
 spf=pass (domain: gmail.com, ip: 209.85.167.195, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-oi1-f195.google.com with SMTP id w145so13317584oie.9
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 09 Nov 2020 23:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pmTZelDiiX/qY8Fx0gpYz4M2e79X9ufE7B+X77mbbxU=;
        b=lLyaNN7VZbt5iCbYeqeejcExU41ESAgPey+oSQuwi3397FM8kdXi75mPultxwR3/MF
         pWkTW5a0/vEd6p21C9Em+HPDmCCBVve3tbxyn4CpjI7xkPZqgzeYTkG959dAZgjA1Uec
         8/VRWhoTknOMYDr6yCV5dAOc3vI/4DjYjZ0+8Q0xbHUQcRpCc6biArI/O+soc+O8jn46
         KpHLEGG+WLgjOps0JGVDzNJ2Le45hVjNIsULEoBTtM4CYQ67sQwO8m7BwIikufiB4xD8
         1CY7ENsX5gv3QajsrtPpI/R3KxkBYYOe+NrKK/fT0XPPnTJHX5pyw+wLSqXjfeYZMZuz
         7TIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pmTZelDiiX/qY8Fx0gpYz4M2e79X9ufE7B+X77mbbxU=;
        b=j9D4bwJRknv+idfNcu2uJ5PPn1EK8QgaU7G3FTPoYHPS1O/9qeJ3g9AtkNPvDdE4B4
         qL1cq/UEdeE10YPT8BXZtFv1IU/U2/f2KE50K1CaymyAx2uRlrMPXL4q1etsAa7piogM
         R2NKJ1mxqyY5p0puwRdk8K1kEz4cYPNUKLMv/UUOZUQCMjNUSrdc3OH6nB8pMf2W2axR
         93Nn+WN05PdF65KgR8+KdkIfJBdvNTlwF5nJtzdMg6ya4Yn7Tvlqjoqx32CbGS1cy/MB
         suI08adGJMGprzg5ePvJTjqtWnZkmwwA0yc5Wlw8Z7lztj8QADhjDQzr6C2aZkcsM3jX
         zRjQ==
X-Gm-Message-State: AOAM5322lLWaIkBEGWD++KCaYxnTtPt2ack3oocu/Gn42asye6mbDTE7
	pBOam9YO0fkajLqEXdnvsskFy8GFf8FeP+ydRUk=
X-Google-Smtp-Source: ABdhPJzxCxW6jMT6s7cFRnYvms7E0xqp7US1ngFLLdkoG2Plw7B04Ktj1idaNhVRgQf1EzVF+e/X6hgZiTKffPAIVws=
X-Received: by 2002:aca:d941:: with SMTP id q62mr2068897oig.33.1604994457962;
 Mon, 09 Nov 2020 23:47:37 -0800 (PST)
MIME-Version: 1.0
References: <cover.1604933003.git.bertrand.marquis@arm.com> <df132acec4c899d81d6a1b52746f0dc782c08e39.1604933003.git.bertrand.marquis@arm.com>
In-Reply-To: <df132acec4c899d81d6a1b52746f0dc782c08e39.1604933003.git.bertrand.marquis@arm.com>
From: "Christopher Clark" <christopher.w.clark@gmail.com>
Date: Mon, 9 Nov 2020 23:47:26 -0800
Message-ID: <CACMJ4GYKuB_KVwfuGkcrYF5c8G-LHDKZGgj4+v13FjS+sctXww@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH 1/2] xen: Fix python libraries installation on multilib
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 9, 2020 at 6:49 AM Bertrand Marquis
<bertrand.marquis@arm.com> wrote:
>
> Fix install path for xen python libraries when multilib configuration is
> activated (which is mandatory to compile xen for x86_64).
> Depending on the version of Xen, the libraries are installed on lib or
> on the nonarch lib directory so add both.

Thanks, Bertrand -- I have positive results for this with
compile-tests with both Xen 4.14 and 4.15 for x86_64.

> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> Change-Id: I1f7f81a4e9e1420bce55d1e4bfe03d98ac2c93a3
> ---
>  recipes-extended/xen/xen-tools.inc | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/recipes-extended/xen/xen-tools.inc b/recipes-extended/xen/xen-tools.inc
> index 736a766..0c69fec 100644
> --- a/recipes-extended/xen/xen-tools.inc
> +++ b/recipes-extended/xen/xen-tools.inc
> @@ -496,7 +496,9 @@ FILES_${PN}-pygrub = "\
>      ${libdir}/xen/bin/pygrub \
>      "
>
> +# Depending on the version of Xen libdir or nonarch libdir is used
>  FILES_${PN}-python = "\
> +    ${libdir}/${PYTHON_DIR} \
>      ${nonarch_libdir}/${PYTHON_DIR} \
>      "

Do you know whether a similar change is also needed for the python
nonarch_libdir items in the -dbg package, when building older versions
of Xen?

Christopher

>
> --
> 2.17.1
>
>
> 
>
