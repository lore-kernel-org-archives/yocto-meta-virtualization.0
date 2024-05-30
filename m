Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91935C25B74
	for <webhook@archiver.kernel.org>; Thu, 30 May 2024 13:11:36 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.8099.1717074692815301607
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 30 May 2024 06:11:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KIJVJi9j;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2c1a5913777so717833a91.2
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 30 May 2024 06:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717074692; x=1717679492; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JU9PNLP9ibYJ26YyrED5aFKeQcRlu/pELTbWe5AuI3U=;
        b=KIJVJi9jpf4odb7+jqwSZgBT8zZm9OqwDS33a8OeVnuoX0+HQkhh/A73KEK+bjgK5A
         o0iGXdSbg92RgVxpHYgqMzs3JhROrR6DWt/jadTTAvs7uALYnHWi8zjLXOj01EVJOSwq
         Divkelco2gin+4Yr8/LbGFVTASBpZOVQ1uV3VacQbWxwz7x+JHqOYTkN3GYUY041A9iv
         qVFQgEfHhEOf3hbPH7DeFs2yvntlq4O/tZSlYmO9T3zGMnzCt+jvDrwgxV+AMgnMUKPF
         n2wX/uKMaKWQik3tYzZrCB2IsAu+PH/QGfe+KQw2GIZq7tSYGEXqOyILj2+M2hwXhv8N
         qiRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717074692; x=1717679492;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JU9PNLP9ibYJ26YyrED5aFKeQcRlu/pELTbWe5AuI3U=;
        b=g66APPzz6KDWxtHoeDZ59KdZdH/7EVsBh4MwPsByWIBia09didFiQzcIgd8g0caaG8
         r8sdd3qna0d1NddO2JvTWSY8pprYsqAvVKso9NvL9FtbiNG0KO7VncnJDXWGziFL03mR
         HZM6Hqp/GAXJyag2PyUJbhOXAmiAluNGK+3DTzRDxfWIMqQEu/uTdkd7j3vygb7d45gY
         eFy9mHTXnDvxycDNPHfqUcOveeSMv4pu2qYL9JkGfL4u1qObsIU//DC1CjXVT/Ezm0W/
         y12kTNOYCw9OQm9we5XyLuLU7R8f/ZFrNHORill+YnTygDEFcPgMC9Y5gfsR/xqh4pIG
         yHzg==
X-Gm-Message-State: AOJu0YzMpliXCIIv5YsDdmk0G4NT9ESSs4fFRrfc7KAjKTSK9IjZCwlp
	rB1hv7uRorTkCaxo4G/kELESChWvD5xF4KIvVSvgOvDJvOW+RX+NUbfpZjxoQr1ZXtRMAJb+0Hw
	criZ7+C2qrCbhsYtOTRmAK2ySDq8=
X-Google-Smtp-Source: AGHT+IG+y4nkFLO8ZsvjfYLEkbilknvh3h8TUr+Jvu/tE7NuPuO0ItsSX0z1EqiFIi8oboXXSFD1O12rbaDrV/nOZsk=
X-Received: by 2002:a17:90a:7102:b0:2c0:17b4:858f with SMTP id
 98e67ed59e1d1-2c1abc32866mr2017089a91.37.1717074691921; Thu, 30 May 2024
 06:11:31 -0700 (PDT)
MIME-Version: 1.0
References: <20240530124706.17491-1-martin.jansa@gmail.com>
In-Reply-To: <20240530124706.17491-1-martin.jansa@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 30 May 2024 09:11:20 -0400
Message-ID: <CADkTA4O2a7DmbDOW2DxjXhXExgzZPMLfAp9nbtN2emL85K-EmA@mail.gmail.com>
Subject: Re: [meta-virtualization] [master-next][PATCH] libvirt: convert more
 WORKDIR references to UNPACKDIR
To: martin.jansa@gmail.com
Cc: meta-virtualization@lists.yoctoproject.org, 
	Hieu Van Nguyen <hieu2.nguyen@lge.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 30 May 2024 13:11:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8785

