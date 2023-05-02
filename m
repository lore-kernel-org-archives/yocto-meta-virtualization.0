Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84508C77B78
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 20:44:05 +0000 (UTC)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
 by mx.groups.io with SMTP id smtpd.web11.1920.1683060235815499017
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 02 May 2023 13:43:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=MB0BOtd2;
 spf=pass (domain: gmail.com, ip: 209.85.166.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-3313a2200a4so2082685ab.3
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 02 May 2023 13:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683060235; x=1685652235;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vcmkBBKqpEYbM1ryqcowOq5+7iWFHAqU+vsYAehZ6Dk=;
        b=MB0BOtd2lvkFr8b0A551Uc1iqflRUz0SHIvZG6swpRLHfjXCyIaX5xc1onIqTjaHLW
         pIsqZ8+firvlJQ8zyWDTFD8OX94h1widUnwt8Qz6ieN9F6uAwCkhAoJuXWHNgNDKX6vW
         fH9YmNDnpTN14QHcsxfUgBj4LFfyhrzyEvL1hx/1obfYuoUoLwl4zaUALUvqKdYT8Y6z
         esb4et0SNzArd8a63wOYmkLFj6Xvbm1bd+m95cQpKGRzRs0nCy2RH8mE7JBdUqhF7RRq
         UTGNxn2VmQyYJvYCHdX+9U5RPBGpl+F0vXlbV9UYkrsd8+zc+BKv4YAYVhnaTeBSnWc+
         E4vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683060235; x=1685652235;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vcmkBBKqpEYbM1ryqcowOq5+7iWFHAqU+vsYAehZ6Dk=;
        b=iPoFcKJrRWsALwN01u6HY3fkkck/JQ9Q5bPbfYAuP28uPh/Myvq+b1eM3pLz+iY/yI
         QEiyLTvUV1GVXCdrDh2l9fb8nKZAwFGDCnN3jUI7a7ErUDcrbZn1pM73U88YsbuABh1m
         dWXkvxH+su1ATPPDAoiLACief0UaJPObeo03JHv11tnaBEpiGaeoaPdK3fbTJ8EzgSBo
         zG9yfZ+c43fiJeoXw042BtbqWZCmDF7SmjKDxfgZhnUi1zIcm0NBRo2w8MZnQRst6hpJ
         8ako7ue7vG1+dy/qUKPiAvnwYSKyc36cZn+lYS1Xo1LKyGP3LkiTaeHNtRUNBiSReAq4
         ZtSw==
X-Gm-Message-State: AC+VfDwputFQtFk6LrBNH2FbfDg6+asL9Qz9wisoWRYjDzdPhKq5iP+8
	LzLJGvosNTR6TRBCrohLZ2hU0onX9XddulPm6kIAxBu4aH3maQ==
X-Google-Smtp-Source: ACHHUZ4D8ni35a9ZAciRW3FJXjn89rWfMZDuqOma+tTJRzG8DQ607RDw903qsZWq22qHP/GJ3b+26c6b/m6ik8VzCHU=
X-Received: by 2002:a92:cbc2:0:b0:32b:6433:668f with SMTP id
 s2-20020a92cbc2000000b0032b6433668fmr10867399ilq.4.1683060234933; Tue, 02 May
 2023 13:43:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230502202631.2102074-1-pkj@axis.com> <20230502202631.2102074-8-pkj@axis.com>
In-Reply-To: <20230502202631.2102074-8-pkj@axis.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 2 May 2023 16:43:47 -0400
Message-ID: <CADkTA4OAsVxDZwa0pa69FxO5PvP5Os6jbYUf1sMez6GEQzy+Yg@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH 8/8] netavark: Fetch the crate
 instead of the Git repository
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 02 May 2023 20:44:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8028

Same comment as the other.

This should stay as a git fetch, versus a crate.

Bruce

On Tue, May 2, 2023 at 4:26=E2=80=AFPM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  recipes-containers/netavark/netavark_1.2.0.bb | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/recipes-containers/netavark/netavark_1.2.0.bb b/recipes-cont=
ainers/netavark/netavark_1.2.0.bb
> index be7cff5..0b16d2b 100644
> --- a/recipes-containers/netavark/netavark_1.2.0.bb
> +++ b/recipes-containers/netavark/netavark_1.2.0.bb
> @@ -4,16 +4,12 @@ HOMEPAGE =3D "https://github.com/containers/netavark"
>  LICENSE =3D "Apache-2.0"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D86d3f3a95c324c9479bd8986968f4=
327"
>
> -SRCREV =3D "90cccc1c21f26fbc473a201ce3b30d77667c7635"
> -
> -# how to get netavark could be as easy as but default to a git checkout:
> -# SRC_URI +=3D "crate://crates.io/netavark/1.2.0"
> -SRC_URI =3D "git://github.com/containers/netavark.git;protocol=3Dhttps;n=
obranch=3D1 \
> +SRC_URI =3D "crate://crates.io/${BPN}/${PV} \
>             file://tests.patch \
>             file://run-ptest"
>  require ${BPN}-crates.inc
>
> -S =3D "${WORKDIR}/git"
> +SRC_URI[netavark-1.2.0.sha256sum] =3D "8d636ecaab6dcbc7989cde720d290d8ff=
30d9eb69f3a2b3cb70d4135e721b936"
>
>  PACKAGECONFIG ?=3D "aardvark-dns"
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8025): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8025
> Mute This Topic: https://lists.yoctoproject.org/mt/98647881/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

