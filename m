Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C142CD0425
	for <webhook@archiver.kernel.org>; Mon,  5 Jan 2026 23:30:54 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.78565.1767655847935195885
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 05 Jan 2026 15:30:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Brn9FhC+;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2a07f8dd9cdso3912545ad.1
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 05 Jan 2026 15:30:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767655847; x=1768260647; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ngGd/NOXmwH06QFleDUm0lYGFovWDTq3M4BEvql8bsk=;
        b=Brn9FhC+zSt4Zh7d3CnTpfih1bH6k253KoD3tYEGooKG+u00yp7br2ffgCxf5cer1O
         Grn3vnimRgZUXXMGA7NRKo4qVGn97DQp+A/UY+CSBLL7SB+MGDiHe4+YmADL3WkFsqxv
         /NmnHmmLpvTwVOMlmCkd/Xayxtybo7JGgvK1/fbIBWDWaLRQmyOz6s+uq8wMWhjkMyVM
         TuuYG+ljM0ViA7bVTl1Y2/2qkNOywMV0Nf2n+yru2KBXIZf2L6T87NCY3TqiXUaPIGky
         AqtdoX0vt/Lp0tE3HLwy5hLhPkSvw8oLlEtWCHajtj1DP8w0BKHUCOhL5L60TeHlCtLl
         l8uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767655847; x=1768260647;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ngGd/NOXmwH06QFleDUm0lYGFovWDTq3M4BEvql8bsk=;
        b=C16wVP0d4rLV9y1OeRZJrNIzxiCf+QU/fSKmdE+lrTQHdZsYblk5COTAvNxKbpdA+n
         NqfkYuw/mo0qKB5iu4zykf6ib7JpaYPeeJLpFwol7Xprgkv/q4kEoTuNPpTQ7KnXALpa
         yB8VwBe1QoP8qqzvvmTT/EpN0IrPT8dLP8Jy4fjuK0f4KzbVGMIAMfUXN1L1wL9raorx
         ZSmDEFUKLMDzIq/WcgI+51XHSwnU6lhu18zJg0MzNCCY6sW7QcPcYYl5FQNiVItzpCSh
         ABxB/qjOaQuo85dl/StvJetBvQ1uLV63SIJYK3TeIiJzcS5CtoDxP01C9vdrc8CaIftt
         6T+g==
X-Gm-Message-State: AOJu0YyyQd9SqKYAvE6aGTpnjrX2TfF1HAt33M3Yu3iMX2Qu3MlsGExf
	Z2eztsS5UwI45aBBP4ZC/vxinEl1wXcX8zx/MHjqwusgTwoZwsIVtADNKba3uQLIMWeBcPoHXd+
	jngvSdQjoRh12dn5mqWooeXmeIeholA8KI90KeF8=
X-Gm-Gg: AY/fxX5nTOJpeVsc0szCmYd/d/0F36aTbQT1klvKxCmPyaiBs1hIysurgm5kUVFru4/
	cxtNfjUblPn5JjdRXEOVf8rJ6oxG+2yfs7H2zLuFSGF78dA+iuNk2KIJkr69jAYEu+cDoWp6sIo
	6IJU+B2zO9jGueds9E1TzrGJ/l0g/ejtAMDh/5mgEdZ6U7vyzUbjfv94PMOfB8Y9UPZaf37JdAQ
	OV7vq7Owfttnb6/mJnQn9YT30pXiJUEhIvSsZJnPTie/NHRtdhXI66iwCqCKEwvVgMmcpji
X-Google-Smtp-Source: AGHT+IGuvfrHvdpZsTl+k7+95Ofm94/ocYzTOV47UjK3O6Xy1r1Svx0fx62WNXMp/7u9cKqanWW8+Bpesq/0LvzqQSQ=
X-Received: by 2002:a17:90b:3e83:b0:341:315:f4ed with SMTP id
 98e67ed59e1d1-34f5f280f61mr662651a91.10.1767655847075; Mon, 05 Jan 2026
 15:30:47 -0800 (PST)
MIME-Version: 1.0
References: <20260105212937.23936-1-matt@mattfischer.com>
In-Reply-To: <20260105212937.23936-1-matt@mattfischer.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 5 Jan 2026 18:30:35 -0500
X-Gm-Features: AQt7F2oqSMNZHEbJ7xX_yap08y7_6u5481NljRvMd9tvryDEY-CoudMfTD3MKz4
Message-ID: <CADkTA4NoJyRka5b_euf3b4ZcFe26uK9jNhJF74u5KapCOX3s5Q@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] upgrade podman to 5.7.1
To: matt@mattfischer.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 05 Jan 2026 23:30:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9519

On Mon, Jan 5, 2026 at 4:29=E2=80=AFPM Matt Fischer via lists.yoctoproject.=
org
<matt=3Dmattfischer.com@lists.yoctoproject.org> wrote:
>
> This patch updates podman to 5.7.1 which is the latest release
> as of today.
>

Thanks for the update, but I'm in final stabilization before release.
I won't be doing
any package updates until the M2 timeframe.

Cheers,

Bruce

> Signed-off-by: Matt Fischer <matt@mattfischer.com>
> ---
>  recipes-containers/podman/podman_git.bb | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers=
/podman/podman_git.bb
> index f09e01f8..0a80456d 100644
> --- a/recipes-containers/podman/podman_git.bb
> +++ b/recipes-containers/podman/podman_git.bb
> @@ -16,9 +16,9 @@ DEPENDS =3D " \
>      gettext-native \
>  "
>
> -SRCREV =3D "3529cd312f28b0d44ad9647aa652fb4437b9bb1c"
> +SRCREV =3D "f845d14e941889ba4c071f35233d09b29d363c75"
>  SRC_URI =3D " \
> -    git://github.com/containers/libpod.git;branch=3Dv5.6;protocol=3Dhttp=
s;destsuffix=3D${GO_SRCURI_DESTSUFFIX} \
> +    git://github.com/containers/libpod.git;branch=3Dv5.7;protocol=3Dhttp=
s;destsuffix=3D${GO_SRCURI_DESTSUFFIX} \
>      ${@bb.utils.contains('PACKAGECONFIG', 'rootless', 'file://50-podman-=
rootless.conf', '', d)} \
>  "
>
> @@ -27,10 +27,11 @@ LIC_FILES_CHKSUM =3D "file://src/import/LICENSE;md5=
=3D3d9b931fa23ab1cacd0087f9e2ee12
>
>  GO_IMPORT =3D "import"
>
> -PV =3D "v5.6.2"
> +PV =3D "v5.7.1"
>
>  CVE_STATUS[CVE-2022-2989] =3D "fixed-version: fixed since v4.3.0"
>  CVE_STATUS[CVE-2023-0778] =3D "fixed-version: fixed since v4.5.0"
> +CVE_STATUS[CVE-2025-52881] =3D "fixed-version: fixed since v5.7.0"
>
>  PACKAGES =3D+ "${PN}-contrib"
>
> --
> 2.50.1 (Apple Git-155)
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9518): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/9518
> Mute This Topic: https://lists.yoctoproject.org/mt/117095122/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

