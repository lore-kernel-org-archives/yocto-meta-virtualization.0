Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70B33C07545
	for <webhook@archiver.kernel.org>; Tue, 24 Oct 2023 15:45:31 +0000 (UTC)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
 by mx.groups.io with SMTP id smtpd.web10.151211.1698162323504105709
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 24 Oct 2023 08:45:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NuV0A1Uq;
 spf=pass (domain: gmail.com, ip: 209.85.166.47, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-7a667f3f5c0so157208639f.0
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 24 Oct 2023 08:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698162322; x=1698767122; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/wcmCX/unH691oXAuaXjBhr/czOLu1ZrCxS1YgoSesc=;
        b=NuV0A1UqliX126GfcSZ8wpczP5voObbaVcrnlwyVQEOTxLx/p9U+r4thbCdhXaVhqT
         4hT5N5Ijq1MteqHHx6Bdj/l73yzXQ8k/8lpF9zi43u8FQ1aFwJeHP7zI1t56RNUby/Qh
         bFIL2w+P10ri3HXjQJneNT1zTJdV41c7FDaGmZu+lHfvuMiAp3/Fiym//dqncMCMWYRr
         PjIpnRuXfuHOwgqqHUjR5gtJakoqqoOMb+WjE5cawl3sQbf9qd1mjmcR+su4CZHP05eB
         S5sD+y2cEtv9VuvB24km46IYfVvAGIFKUXgQSENph/ZxCCcAt7ra7grZosDdFCdUF0z9
         UJZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698162322; x=1698767122;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/wcmCX/unH691oXAuaXjBhr/czOLu1ZrCxS1YgoSesc=;
        b=crdR7Ij5ZpUhzQ6jxqRWOhLsaREc1V2d7MJ5eoLWPXiJChQNaBLJGC98AkiTHwqZkk
         pMdrTWUF2QfdwJdePZt5SLEYSPpsnmaJE+E9q3RdtXJaS5V2Vqy4yDoYCiT6PQ8pUa+q
         HdDAHsAuaCgC7QTDTP9KfYOnAQfpkmqtu9/nwh3WDNTi6/0crj66vVM2+pgpcnZck2sF
         SHPpnIDO8lhuntr/ovmMmeONeehCRpo0QHfSJ5JdKS9paV0DTziPjFtrpvCxMy9fuFBS
         SadFAVRosL/ADZwbUoumfHQl35A5AXq49ENjIvpywMeg93DPBU4mUWV5IJW5FSZnwaMT
         g33w==
X-Gm-Message-State: AOJu0YxySlHmZcuJ1BEHp8bHt39+OoWO2WTHk+pMx/GSMiUm47Q0ie5l
	qk9mrAHK9TeFGqs77DNaK/muYmot93s+uhHiQQI=
X-Google-Smtp-Source: AGHT+IHEdPeRtaiymRTMgy7v4vWeCXRFFXulQTwDdKL6hID/MP4Dx3HSMXz5Arz0HxFJHTYYNSdmz21oEGnavE6z/gE=
X-Received: by 2002:a92:d8cf:0:b0:34f:739d:9bec with SMTP id
 l15-20020a92d8cf000000b0034f739d9becmr12445066ilo.31.1698162322366; Tue, 24
 Oct 2023 08:45:22 -0700 (PDT)
MIME-Version: 1.0
References: <20231024152415.1259420-1-kai.kang@windriver.com>
In-Reply-To: <20231024152415.1259420-1-kai.kang@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 24 Oct 2023 11:45:11 -0400
Message-ID: <CADkTA4NHqeJS0NG7a-vQkt7MAmeVqoide=sPE3YeAwDEtwT0Sg@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH 1/2] podman & umoci: mark
 incompatible with mips
To: Kai Kang <kai.kang@eng.windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 24 Oct 2023 15:45:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8387

podman has already been marked as incompatible with mips on master.

Is your branch out of date, or did you miss where it was in the recipe ?

Bruce

On Tue, Oct 24, 2023 at 11:29=E2=80=AFAM Kai Kang <kai.kang@eng.windriver.c=
om> wrote:
>
> From: Kai Kang <kai.kang@windriver.com>
>
> Since runtime dependency skopeo has been marked incompatible with mips,
> set for podman and umoci accordingly.
>
> buildah and podman-tui rdepends on podman, so mark for them too.
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  recipes-containers/buildah/buildah_git.bb       | 2 ++
>  recipes-containers/podman-tui/podman-tui_git.bb | 2 ++
>  recipes-containers/podman/podman_git.bb         | 2 ++
>  recipes-containers/umoci/umoci_git.bb           | 2 ++
>  4 files changed, 8 insertions(+)
>
> diff --git a/recipes-containers/buildah/buildah_git.bb b/recipes-containe=
rs/buildah/buildah_git.bb
> index 5155cbb1..ef1feead 100644
> --- a/recipes-containers/buildah/buildah_git.bb
> +++ b/recipes-containers/buildah/buildah_git.bb
> @@ -20,6 +20,8 @@ inherit pkgconfig
>  inherit features_check
>  REQUIRED_DISTRO_FEATURES =3D "seccomp ipv6"
>
> +COMPATIBLE_HOST =3D "^(?!mips).*"
> +
>  GO_IMPORT =3D "github.com/containers/buildah"
>  GO_INSTALL =3D "${GO_IMPORT}"
>  GO_WORKDIR =3D "${GO_INSTALL}"
> diff --git a/recipes-containers/podman-tui/podman-tui_git.bb b/recipes-co=
ntainers/podman-tui/podman-tui_git.bb
> index 1a40d0ec..0b1924f9 100644
> --- a/recipes-containers/podman-tui/podman-tui_git.bb
> +++ b/recipes-containers/podman-tui/podman-tui_git.bb
> @@ -41,6 +41,8 @@ PODMAN_PKG =3D "github.com/containers/podman-tui"
>  inherit go goarch
>  inherit pkgconfig
>
> +COMPATIBLE_HOST =3D "^(?!mips).*"
> +
>  do_configure[noexec] =3D "1"
>
>  BUILD_TAGS ?=3D "exclude_graphdriver_btrfs exclude_graphdriver_devicemap=
per"
> diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers=
/podman/podman_git.bb
> index dc80eb6c..3e9fec33 100644
> --- a/recipes-containers/podman/podman_git.bb
> +++ b/recipes-containers/podman/podman_git.bb
> @@ -9,6 +9,8 @@ DESCRIPTION =3D "Podman is a daemonless container engine =
for developing, \
>  inherit features_check
>  REQUIRED_DISTRO_FEATURES ?=3D "seccomp ipv6"
>
> +COMPATIBLE_HOST =3D "^(?!mips).*"
> +
>  DEPENDS =3D " \
>      go-metalinter-native \
>      go-md2man-native \
> diff --git a/recipes-containers/umoci/umoci_git.bb b/recipes-containers/u=
moci/umoci_git.bb
> index feaf6dff..62b42b8e 100644
> --- a/recipes-containers/umoci/umoci_git.bb
> +++ b/recipes-containers/umoci/umoci_git.bb
> @@ -17,6 +17,8 @@ GO_IMPORT =3D "github.com/opencontainers/umoci"
>  inherit goarch
>  inherit go
>
> +COMPATIBLE_HOST =3D "^(?!mips).*"
> +
>  # This disables seccomp and apparmor, which are on by default in the
>  # go package.
>  EXTRA_OEMAKE=3D"BUILDTAGS=3D''"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8386): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8386
> Mute This Topic: https://lists.yoctoproject.org/mt/102160041/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

