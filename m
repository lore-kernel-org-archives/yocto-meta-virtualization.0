Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web11.76679.1638282644097965585
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 30 Nov 2021 06:30:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JKc7CJX5;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id z5so22389682edd.3
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 30 Nov 2021 06:30:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/2FTArCOrn7R77gMTQPaO3IhPDTCM4R19RHLgc77cIE=;
        b=JKc7CJX5jpcPzet6/F1ucL5AnCdloVCNIJ36td1Fna54laJl8yN89qugAmvf1e/nZz
         zI4tr+yKFhVXyLktlU+Y7ejvDl8qkkHE5I32QMB2cJB0LTAN8hlu6tzAZNzitEuiteIT
         iJSqXagKL+cxbmt7AuHEMGNp6f76kMycVSCPWvL9I9LHzDTPmDxhbxhlQD5u6rkIl2Qb
         xN7/waKbIyupidKOkUYxbxXRu590LCMoyhT2ZS3C3qva3O0GmwdWSCd79ZNxIPNPvRp2
         dBSYagj6gfxxXRUbBxK5q2q0rS17tRuccgWbUoBmjvDalfMqY7YV8Xz5DUjKG2eQjiCM
         e91A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/2FTArCOrn7R77gMTQPaO3IhPDTCM4R19RHLgc77cIE=;
        b=vt4Y++l1RZ7cc8HO+6M3k1n6+8jxDr4qmvvL/d0Kfj5/3BBVn4YIW+dDRV+k2O6DuW
         fbeW1yxDd3DLO6SImpHT+jEyPqpNGwLoLq0ApUHm92QCg/kURXE9ewfM7stTAtBP0Wgc
         IDFAFjnZZzstHfAWeT4f/iSI8iEM0vBbD/RN9zUFZSgwPE5IiAdl8hRRHCZsULOUaEkA
         UDRVkjo2sUArWzn6VWojdGn17wZhEZPt+bqHhR8/8vFjFxIMu/Z1poCETy04vPBI1Dxd
         MdAdBIzw5AxX96CC89Wwma4EI/BPfowFsAcnFtNC32LU3IbsgIfGuWhqLwB+C2zXcN1z
         BO2g==
X-Gm-Message-State: AOAM533/FZMxWWgkIF4aHlzSERKaaHSo2nAimBPdWluyctXtcTzGSHPd
	qWZsJPuRiSIpngCump1ynC1Uhlkba/PCsjzYVss=
X-Google-Smtp-Source: ABdhPJz7nnx1cly1FYGeJ9pDeJF+A+oY0628F0kOqU7PSp1xX5uhGXnRsowLp7sfAkCresImBIc69I1V5+GXj203cBs=
X-Received: by 2002:a17:907:1689:: with SMTP id hc9mr66782764ejc.445.1638282642444;
 Tue, 30 Nov 2021 06:30:42 -0800 (PST)
MIME-Version: 1.0
References: <20211130142116.34259-1-Martin.Jansa@gmail.com>
In-Reply-To: <20211130142116.34259-1-Martin.Jansa@gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 30 Nov 2021 09:30:31 -0500
Message-ID: <CADkTA4PXmJzjjo9ZG40Y69dW6E7OWUg_ygg+YGeNu6Y1e47o-A@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] xvisor: set PV
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 30, 2021 at 9:21 AM Martin Jansa <Martin.Jansa@gmail.com> wrote:
>
> * use something more reasonable than default 'git' from filename
> * there wasn't a new tag for a long time, so this is quite far
>   from 0.3.0 as git describe shows:
>   v0.3.0-231-g6b23764a
>   but 0.3.0 is still the closest release I've found
>   and matches PROJECT_VERSION in Makefile:
>   https://github.com/avpatel/xvisor-next/blob/6b23764a1439f9d08b2ed2f363da522460d8a22b/Makefile#L29
>

I had noticed this as well (I struggled on the commit message so just
went for 'tip') and had meant to circle back to it.

Thanks for the patch, it is now merged.

Bruce


> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  recipes-extended/xvisor/xvisor_git.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/recipes-extended/xvisor/xvisor_git.bb b/recipes-extended/xvisor/xvisor_git.bb
> index 4d2a719..26b4e0f 100644
> --- a/recipes-extended/xvisor/xvisor_git.bb
> +++ b/recipes-extended/xvisor/xvisor_git.bb
> @@ -8,6 +8,8 @@ require xvisor-configs.inc
>
>  inherit autotools-brokensep
>
> +PV = "0.3.0+git${SRCPV}"
> +
>  # This version support the RISC-V v0.5.0 Hypervisor extensions
>  SRCREV = "6b23764a1439f9d08b2ed2f363da522460d8a22b"
>  SRC_URI = "git://github.com/avpatel/xvisor-next.git;branch=master;protocol=https \
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
