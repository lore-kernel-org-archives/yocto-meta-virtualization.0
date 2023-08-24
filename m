Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E872BC3DA66
	for <webhook@archiver.kernel.org>; Thu, 24 Aug 2023 02:29:52 +0000 (UTC)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
 by mx.groups.io with SMTP id smtpd.web10.2405.1692844186333455838
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 23 Aug 2023 19:29:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=g172dCZ2;
 spf=pass (domain: gmail.com, ip: 209.85.166.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-34bae82b2ffso21554175ab.1
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 23 Aug 2023 19:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692844185; x=1693448985;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b+COsJO+8E01qheUiHBUOE2uzhYjuCD1c0InE8/KzmI=;
        b=g172dCZ2ujIXw7xoG6r5jUDsD8c5XeQJykPIKC3dcEQOrPm+pVk5kN/goTR3E3i6s7
         gCZ9UeNGu2b6QvFdWjxz/avAebOJqkBmm81KomaVCyb/jQNzzetS636L6pdDmKwMaz26
         JRzhR7z5Y4y2AkxRGp7wIKQZCJ1Dm3fMtgyCfg2ZQ16JPtM1L88osetn46yCXLN6c/oR
         agH4hCdb5zC8LBXxiZWHaldAxEb07du1iOzSyn9rrVWWCcZlJczqjGlqSCpz3onM7rx9
         UHl+r7T9pWTMY5QksqzL8ZfTMtZQjOydJ1TxT2AbrPfP4WE6S/OrPt2u1/YGYaLllYSl
         dCeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692844185; x=1693448985;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b+COsJO+8E01qheUiHBUOE2uzhYjuCD1c0InE8/KzmI=;
        b=XmFjyiYAuK6QfmsTWdlbxFfYTKxR5IbOB772UukEg7PNCdvzFMzScrSuLc0rfImgtO
         veWulzEoIM1b08CtzUhtHbhxmY11tzLA3V6zsupVGke6jqpz3nqhpqmROnTzPGASOfRe
         5fSDwDglTnq9WL7C0CAwcP+2gl4TdyhpZkVRm9QkQptAK6MbVwp9sj6gRoI/TUveokJv
         qGT3yUNdmQdlRdY+hs+08UVDX6DbJCJTNwjUAxT67YkuepPxedXm2ZV2YFnmRiTIR5cu
         wUw9cZpifFLDrrFwYcfnFx36uccIkIq4ZezdezoskUfXbPJm5vmmgdWpgz6ATGobVWq0
         weEA==
X-Gm-Message-State: AOJu0YxxYnQHh2XXhymiC/v94brI8jcbHTDVnlc9imOTupGPzZiS9bSb
	g7lVR9Lq6F8zJnzMT0NG47hzRDwPCiLaMZQIz4wnpAHBA6o=
X-Google-Smtp-Source: AGHT+IEhhOUDRvLiS4FA3DwgT2l18sybV12uLP2riOcXjpxJ+vBYEjEHVRefjFbgVj5hPnFOCGer8l+B49Egw2ZeQIw=
X-Received: by 2002:a05:6e02:13f3:b0:34c:a30a:15fe with SMTP id
 w19-20020a056e0213f300b0034ca30a15femr3486645ilj.32.1692844185515; Wed, 23
 Aug 2023 19:29:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230822224604.622578-1-f_l_k@t-online.de>
In-Reply-To: <20230822224604.622578-1-f_l_k@t-online.de>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 23 Aug 2023 22:29:34 -0400
Message-ID: <CADkTA4OQK+uN1h3s8uJ6f8F35LJ75iEVAeoF-WNJ7=jgJmjvKQ@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCHv2] libvirt-glib: fix introspection
 and documentation build
To: Markus Volk <f_l_k@t-online.de>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 24 Aug 2023 02:29:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8225

This is also a good change, I disabled the documentation because no one
was using it anyway.

I assume it is being grabbed by the main package ? or is it being picked
up by a -docs package ?

We should document how and where the built documentation can be
accessed as part of this commit.

Bruce

