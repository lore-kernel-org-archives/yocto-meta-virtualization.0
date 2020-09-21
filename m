Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
 by mx.groups.io with SMTP id smtpd.web10.52401.1600723801797989389
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 21 Sep 2020 14:30:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=W3V+3jKq;
 spf=pass (domain: gmail.com, ip: 209.85.208.67, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f67.google.com with SMTP id g4so14312358edk.0
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 21 Sep 2020 14:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/U9ARzVVxV2DD6nHwz4jA2Ine5u03kr9axfHLZARLOg=;
        b=W3V+3jKqTDOSrilW76jWdk3BkyW3aU2fXHcQ5STJAjH7uAp3rxLYt0tAGN92EPbFuG
         mpsjSGncZ1rbv41rKCHkv2N/atWXTsVbGLPiRr3tKrhJsrgpsZ9Ue8phx1D5EA17iLMt
         3s/qnNfl0HwzLmtPusqWvNk083p4Z3Mcz4YRdGr1V/kRGOd8DVzB1QgRfK8+4TqzaAjA
         xp5WzrGtRCr0GRn4JanygWhlISFuOVCvLPsd+OfQJD8qaRhqz2uXoJgQSrJDEgEvLvu/
         8IrR5DlUKTiqvsb6G/o+NKt9A0C/9Vj7/8/JXrpulG5U/QXjBX15Zg1siBTs6qp8bKgr
         vMuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/U9ARzVVxV2DD6nHwz4jA2Ine5u03kr9axfHLZARLOg=;
        b=EnEsnEWgGxp4bxllBKm9h6i+k0obklNsvWXnFrOuck3kEkDS+GPD1NiliPbGUfoPMw
         8ayAS+CWPr8P39GNZn9X5Ub//tB/7IykUqUOXE00K2eBQT9lNcdMDL3G3kBRz42V6rrO
         lHxYpyQ+GexEtXXUg1lxRPoWikuTGB1NYl4poNKH4lEUrANKWvivPv/+9qpLAJn8n4aJ
         hKIQ40YqUHvEzgVWFXuVBQYJe8TfutcGy1FkyObMVRBj+dT5t/G13sMsGpbeyojXrpy4
         G3ASfR9oky0eGttuto+z9QMwOgxp2z1klTX8ButXScHrfhV5FO0/Xi/oG/O5Cz7Xt4nN
         RzoA==
X-Gm-Message-State: AOAM531tz8CEN/zrE++xqqqoUTd4isr2YjaVnbaDr8tQOyryY6IAqSZq
	dh8RdNoMZP8zCCNk0ntMNgbv2CP9Ghn1ZrNralw=
X-Google-Smtp-Source: ABdhPJzjVMnRwGzVHi30thbNDjzJF80og5+HR8EcNRpRsUVKuAwUz3bVtOuA1J9khhD87RIN3gSPcBNO6i8eDGtUi9A=
X-Received: by 2002:a50:abc3:: with SMTP id u61mr860425edc.129.1600723799966;
 Mon, 21 Sep 2020 14:29:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200914143148.12881-1-hongxu.jia@windriver.com>
In-Reply-To: <20200914143148.12881-1-hongxu.jia@windriver.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Mon, 21 Sep 2020 17:28:43 -0400
Message-ID: <CADkTA4Md7cNQfxT45bz8V+Q14awt0A0+BCSGXC_1NDXrBs04PA@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] sloci-image: add nativesdk support
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

This is only a -native recipe, so it shouldn't be renamed.

It is fine if you want to add nativesdk support to it, but that
shouldn't necessitate the recipe being renamed.

Bruce

On Mon, Sep 14, 2020 at 10:32 AM Hongxu Jia <hongxu.jia@windriver.com> wrote:
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  .../{sloci-image-native_git.bb => sloci-image_git.bb}         | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename recipes-containers/sloci-image/{sloci-image-native_git.bb => sloci-image_git.bb} (93%)
>
> diff --git a/recipes-containers/sloci-image/sloci-image-native_git.bb b/recipes-containers/sloci-image/sloci-image_git.bb
> similarity index 93%
> rename from recipes-containers/sloci-image/sloci-image-native_git.bb
> rename to recipes-containers/sloci-image/sloci-image_git.bb
> index b3b11bd..30fa4c1 100644
> --- a/recipes-containers/sloci-image/sloci-image-native_git.bb
> +++ b/recipes-containers/sloci-image/sloci-image_git.bb
> @@ -11,8 +11,6 @@ DEPENDS = ""
>  SRCREV = "4015e49763e5a738026a5bbfcf32b38b5a4fa650"
>  PV = "v0.1.0+git${SRCPV}"
>
> -inherit native
> -
>  S = "${WORKDIR}/git"
>
>  do_compile() {
> @@ -23,3 +21,5 @@ do_install() {
>         cd ${S}
>          make PREFIX="${exec_prefix}" DESTDIR=${D} install
>  }
> +
> +BBCLASSEXTEND = "native nativesdk"
> --
> 2.18.2
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
