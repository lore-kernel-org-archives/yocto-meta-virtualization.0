Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7E23C2A062
	for <webhook@archiver.kernel.org>; Sun,  4 Jan 2026 14:15:03 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43087.1767536092721398482
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 04 Jan 2026 06:14:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Xh01P9an;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-34c708702dfso14107632a91.1
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 04 Jan 2026 06:14:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767536092; x=1768140892; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QRYJYae6rB9w1pjZaRIpOwts9L3eK7UKEs3N/aYjHcM=;
        b=Xh01P9an51AHtqpEjrAWZoSovIcyzQ/9oXjkKwyAoUdpdLViMOvRM+y/7yFNGvgfcT
         PQ5PrxgjRamriXdbljO2XTmi/895Li90jb6BsRk/8ZphuiqgHGBNKQg/D70C2NHCUhNZ
         bgEuv19PzhKwsV8/et9O4+UlNMaj6I7H+jvpn5+5/8Nltu6MbHeCicXL2Jo2fOD/vhL8
         ELyQMWHLlY3jk9MMclgf21gFAWn5QtajNZRIw/LdBHCeVFp3KlZ3qzXS1iE7fH0/cidm
         kVpdELqOWIL7GTeJphmSb4Twxaauyn477tKEvjGWk69mg932noZpAyfylqvdvRMboMJe
         1tbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767536092; x=1768140892;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QRYJYae6rB9w1pjZaRIpOwts9L3eK7UKEs3N/aYjHcM=;
        b=HfG6aoTBpNeSe+OHQC5ol+wk/zSmtX7EIt1IigGt3NEbOci9hS6v9CH5ziGgLp4fif
         27i3LEnKJDcLPKUBdEXfp1gzlbkVIEdsctweJFcbFu8bd69xhDXJLyLWmKTjh4vguXnm
         VrOKXvCurCb+d1eIHhzK+vhfj/FAv8Fv4ghjQMQcbq8bOC7nCFKsAyWOExLKydgK8A4a
         7vjwv/WI+2U52ZPy7Jxy8WOPIWmZM+hcKUbtWloFdPmHu0VHMi6eSrfbiYFqWYlreH3w
         USjfrA5OQgpC/qeljtfctMJ1zhEnkgWZ3ZZS9RjlmJO/0g5VvX9JRp3UDun2k2yXRopa
         Hr2A==
X-Gm-Message-State: AOJu0YzQGvzDW7nECTwkPeibNJhs9DMPKIsClUsxdyjMbFXfFzL1pX7v
	AwW/SxyWHcG7FWTHwGpoJehrL/KsEe3R3B+6DkI8wR+rM/J7xe8shApVIF7M362O1zfEdnK1fhr
	kI6vta1aWQqkZMgEjDidI8ML7EJapxIs=
X-Gm-Gg: AY/fxX6vSXSSG2/4n3GosGNNpmeRNIkJBGDs5cRLpssLynEiTe99+2853cSQowbpLSi
	2wh/1GD0Goo5fUeApdXvG1DyJDmtVV1DeI/ygUpl+/nXLt3leDoeUaL6rK5no8pa57Zyy1vHOjX
	gr20KIsLYKD59dFmexH9E/rrFgXIg/niP52047NgUK1v09inHNH/OwpSGwshDmo9GVFmTZwx/ER
	mKdH6lOcfYgrOpaN+mEFUPe+gX8DVhepcOGgTvhxBa01EcCZ5jf0miUEL3DkSpWPvI7ou/r
X-Google-Smtp-Source: AGHT+IGFpX1Vf0ryFjxdjuBRwCyiOxVlcH8CduQcUmGgMU85BdM8a0cjl7wdOPYVsW+VOIXto/OxVHyfcEorXwhNjp4=
X-Received: by 2002:a17:90b:568c:b0:34a:b4a2:f0bf with SMTP id
 98e67ed59e1d1-34e92142b2fmr44665225a91.16.1767536092023; Sun, 04 Jan 2026
 06:14:52 -0800 (PST)
MIME-Version: 1.0
References: <20260104115008.3349052-1-dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20260104115008.3349052-1-dmitry.baryshkov@oss.qualcomm.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 4 Jan 2026 09:14:39 -0500
X-Gm-Features: AQt7F2p-AIbquYi4W_ihqkm8e4deuo7NI7b0X38rNQtcnylcbDClTLI2XybEuyE
Message-ID: <CADkTA4ODqP9FnAJWCbWgEs70F8ZwVv8ezp-vKPqkOStskzh7gw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] nerdctl: add textrel to the list of
 skipped QA checks
To: dmitry.baryshkov@oss.qualcomm.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sun, 04 Jan 2026 14:15:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9516

On Sun, Jan 4, 2026 at 6:50=E2=80=AFAM Dmitry Baryshkov via
lists.yoctoproject.org
<dmitry.baryshkov=3Doss.qualcomm.com@lists.yoctoproject.org> wrote:
>
> On ARMv7 building of nerdctl fails with:
>
> ERROR: QA Issue: nerdctl: ELF binary /usr/bin/nerdctl has relocations in =
.text [textrel]
>
> Add "textrel" to the skip list.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  recipes-containers/nerdctl/nerdctl_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-containers/nerdctl/nerdctl_git.bb b/recipes-containe=
rs/nerdctl/nerdctl_git.bb
> index 8dc209b2d0e8..08a42aa3ff00 100644
> --- a/recipes-containers/nerdctl/nerdctl_git.bb
> +++ b/recipes-containers/nerdctl/nerdctl_git.bb
> @@ -85,5 +85,5 @@ do_install() {
>  }
>
>  INHIBIT_PACKAGE_STRIP =3D "1"
> -INSANE_SKIP:${PN} +=3D "ldflags already-stripped"
> +INSANE_SKIP:${PN} +=3D "ldflags already-stripped textrel"

This needs to be architecture specific, otherwise, we'll never figure
out the root cause
or know if it pops up in other architectures.

Cheers,

Bruce

>
> --
> 2.47.3
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9515): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/9515
> Mute This Topic: https://lists.yoctoproject.org/mt/117069038/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

