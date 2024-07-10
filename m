Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52C0BC3DA42
	for <webhook@archiver.kernel.org>; Wed, 10 Jul 2024 13:57:31 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web10.15106.1720619846767812609
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 10 Jul 2024 06:57:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LYSnwbdl;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-64789495923so55317257b3.0
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 10 Jul 2024 06:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720619846; x=1721224646; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z/g/uXFWupPQBz/BOLztfHoTT2FeEc1g42NpY2InPiQ=;
        b=LYSnwbdllhDI9E2ju/IYw4QCyyYhG3rvamDJ9Q2baPLJFkqO9ujDJa7X9xQQcmKXel
         kAKVc1dNpcfSdyAhqS8Hn/APV4WB6FE8HrAUfUhNmNX97HiDKOYNT0cEpzDVRq9N1LYl
         4Enhs4BZGKbZxrpHooRQKOXfIBrPQxWFnhPU6xIQNpjFAAP5k+AgXrp4LyWG7OOSf4cY
         huaeHKCcsMyeMhxFXB2KPPwLSvAZ+xQInrn1/bCQROHUdQ/7khlwlc6PXHYV2nXuxMYz
         artcLYBFxBLotNwUw89RkWJ46Rk9JamIQx4oteXB7JUfPiqjE0oMRRfsQPKoqwj8GqTl
         7Xww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720619846; x=1721224646;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z/g/uXFWupPQBz/BOLztfHoTT2FeEc1g42NpY2InPiQ=;
        b=Wcs58mr4/cAN0uwR8s16TygdLrmRw0e9W/GHlqt0DxNn79hGEvRMJi9+h5w10KiNcD
         UkLHukCuKvr8SGTDxCLx7Z0SWOF7FYgp+L9liYQu0PLcWe/x/m1MS3/5ekX/18duXaoE
         aRTLwsYIhdu4J2ij9USAGMCUltZP6tnekqBcGUy6/GGX/4DsHUeWCjNqOijalWXRUxaY
         KBOPNeB4UOstzMdRMiCgr5a2ltTJcMItfGpZ2/ZHfTmNg8jNfqGqOoeDe7alSy/OHc4k
         ShSm7eXYtl9ZRa+sM1M0ADXsn3be5/cxRXCe97lOsDY1P85Vg8uOP1MLoMUekvUTW/VI
         ioHg==
X-Gm-Message-State: AOJu0YxDlHyNMzFU2YPEV3gQjtDHU/QoCOA6qdz5NASGnDxYbF0AT0r7
	dpvfBLeiMCoHVqAXo5CIZOBhukCAThNPqmbKkTfg+LrJxZgHkTxp5/0KK6h8mQmtOZSfsbUN/6P
	G0OQhqjU1bArT9QKzBJam/uYXrbXBFzlK
X-Google-Smtp-Source: AGHT+IHQYg6qYMb+1MIiFa1QKbkRRCIjhjs/nplqyzsRMvg2UUHUlKgQcJWbijs7Mj2Zarl2LVqV6c188r/nXQ5iB7s=
X-Received: by 2002:a0d:e616:0:b0:64a:5df5:3afb with SMTP id
 00721157ae682-658f02f4022mr62400247b3.39.1720619845678; Wed, 10 Jul 2024
 06:57:25 -0700 (PDT)
MIME-Version: 1.0
References: <20240710133017.205957-1-d.schultz@phytec.de>
In-Reply-To: <20240710133017.205957-1-d.schultz@phytec.de>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 10 Jul 2024 09:57:13 -0400
Message-ID: <CADkTA4OBR3uTp0JNe7uMWPfSB0rkBOowyNJTZH3j8sS4tG7F-g@mail.gmail.com>
Subject: Re: [scarthgap+][PATCH] podman-compose: Switch branch to main
To: Daniel Schultz <d.schultz@phytec.de>
Cc: meta-virtualization@lists.yoctoproject.org, L.Anderweit@phytec.de, 
	upstream@lists.phytec.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 10 Jul 2024 13:57:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8836

I'm going through a package update cycle right now and ran into
this as well.

I've got the branch switch and a version bumped queued and under
test. But I can rush out the branch test switch faster, since it is
breaking builds.

Let me say for the mailing list archive .. projects that delete branches
are inherently wrong. I don't have the energy to go complain to the
upstream, but if someone wants to go ahead and call them out on
removing a branch, they should feel free to do so :)

Bruce

On Wed, Jul 10, 2024 at 9:30=E2=80=AFAM Daniel Schultz <d.schultz@phytec.de=
> wrote:
>
> The podman-compose repository has no stable branch anymore and
> release 1.0.6 is located on main now.
>
> Signed-off-by: Daniel Schultz <d.schultz@phytec.de>
> ---
>  recipes-containers/podman-compose/podman-compose_1.0.6.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-containers/podman-compose/podman-compose_1.0.6.bb b/=
recipes-containers/podman-compose/podman-compose_1.0.6.bb
> index e055ee45..bcb2b86b 100644
> --- a/recipes-containers/podman-compose/podman-compose_1.0.6.bb
> +++ b/recipes-containers/podman-compose/podman-compose_1.0.6.bb
> @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Db234ee4d69f5fc=
e4486a80fdaf4a4263"
>
>  inherit setuptools3
>
> -SRC_URI =3D "git://github.com/containers/podman-compose.git;branch=3Dsta=
ble;protocol=3Dhttps"
> +SRC_URI =3D "git://github.com/containers/podman-compose.git;branch=3Dmai=
n;protocol=3Dhttps"
>
>  SRCREV =3D "f6dbce36181c44d0d08b6f4ca166508542875ce1"
>
> --
> 2.25.1
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

