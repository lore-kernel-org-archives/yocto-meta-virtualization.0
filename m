Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3C67C19F20
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 20:41:35 +0000 (UTC)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
 by mx.groups.io with SMTP id smtpd.web10.1861.1683060092539073017
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 02 May 2023 13:41:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=WlvdXh5y;
 spf=pass (domain: gmail.com, ip: 209.85.166.45, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-760f5070ccfso320143139f.2
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 02 May 2023 13:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683060092; x=1685652092;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eTxQrQ1ilUuZVqKJedqdLzfFKSZ3Zhe2Qz87pcgNE0U=;
        b=WlvdXh5yufha7YBD/VXR307kOSfBHixLBA9vPmdV3ciOLRHyWQqDH/anvh6imYvqzT
         zXB6jg02sG4KgL2w8fbj+AiVcTmuibqZh6nd2MxRJL5PFOlknjNl/jjnJs11Atq6O0fD
         M/oz89u5lhj5Pf3YRHBS9dI6neVFvsTJdax2E1kfKMYVIhzF62eSLwFCcoi7zb+kTFoa
         ShO8i6qlFMci9t/JEtMIIn4keFaN2nKGiMX6/VMTujK4oXA3qhQdMGufjwaxz8VcIgBc
         yTE9/7OE7VkHLtOEo42Vh3Su8GfaxKQGPG3XTolCiXBaUfLdQ9IkpLPSoFm+0eztOG/g
         W5SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683060092; x=1685652092;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eTxQrQ1ilUuZVqKJedqdLzfFKSZ3Zhe2Qz87pcgNE0U=;
        b=S5nIPn/vBrN1aHQv2oRQB0mmMMWfus8AIpkvcWdUUR9sjZ1eMdoOz1ctpH0lzeYDnJ
         X57CS1CxDOkRS9s6NM47+zq+XKsvb/mG2rUog9n4N/4npZWlXNOizybXPXHSyEs9WfBl
         NcuJR/FSWbdG9EoLLUJTr4fkZNW6g7qj2LMN5N51n3XmfdH5TCPnUCqEMiN4jEvbfTXJ
         g3N3DrhcJ/vKQiaJyzX1cTjY0jsQK3iqm+OqDO9uThk9+4KRp00Iz+f0DrzgnuJD59yq
         1Lquo0Bw23WzluKHsqN11qUq2/K7HWXc5tIsjKt6sKW9vjlqqOkT5qgDwMTWCVPcJscA
         d3sQ==
X-Gm-Message-State: AC+VfDzaDnALk3U4V2KFmN2nd87JXWVZvseZoMdrYxtYOXsAEFITBjXj
	NzkAGPcuALyVObyNRJ7Qau4jssKXm/ORHJoZOTw=
X-Google-Smtp-Source: ACHHUZ5Fsp6lJspqkIdHEE+PkJ2Y9fa7577npYN4Fv0NqUwHjwGEVVProiS+UR/nj6xNkjkFMXCvJk1x5hmjig0DR/E=
X-Received: by 2002:a5d:80c7:0:b0:760:ea63:3385 with SMTP id
 h7-20020a5d80c7000000b00760ea633385mr11597331ior.19.1683060091752; Tue, 02
 May 2023 13:41:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230502202631.2102074-1-pkj@axis.com> <20230502202631.2102074-4-pkj@axis.com>
In-Reply-To: <20230502202631.2102074-4-pkj@axis.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 2 May 2023 16:41:24 -0400
Message-ID: <CADkTA4MENogff6ezzKLjf4AY=4NanzAGT98H=WeHN9YxbsDMSw@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH 4/8] aardvark-dns: Fetch the crate
 instead of the Git repository
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 02 May 2023 20:41:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8026

On Tue, May 2, 2023 at 4:26=E2=80=AFPM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  recipes-containers/aardvark-dns/aardvark-dns_1.2.0.bb | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/recipes-containers/aardvark-dns/aardvark-dns_1.2.0.bb b/reci=
pes-containers/aardvark-dns/aardvark-dns_1.2.0.bb
> index 10901eb..ac2fc6d 100644
> --- a/recipes-containers/aardvark-dns/aardvark-dns_1.2.0.bb
> +++ b/recipes-containers/aardvark-dns/aardvark-dns_1.2.0.bb
> @@ -4,15 +4,11 @@ HOMEPAGE =3D "https://github.com/containers/aardvark-dn=
s"
>  LICENSE =3D "Apache-2.0"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D86d3f3a95c324c9479bd8986968f4=
327"
>
> -SRCREV =3D "cb1a462dd8427e33355f6907394a0646f5a26bf2"
> -
> -# how to get aardvark-dns could be as easy as but default to a git check=
out:
> -# SRC_URI +=3D "crate://crates.io/aardvark-dns/1.2.0"
> -SRC_URI =3D "git://github.com/containers/aardvark-dns;protocol=3Dhttps;n=
obranch=3D1 \

I much prefer the git fetch, and am inclined to reject this part of the upd=
ate.

Is something actually broken with the git fetch ? If we can't mix the
two, then I'm inclined to say the crates support is broken.

Bruce

> +SRC_URI =3D "crate://crates.io/${BPN}/${PV} \
>             file://run-ptest"
>  require ${BPN}-crates.inc
>
> -S =3D "${WORKDIR}/git"
> +SRC_URI[aardvark-dns-1.2.0.sha256sum] =3D "1f9d011e5edaa6e0fa055e383bec0=
3a46c9ef35dfa346883aeb5bf86b794a949"
>
>  inherit cargo cargo-update-recipe-crates features_check ptest
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8022): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8022
> Mute This Topic: https://lists.yoctoproject.org/mt/98647878/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

