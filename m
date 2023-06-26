Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A523DEB64D7
	for <webhook@archiver.kernel.org>; Mon, 26 Jun 2023 11:58:03 +0000 (UTC)
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
 by mx.groups.io with SMTP id smtpd.web11.5982.1687780682885173404
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 26 Jun 2023 04:58:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=fGYkhGRB;
 spf=pass (domain: gmail.com, ip: 209.85.166.174, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-3420b22365fso18740515ab.1
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 26 Jun 2023 04:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687780682; x=1690372682;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V/MLqVU4bhQN2AETva4VsfKJKYkOawSn/tWM4nMZLdg=;
        b=fGYkhGRBxGw+XnA8fog/C1NOeFSRWepD5pOf9lfIml8C5M9V6AzcKfZ5V5XeEueC4C
         Xndikho/3QlXTJ447USabyoefVjGiBvR5vQQCUNPYSkU28/YAXLUs0zPVRcTi35+bIyZ
         ALHwX7N9yRFbRmC5oJp7cPNIzhelfNcfr6SB52V7d/p2U1bymS7OliyDH6B7XkodOigv
         MG9UYam8IcWDP0xcGXsIDctHQ8b6arWH5f6TG6xPlKiu38Wbqxrl9exAXJXbIZKAQ4n+
         lvUdzFQ/72yrhohRUg2WvEArhXV24tU44s1vvLT959leTSFHKuQ7LlhRIhdSn4ghQsY3
         0IDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687780682; x=1690372682;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V/MLqVU4bhQN2AETva4VsfKJKYkOawSn/tWM4nMZLdg=;
        b=Qfaqr+6n0bG38uWHxmvDGZEw+mOMVNuVER3Iw+ll8EJjDKJz6LGXvyJ7h7Et+gFUYr
         no+d1Zc9E7j4IO8M+iZpGxBjnzI6jbqgK30FkIi45IMjznqVSAdRzrCcC/mPeiQJRtfu
         P0938A8GNglU24ajXlQtzkPVR4JvEYuoSDZIaATFL7syCXXE5zo99UJCohi1eYkatHXH
         iS4lCmbvx0RYe6ophPjhFLcbcod1iVAUc4na1vl0T0LuyeLeFjArlL7mz32SJ73GcdrI
         NCHQ5XTWVbeipjAAK0JWeTHTejwke+1nuscvRojSOXoFrnZXbSE3riKtKykfFHH6mNFZ
         JL+g==
X-Gm-Message-State: AC+VfDxCGlMhXu6eGGdWhgBiAFLrtAfAVZIQERvyBbK3Yoi23RPoi8To
	CdB5Xh1CRcLD8jwObZpV4xSW6MyiTSysWefv6hc=
X-Google-Smtp-Source: ACHHUZ7oEuQI3WQfqG3gd1HUWuS3Jt3B+XZc3YqcSU4GhnenjGM3ET9i02+HSx+6zGAcUTfEbLilsuRm3ZMHvj7In48=
X-Received: by 2002:a92:d6c5:0:b0:345:a3c6:87b6 with SMTP id
 z5-20020a92d6c5000000b00345a3c687b6mr4892121ilp.32.1687780681879; Mon, 26 Jun
 2023 04:58:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230626064420.1012760-1-Qi.Chen@windriver.com>
 <20230626064420.1012760-2-Qi.Chen@windriver.com> <176C2405FDA29323.6977@lists.yoctoproject.org>
In-Reply-To: <176C2405FDA29323.6977@lists.yoctoproject.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 26 Jun 2023 07:57:50 -0400
Message-ID: <CADkTA4OseSk3cukcf4eOePhRHHqjLBNOk9x-Ap0-nby0a5-EgQ@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 2/2] meta-virt: rename
 containerd-opencontainers to containerd
To: bruce.ashfield@gmail.com
Cc: Qi.Chen@windriver.com, meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 26 Jun 2023 11:58:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8108

On Mon, Jun 26, 2023 at 3:12=E2=80=AFAM Bruce Ashfield via
lists.yoctoproject.org
<bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
>
> On Mon, Jun 26, 2023 at 2:44=E2=80=AFAM Chen Qi via lists.yoctoproject.or=
g
> <Qi.Chen=3Dwindriver.com@lists.yoctoproject.org> wrote:
> >
> > From: Chen Qi <Qi.Chen@windriver.com>
> >
> > We had two containerd recipes, containerd-opencontainers and
> > containerd-docker. But now we have only one containerd recipe.
> > We should just use the name 'containerd'.
>
> We could, but there's also no pressing need to change it (otherwise, I
> would have).
>
> I'll leave this as-is, since there are actually some layers with
> includes that I don't feel the need to break at the moment.
>

I should clarify that this is something I'll monitor and queue for the
next release, once I've confirmed that migration has been done.

Bruce

