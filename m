Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web10.23227.1604981070658824327
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 09 Nov 2020 20:04:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=THCIS5ju;
 spf=pass (domain: gmail.com, ip: 209.85.222.196, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f196.google.com with SMTP id 11so10290939qkd.5
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 09 Nov 2020 20:04:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=U9r+YWnPigynXV3YCaHeePfSgt233EP2lS1LEZH2Yy0=;
        b=THCIS5ju+Mpx9dqRvqENg82ltzxOY92ehkEM2lDsvZcfpkudTYNJDCL128YP10UCS0
         Wa8+neEYy8XLP470uTPr1Y0gO2NZPG73pa7F7iYJhhxbjPzOJ55ofU5FAvrLEOhbTfz4
         rFdqvocAe6PVF+MfN24DY2hGmPDMEkZyBp2TLxkT9YUykzZ/G28PaungNWkYRWW+CAS6
         HyzyR/JFjFvANKzkgJrR9oROjGppr38x7PehQrFtvDokdUp5pgvVPGCdmnyYrJJbk31j
         ha0mtz0LetErJIx1lBjtJRc+/9gIRCVTo5+6C/uCKuPT1ON51e9AYpNMmmOrXGGDq6uG
         +UGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=U9r+YWnPigynXV3YCaHeePfSgt233EP2lS1LEZH2Yy0=;
        b=IKhHt0SXetaHiuzpPJbwxPI1B2VrD3OAxULp8ix0Mf//kGRAS/PS9/fDFXdRj3YoJy
         Yqq9OWken6M0RxT/m3i1/s8qAZWZKI4xjDeeYA5TaaQrFOkN0br9Ibf6/Hp7PIEHQJD1
         htk6LnVyuoLaN/TtN5G0jdJX7lQxQzbP9FB/ftIjw/itOutw2T5VneBCMrCaEesGnRCx
         PrUx/qZSqPcvuklAE2+akhZ8/WFjY0g4r4ewB0KwdzSGSiY1CD0dAd159WcsQcBIL4AT
         sCInoopF3l4x+JXoZkOdHudBSFkMA7yDGoGHqhBED0NHpJ10z7AGGCdSDQ7e+MALQC9h
         Rdtw==
X-Gm-Message-State: AOAM532jRj6ETWW0dvuUrH3HkfpRbAi6bOY4eq/ETDM39zfqaa6OTtyO
	TLlSirHHk4uynCSnrSCVODxdbFKyOYXNpH0V
X-Google-Smtp-Source: ABdhPJyBEuXlvGcmNIbOaSgpPxXtiY292AryJdJAX9dZCnbcNSJNkuKW1ftCcYfuTwkabN1wTxsmrw==
X-Received: by 2002:a37:8245:: with SMTP id e66mr12765420qkd.389.1604981069762;
        Mon, 09 Nov 2020 20:04:29 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (cpe04d4c4975b80-cm64777d5e8820.cpe.net.cable.rogers.com. [174.112.165.127])
        by smtp.gmail.com with ESMTPSA id x22sm7482239qkn.125.2020.11.09.20.04.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 20:04:29 -0800 (PST)
Date: Mon, 9 Nov 2020 23:04:27 -0500
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] xvisor: skip QA checks ldflags and textrel
Message-ID: <20201110040424.GA37119@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20201106140519.765558-1-Martin.Jansa@gmail.com>
 <20201106140937.765868-1-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Merged.

Bruce

In message: [meta-virtualization][PATCH] xvisor: skip QA checks ldflags and textrel
on 06/11/2020 Martin Jansa wrote:

> * feel free to fix it properly, I don't use xvisor at all
>   it just shown these 2 errors in my aarch64 world builds
>   and this recipe needs more love than just these 2 issues
>   like setting PV to something better than "git"
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
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


