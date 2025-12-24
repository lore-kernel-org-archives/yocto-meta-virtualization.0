Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEA8FE75456
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 13:04:51 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.119715.1766581484578835785
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 24 Dec 2025 05:04:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SGU4ZzxQ;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-34c902f6845so8183974a91.2
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 24 Dec 2025 05:04:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766581484; x=1767186284; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iojl8/hfbqX+i90UdAJq/kgmFGewxoyZJE6uiR+2bbM=;
        b=SGU4ZzxQxbg/QGkzdg/LD534dbRmE5FfROOfBSpJN8kdiH5Y6F3DnCv/RCzXqo4YQi
         Gt1ZO8NhIbFOFxVYexP/PgBYfmNbm9ilocN/WcF/JWB0J53azj/wn2qC9GIrfShFu5FZ
         Nj9FJdsVl94c92rWfa/JKfxe4MuUwQfT0TSl6UUJwsLxTbflHkB3jhX1ayn3XYk1RfID
         BJ7E9i0fQov05PJvMm+UZhOP7dzSaN56J+i/3+gdQnR2UwCEpec/q3KYFps2IUPbdoUK
         k7ScGwCqvamrye50EdVLv/+LY6/k4HZXGa51IgVfSFVLnQnPf3FqNShhaIuglgtRuag0
         HiDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766581484; x=1767186284;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Iojl8/hfbqX+i90UdAJq/kgmFGewxoyZJE6uiR+2bbM=;
        b=i25Ws2PZdwxK2MckqC0c/dKJH1QK1MeL9gNlsw790Qm9EbTMyykB+9ghUiVyMlDbms
         zWsb39rfRFu+ib0i59VcoatUKVr8gQhS6NeBCrC4xSXYFWj+bPJzCOnhCsdOD2+SfGzX
         38MzhKS1Ds+b6WugzAmYCkTIO/5msoqRFsxv5hWbKYCoE6Iw+e1/etY7d23NEJgxANs2
         wUEYghueIiktCF5fObmydhGJpkFuDXdUs4EV8InMldejgUHarEVZwXZLRwehaprWzHyn
         xJVNYpDra7Xlav7DmDbUBGiTD1lgotUUVKrUaz7oWd9q5TsFx1+uDqhgMq7EUNSsU0sa
         VRKw==
X-Gm-Message-State: AOJu0Yz0Kh7pI7fW9+xdCZx53p68A5gRoSWDnozbtJKX4MYnOXGy007O
	Ry80KGntdx6QZnYBrPf2H3aLzqYNMD01/4EFTKnC9e8MQh3cNRWUit8IZgJiwkSBWerGn0ajkEz
	jBB/slkpRTU8AVNL5deGIAQ6ZYm4ZLkc=
X-Gm-Gg: AY/fxX6z8aR8ss5Yq/0LYiSCGqMiTSnrq8/is/yZalMJyvis1iL7gs93wwBVHXOqDt2
	Vk/I2/WPU71L0F4bMPzmpNmF3CI/swgZiuloa6+9qYlTMDLy2SvLT7FVLS6KRYcev2fhQGiutfH
	OnBGzoOQx64RTUQpRGr0CXTks6GldSlZNO59PEZqSRrkcGKBp1AFrqqoWJ7E5QFkamX2NJf/ftR
	dzRQz+VvknLy303gxISKlffJx1Uog9lQsFfHLCPmgMWwBRMpx8Cudb8ObZPNGjIORrLOw==
X-Google-Smtp-Source: AGHT+IFdB5lkql2xe3l+FkLE9jOoXQpGTaxy10x0mvK54wxZmAUzpc61tftHaOn6uhE3xkZuki5pxXmKs0CUMzm6ca4=
X-Received: by 2002:a17:90b:53c7:b0:341:8c8b:b8e6 with SMTP id
 98e67ed59e1d1-34e9213afc0mr17298197a91.16.1766581483954; Wed, 24 Dec 2025
 05:04:43 -0800 (PST)
MIME-Version: 1.0
References: <20251224054744.3109658-1-Qi.Chen@windriver.com>
In-Reply-To: <20251224054744.3109658-1-Qi.Chen@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 24 Dec 2025 08:04:32 -0500
X-Gm-Features: AQt7F2oPdnFhzi-svMUd9TyfFdKHbGaSzxurhqPpOPbb0x_hN6tEss9S4cEIJtI
Message-ID: <CADkTA4NK2AtaY0qfCKBP2T34N4+bTmyzKCtVf7tQjbkaCJEfdQ@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] docker: RDEPENDS on virtual-runc
To: Qi.Chen@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 24 Dec 2025 13:04:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9499

On Wed, Dec 24, 2025 at 1:48=E2=80=AFAM Chen Qi via lists.yoctoproject.org
<Qi.Chen=3Dwindriver.com@lists.yoctoproject.org> wrote:
>
> From: Chen Qi <Qi.Chen@windriver.com>
>
> docker tries to find 'runc' binary, and if 'runc' is not available,
> things fail.
>
> The VIRTUAL-RUNTIME_container_runtime could be crun or virtual-runc.
> This is not correct for docker. What docker wants is virtual-runc.
>

Hmn. no, what I had was intentional (if maybe incomplete). That is there
so you can configure the stack to use docker and crun.

Are you seeing a build. or runtime error  ?

Bruce

> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  recipes-containers/docker/docker.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-containers/docker/docker.inc b/recipes-containers/do=
cker/docker.inc
> index 99535a77..39782b88 100644
> --- a/recipes-containers/docker/docker.inc
> +++ b/recipes-containers/docker/docker.inc
> @@ -13,7 +13,7 @@ RDEPENDS:${PN} =3D "util-linux util-linux-unshare iptab=
les \
>                    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '',=
 'cgroup-lite', d)} \
>                    bridge-utils \
>                   "
> -RDEPENDS:${PN} +=3D "virtual-containerd ${VIRTUAL-RUNTIME_container_runt=
ime}"
> +RDEPENDS:${PN} +=3D "virtual-containerd virtual-runc"
>
>  RRECOMMENDS:${PN} =3D "kernel-module-dm-thin-pool \
>                       kernel-module-nf-conntrack \
> --
> 2.49.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9498): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/9498
> Mute This Topic: https://lists.yoctoproject.org/mt/116925968/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

