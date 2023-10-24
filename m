Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47D1BC00A8F
	for <webhook@archiver.kernel.org>; Tue, 24 Oct 2023 19:00:22 +0000 (UTC)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
 by mx.groups.io with SMTP id smtpd.web11.26560.1698174017653675249
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 24 Oct 2023 12:00:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Cb4SYFMX;
 spf=pass (domain: gmail.com, ip: 209.85.166.53, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-7a6907e9aa8so176254839f.1
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 24 Oct 2023 12:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698174017; x=1698778817; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wlyDR270g2JUlmH1M7wpkwlgCEghIrox0B/maUqLpco=;
        b=Cb4SYFMXHMigWfPDi9DqRde8j4k60NZH2u9D9YU8EN/3JKmqCLhWHqqdt4+ZDubEr9
         6xIs904XJ5KZfcY4HRet32YQ+qopXt62mLgJRuV9ZMpdiqjao5swF2I7UKgcOpMZsjwZ
         /ZaEn2Ui7FbzIkPOOAiQ3aPdvSjnxJLZTCAdVXiWWgU77RhUrDTzIKEgSTLimqb3Yhgh
         PxC3gwEONszx1bvAaKn67iAD0eW8MRJbW8hTUBeprsMw1DSBbZtgGkFtPnUDH2H4GvxV
         n4+q+ZqYSll3XR7v/X71ae9PyVccmnH3mDSGXujBu4Erf6fFPmVBlb5YivU1eJhTyPJ3
         J0Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698174017; x=1698778817;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wlyDR270g2JUlmH1M7wpkwlgCEghIrox0B/maUqLpco=;
        b=A43R0BDV9O6Qobg9tCWunczkCaby87osPLeLciaDLdz+iTb7arxLpBual9EtZ1/WJC
         Kv+2eHtwast6Xi7r8uyfcTkGZaB4QGrWKAvYmLvqdXWxwo5omdx/oL2BfafejCFWt039
         /cQSDRtaEhRjd1bYUFIMgtJ507O9ime88cAHosG/0kGVxOSvylKC0I+72psbC+rJc/eT
         RzbkKSyTJcRXpIoj5lIB1DH7+nnIgfjdiNMCDSTqsCsaD7sUtW6bBQj6p6nymVFyHPZC
         Yl2QtdhNFiZ/XNyDRV5GdjMUCdN82t8WuWHpNmgfoC0xydDCjiiZnUUK47ERCqI7tn1H
         r90w==
X-Gm-Message-State: AOJu0Yy4TQ09CJZvMRMdysKCiiAVMW1x3lUlPeEsuobJn1HU8PGiHczY
	wHsBwRcUeBaI7ccfAkQwbQvRtKYsTYlJknUz6hc=
X-Google-Smtp-Source: AGHT+IHCBXqn43Zj8HS6hPIQ45gBAmtR6p8WALTgcLwnfPgFt/pYujgbzBSZ3lZOpDx2/d4LsIxJ51DDkSPIM1ygc3k=
X-Received: by 2002:a05:6602:2c45:b0:792:8c52:b3b8 with SMTP id
 x5-20020a0566022c4500b007928c52b3b8mr17136197iov.14.1698174016779; Tue, 24
 Oct 2023 12:00:16 -0700 (PDT)
MIME-Version: 1.0
References: <20231016210832.2116524-1-JPEWhacker@gmail.com>
In-Reply-To: <20231016210832.2116524-1-JPEWhacker@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 24 Oct 2023 15:00:05 -0400
Message-ID: <CADkTA4Np4B2k328g2M6RsYpG=zzAfAv=VLp046keR92WnwUTQQ@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] classes/image-oci-umoci: Allow
 labels to have spaces
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 24 Oct 2023 19:00:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8391

Ack'd.

This makes sense regardless of the other patches I'm doing more tests with.

This will be staged shortly.

Bruce

On Mon, Oct 16, 2023 at 5:08=E2=80=AFPM Joshua Watt <JPEWhacker@gmail.com> =
wrote:
>
> Quote the label argument passed to umoci to allow it to correctly handle
> spaces. Note that this requires that OCI_IMAGE_LABELS have the argument
> quoted with single quotes, as in:
>
>     OCI_IMAGE_LABELS =3D "org.opencontainers.image.description=3D'${SUMMA=
RY}'"
>
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  classes/image-oci-umoci.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/classes/image-oci-umoci.inc b/classes/image-oci-umoci.inc
> index 58e4668..333c816 100644
> --- a/classes/image-oci-umoci.inc
> +++ b/classes/image-oci-umoci.inc
> @@ -58,8 +58,8 @@ IMAGE_CMD:oci() {
>      bbdebug 1 "OCI: configuring image"
>      if [ -n "${OCI_IMAGE_LABELS}" ]; then
>         for l in ${OCI_IMAGE_LABELS}; do
> -           bbdebug 1 "OCI: umoci config --image $image_name:${OCI_IMAGE_=
TAG} --config.label $l"
> -           umoci config --image $image_name:${OCI_IMAGE_TAG} --config.la=
bel $l
> +           bbdebug 1 "OCI: umoci config --image $image_name:${OCI_IMAGE_=
TAG} --config.label \"$l\""
> +           umoci config --image $image_name:${OCI_IMAGE_TAG} --config.la=
bel "$l"
>         done
>      fi
>      if [ -n "${OCI_IMAGE_ENV_VARS}" ]; then
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8375): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8375
> Mute This Topic: https://lists.yoctoproject.org/mt/102005707/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

