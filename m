Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91479C76195
	for <webhook@archiver.kernel.org>; Mon, 27 Mar 2023 12:21:39 +0000 (UTC)
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
 by mx.groups.io with SMTP id smtpd.web11.33435.1679919693764827675
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 27 Mar 2023 05:21:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mISmj/YQ;
 spf=pass (domain: gmail.com, ip: 209.85.166.180, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f180.google.com with SMTP id h11so4513677ild.11
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 27 Mar 2023 05:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679919693;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WsUlrbdx6nUsC4ML90I19+1kUTrm72abxBAPh8mdaz8=;
        b=mISmj/YQXRbzqfW4cIIyRGhrXQi4RlSoRPHR6YX6+uMmTPatbtjHWQykocniPEMwGt
         R8mZqCWZoDr4LAdrf3e4rJ2emcu91l8AcNDq7WdUHlGhSrZhC8fyphgAgse8gqWG+xNJ
         SXTxtQEluAaNwKiVygIXb8M33NSSaXflQVtpw8hOsl6wIdyfDUMn5cTJKiPfxgdERSdL
         NZnjSOCbTXLqpmgILtmVT8uyIcr4G8eOBg71ixhxQ77ySCW99vDTo2bX7/WaIBOMMRS+
         krvtMys6+ydEUyuQ3dUHvRFC9VYbnNlI+1yeQiqB8aNPYFCkwsG8y3sqI1VlzmuL68En
         GTvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679919693;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WsUlrbdx6nUsC4ML90I19+1kUTrm72abxBAPh8mdaz8=;
        b=bYJDeU2msZlzbhubghI3RxwzuBqLlE+M2chPLefrULe5sNhea6v0rWzHBjyHL4uEIL
         GClnIyBijbD5d98AMQFZ4Il259iLtBMxVpMd+aIhiVx5tmqqRPFEHl3I9noOWDJ6JwNm
         ju7wfd/J4u3imwbzHFKNf6mL2y7cvy91b7G2adgJw594JsGnB8cjFMefyCr/zRW+GXLl
         E7ow09MwyjyBWRZn+sLycVpmb20rIfcir65V0d1C4G2dhP/3FoMKYZ5d6U5g56eAz0ll
         EaQpFAVBkF4nngmqSf4kxNyRyXnj9hAYuDMxwNbfQTvB33aiLiFGIpWceJRs2qGQpjJ6
         k2EQ==
X-Gm-Message-State: AAQBX9d+K0VNx8E9Iqu3j+YuuQT/BgEDvq0jIdvGoPK2oIeIj36vGCam
	fQcR35mKgv3Ix6hOzgmI7/+hSq8q/1RdMTOedFc=
X-Google-Smtp-Source: AKy350YniSbH+/HPJp0bq/5CYAdRnjdSpk10IuL+QzAxD9VvTvc1aTuLAwlVrXQ52++RqJxSUcGN4XqzjK7tgaXobu8=
X-Received: by 2002:a92:c264:0:b0:323:17d:1e42 with SMTP id
 h4-20020a92c264000000b00323017d1e42mr6171391ild.5.1679919692880; Mon, 27 Mar
 2023 05:21:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230327082037.3173653-1-jose.quaresma@foundries.io> <20230327082037.3173653-2-jose.quaresma@foundries.io>
In-Reply-To: <20230327082037.3173653-2-jose.quaresma@foundries.io>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 27 Mar 2023 08:21:21 -0400
Message-ID: <CADkTA4MLWur3FH-B1j83MP=JnUEHNTgq_jx3_bk1Nisa8A-1NA@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 2/2] buildah: enable linkshared
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org, 
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 27 Mar 2023 12:21:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7958

I'm going to keep this change as-is.

The structure of the linkeshared building in buildah isn't well done,
and the build -> rm -> build again is strange (to say the least).

Bruce

On Mon, Mar 27, 2023 at 4:21=E2=80=AFAM Jose Quaresma <quaresma.jose@gmail.=
com> wrote:
>
> The linkshared is fixed upstream and backported in oe-core.
> https://git.yoctoproject.org/poky/commit/?id=3Dd5c79ca6a77af1a04992fff430=
0333e02d94d84d
>
> Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> ---
>  recipes-containers/buildah/buildah_git.bb | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/recipes-containers/buildah/buildah_git.bb b/recipes-containe=
rs/buildah/buildah_git.bb
> index 3c17c98..af340eb 100644
> --- a/recipes-containers/buildah/buildah_git.bb
> +++ b/recipes-containers/buildah/buildah_git.bb
> @@ -40,9 +40,15 @@ do_compile:prepend() {
>  go_do_compile() {
>          export TMPDIR=3D"${GOTMPDIR}"
>          if [ -n "${GO_INSTALL}" ]; then
> -                ${GO} install ${GOBUILDFLAGS} ./cmd/buildah
> -                ${GO} install ${GOBUILDFLAGS} ./tests/imgtype/imgtype.go
> -                ${GO} install ${GOBUILDFLAGS} ./tests/copy/copy.go
> +                if [ -n "${GO_LINKSHARED}" ]; then
> +                        ${GO} install ${GOBUILDFLAGS} ./cmd/buildah
> +                        ${GO} install ${GOBUILDFLAGS} ./tests/imgtype/im=
gtype.go
> +                        ${GO} install ${GOBUILDFLAGS} ./tests/copy/copy.=
go
> +                        rm -rf ${B}/bin
> +                fi
> +                ${GO} install ${GO_LINKSHARED} ${GOBUILDFLAGS} ./cmd/bui=
ldah
> +                ${GO} install ${GO_LINKSHARED} ${GOBUILDFLAGS} ./tests/i=
mgtype/imgtype.go
> +                ${GO} install ${GO_LINKSHARED} ${GOBUILDFLAGS} ./tests/c=
opy/copy.go
>          fi
>  }
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7957): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/7957
> Mute This Topic: https://lists.yoctoproject.org/mt/97877470/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

