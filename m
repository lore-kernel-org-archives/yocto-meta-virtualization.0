Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80DF2C61DD3
	for <webhook@archiver.kernel.org>; Tue,  1 Sep 2026 12:25:24 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6809.1788265522434579375
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 01 Sep 2026 05:25:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=sm7mCruv;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-84faf0fa17eso4736710b3a.2
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 01 Sep 2026 05:25:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788265522; cv=none;
        d=google.com; s=arc-20260327;
        b=haJQqlFPde8BT0X0u/b944+GMAkozcu0ccWIFZKcdRCqxkfLXfVpC8krmzTChLBCsM
         ty7+gseJF3Bu4rI5v0kdO9sIb4xDFoTE28HMnB+sRUSARSq0Wr9LsWKHnbuBHnj+8yX6
         NTPwTgk5DGpg4u1rzFYvnPiGGPClgBM1cZp0xCc8G2jL6UGBBIWOXyZqNJTcS4j15xK9
         QAR3HJOVdhB6eTCaSOYCwJ8fmZSV8O8xsqWt4R7aVRAoM/u+ONLNiLupEZ6yenEALlvI
         rv+xz0d+JH8hDcaObN218JlngqS3tfqLAi96UbzPB95iPvLVdHRtW5T8dqdaBabmJXYE
         13Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jmBH74q040jvQ3QEs9TKnqm8iRqfXqDC97MbJ/5zxPo=;
        fh=8pgwkIBJQm2YxD75f7RVQU7m4vlnazCysXygsGHKiP0=;
        b=OBCTpyw2cfv+Po6XYcT0qpMXHkHvMwqvVD0pURs0jH+h9dyxvFAc2dMaR+xXgWdmee
         3zsMIXc9i/zQ/p2f4gP+cTxi8WwTKezaUtxO/gAw5vkvoJjWsizMMZFnfRGTdKswPoNf
         3O0GenDuFbovdRxAN6CZSxBzZdicuMLNNDfQIAjyz2XkOxpglQK1uQn+7tL0xhWhHrw9
         6cwxxU10EMhwAerOou4MEMq9kZkXYPZWVRJzBBZOrYqrxtihznwb7NnYDriFrRCui+D6
         +891JsF765c1TlS+7329dW2HuRolRXo+MSlzqwBnK5745/1P6m3l9+mXSRWZDhTGefYZ
         H6sg==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788265522; x=1788870322; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jmBH74q040jvQ3QEs9TKnqm8iRqfXqDC97MbJ/5zxPo=;
        b=sm7mCruvWEni40SbtRtFYQLBHrQbeCLYHgCJeeXwAveF7AJycTY3JOIUXwVQB5OU8G
         pvP/TID390WlXkgbK+9FysRbL3Pi6qnaiRO/e1yP7aM622/oursVV/A9md834tFEgjMC
         m3lLndJDqji2/aWYzrEnPv0hNnAnvLhElzuHLzbZT0li8WhQgOvpVg4a2iY18rILkh78
         I1KOmlJwaojJS/+saLrGEk6tOEHXMaD5Qa6w4el/ukJgQT9oPacjaTb0sID/JxjnfR7w
         NWnv6b+H0dqkd44Y4IhQy/iZspYlXDqOg2iSKh+1vVI9s/7rIprRoEYBMJFpBPUIlaKA
         ZPhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788265522; x=1788870322;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jmBH74q040jvQ3QEs9TKnqm8iRqfXqDC97MbJ/5zxPo=;
        b=F1rsVbCRx/o8m7EJ4SNc5JyxG+Lw3UgE9/18VMYdQnphiGrrrv3da4qhxUFl5nM41L
         2jXXdlLmqcBRO2NGxWJnQRaOfiiry9VlPQ+dw8xU8MtGC0KBc3F2CTbBDNLuuOVy8BdO
         kr9pwRPxSYC/2Bs6PlUVX2zSoDDYnPtIcY3RJCXASEeegcNgRCtbdRUiFh8YgBaqTKrw
         /oISGF+9Lsw3bGHXlbzKmAJn1/+npBrujcx+ky8gbCm+ZdR/HwXgG+lejCr+jG4vNoH5
         RP3uFUdMhDba6aos3LNf3pLJm5CDLFffw/txWZaTbYn5i3mFVJzsVSYrSffjIyUXGf5Y
         r4Hw==
X-Gm-Message-State: AFuF++kcRCOqM8h0fUQI7ewoUsSvtjwSVVU0XJCRSeCE46qlf/AuYkcx
	Q/VU8ULKco3RhHkTJOJVeDOikPFvPhuY3/MzGu3crn24JqwB2cfa3NExM+R1FHbJCGSwLIK//Gd
	OvvmUHsbMk6P9vTAoLGYhSLZxMeScZbY=