On Thu, May 30, 2024 at 8:47=E2=80=AFAM Martin Jansa via
lists.yoctoproject.org <martin.jansa=3Dgmail.com@lists.yoctoproject.org>
wrote:
>
> From: Hieu Van Nguyen <hieu2.nguyen@lge.com>
>
> unpacked source files are now in UNPACKDIR, so we adjust our
> operations to match.
>
> Some references were missed in previous commit as they
> are behind conditional.
>
> Signed-off-by: Hieu Van Nguyen <hieu2.nguyen@lge.com>
> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> ---
>  recipes-extended/libvirt/libvirt-python.inc |  4 ++--
>  recipes-extended/libvirt/libvirt_10.0.0.bb  | 18 +++++++++---------
>  2 files changed, 11 insertions(+), 11 deletions(-)
>
> diff --git a/recipes-extended/libvirt/libvirt-python.inc b/recipes-extend=
ed/libvirt/libvirt-python.inc
> index 6fb2b68c..12041df0 100644
> --- a/recipes-extended/libvirt/libvirt-python.inc
> +++ b/recipes-extended/libvirt/libvirt-python.inc
> @@ -46,7 +46,7 @@ do_compile:append() {
>                 # the syroot staged pkgconfig entries. So we clear the sy=
sroot
>                 # for just this portion.
>                 export PKG_CONFIG_SYSROOT_DIR=3D
> -               cd ${WORKDIR}/${BPN}-python-${PV} && \
> +               cd ${UNPACKDIR}/${BPN}-python-${PV} && \
>                   ${STAGING_BINDIR_NATIVE}/python3-native/python3 setup.p=
y build
>         fi
>  }
> @@ -57,7 +57,7 @@ do_install:append() {
>                 # the syroot staged pkgconfig entries. So we clear the sy=
sroot
>                 # for just this portion.
>                 export PKG_CONFIG_SYSROOT_DIR=3D
> -               cd ${WORKDIR}/${BPN}-python-${PV} && \
> +               cd ${UNPACKDIR}/${BPN}-python-${PV} && \

Indeed, I did miss these behind the pkgconfig.

>                   ${STAGING_BINDIR_NATIVE}/python3-native/python3 setup.p=
y install \
>                         --install-lib=3D${D}/${PYTHON_SITEPACKAGES_DIR} $=
{LIBVIRT_INSTALL_ARGS}
>         fi
> diff --git a/recipes-extended/libvirt/libvirt_10.0.0.bb b/recipes-extende=
d/libvirt/libvirt_10.0.0.bb
> index 9ad1f798..ababbf1b 100644
> --- a/recipes-extended/libvirt/libvirt_10.0.0.bb
> +++ b/recipes-extended/libvirt/libvirt_10.0.0.bb
> @@ -286,21 +286,21 @@ do_install:append() {
>
>         if ${@bb.utils.contains('PACKAGECONFIG','gnutls','true','false',d=
)}; then
>             # Generate sample keys and certificates.
> -           cd ${WORKDIR}
> -           ${WORKDIR}/gnutls-helper.py -y
> +           cd ${UNPACKDIR}
> +           ${UNPACKDIR}/gnutls-helper.py -y

I had left these on purpose. Not everything has to be in UNPACKDIR
(from my understanding and point of view)

Since these are generated files as part of the build, I don't see the issue
with them being in WORKDIR.

That's what my comment about "generated files" was referring to in the
commit message.

Bruce

>
>             # Deploy all sample keys and certificates of CA, server and c=
lient
>             # to target so that libvirtd is able to boot successfully and=
 local
>             # connection via 127.0.0.1 is available out of box.
>             install -d ${D}/etc/pki/CA
>             install -d ${D}/etc/pki/libvirt/private
> -            install -m 0755 ${WORKDIR}/gnutls-helper.py ${D}/${bindir}
> -           install -m 0644 ${WORKDIR}/cakey.pem ${D}/${sysconfdir}/pki/l=
ibvirt/private/cakey.pem
> -           install -m 0644 ${WORKDIR}/cacert.pem ${D}/${sysconfdir}/pki/=
CA/cacert.pem
> -           install -m 0644 ${WORKDIR}/serverkey.pem ${D}/${sysconfdir}/p=
ki/libvirt/private/serverkey.pem
> -           install -m 0644 ${WORKDIR}/servercert.pem ${D}/${sysconfdir}/=
pki/libvirt/servercert.pem
> -           install -m 0644 ${WORKDIR}/clientkey.pem ${D}/${sysconfdir}/p=
ki/libvirt/private/clientkey.pem
> -           install -m 0644 ${WORKDIR}/clientcert.pem ${D}/${sysconfdir}/=
pki/libvirt/clientcert.pem
> +            install -m 0755 ${UNPACKDIR}/gnutls-helper.py ${D}/${bindir}
> +           install -m 0644 ${UNPACKDIR}/cakey.pem ${D}/${sysconfdir}/pki=
/libvirt/private/cakey.pem
> +           install -m 0644 ${UNPACKDIR}/cacert.pem ${D}/${sysconfdir}/pk=
i/CA/cacert.pem
> +           install -m 0644 ${UNPACKDIR}/serverkey.pem ${D}/${sysconfdir}=
/pki/libvirt/private/serverkey.pem
> +           install -m 0644 ${UNPACKDIR}/servercert.pem ${D}/${sysconfdir=
}/pki/libvirt/servercert.pem
> +           install -m 0644 ${UNPACKDIR}/clientkey.pem ${D}/${sysconfdir}=
/pki/libvirt/private/clientkey.pem
> +           install -m 0644 ${UNPACKDIR}/clientcert.pem ${D}/${sysconfdir=
}/pki/libvirt/clientcert.pem
>
>             # Force the connection to be tls.
>             sed -i -e 's/^\(listen_tls\ =3D\ .*\)/#\1/' -e 's/^\(listen_t=
cp\ =3D\ .*\)/#\1/' ${D}/etc/libvirt/libvirtd.conf
> --
> 2.45.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8784): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8784
> Mute This Topic: https://lists.yoctoproject.org/mt/106387463/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

