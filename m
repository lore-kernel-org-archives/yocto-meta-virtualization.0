Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.2136.1595270898217292922
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 20 Jul 2020 11:48:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vaHE/q5N;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: bruce.ashfield@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B79D3E01ED0; Mon, 20 Jul 2020 11:48:17 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.208.65 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 218ADE01ECE
	for <meta-virtualization@yoctoproject.org>; Mon, 20 Jul 2020 11:48:15 -0700 (PDT)
Received: by mail-ed1-f65.google.com with SMTP id dm19so13520600edb.13
        for <meta-virtualization@yoctoproject.org>; Mon, 20 Jul 2020 11:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yExEqSo2tWRHLsCQbhP8BEIIyUNglKmR8X3yv+Za42o=;
        b=vaHE/q5N9MiXlj74F0cRcQkUQcBqsxuBJ42CBQponWpN7ph1XHiO5wRcCL0wgdvuEs
         4ROn7p4hkj3aMsmA9UI28cE9Wk61R8LAPtwn7PQJVUFguy6fj4yQqpcqCNEqU9TmmHQm
         4YFBk7jYy4vgZ+p2uev04in7NgJ+TalchIrVH342daTK0jsy/joxGNL0Wdn/H4JLxMJV
         52s0/XFps2XvLiSos9R+i6klFOnoKHI6CQG0eWN9hEfFVJaDeR+IY3SFKr1dvc4dWv5Y
         u6AV4GENJQbTpaOitYngsoKIEHjrjM+a8DUSxMJ/H+8gjGNIcsOFExbsa1BB/wAnmFWB
         d80A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yExEqSo2tWRHLsCQbhP8BEIIyUNglKmR8X3yv+Za42o=;
        b=WG1iVi/mIIeIOjdUlCr99q07rYC6Jrl5Vd/MZSbDidfmPtxADoYXdipQTHPW/Ps7h8
         fbRx5yzarTjxRQ8DHd4plhAFYjKWRU091dzFIROuweaOIznJu31aDdL68PIEhNCm1lUi
         cep2+1AM0n6WlBbUOz3T7KFHZl3uPvCNQRrlirz2CtYFfIm4yFJ03EMgSrCxH+FuRT4X
         LJQa7d+RtFmRqI6IwXrUfiRFGcubzjVSEYgR0ZaHYJmEXGjJjA330EZyMZfGqf+nIOgm
         PmPo5QFeT/lcv6DucH9DWPpx2YTNRgxU1G8O0PdSEK+FSEX/dSx7wMHhf2Ec7bTWaG7Q
         jBlg==
X-Gm-Message-State: AOAM532qfO1RrgMcJmh1agXijicqy+Ij6qRv0ChrrI/piOH5FeE49+1K
	EU7xlrI4YNDxpFEUaJmc2HiBuYVhxvSt72CMTLs=
X-Google-Smtp-Source: ABdhPJwoSChaKueemkEYVpPjaMe5cLtR5cM7DSM9Dn8iU8BdmbZxfaOSbzl33TcAb1EAHBb9/8ceZ6hnDhZqB3I4bHY=
X-Received: by 2002:aa7:d6cf:: with SMTP id x15mr22072074edr.164.1595270894547;
 Mon, 20 Jul 2020 11:48:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200717210349.16459-1-christopher.w.clark@gmail.com>
In-Reply-To: <20200717210349.16459-1-christopher.w.clark@gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Mon, 20 Jul 2020 14:48:03 -0400
Message-ID: <CADkTA4O+eZpYTWYkT5kvvc80Gxu9qsGfpT3TN-5AtKZgtYCUcw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 1/4] xen-tools: packaging for new files in Xen 4.14
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: meta-virtualization <meta-virtualization@yoctoproject.org>, 
	Doug Goldstein <cardoe@gentoo.org>
Content-Type: text/plain; charset="UTF-8"

The series has been merged.

Thanks!

Bruce