> Bruce
>
> >
> > The previous CVE_PRODUCT setting in containerd-opencontainers
> > is deleted, as it's no longer needed.
> >
> > The 'containerd-opencontainers' is added in PROVIDES and RPROVIDES
> > for backward compatibility.
> >
> > Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> > ---
> >  conf/layer.conf                                             | 2 +-
> >  ...kefile-allow-GO_BUILD_FLAGS-to-be-externally-speci.patch | 0
> >  .../0001-build-don-t-use-gcflags-to-define-trimpath.patch   | 0
> >  .../{containerd-opencontainers_git.bb =3D> containerd_git.bb} | 6 ++--=
--
> >  4 files changed, 3 insertions(+), 5 deletions(-)
> >  rename recipes-containers/containerd/{containerd-opencontainers =3D> c=
ontainerd}/0001-Makefile-allow-GO_BUILD_FLAGS-to-be-externally-speci.patch =
(100%)
> >  rename recipes-containers/containerd/{containerd-opencontainers =3D> c=
ontainerd}/0001-build-don-t-use-gcflags-to-define-trimpath.patch (100%)
> >  rename recipes-containers/containerd/{containerd-opencontainers_git.bb=
 =3D> containerd_git.bb} (96%)
> >
> > diff --git a/conf/layer.conf b/conf/layer.conf
> > index 9ff61f1..cbd75f5 100644
> > --- a/conf/layer.conf
> > +++ b/conf/layer.conf
> > @@ -40,7 +40,7 @@ LAYERRECOMMENDS_virtualization-layer =3D " \
> >  require conf/distro/include/virt_security_flags.inc
> >
> >  PREFERRED_PROVIDER_virtual/runc ?=3D "runc-opencontainers"
> > -PREFERRED_PROVIDER_virtual/containerd ?=3D "containerd-opencontainers"
> > +PREFERRED_PROVIDER_virtual/containerd ?=3D "containerd"
> >  PREFERRED_PROVIDER_virtual/docker ?=3D "docker-moby"
> >
> >  # Sanity check for meta-virtualization layer.
> > diff --git a/recipes-containers/containerd/containerd-opencontainers/00=
01-Makefile-allow-GO_BUILD_FLAGS-to-be-externally-speci.patch b/recipes-con=
tainers/containerd/containerd/0001-Makefile-allow-GO_BUILD_FLAGS-to-be-exte=
rnally-speci.patch
> > similarity index 100%
> > rename from recipes-containers/containerd/containerd-opencontainers/000=
1-Makefile-allow-GO_BUILD_FLAGS-to-be-externally-speci.patch
> > rename to recipes-containers/containerd/containerd/0001-Makefile-allow-=
GO_BUILD_FLAGS-to-be-externally-speci.patch
> > diff --git a/recipes-containers/containerd/containerd-opencontainers/00=
01-build-don-t-use-gcflags-to-define-trimpath.patch b/recipes-containers/co=
ntainerd/containerd/0001-build-don-t-use-gcflags-to-define-trimpath.patch
> > similarity index 100%
> > rename from recipes-containers/containerd/containerd-opencontainers/000=
1-build-don-t-use-gcflags-to-define-trimpath.patch
> > rename to recipes-containers/containerd/containerd/0001-build-don-t-use=
-gcflags-to-define-trimpath.patch
> > diff --git a/recipes-containers/containerd/containerd-opencontainers_gi=
t.bb b/recipes-containers/containerd/containerd_git.bb
> > similarity index 96%
> > rename from recipes-containers/containerd/containerd-opencontainers_git=
.bb
> > rename to recipes-containers/containerd/containerd_git.bb
> > index c804caa..ab41a6c 100644
> > --- a/recipes-containers/containerd/containerd-opencontainers_git.bb
> > +++ b/recipes-containers/containerd/containerd_git.bb
> > @@ -20,8 +20,8 @@ CVE_VERSION =3D "v1.7.1"
> >
> >  # EXTRA_OEMAKE +=3D "GODEBUG=3D1"
> >
> > -PROVIDES +=3D "virtual/containerd"
> > -RPROVIDES:${PN} =3D "virtual-containerd"
> > +PROVIDES +=3D "virtual/containerd containerd-opencontainers"
> > +RPROVIDES:${PN} =3D "virtual-containerd containerd-opencontainers"
> >
> >  S =3D "${WORKDIR}/git/src/github.com/containerd/containerd"
> >
> > @@ -99,5 +99,3 @@ INSANE_SKIP:${PN} +=3D "ldflags already-stripped"
> >  COMPATIBLE_HOST =3D "^(?!(qemu)?mips).*"
> >
> >  RDEPENDS:${BPN} +=3D " ${VIRTUAL-RUNTIME_container_runtime}"
> > -
> > -CVE_PRODUCT =3D "containerd"
> > --
> > 2.34.1
> >
> >
> >
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8107): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8107
> Mute This Topic: https://lists.yoctoproject.org/mt/99782881/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/leave/6=
693017/1050810/978058475/xyzzy [bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

