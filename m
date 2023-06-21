Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04103EB64DC
	for <webhook@archiver.kernel.org>; Wed, 21 Jun 2023 12:57:37 +0000 (UTC)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
 by mx.groups.io with SMTP id smtpd.web11.9974.1687352247923027727
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 21 Jun 2023 05:57:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=NOO0vbtm;
 spf=pass (domain: gmail.com, ip: 209.85.166.53, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-77e3ba2fbbfso151432839f.1
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 21 Jun 2023 05:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687352247; x=1689944247;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F5MAt4zKIabPGjovfyHT4jx5E0rnAm3OZ5Sh7lkw+7c=;
        b=NOO0vbtmdvWOMyNc77o7nBsIpyu8gMdag3GVCVjl5tfWtFlh/CO+gqEpkwc7sSWtzL
         l/mMvyOR+YjcvPBz1hjF1IzMpZ2OVJNChVFQoyHmi2t4SpwQnFKEHFupgpIxDygC1VtH
         Iwk+52aNue1m6Y4bNa7ul/c2+LP04HsdATPYgJj3PO9cuwNGciua5qKiXao/kHQNnLIv
         LwsJ6ZPxkuKgWBwF3DBDgdTX7ydAI/fOEDBc+1cfVG5kCQ4w18kjghY1qGw8q7z+xsMt
         Q+9/lQ74uisPBgx/ORDjpxDsG+F6AlBVzUIUBsJTRxpiP2g+7RLSqGHgT0wypm8Cxo7h
         Qg2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687352247; x=1689944247;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F5MAt4zKIabPGjovfyHT4jx5E0rnAm3OZ5Sh7lkw+7c=;
        b=K6wbYIruFoa+H7PHxhcmJdNdYxRYxskYB2xCKtafx4Loea/X4+NOx5VMSVYrE+n8TR
         vhjnttPKADrhX1Dbu9kOTXuknE8hYc55cdvtHkq4W9FbiT7MFDsFpWKm2dlt0CtiRpcL
         0sCtE71tT0tIJfqt2CO14dpRm2IKHsm4AGNqumeIlwxoUlD6jSoOyTwQWestDgD1zH1t
         jXcZvhq4xwleHpaGH+tG43K29avNiZG+uQySU/83qCpdZIkJt4hp8Qufk+6r8cBwapQ5
         ZxpAaYWJ0fsJ6nu9/CwGRvEnsiNmKVrxJUJ5FBevlB4Id89pSfmRrkSrtfnwYLzCqomC
         ev/g==
X-Gm-Message-State: AC+VfDyVIC2gGkrXVQ8H12jEbTFb9XnJkw0MvApCaFhb3R8IHdSJaNJe
	ohNCVFyF7xGH3u9jO7wl7ssyiknupUwCX+msFxQ=
X-Google-Smtp-Source: ACHHUZ6rVLxSti/gP92MvNDEfqCOooed4sPjC6Eb+TuBhaPs6AJY+C282S/sW0kkpKW5JgTacpmfVOyhQPXwFSRxM0U=
X-Received: by 2002:a6b:5108:0:b0:76c:4ca6:34d7 with SMTP id
 f8-20020a6b5108000000b0076c4ca634d7mr15431350iob.19.1687352247020; Wed, 21
 Jun 2023 05:57:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230621104656.2149899-1-Martin.Jansa@gmail.com>
In-Reply-To: <20230621104656.2149899-1-Martin.Jansa@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 21 Jun 2023 08:57:38 -0400
Message-ID: <CADkTA4M=ies0HM87uXrwj2vWFU0SiQp3MRb74=z=fnLT7eHOMQ@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] netavark, xen: *.patch: add
 Upstream-Status to all patches
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 21 Jun 2023 12:57:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8102

On Wed, Jun 21, 2023 at 6:47=E2=80=AFAM Martin Jansa <Martin.Jansa@gmail.co=
m> wrote:
>
> There is new patch-status QA check in oe-core:
> https://git.openembedded.org/openembedded-core/commit/?id=3D76a685bfcf927=
593eac67157762a53259089ea8a
>
> This is temporary work around just to hide _many_ warnings from
> optional patch-status (if you add it to WARN_QA).
>
> This just added
> Upstream-Status: Pending
> everywhere without actually investigating what's the proper status.
>
> This is just to hide current QA warnings and to catch new .patch files be=
ing
> added without Upstream-Status, but the number of Pending patches is now:

Pending is fine.

I have no intention of doing anything more with the warning fixup
(since my opinion on forcing ths on non-core layers and documenting it
within the patches themselves is well documented :)

Bruce

>
> Patches in Pending state: 15 (11%)
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  recipes-containers/netavark/files/tests.patch                   | 2 ++
>  .../xen/files/0001-python-pygrub-pass-DISTUTILS-xen-4.18.patch  | 2 ++
>  2 files changed, 4 insertions(+)
>
> diff --git a/recipes-containers/netavark/files/tests.patch b/recipes-cont=
ainers/netavark/files/tests.patch
> index 254e4e9..c4b3618 100644
> --- a/recipes-containers/netavark/files/tests.patch
> +++ b/recipes-containers/netavark/files/tests.patch
> @@ -1,3 +1,5 @@
> +Upstream-Status: Pending
> +
>  diff --git a/test/helpers.bash b/test/helpers.bash
>  index 89866ec..017b2b5 100644
>  --- a/test/helpers.bash
> diff --git a/recipes-extended/xen/files/0001-python-pygrub-pass-DISTUTILS=
-xen-4.18.patch b/recipes-extended/xen/files/0001-python-pygrub-pass-DISTUT=
ILS-xen-4.18.patch
> index 3c7a97d..7ac1a39 100644
> --- a/recipes-extended/xen/files/0001-python-pygrub-pass-DISTUTILS-xen-4.=
18.patch
> +++ b/recipes-extended/xen/files/0001-python-pygrub-pass-DISTUTILS-xen-4.=
18.patch
> @@ -1,3 +1,5 @@
> +Upstream-Status: Pending
> +
>  diff --git a/tools/pygrub/Makefile b/tools/pygrub/Makefile
>  index 4963bc89c6..c1c05eb421 100644
>  --- a/tools/pygrub/Makefile
> --
> 2.41.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8099): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8099
> Mute This Topic: https://lists.yoctoproject.org/mt/99673711/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

