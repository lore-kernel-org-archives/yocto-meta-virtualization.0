Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web09.7370.1614915950460084652
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 04 Mar 2021 19:45:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=indNi82f;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id m9so716865edd.5
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 04 Mar 2021 19:45:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lGiBM8uqWLsLZ7ATRMVTm4lF4t7ZiIeKx5vLZCfYj6w=;
        b=indNi82fpvUjJOFI/iVfvf+4ohXwoImEQ8cD3k2gS8/yW1IEIYJnHO2N3snLnyYJQ2
         eITWYABseDdLsErEG13Rr1ToPP1ewI0bv/mcphBIdT2QCndxxuuGYYPxSqy4sfkcFzeF
         GBiMNJh47b0F1Y4bspVvXWGwYZ5xpqQOHJVk0e0Gb0DDcjksnX6iYWr/rNzroeOS5AAu
         EKDvrt3qfFGWXQTE4acvsMogS9o7HqqHFXpT6W7TvadGwkUOwLe7akEVljlTRvCRAmGl
         5A3qF1YBVXE3aiqQZORrJcVKyOzEBtXUcKJGpIoXV0tdP/y46REluUiK2mjFvCxK1iMv
         hTFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lGiBM8uqWLsLZ7ATRMVTm4lF4t7ZiIeKx5vLZCfYj6w=;
        b=hBoLq4BN9nYeA18WZiMNfNs1eZRCvpifJpSjZwd14pCbGIinCMeuWiOrDpeHneO9Sz
         3hteuZz7+xDl/3RAZKc7nbiEHXjRcJ1MCaCtkjx2PP4zzEC0vochtdiaqZNwFAG5hTDP
         rDr3Q8GdP+CWqX4VRbdF2N/J+cSTx/eKN5LAcdbH0cyp5u8J4zPE2cFwQhFHzk7dyspO
         DuKWKscQuU+6llaJI8ljxIWrzFSMGdwV7wWoa3pb6TQPZ6Jb0fzl+du4efF4JzBiYAgB
         2zHNk9HqU4jL4lHGyiT9skzv1YLmEj04XPbVnYbmwR1gH6GN3B5zX3wC5Q5YPDPKRN3x
         X6iA==
X-Gm-Message-State: AOAM533zPfO6ZZjpjxMQp/1/YRYG63cD756veHahUai+mibszjAUQi0x
	9bIpgO75kUrQEOeclErz/hZorODGFv5r7R8/IZ8=
X-Google-Smtp-Source: ABdhPJztmjRQUQAc17pSE+pTinb0WMvawqeSYUVeUT81TOMy/qYB4Xy+NO6aK0QFEcfjWHsIEFDqbRH2mFdZ+UzpTGs=
X-Received: by 2002:a50:da8b:: with SMTP id q11mr7609750edj.352.1614915948635;
 Thu, 04 Mar 2021 19:45:48 -0800 (PST)
MIME-Version: 1.0
References: <20210226014356.31274-1-Qi.Chen@windriver.com>
In-Reply-To: <20210226014356.31274-1-Qi.Chen@windriver.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 4 Mar 2021 22:45:37 -0500
Message-ID: <CADkTA4P0woZtrwTseG7YipvhSPyF5M_TPwmTXSt-ioQtvXCHog@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] openvswitch: set CVE_VERSION
To: Chen Qi <Qi.Chen@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Thu, Feb 25, 2021 at 8:44 PM Chen Qi <Qi.Chen@windriver.com> wrote:
>
> CVE entries are using version 2.xx.xx, our PV is 2.13+xxx, this causes
> problem for CVE detection. So we need to set a CVE_VERSION for better
> CVE scanning.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  recipes-networking/openvswitch/openvswitch_git.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/recipes-networking/openvswitch/openvswitch_git.bb b/recipes-networking/openvswitch/openvswitch_git.bb
> index fa1ec4dc..60aaf496 100644
> --- a/recipes-networking/openvswitch/openvswitch_git.bb
> +++ b/recipes-networking/openvswitch/openvswitch_git.bb
> @@ -15,6 +15,7 @@ RDEPENDS_${PN}-ptest += "\
>
>  S = "${WORKDIR}/git"
>  PV = "2.13+${SRCPV}"
> +CVE_VERSION = "2.13.0"
>
>  FILESEXTRAPATHS_append := "${THISDIR}/${PN}-git:"
>
> --
> 2.17.1
>
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
