Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AF8AC53219
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 19:21:13 +0000 (UTC)
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4291.1785266471215078497
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 28 Jul 2026 12:21:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=OHDA0Kyb;
 spf=pass (domain: gmail.com, ip: 74.125.224.42, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-66807ba2f0fso86090d50.3
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Jul 2026 12:21:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785266470; cv=none;
        d=google.com; s=arc-20260327;
        b=Lxlt/WRT+BLnlHNN9+GbD2j3umr8G0LhRze6s31oinpCs65CcEpMtB09o/Eox9fG0O
         0W0tQxebl0uDjUCeCOWN6rpFDuMbrPqrOz4AJOcu/OClq5PeNEVf5lWcVhEQeJTj9CBn
         4iQ58DqDttWRdrwikM77VdCfWObhxTkSabXLMFsv37LJvPOhWJdYC5Kf+z7dxo694VJH
         j1QmGdFM1+rWP2sLD3/dYQ8DjBCXSZOIubzUhDBx/M8l39/ML+mwxRGZN5thmIxTxKHl
         Jyv0Bj6NzQxrVZuBs1BR92FZYkDWXKoKmrv7f8WX4854/WqbLvbqQLiE46sgWAzUrfGp
         Rp3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8sjau3E1GeSM8nwQTrzCrmVGJAUnsBed2Jvr9dsX2HY=;
        fh=hlLEK3pItE2LGIEGxbjUKXm7mi5I2ht885vnwqeyEsA=;
        b=Nk98qwrXn9MXa1gz3BpzZDMMnFxQcPx6uuQB7CIHSYHPWOjJ7XbarOfhTZUVYu/ppf
         jHUzMOik9RdIhEUJ2B2/Jf73LeENsPLZm2vKN303ovkDlXvs2Mc6HEMeOdqZploQZIEp
         1thm9nUS2+tVui82oYBOIyIAAZLHA92eYztIlU48Xa+enO1QzADsfeiyyH1hjWfi8afR
         YM5AroPCY7uzMrwupVYb/ta/QZcVqsaYuHEtiiLwOoes0HkahBOyIcLOb1x00bcm6G6j
         7u98+llxn+5HZ99dIv+224tl1F7hFNOQdb0p3aOBmbTpLGrBttEFIy8qBya0lPNrT8Lu
         IRRw==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785266470; x=1785871270; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8sjau3E1GeSM8nwQTrzCrmVGJAUnsBed2Jvr9dsX2HY=;
        b=OHDA0KybjaDTwgOHFbqMS5dcrTLVollebieP5O8t1e/16rDC8zk/81fvQ8VWB/9tMN
         qBLW9XLxLD1S0NKMTfef9J1LHdS5v9ZfD3QIr4IVCq0hMMryQ7/e7dl2KkXhJHIoaCQI
         mpgUhOx4VCEIS3fK9drPLuJOz/Fyk0rYW4ugtJkFuxWU6Dub1LgoX887Zsh0C1JsCvl8
         lC+FABQk6/qFak34Fja6JF5eRkG45UcYJtQh5Uk8CcCqj4qlM7LP3zI4lJTkh+dP6LTA
         B9fCyRpcfHZS8sbuQH+O0afi5DPkGaNh5CPbEUf8Q/bdOEJuxDWhFmOIoTJ6RSJ9AMAE
         p7Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785266470; x=1785871270;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8sjau3E1GeSM8nwQTrzCrmVGJAUnsBed2Jvr9dsX2HY=;
        b=JAKxBImUAY2YFruBbZz0jXJTDuUMieg1vNZqoKX+0D05/9yB9oqT6V7OC0F63yKro4
         6yATc81PeV3wX2ai9gzLOvELfDFCJkDYkviJxArQ3SAgLZv25l98BnSgNRc0bLU7sSYW
         lJOA/JDTtG5nT0lA0NXsCHg7psOCVncGA59U07qowkxB+7dPyVVB+PxdGKhagbs9MugK
         L/fdt9pYUqCfCVgvdCOGSQBIZ4UzUZmaEH/XXRee3PSMuKdaHlT6nhKzfOzn0YMxCnSN
         i1EOEYXuRWCsLe1N328yC1o6+/2eATwOSOXDT6EJhmcTmqSU2UA2IcD7uEK4FJibYX1A
         la9w==
X-Gm-Message-State: AOJu0Yy4E+t6UkpmKwPaaLmi8dBS9WHzpWP6Cb2jZ+x1el5nR6PXwAr9
	RdbfuwtUtfmFOA9Xs68jiwhUGxIMVp6SUbkfOiAdexWBYGEpVGXJwlrtmvfkb1ngzE2LAk4BJyq
	SpmlcrgOLcjdr49v1u1zKGZS0zhU98nI=
X-Gm-Gg: AR+sD10rtZgvWiiquaT0xVzHCHUkh32Rt/SF8uHIVcUjgkLCRSDWB3RKGqbo2DsJ7Kt
	4MNkzJfbv6OSKf2QpgOZCVdmADdEZejp2A3XB/VevtEUYItNO5fXTu7Gn3VZal6/kTrETr66C9p
	xwMttZTjVieQbR3fJB2U4f0/KxFwFO0Lexm2qrl+xe71SKcFmg2KbTH+KZp49chjKS64gsoxUFL
	U26VFGj/I993eIEUcji+VKiJVJqkZigecn/3y+bfDglOhzJaOK0zkCb4xHZ8juQr1sDSJTV9aiO
	nmUolP86AdjGTdFYLS8OK7h5XVwz7O9AQx8+e5T/RjbxliN2uXJd77w4Ih/3DIKatS/jS+kznpV
	DWncT
X-Received: by 2002:a05:690e:401:b0:668:973d:5ba1 with SMTP id
 956f58d0204a3-66905822a07mr1002823d50.79.1785266470200; Tue, 28 Jul 2026
 12:21:10 -0700 (PDT)
MIME-Version: 1.0
References: <18C3CBFF4B8615C4.1217577@lists.yoctoproject.org> <AM9PR10MB508230EAF658EC9F54AE9E5DFDCB2@AM9PR10MB5082.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AM9PR10MB508230EAF658EC9F54AE9E5DFDCB2@AM9PR10MB5082.EURPRD10.PROD.OUTLOOK.COM>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 28 Jul 2026 15:20:55 -0400
X-Gm-Features: AUfX_mzvbcFT9gP7yoEthjinrDh1LovKaGjMtX67Z-2omzZVrbdArT1ZRIbfYpw
Message-ID: <CADkTA4P952ony90eA8geWYSeG9uK8Q5gshXk1oO6B_dUCQhYew@mail.gmail.com>
Subject: Re: [meta-virtualization][wrynose][PATCH] crun: set status for CVE-2025-24965
To: "Marko, Peter" <Peter.Marko@siemens.com>
Cc: "meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Jul 2026 19:21:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10009

I have no record of the original email.

Can you resend ?

Bruce

On Tue, Jul 28, 2026 at 2:40=E2=80=AFPM Marko, Peter <Peter.Marko@siemens.c=
om> wrote:
>
> Gentle ping.
>
> -----Original Message-----
> From: meta-virtualization@lists.yoctoproject.org <meta-virtualization@lis=
ts.yoctoproject.org> On Behalf Of Peter Marko via lists.yoctoproject.org
> Sent: Sunday, July 19, 2026 10:49 PM
> To: meta-virtualization@lists.yoctoproject.org
> Cc: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> Subject: [meta-virtualization][wrynose][PATCH] crun: set status for CVE-2=
025-24965
>
> From: Peter Marko <peter.marko@siemens.com>
>
> This CVE was fixed in v1.20.
> This is mentione in NVD report description [1] and github advisory [2].
> Explicitly set CVE_STATUS because cve-check still reports it as open.
>
> [1] https://nvd.nist.gov/vuln/detail/CVE-2025-24965
> [2] https://github.com/containers/crun/security/advisories/GHSA-f42g-r5jj=
-qh4j
>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  recipes-containers/crun/crun_git.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/recipes-containers/crun/crun_git.bb b/recipes-containers/cru=
n/crun_git.bb
> index d2f7b63b..ea14e8ec 100644
> --- a/recipes-containers/crun/crun_git.bb
> +++ b/recipes-containers/crun/crun_git.bb
> @@ -67,3 +67,5 @@ RCONFLICTS:${PN} =3D "${@'runc' if d.getVar('CRUN_AS_RU=
NC') else ''}"
>  REQUIRED_DISTRO_FEATURES:class-native ?=3D ""
>  DEPENDS:class-native +=3D "yajl libcap go-md2man m4 libseccomp"
>  BBCLASSEXTEND =3D "native"
> +
> +CVE_STATUS[CVE-2025-24965] =3D "fixed-version: Fixed since 1.20"



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