X-Gm-Gg: AR+sD13HLGaWAsBYL1Fynrz63kmO+XwgVOSSfS+Qggupt30iBLsZaMuwOXAv4+UChKB
	qFh+uzU8HT3s++cmRGinaTbL0H0056WIj5CHZp5jGH6fNPEr+DtPHwWi+jp12DWX7t9ttAsyprf
	qjKohNrGLFHJj12RkVkBPz03feM0n8wCsYraq6CpM94wIZkO1kYu9jliAhaCNjTaLwJ/TkLqTSb
	fwaV78L/Tk2E7NLaa6rzwCuXFsJgxilkYxhhceCAH7f95MRVi9T4lH+1D1I3/zs9z6Y+bBOg0XS
	4jc4X5MCTdKld0bGpw+OIGmRR4zObmpBYjkcTmM1o4KPoLii5DfcXVJWiXjA59oHCSZGWHU8Z90
	Derixq8LPsFLpAsmbo0IedR0dzesr0bBmkYbRZWhREVlQkDCNOuBVBmkDMIed/Ftw
X-Received: by 2002:a05:6a21:33a2:b0:3cc:f0c7:5999 with SMTP id
 adf61e73a8af0-3d2686b1408mr49540426637.16.1788265521613; Tue, 01 Sep 2026
 05:25:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260901045008.207872-1-harish.kore@windriver.com>
In-Reply-To: <20260901045008.207872-1-harish.kore@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 1 Sep 2026 08:25:09 -0400
X-Gm-Features: AcwNN1WMrDRxIIneqJEWvriKhxOpIxCvo7FJEN-egb43ch969R-hffIWUHUrZPI
Message-ID: <CADkTA4NTPc6-MB-PhzeFENSm4573W=Xr3P7zHcRe+8b_cM22FA@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] podman: make manpages optional via PACKAGECONFIG
To: Harish Kore <harish.kore@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 01 Sep 2026 12:25:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10066

On Tue, Sep 1, 2026 at 12:50=E2=80=AFAM Harish Kore <harish.kore@windriver.=
com> wrote:
>
> The default make target also builds the manpages, which fails when
> the required manpages tools are not available.
>
> Add a manpages PACKAGECONFIG option and only build and install the
> manpages when it is enabled.
>
> Signed-off-by: Harish Kore <harish.kore@windriver.com>
> ---
>  recipes-containers/podman/podman_git.bb | 19 +++++++++++++++++--
>  1 file changed, 17 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers=
/podman/podman_git.bb
> index 36c80c0e..6e990fe4 100644
> --- a/recipes-containers/podman/podman_git.bb
> +++ b/recipes-containers/podman/podman_git.bb
> @@ -71,6 +71,10 @@ EXTRA_OEMAKE =3D " \
>  PODMAN_FEATURES ?=3D "docker"
>
>  PACKAGECONFIG ?=3D ""
> +# Building manpages needs go-md2man and runs 'man -l', which is not
> +# available on the build host. Off by default; when enabled, use
> +# go-md2man-native and skip the 'man -l' check via MAN_L=3Dtrue.
> +PACKAGECONFIG[manpages] =3D ",,go-md2man-native"
>  PACKAGECONFIG[rootless] =3D ",,,fuse-overlayfs slirp4netns,,"
>
>  do_compile() {
> @@ -98,7 +102,14 @@ do_compile() {
>         export NATIVE_GOOS=3D${BUILD_GOOS}
>         export NATIVE_GOARCH=3D${BUILD_GOARCH}
>
> -       oe_runmake NATIVE_GOOS=3D${BUILD_GOOS} NATIVE_GOARCH=3D${BUILD_GO=
ARCH} BUILDTAGS=3D"${BUILDTAGS}"
> +       if ${@bb.utils.contains('PACKAGECONFIG', 'manpages', 'true', 'fal=
se', d)}; then
> +               oe_runmake binaries docs \
> +                       GOMD2MAN=3D"${STAGING_BINDIR_NATIVE}/go-md2man" M=
AN_L=3D"true" \
> +                       NATIVE_GOOS=3D${BUILD_GOOS} NATIVE_GOARCH=3D${BUI=
LD_GOARCH} BUILDTAGS=3D"${BUILDTAGS}"
> +       else
> +               oe_runmake binaries \
> +                       NATIVE_GOOS=3D${BUILD_GOOS} NATIVE_GOARCH=3D${BUI=
LD_GOARCH} BUILDTAGS=3D"${BUILDTAGS}"
> +       fi

Rather than repeating the oe_runmake, make the additions to the make
invokation be
a variable, and set the variable(s) (both environment and make command
line) conditionally.

Same for the condition below.

Bruce

>  }
>
>  do_install() {
> @@ -108,7 +119,11 @@ do_install() {
>         export GOPATH=3D"${S}/src/.gopath"
>         export GOROOT=3D"${STAGING_DIR_NATIVE}/${nonarch_libdir}/${HOST_S=
YS}/go"
>
> -       oe_runmake install DESTDIR=3D"${D}"
> +       if ${@bb.utils.contains('PACKAGECONFIG', 'manpages', 'true', 'fal=
se', d)}; then
> +               oe_runmake install.bin install.man install.systemd DESTDI=
R=3D"${D}"
> +       else
> +               oe_runmake install.bin install.systemd DESTDIR=3D"${D}"
> +       fi
>         if ${@bb.utils.contains('PODMAN_FEATURES', 'docker', 'true', 'fal=
se', d)}; then
>                 oe_runmake install.docker DESTDIR=3D"${D}"
>         fi
> --
> 2.53.0
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

