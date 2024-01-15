Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70F63C3DA79
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 17:10:17 +0000 (UTC)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
 by mx.groups.io with SMTP id smtpd.web10.87881.1705338607337220780
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 15 Jan 2024 09:10:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Dh2fbA0c;
 spf=pass (domain: gmail.com, ip: 209.85.166.43, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-7baa8097064so427063239f.3
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 15 Jan 2024 09:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705338606; x=1705943406; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S34B2v8qwacCvQXcxqeqBxotEoVU7f2rZRLiCmhMjdU=;
        b=Dh2fbA0cbK/P3EM6osfzhvZqWlpjEsi8IOzpPx7I1te23LyE+e+pCN7/LOYwVw9V6A
         b3K2wiS7D52rbaBFKd653qzD1vkqIeblNVAHYh1qbLiTN8iKxY1jfP30jwho9vX5PjlO
         zxw7ZvYq8DJR3cAmdk5wpMnmXDQbDkzCCNGj5yrYcAWzTMpQRjwNkZmm5DyIYNb4O34B
         qDmFaLSH/ItYFOJ7kXlIFw5408uX1vltDPRmMhoiJqvXvsIPsOYki/b0YOjl2ZyHV9WQ
         5XA5zZYZEjEsZiEXEcf+77UZvyOLrCLb6hVHRKsxAiyK1iVUthnfG6VGV8aw6u87wKbE
         P+Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705338606; x=1705943406;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S34B2v8qwacCvQXcxqeqBxotEoVU7f2rZRLiCmhMjdU=;
        b=kfCCIp5NYyqJCUIji7y/PkRZtCYOmxYJ0aipjICiIwXT20awsw3gKN/ynDg/dymqnp
         5n4YtJ8Aanxrs9KlOG9hGhOzT4C0YbHFJBNYMFguhB+9XNPA2xipm4TPsTaXEC1Xw60C
         a7sHTr+61J6rwApXhlyqdQpwVLubcz8vn6epg9H3Ff/UztofVHf8Riymue1MnkCZyRjZ
         2LoILELe+KS3Nnr4A0DdilRgzEvR2u1kkiSBnXt1bnXhxUbVK+7w7ZfjfClM3T2ka3y9
         /DY17LwVzfMFRhpbMf18vQoY6oR5yyxOJYmKp3d1A0yb3raPNMoS82W4CRKvxGGwXwxM
         z8Ig==
X-Gm-Message-State: AOJu0YyRVaDLfJhfNC/Cc7345KVmF9u1Waz1qy1k2Rgz4CCJdNNQMSUn
	TCIOL2HiYQRNKYYWyA4crgy8/TZfcrQTP38VBrhKOLCv74k=
X-Google-Smtp-Source: AGHT+IGITBTGw8fdfn1nfKp0Gask/tA0XyKeTZAJWUX5rttRuRFST8nwVwI0D5ssjniFbtuqb3b+CHHGWW03b4FrHKE=
X-Received: by 2002:a6b:3f46:0:b0:7bf:3a02:9b9f with SMTP id
 m67-20020a6b3f46000000b007bf3a029b9fmr2837258ioa.19.1705338606209; Mon, 15
 Jan 2024 09:10:06 -0800 (PST)
MIME-Version: 1.0
References: <20240115170030.3531505-1-pkj@axis.com>
In-Reply-To: <20240115170030.3531505-1-pkj@axis.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 15 Jan 2024 12:09:54 -0500
Message-ID: <CADkTA4PkPBXp1tVuth0Cj8WvTTX4J-NhHmDHoHm-gGdiD3==MA@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] containerd-opencontainers: Use
 RDEPENDS:${PN} instead of RDEPENDS:${BPN}
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 15 Jan 2024 17:10:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8539

On Mon, Jan 15, 2024 at 12:00=E2=80=AFPM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> This avoids the following warning:
>
>   WARNING: .../containerd-opencontainers_git.bb: Variable key
>   RDEPENDS:${PN} (...) replaces original key
>   RDEPENDS:containerd-opencontainers
>   (  ${VIRTUAL-RUNTIME_container_runtime}).
>
> if, e.g., RDEPENDS:${PN}:append =3D " ..." is used in a bbappend or
> bbclass.
>

All that the above commit message does is explain the syntax
of what you are fixing .. but not why.

We had the BPN rdepends on purpose, showing why that
original purpose is not needed  ... should be in the commit
message.

My answer right now would be .. .don't use PN in your bbappend
and you can avoid the warning.

Bruce

> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  recipes-containers/containerd/containerd-opencontainers_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-containers/containerd/containerd-opencontainers_git.=
bb b/recipes-containers/containerd/containerd-opencontainers_git.bb
> index 5c1e127..1dadf28 100644
> --- a/recipes-containers/containerd/containerd-opencontainers_git.bb
> +++ b/recipes-containers/containerd/containerd-opencontainers_git.bb
> @@ -95,6 +95,6 @@ INSANE_SKIP:${PN} +=3D "ldflags already-stripped"
>
>  COMPATIBLE_HOST =3D "^(?!(qemu)?mips).*"
>
> -RDEPENDS:${BPN} +=3D " ${VIRTUAL-RUNTIME_container_runtime}"
> +RDEPENDS:${PN} +=3D " ${VIRTUAL-RUNTIME_container_runtime}"
>
>  CVE_PRODUCT =3D "containerd"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8538): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8538
> Mute This Topic: https://lists.yoctoproject.org/mt/103743235/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

