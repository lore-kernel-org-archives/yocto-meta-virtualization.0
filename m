Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7F1CC54E4A
	for <webhook@archiver.kernel.org>; Fri,  8 Mar 2024 18:27:24 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web11.709.1709922435300561276
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 08 Mar 2024 10:27:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NP14ECZO;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-53fbf2c42bfso934597a12.3
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 08 Mar 2024 10:27:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709922435; x=1710527235; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IS4fl4VFrUBlhoRGL0p4PEXDge5lnC76uy6xxJJnmM0=;
        b=NP14ECZOYraubRMfgZ66UzLa1vD6aYsEqG0ol3RcRFUG8J7/x4QY4qpu9HJvP8XiTQ
         YQyULnKQCKMQM0t7lSD745XEllCl/6oRAOZmQnLOVjvyMNZ7BwDb17vi+lsm0X8XBaqg
         4kqg8Xm98iw4xJGOHC25zW6hy6GB7E8KbbvgIbNoeXFFJo3MQ9G8oY6J6tju7pnpZli5
         O/2QMLhEz1Mx0cisC8teLCsFroihtYZ8RtttEKV2oaCVBFymHwWiglGu8i7ts6juHIk2
         UEUfThPJyRLCGg/QQLRPs6VxZeJ1l5uVAOW8XNQbQV9xdBGmyp1ue27n+eEc+yXfwdYS
         BsfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709922435; x=1710527235;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IS4fl4VFrUBlhoRGL0p4PEXDge5lnC76uy6xxJJnmM0=;
        b=vyLGRvO+ji/22LFgy7DluELrJiN5/1DJE/KmboDmEzMqWrEtqNj4EB9uZMJnBOOE7b
         ep8AgwAoiY2YcmK+RvssrX8BNg6cuPpjiFiLJfWhMVcswBOMzUgsCnm1XFLqv3VqSa2g
         tRdyWsNEh1NuIXXLg7LXVD3u22sA7xwXvjXMveTkScUyxOLimpLRm/1efxPNZaiLRYrT
         RJEFxe9kf8TbavrjvZpnvx72D7wq9Dx7yDYb0OO00T10HAS9lOiWvQTzt3hkmhWUrlWQ
         mpZlgGAWl6Zx0zGc1FJv29zhAx4Xnul/Wj8WRqCHuDTh7NxlWoP31j3dMaNVFeLuVNVP
         1a2w==
X-Gm-Message-State: AOJu0YzUYBdbLjb2bwchwbcSWTRFGNsu9t8HF9fKTK8fNbpr+OPSIngD
	WLlHUrKMoer5Nb3AqRoOYTRqcrQacb6p5xyVkS0A+f7mvvwF8Me++2U8lJtbzLiND8JvsvPJ3CN
	z7ka7nwdUrKaxtWVa/IxO0iaMuRo=
X-Google-Smtp-Source: AGHT+IHPqYf7CTCRbPx2sUgheqDH6X1mTqbZA7d30dX7op5LkWVTEnXy3Z061AW/2Si1376LuZ/ChDVQxIzGFQomN/Q=
X-Received: by 2002:a17:90a:ac18:b0:29b:9f33:9b41 with SMTP id
 o24-20020a17090aac1800b0029b9f339b41mr957023pjq.23.1709922434518; Fri, 08 Mar
 2024 10:27:14 -0800 (PST)
MIME-Version: 1.0
References: <20240308181850.2161010-1-f_l_k@t-online.de>
In-Reply-To: <20240308181850.2161010-1-f_l_k@t-online.de>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 8 Mar 2024 13:27:03 -0500
Message-ID: <CADkTA4NLL2y9tDgwFV_c1bbEdrVpLr0TVrXXAnWNRyGKeENfvA@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] libvirt-glib: update 4.0.0 -> 5.0.0
To: Markus Volk <f_l_k@t-online.de>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 08 Mar 2024 18:27:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8612

Since this is a major version bump, the commit also needs a listing
of the changes.

If it is really long, then a summary of the changes will do.

Bruce

On Fri, Mar 8, 2024 at 1:18=E2=80=AFPM Markus Volk <f_l_k@t-online.de> wrot=
e:
>
> This fixes build after libxml update:
> ../git/libvirt-gconfig/libvirt-gconfig-object.c:200:37: error: passing ar=
gument 2 of 'xmlSetStructuredErrorFunc' from incompatible pointer type [-We=
rror=3Dincompatible-pointer-types]
>   200 |     xmlSetStructuredErrorFunc(NULL, gvir_xml_structured_error_nop=
);
>       |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>       |                                     |
>       |                                     void (*)(void *, xmlError *) =
{aka void (*)(void *, struct _xmlError *)}
> In file included from /home/flk/poky/build/tmp/work/corei7-64-poky-linux/=
libvirt-glib/4.0.0/recipe-sysroot/usr/include/libxml2/libxml/relaxng.h:14,
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../libvirt/{libvirt-glib_4.0.0.bb =3D> libvirt-glib_5.0.0.bb}    | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename recipes-extended/libvirt/{libvirt-glib_4.0.0.bb =3D> libvirt-glib=
_5.0.0.bb} (92%)
>
> diff --git a/recipes-extended/libvirt/libvirt-glib_4.0.0.bb b/recipes-ext=
ended/libvirt/libvirt-glib_5.0.0.bb
> similarity index 92%
> rename from recipes-extended/libvirt/libvirt-glib_4.0.0.bb
> rename to recipes-extended/libvirt/libvirt-glib_5.0.0.bb
> index 7ca65a95..4435ca0b 100644
> --- a/recipes-extended/libvirt/libvirt-glib_4.0.0.bb
> +++ b/recipes-extended/libvirt/libvirt-glib_5.0.0.bb
> @@ -10,7 +10,7 @@ SRC_URI =3D " \
>         file://0001-meson.build-allow-crosscompiling-gir-and-doc.patch \
>  "
>
> -SRCREV =3D "e0bfc34682744a74b850fa217e9c206a9eb80612"
> +SRCREV =3D "9b26bec8828a38fcb3bc0e5f6f33b03fa99c4b68"
>  S =3D "${WORKDIR}/git"
>
>  inherit meson pkgconfig gobject-introspection gettext vala gtk-doc
> --
> 2.44.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8611): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8611
> Mute This Topic: https://lists.yoctoproject.org/mt/104814238/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

