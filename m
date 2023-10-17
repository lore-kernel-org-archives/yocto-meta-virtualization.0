Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C539BCDB465
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 01:35:24 +0000 (UTC)
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
 by mx.groups.io with SMTP id smtpd.web11.197846.1697506520153218970
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 16 Oct 2023 18:35:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=euniwSs7;
 spf=pass (domain: gmail.com, ip: 209.85.166.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-35164833a21so15499935ab.0
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 16 Oct 2023 18:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697506519; x=1698111319; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mLi803dbDLE5FRADfKzoOsKVatWHmRDSXLpPPn4M2EU=;
        b=euniwSs76o0ZgSm1OXPkh1BXeoOtzSQZxwJa3psDUAT66Ngat19U3grTmqPORKU9EI
         u5FA/6YYjiO94U5gTjm6YubziM1pPkOYJdW0/u5zOWVY8hC/OVxvnfglpoDx1ki+Ive/
         gqtC6nvSehMNAXFsjwnwHZGYTAFuWWGDOl1H2imuNWn6xUoWbEjNPUlqFnLCX2K7G/5N
         hmKIjLdB+D/6OY5BKz5+1BR55qQuzPLEQeDbOiBHn4KJErdKLmBerW5TJrX0+F3qI2Qh
         Il7aR8256L5xvl7Iq3vAnUDDiwxoeO9dPRP4tXZfwElDiWJ+Qbi4O3stqkEm49LItkm+
         MD3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697506519; x=1698111319;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mLi803dbDLE5FRADfKzoOsKVatWHmRDSXLpPPn4M2EU=;
        b=ihahwwZl+DNy3Zul+jwQXRTFKJDbKuOXHK49nW0eEH+pO2gllCQzXkwEiJSRYdR73B
         7mbTFxALjkDeHThsTxKyyZka9u+mnenYnPp4tvwcPzqooeChZGGc/uJlBodwi5boB3DY
         Rxny/oPFdCmw4hlqSOAxqJYtVdq5t3+TlqcxrJ21F55IqqGtSrK6cZoy/3a60UsKteMG
         M9vovjjGggX4ymJGhcMxTl2sRyWAB7LZz10TJ2q8a1FIxzl/lkzYpWKHMcc6AM+OV7wI
         3xPDyC1JAzwp70zmChM6plT1meNCReQa3QIfChZCxN7Snb0W2dsKYnT03LHdgxYY+Hse
         qw4g==
X-Gm-Message-State: AOJu0Yxnf7+bUxUuz/jV2UiVT1glyMjX1nbab38JjU7xMdNwb7/7CjAu
	1XWA+ZDR/TzMWoSERh6F08korxM/S3G0Waqv2Tw=
X-Google-Smtp-Source: AGHT+IFbovbAEp4WjQywQ5oqq8ZOcd9Aln/W/eTbaZ3Ed3CcWwxmMdOqB1TGFY6nQZvQ+xx3HD0NlqvcKyA4YNmBMrw=
X-Received: by 2002:a05:6e02:1b81:b0:357:5c29:18ec with SMTP id
 h1-20020a056e021b8100b003575c2918ecmr607029ili.1.1697506519255; Mon, 16 Oct
 2023 18:35:19 -0700 (PDT)
MIME-Version: 1.0
References: <20231016212626.2146963-1-JPEWhacker@gmail.com>
In-Reply-To: <20231016212626.2146963-1-JPEWhacker@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 16 Oct 2023 21:35:22 -0400
Message-ID: <CADkTA4P_isu6k8b=jp37=2BdfO6ka_WziiPTT0+__qAnPsa4pw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] classes/image-oci: Map x86_64 -> amd64
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 17 Oct 2023 01:35:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8378

On Mon, Oct 16, 2023 at 5:26=E2=80=AFPM Joshua Watt <JPEWhacker@gmail.com> =
wrote:
>
> OCI requires that the architecture [1] be a valid GOARCH [2]. "x86_64"
> is not a valid GOARCH so map it to the correct "amd64" value.
>

It may require it, but I've never had any issues with a container running.

Are you seeing a warning or something else ?

> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
>
> [1]: https://github.com/opencontainers/image-spec/blob/main/config.md#pro=
perties
> [2]: https://go.dev/doc/install/source#environment
>
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  classes/image-oci.bbclass | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/classes/image-oci.bbclass b/classes/image-oci.bbclass
> index 9ddb88b..3370f86 100644
> --- a/classes/image-oci.bbclass
> +++ b/classes/image-oci.bbclass
> @@ -52,7 +52,7 @@ OCI_IMAGE_AUTHOR_EMAIL ?=3D "${PATCH_GIT_USER_EMAIL}"
>  OCI_IMAGE_TAG ?=3D "latest"
>  OCI_IMAGE_RUNTIME_UID ?=3D ""
>
> -OCI_IMAGE_ARCH ?=3D "${TARGET_ARCH}"
> +OCI_IMAGE_ARCH ?=3D "${@oci_map_arch(d.getVar('TARGET_ARCH'))}"
>  OCI_IMAGE_SUBARCH ?=3D "${@oci_map_subarch(d.getVar('TARGET_ARCH'), d.ge=
tVar('TUNE_FEATURES'), d)}"
>
>  OCI_IMAGE_ENTRYPOINT ?=3D "sh"
> @@ -74,6 +74,13 @@ OCI_IMAGE_ENV_VARS ?=3D ""
>  # bundled into a tarball.
>  OCI_IMAGE_TAR_OUTPUT ?=3D "true"
>
> +# Map architectures to a valid container arch. Note that the container a=
rchs
> +# should be a valid GOARCH
> +def oci_map_arch(a):
> +    if a =3D=3D "x86_64":
> +        return "amd64"
> +    return a

If it is supposed to match to the goarch, why wouldn't we just use the
goarch.bbclass mapping ?

Bruce

> +
>  # Generate a subarch that is appropriate to OCI image
>  # types. This is typically only ARM architectures at the
>  # moment.
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8376): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8376
> Mute This Topic: https://lists.yoctoproject.org/mt/102006091/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

