Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
 by mx.groups.io with SMTP id smtpd.web11.394.1595610601037040828
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 24 Jul 2020 10:10:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=O7UWAlpB;
 spf=pass (domain: gmail.com, ip: 209.85.208.66, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f66.google.com with SMTP id by13so7502847edb.11
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 24 Jul 2020 10:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rtOhdPosb0oBqZEenDG0nvk2fQ4SGR/TJKm6F6qG9Qg=;
        b=O7UWAlpBHaBQGW50YDFlbGqXyi9ySrn8/BM0FJJuoi811YTD/GnH2vc7QGo7uSWwyP
         tKZpb3YAk62oxE1yoPH9HGmHpnJMIwSynTWMjntTjk7TckIx+OYNg3VIsBzAGKbyfUHA
         EA2o3Ac/nSxNC86nUNYhq0TNaY5sbiSpZhCVTWre8J/4xrkTAsUscv7YVnSyhDKID+/w
         4tMGPDOv4kjrcBWVDaKeQDpKM53hKhD4mpUMzoVl1cXaA86lriVC/d4twxvckwuEcveS
         9d8Aoa3/+gMO6WqG8ZiM1K0ZYEntK/yxg6cZHYmePRTpBkcnXrdG7GfQR9So4FXZsCLW
         wL+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rtOhdPosb0oBqZEenDG0nvk2fQ4SGR/TJKm6F6qG9Qg=;
        b=mbcahxN3ee2mcISxaROio+qIlDpkmeNfI29zcCgSWisPhmzTd42K6Si4gBh5n5rqaV
         nwYes0pW9gK75Yfuk0PoIWTIMb9HgXF3beoPBOPanTn4fYocNgJyd67+m7ZTdWG1UYyn
         PomBRY5k6emaBfFepTfQ9jyraLxyHk0jYpRHwrHWlp7NyDIF40GfSMjYrLqlTiEvcQZt
         XXiGJGbAdTwfTal2Z70y4hgpIsFtLKO4T2VpSFNXvbjoGax3T6q3xkSFl3y/W/u+b3Wb
         uRiXQyVL7r1NynlDZGC7ZY39geDwco5lA9SXxKX4fV6Jl1rdJcCqAR5FSAGbPaxX1E/Z
         KyJQ==
X-Gm-Message-State: AOAM53118uYYamc3LE4L+aD3zn3Jd7EQrxdQMsl7hnl4ctx0wSRGGed/
	HSHR+avARY02q8yO9ihEQ5i8rjavfwR3UdJFBR8=
X-Google-Smtp-Source: ABdhPJxmexkIVEG5ZhF4J/hIbDoallaDxFUBLI28JxGgpHUoOdY15CwFZ7mYJ2K1/jBzVBkQYblbTMMWJ46b6pvvWPw=
X-Received: by 2002:a50:f385:: with SMTP id g5mr9453615edm.347.1595610599440;
 Fri, 24 Jul 2020 10:09:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200721182439.1827-1-liu.ming50@gmail.com>
In-Reply-To: <20200721182439.1827-1-liu.ming50@gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Fri, 24 Jul 2020 13:09:48 -0400
Message-ID: <CADkTA4POJpV9R5cJspJEWaQnS5NkvBiga6ZBBQs9S1jOKybR7w@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] conmon: uprev 2.0.11 > 2.0.18
To: Ming Liu <liu.ming50@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org, 
	Stefan Agner <stefan.agner@toradex.com>, Ming Liu <ming.liu@toradex.com>
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Tue, Jul 21, 2020 at 2:22 PM Ming Liu <liu.ming50@gmail.com> wrote:
>
> From: Ming Liu <ming.liu@toradex.com>
>
> Also drop useless SRC_URI[md5sum], SRC_URI[sha256sum] and FILES_${PN},
> and add SRCPV to PV.
>
> Signed-off-by: Ming Liu <ming.liu@toradex.com>
> ---
>  .../conmon/{conmon_2.0.11.bb => conmon_2.0.18.bb}        | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
>  rename recipes-containers/conmon/{conmon_2.0.11.bb => conmon_2.0.18.bb} (71%)
>
> diff --git a/recipes-containers/conmon/conmon_2.0.11.bb b/recipes-containers/conmon/conmon_2.0.18.bb
> similarity index 71%
> rename from recipes-containers/conmon/conmon_2.0.11.bb
> rename to recipes-containers/conmon/conmon_2.0.18.bb
> index a5bd527..c2c0fae 100644
> --- a/recipes-containers/conmon/conmon_2.0.11.bb
> +++ b/recipes-containers/conmon/conmon_2.0.18.bb
> @@ -6,13 +6,12 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=61af0b6932ea7b12fb9142721043bc77"
>
>  DEPENDS = "glib-2.0"
>
> -SRCREV = "ff9d97a08d7a4b58267ac03719786e4e7258cecf"
> +SRCREV = "7b3e303be8f1aea7e0d4a784c8e64a75c14756a4"
>  SRC_URI = "\
>      git://github.com/containers/conmon.git \
>  "
>
> -SRC_URI[md5sum] = "5c711911d766d76813333c3812277574"
> -SRC_URI[sha256sum] = "4c31278b2c03e5be5a696c3088bc86cf2557a70e00f697799c163aba18e3c40e"
> +PV = "2.0.18+git${SRCPV}"
>
>  S = "${WORKDIR}/git"
>
> @@ -26,7 +25,3 @@ PACKAGECONFIG[systemd] = ",,systemd"
>  do_install() {
>      oe_runmake 'DESTDIR=${D}' install
>  }
> -
> -FILES_${PN} += " \
> -    ${bindir}/conmon \
> -"
> --
> 2.27.0
>
> 



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
