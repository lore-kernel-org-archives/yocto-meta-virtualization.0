Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web12.7488.1621339420450982235
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 18 May 2021 05:03:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UkYcVZUM;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id s22so13931947ejv.12
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 18 May 2021 05:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nOG3S2HEpFsEGK3D3N9GaaS/xDAKuG3yjoYhYBAYlE8=;
        b=UkYcVZUMTvHj5rz0mmB8HsY4T0Z5yl8i7bXka2XRaQ99kSgZSiaUmPaEEywMVyv1b/
         MapZpJvmmrzOcLtGvukuUUwJzA8IRYtNML8CjObE3moM3Q9bUWEyQXHc2jC/d2I9qBqi
         FaUCEdnIRfgQxCxHpP6nSFMAlEHs/G1qxBnguOkA8jn0IY0u7rnQm0S8gJUq42Y5YgOT
         Md15Fks8IpYeoTq9ySXWJOPHAxhRy6F0nTG0M/M0Suu7wrBadUaCNM7atAEvZZ/4dLih
         cbRsn7cr8Nal/A4c2VXEjrvoFcs1Nd5I31Ay7op7WYSy9sju7m8kYhlLwG7AoB+QhK81
         Li1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nOG3S2HEpFsEGK3D3N9GaaS/xDAKuG3yjoYhYBAYlE8=;
        b=nz64U4K3XkVwB4Etx6A5lLH9rDFG4rBrF1RHCBgiM3kqmsrCL/CzzfaS79UkmE3doA
         Eie4nzCJsjYaKVJc9mbNsskmVe+NUjZ8wCvHTSFSx6mfsYoqN3WFh4bab7Ba2d0he76L
         oTx/F59NNyxTIVH883KDsIP4kcODLUA2wLkOTdk7MAF2VQH1pV6/bNjGK1nQySrNbJjT
         EgEkKzGguu/WAXEcfRYJAvicNeBIFUg7/RZ/9Sucroo0C2YvNvucj5S9+tsQKHputNoB
         Yiaq+EqBfh/BN6BgHiJ2RzrMiRtxbi80pQOnA3uUBA74CBv1Ua9J/pRQBCRI88mJrvtj
         DCwg==
X-Gm-Message-State: AOAM530z9XflBJRWwqblb+lq25wu0qbOQQH21U4ULX+l8QmJkqkbiSrF
	Z/GCKp/sLSZGSmECcgeTc81gu/Zib9hJRTHe0V4=
X-Google-Smtp-Source: ABdhPJz6v25QgpOskmT97/Ul/3Eb+7mlOdjMTu5gdh+JKqEDJo3X2dzHycklvxr1pFdCdtmQ5rlzuFW6AukAeSNSpt8=
X-Received: by 2002:a17:906:2ac5:: with SMTP id m5mr5655130eje.517.1621339418945;
 Tue, 18 May 2021 05:03:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210518045546.57617-1-Qi.Chen@windriver.com>
In-Reply-To: <20210518045546.57617-1-Qi.Chen@windriver.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 18 May 2021 08:03:27 -0400
Message-ID: <CADkTA4MR2hnoB73ohuDrwK7_aSy0ak8mkftb-iev-LyXh6NvXQ@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] nativesdk-sloci-image: add recipe
To: Chen Qi <Qi.Chen@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Tue, May 18, 2021 at 12:55 AM Chen Qi <Qi.Chen@windriver.com> wrote:
>
> Add nativesdk-sloci-image recipe which is basically from the
> sloci-image-native recipe.
>

Copying the recipe is a bad idea.

What's wrong with just adding the inherit nativesdk in the existing
sloci recipe ?

Bruce

> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  .../sloci-image/nativesdk-sloci-image_git.bb  | 27 +++++++++++++++++++
>  1 file changed, 27 insertions(+)
>  create mode 100644 recipes-containers/sloci-image/nativesdk-sloci-image_git.bb
>
> diff --git a/recipes-containers/sloci-image/nativesdk-sloci-image_git.bb b/recipes-containers/sloci-image/nativesdk-sloci-image_git.bb
> new file mode 100644
> index 0000000..3c2b539
> --- /dev/null
> +++ b/recipes-containers/sloci-image/nativesdk-sloci-image_git.bb
> @@ -0,0 +1,27 @@
> +SUMMARY = "A simple CLI tool for packing rootfs into a single-layer OCI image"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=948cd8e59069fad992b0469af9ad7966"
> +SRC_URI = "git://github.com/jirutka/sloci-image.git \
> +           file://0001-sloci-image-fix-variant-quoting.patch \
> +          "
> +
> +
> +DEPENDS = ""
> +
> +SRCREV = "4015e49763e5a738026a5bbfcf32b38b5a4fa650"
> +PV = "v0.1.0+git${SRCPV}"
> +
> +inherit nativesdk
> +
> +S = "${WORKDIR}/git"
> +
> +do_compile() {
> +       :
> +}
> +
> +do_install() {
> +       cd ${S}
> +        make PREFIX="${exec_prefix}" DESTDIR=${D} install
> +}
> +
> +CLEANBROKEN = "1"
> --
> 2.30.2
>
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
