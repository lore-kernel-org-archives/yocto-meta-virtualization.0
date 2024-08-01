Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B8BCC3DA64
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 15:25:38 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web11.71184.1722525929068397836
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 01 Aug 2024 08:25:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=C/5GgazI;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-7a0e8b76813so4770738a12.3
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 01 Aug 2024 08:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722525928; x=1723130728; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z2ZWnF/abuX+N4Ut/gpJ43G50auHG1HKwcxtQ4BfzLU=;
        b=C/5GgazIsrDnp19ToYxV5wx8EHbGrLvdrknfXuAaAwzxdc3JhTtJrMNKqQ8veReyGK
         cUOvMmMdjJqi70v0RWxtakJPKpnzN5ADjF+yu13+T/NDkH8KQErW2bhn71BzhO82JBBU
         vYiU1ApBuLEtOS/k8dAKX+xFRzonXW3H5io6zrpBXCvjVDK3u5w6eVzOvn+qdLs2Y7YQ
         m3JT/0I9PjnddQlIqKXh6C8Ti1FSSvpdStNlDYQKKjeri+QDzJA6leI7n4WIVDBhCR0V
         C4JyFmqtoYv+Va9RlMFr1Px+wf4WfPCyAEX/IMFD68y0mi/B03m31T/r3IBbNYkNH/B1
         gFvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722525928; x=1723130728;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z2ZWnF/abuX+N4Ut/gpJ43G50auHG1HKwcxtQ4BfzLU=;
        b=Px9SvZ/eqqo7a1ffNck4ma15ltaKjl/FwZKSpwBWebkif5QriXwa9Qpb4dp5MgiZTp
         USVAAkn3ahvd9l1vYr3XPY3pIehGIOkZKt8KFbtSEKiNpX2ClrFqS2fdamT2vNvtbQ4H
         XPGKGkojDe4qovJ0ncd1qAxyrM5Zcv/gGmsmaggwSOn3LexwrTez4a4YeKIvPjqOtnfg
         F+Ub4yJM5CnJTOebse1XM1P9DbvV7cailFXM1khW3SjXwY5lkgAavmKZwgGcQjCGiY7r
         zdvycaRx3FxfBnRwtTDeKTpvoWKhI0m9lFwVuaCyonY6q/9XB/CbHB1RNRS+n7QPrpb3
         FNxw==
X-Gm-Message-State: AOJu0YxsOfvALBYyENIEk2tE++xPkhawq+obu+xRZPd07fB5cZbiFuTd
	RQYE6Ij31dPzvV3KOxtLBldY8MwcfRx0Z5h5hqHxbdUbbnviefUrUn/nHGi6JZapoZgVzM60oFm
	xKXgWY6LNpzIkNWwY1wncRVpPtQm6TvR7
X-Google-Smtp-Source: AGHT+IHEomNTLbdF7f4O4w/1GWMV2NEvGv+jvlA7jl/DMT/XzuQ/p1dW8GYthyuHZnySgXuo67z4RRyCMk/hi1mByGU=
X-Received: by 2002:a17:90a:2e17:b0:2c9:81fd:4c27 with SMTP id
 98e67ed59e1d1-2cff9449532mr702962a91.14.1722525928212; Thu, 01 Aug 2024
 08:25:28 -0700 (PDT)
MIME-Version: 1.0
References: <20240726104109.1729821-1-jose.quaresma@foundries.io>
In-Reply-To: <20240726104109.1729821-1-jose.quaresma@foundries.io>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 1 Aug 2024 11:25:16 -0400
Message-ID: <CADkTA4OdNZDvo9ob-T=G4+64XkLO1FBbs14ZBur2=hseRq_QrQ@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] docker-compose: drop SRCREV_FORMAT
To: quaresma.jose@gmail.com
Cc: meta-virtualization@lists.yoctoproject.org, 
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 01 Aug 2024 15:25:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8852

On Fri, Jul 26, 2024 at 6:41=E2=80=AFAM Jose Quaresma via
lists.yoctoproject.org
<quaresma.jose=3Dgmail.com@lists.yoctoproject.org> wrote:
>
> We currently only fetch from one SRC_URI so we can drop
> the SRCREV_FORMAT and covert from the named SRCREV_compose
>

hmm. But we don't actually fetch from a single SRC_URI, there are
many that are being fetched (src_uri.inc), as the comment in the
recipe indicates, two important ones are picked to go into the
recipe hash.

We could argue that "survey" isn't important and that we could use
another SRCREV, but we should define multiple in the format. We
could also argue that they all should be in the format, but that also
doesn't scale / work.

Bruce

> Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> ---
>  recipes-containers/docker-compose/docker-compose_git.bb | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/recipes-containers/docker-compose/docker-compose_git.bb b/re=
cipes-containers/docker-compose/docker-compose_git.bb
> index 8bab3fb6..dd2b131b 100644
> --- a/recipes-containers/docker-compose/docker-compose_git.bb
> +++ b/recipes-containers/docker-compose/docker-compose_git.bb
> @@ -7,11 +7,9 @@ DEPENDS =3D " \
>      rsync-native \
>  "
>
> -# Specify the first two important SRCREVs as the format
> -SRCREV_FORMAT=3D"compose_survey"
> -SRCREV_compose =3D "f79c28168bf6a95ea0cbd1c298f4a0ff4c3ac36b"
> +SRCREV =3D "3371227794f5f3645f4f19829c60a741635ed329"
>
> -SRC_URI =3D "git://github.com/docker/compose;name=3Dcompose;branch=3Dmai=
n;protocol=3Dhttps;destsuffix=3D${GO_SRCURI_DESTSUFFIX}"
> +SRC_URI =3D "git://github.com/docker/compose;branch=3Dmain;protocol=3Dht=
tps;destsuffix=3D${GO_SRCURI_DESTSUFFIX}"
>
>  include src_uri.inc
>
> --
> 2.45.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8845): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8845
> Mute This Topic: https://lists.yoctoproject.org/mt/107559145/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

