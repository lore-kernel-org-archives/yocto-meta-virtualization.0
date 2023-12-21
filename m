Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 269D2C35274
	for <webhook@archiver.kernel.org>; Thu, 21 Dec 2023 17:58:10 +0000 (UTC)
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
 by mx.groups.io with SMTP id smtpd.web11.671.1703181480948256146
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 21 Dec 2023 09:58:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BdjvCqGL;
 spf=pass (domain: gmail.com, ip: 209.85.166.176, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-35fd902c6b5so2661315ab.3
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 21 Dec 2023 09:58:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703181480; x=1703786280; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pbVvf5JFXZLBN8Cd0cVFW+S76CVOA4xElVCB3Ki9hsg=;
        b=BdjvCqGLP4slKDHP1dvdNexIo/tDhZ6u2oBvfdWYHztx5mVXje/bJN5Fs2feVrbu4h
         YDRAPuXMFAXvXpbVxfLpEwDMDcu6agt7cdDyW8SD0l0wZ1jtsvG7PDrZGd6a+dT3ex8S
         L5L/3KEiHQ9jqaF6T3tVGYVOt/LXH8K3NUDaXvrMKw89nhXobGQ8Rcy7X44G+VBqxlFQ
         eqZvtV4RuK66eeM64GW76m8MYuPFXKi7LSWm5uXk2q+PBhqIj/U0VKvAOmRfdoCOBFoi
         RJNR/aE01oQFM3ZKjNxXp7qH0S7L5IsNMWFBPV9FF81qmCulTiNMjXVbFQXQaYpJDzkq
         8xgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703181480; x=1703786280;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pbVvf5JFXZLBN8Cd0cVFW+S76CVOA4xElVCB3Ki9hsg=;
        b=g94i2glqGhxKW4GxuJfOxEqdjWX01iU3fdkrLGEEc0Gc4mx3+Bg9c/+dV/7IkRXLHi
         AtdjTOM3IIuJEJuhEn30n0XK/wN9jDLnazA9n+aAlh0sVbIEuduSz3ySvX/Fgxbnz4za
         +OImbQmOBQAtxXa6ME6hmn6bXZShF9UBcyD6f/MQVyeF5FdM5maE0ir+vozVHHveh4VX
         D6/ASA878lLaKYzomyg7hQ0VfDBcz7rLgbQj1ariZQLP0hGKliDt57DxmCWNx0bQxNF5
         q3ANGeoMPy5xmkMJQs5co8ko9Cgw7BcYJv295nP1l5Hbi9LWRv5eydQFrMwyuv4QdnM8
         5ThQ==
X-Gm-Message-State: AOJu0YznG/4fxdamgHAG1scLCMrys5xZPef5Y/faqKan7V0HM90QTzXY
	a2BMv9U4VtlZFuGiwDQaWu3mjDuTabsFmUy062Y=
X-Google-Smtp-Source: AGHT+IGdqhsxyCQFarKE0SPuRWEIRIb4thHp3CadZM1U6eMSc3x8nLC4QtYqQYQLFqjQOlvK/+kE7aWl0x3fnNZoJyw=
X-Received: by 2002:a05:6e02:1a23:b0:35f:cd48:9300 with SMTP id
 g3-20020a056e021a2300b0035fcd489300mr3775662ile.100.1703181480132; Thu, 21
 Dec 2023 09:58:00 -0800 (PST)
MIME-Version: 1.0
References: <20231221173438.3684990-1-jpuhlman@mvista.com>
In-Reply-To: <20231221173438.3684990-1-jpuhlman@mvista.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 21 Dec 2023 12:57:49 -0500
Message-ID: <CADkTA4OFEAQMgv93n+h8aiTdiNNWxEG85bht-yv8F76iOQtLRA@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] cloud-init: replace sysvinit/redhat
 with sysvinit/debian
To: jpuhlman@mvista.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 21 Dec 2023 17:58:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8524

I have this already staged on master-next:

https://git.yoctoproject.org/meta-virtualization/commit/?h=3Dmaster-next&id=
=3Ddd8fa86c6a85b44d77ae9579453e57aebd7296db

Bruce

On Thu, Dec 21, 2023 at 12:34=E2=80=AFPM Jeremy Puhlman via
lists.yoctoproject.org <jpuhlman=3Dmvista.com@lists.yoctoproject.org>
wrote:
>
> From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
>
> sysvinit/redhat no longer exists in the sources, move to using
> debian sysvinit scripts if sysvinit is enabled in distro features.
>
> Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
> ---
>  recipes-extended/cloud-init/cloud-init_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-extended/cloud-init/cloud-init_git.bb b/recipes-exte=
nded/cloud-init/cloud-init_git.bb
> index 9d84f47e..edc6372f 100644
> --- a/recipes-extended/cloud-init/cloud-init_git.bb
> +++ b/recipes-extended/cloud-init/cloud-init_git.bb
> @@ -25,7 +25,7 @@ do_install:append() {
>      ln -s ${libdir}/${BPN}/write-ssh-key-fingerprints ${D}${sysconfdir}/=
cloud/write-ssh-key-fingerprints
>      if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'fals=
e', d)}; then
>         install -m 755 -d ${D}${sysconfdir}/init.d/
> -       install -m 755 ${S}/sysvinit/redhat/* ${D}${sysconfdir}/init.d/
> +       install -m 755 ${S}/sysvinit/debian/* ${D}${sysconfdir}/init.d/
>      fi
>
>  }
> --
> 2.31.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8523): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8523
> Mute This Topic: https://lists.yoctoproject.org/mt/103304302/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