On Fri, Jul 17, 2020 at 5:04 PM <christopher.w.clark@gmail.com> wrote:
>
> From: Christopher Clark <christopher.w.clark@gmail.com>
>
> Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
> ---
>  recipes-extended/xen/xen-tools.inc | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>
> diff --git a/recipes-extended/xen/xen-tools.inc b/recipes-extended/xen/xen-tools.inc
> index 2feed00..99e7e0b 100644
> --- a/recipes-extended/xen/xen-tools.inc
> +++ b/recipes-extended/xen/xen-tools.inc
> @@ -64,9 +64,12 @@ RRECOMMENDS_${PN} = " \
>      ${@bb.utils.contains('PACKAGECONFIG', 'externalblktap', '', '${BLKTAP_RRECOMMENDS}', d)} \
>      ${PN}-flask \
>      ${PN}-hvmloader \
> +    ${PN}-libxenhypfs \
>      ${PN}-shim \
>      ${PN}-ucode \
> +    ${PN}-vchan \
>      ${PN}-xenpaging \
> +    ${PN}-xenhypfs \
>      "
>
>  RDEPENDS_${PN}-devd = " \
> @@ -137,6 +140,10 @@ RDEPENDS_${PN}-xendomains = "\
>      virtual/xenstored \
>      "
>
> +RDEPENDS_${PN}-xenhypfs = " \
> +    ${PN}-libxenhypfs \
> +    "
> +
>  RDEPENDS_${PN}-xl = "libgcc"
>
>  RDEPENDS_${PN}-xenmon = " \
> @@ -179,6 +186,8 @@ PACKAGES = " \
>      ${PN}-libxengnttab-dev \
>      ${PN}-libxenguest \
>      ${PN}-libxenguest-dev \
> +    ${PN}-libxenhypfs \
> +    ${PN}-libxenhypfs-dev \
>      ${PN}-libxenlight \
>      ${PN}-libxenlight-dev \
>      ${PN}-libxenstat \
> @@ -204,6 +213,7 @@ PACKAGES = " \
>      ${PN}-shim \
>      ${PN}-staticdev \
>      ${PN}-ucode \
> +    ${PN}-vchan \
>      ${PN}-volatiles \
>      ${PN}-xcutils \
>      ${PN}-xencommons \
> @@ -211,6 +221,7 @@ PACKAGES = " \
>      ${PN}-xend \
>      ${PN}-xend-examples \
>      ${PN}-xendomains \
> +    ${PN}-xenhypfs \
>      ${PN}-xenmon \
>      ${PN}-xenpaging \
>      ${PN}-xenpmd \
> @@ -324,6 +335,12 @@ FILES_${PN}-libxenguest-dev = " \
>      ${datadir}/pkgconfig/xenguest.pc \
>      "
>
> +FILES_${PN}-libxenhypfs = "${libdir}/libxenhypfs.so.*"
> +FILES_${PN}-libxenhypfs-dev = " \
> +    ${libdir}/libxenhypfs.so \
> +    ${libdir}/pkgconfig/xenhypfs.pc \
> +    "
> +
>  FILES_${PN}-libxenlight = "${libdir}/libxenlight.so.*"
>  FILES_${PN}-libxenlight-dev = " \
>      ${libdir}/libxenlight.so \
> @@ -535,6 +552,10 @@ FILES_${PN}-ucode = "\
>      ${sbindir}/xen-ucode \
>      "
>
> +FILES_${PN}-vchan = "\
> +    ${bindir}/vchan-socket-proxy \
> +    "
> +
>  FILES_${PN}-volatiles = "\
>      ${sysconfdir}/default/volatiles/99_xen \
>      ${sysconfdir}/tmpfiles.d/xen.conf \
> @@ -557,6 +578,10 @@ FILES_${PN}-xend-examples = "\
>      ${sysconfdir}/xen/xend-pci-quirks.sxp \
>      "
>
> +FILES_${PN}-xenhypfs = "\
> +    ${sbindir}/xenhypfs \
> +    "
> +
>  FILES_${PN}-xenpaging = "\
>      ${libdir}/xen/bin/xenpaging \
>      ${localstatedir}/lib/xen/xenpaging \
> --
> 2.17.1
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