On Tue, Aug 22, 2023 at 6:46=E2=80=AFPM Markus Volk <f_l_k@t-online.de> wro=
te:
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  ...ild-allow-crosscompiling-gir-and-doc.patch | 37 +++++++++++++++++++
>  .../libvirt/libvirt-glib_4.0.0.bb             | 13 +++++--
>  2 files changed, 47 insertions(+), 3 deletions(-)
>  create mode 100644 recipes-extended/libvirt/libvirt-glib/0001-meson.buil=
d-allow-crosscompiling-gir-and-doc.patch
>
> diff --git a/recipes-extended/libvirt/libvirt-glib/0001-meson.build-allow=
-crosscompiling-gir-and-doc.patch b/recipes-extended/libvirt/libvirt-glib/0=
001-meson.build-allow-crosscompiling-gir-and-doc.patch
> new file mode 100644
> index 0000000..cd17bbb
> --- /dev/null
> +++ b/recipes-extended/libvirt/libvirt-glib/0001-meson.build-allow-crossc=
ompiling-gir-and-doc.patch
> @@ -0,0 +1,37 @@
> +From 019d727990d41b5d7911895b75bcb021e4cca3c6 Mon Sep 17 00:00:00 2001
> +From: Markus Volk <f_l_k@t-online.de>
> +Date: Mon, 21 Aug 2023 10:23:08 +0200
> +Subject: [PATCH] meson.build: allow crosscompiling gir and doc
> +
> +Upstream-Status: Inappropriate [oe specific]
> +
> +Signed-off-by: Markus Volk <f_l_k@t-online.de>
> +---
> + meson.build | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/meson.build b/meson.build
> +index 134feb6..a089f42 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -58,7 +58,7 @@ includedir =3D join_paths(prefix, get_option('included=
ir'))
> +
> + # gobject introspection
> + gir =3D find_program('g-ir-scanner', required: get_option('introspectio=
n'))
> +-enable_introspection =3D gir.found() and not meson.is_cross_build()
> ++enable_introspection =3D gir.found()
> +
> + # vala
> + vapi_opt =3D get_option('vapi')
> +@@ -73,7 +73,7 @@ endif
> + # gtk-doc
> + if not get_option('docs').disabled()
> +   gtk_doc =3D find_program('gtkdoc-scan', required: get_option('docs'))
> +-  enable_doc =3D gtk_doc.found() and not meson.is_cross_build()
> ++  enable_doc =3D gtk_doc.found()
> + else
> +   enable_doc =3D false
> + endif
> +--
> +2.41.0
> +
> diff --git a/recipes-extended/libvirt/libvirt-glib_4.0.0.bb b/recipes-ext=
ended/libvirt/libvirt-glib_4.0.0.bb
> index a5cd827..e6effaf 100644
> --- a/recipes-extended/libvirt/libvirt-glib_4.0.0.bb
> +++ b/recipes-extended/libvirt/libvirt-glib_4.0.0.bb
> @@ -5,10 +5,17 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd=
255951079008b364516c"
>
>  DEPENDS =3D "glib-2.0 libvirt libxml2"
>
> -SRC_URI =3D "git://gitlab.com/libvirt/libvirt-glib;protocol=3Dhttps;bran=
ch=3Dmaster"
> +SRC_URI =3D " \
> +       git://gitlab.com/libvirt/libvirt-glib;protocol=3Dhttps;branch=3Dm=
aster \
> +       file://0001-meson.build-allow-crosscompiling-gir-and-doc.patch \
> +"
>
>  SRCREV =3D "e0bfc34682744a74b850fa217e9c206a9eb80612"
>  S =3D "${WORKDIR}/git"
>
> -inherit meson pkgconfig gobject-introspection vala
> -GIR_MESON_OPTION =3D ''
> +inherit meson pkgconfig gobject-introspection gettext vala gtk-doc
> +
> +GIR_MESON_ENABLE_FLAG =3D 'enabled'
> +GIR_MESON_DISABLE_FLAG =3D 'disabled'
> +GTKDOC_MESON_ENABLE_FLAG =3D 'enabled'
> +GTKDOC_MESON_DISABLE_FLAG =3D 'disabled'
> --
> 2.41.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8221): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8221
> Mute This Topic: https://lists.yoctoproject.org/mt/100904573/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

