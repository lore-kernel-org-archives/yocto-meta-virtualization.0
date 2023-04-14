Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 530B8C77B6E
	for <webhook@archiver.kernel.org>; Fri, 14 Apr 2023 13:00:51 +0000 (UTC)
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
 by mx.groups.io with SMTP id smtpd.web10.8471.1681477248469174661
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 14 Apr 2023 06:00:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=kIpYuMQj;
 spf=pass (domain: gmail.com, ip: 209.85.166.51, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f51.google.com with SMTP id e22so4276842ioc.13
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 14 Apr 2023 06:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681477247; x=1684069247;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T0GyJcNjZnuzQsLTd/6AjfTsbwnWpGGyq5yLlZE3qco=;
        b=kIpYuMQjxjb5KI2dVzS9uhrxflm004MFSQQZOAn5/6uf0QaaIe3zu6LjB4IQEegQ2D
         aeDJra8DPo42LNclptE1nmqAvAHXB1SksFeHIfBMHsGju2DAKW+VveyJNy+LIqElKxYF
         Y7VTA7W6PfVwAWgdZjLC8OlOLqmUA7PXJmXmBKQ97vFNWX1ZBBrw0C/ofjVyM69K5ubE
         MWbL3mn/cg1bPtvmaY9PQ+2jTnGQPYPwcm76/jMO3/O/NKidiCYBgmAeFWL24+mu6uR3
         8Q02/PnxfSBt1oZX1v0CF4ZSExiX0sbD+nDsSTyIzr18ryOh8mb1pYjMzqJl7CuGuMDm
         dP+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681477247; x=1684069247;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T0GyJcNjZnuzQsLTd/6AjfTsbwnWpGGyq5yLlZE3qco=;
        b=W+ypreVQLFgAiMa9cdFaoDa2eprWr71dNySmox9TlYKEADElvp3YKCpUQ3vsF4OyWZ
         UzjGJwUx5Lx1RTTgmJxqbrQ/T8rbes9JOzTxelAcjTrY+XzJlklxvPHWnd4UByN+vVtf
         f6MKK/PMFqiB2TjbwqBwFu3Q5pP4j/+oBvH5tvQQa5Ti11Vebw1nMKZw5o1rw6mS7mQA
         K8muK+dFmjtQ9930nePe6yNeL6K5//LjUmb5Fm2IKQq07F6e+y1qLa/uuXG54zEjJ+Xe
         T0efyq/GJAuYPZRZUS0FNImoSMlzkgKtpHCZleGGAPpF7ZZpVtHt7F4IYu0KZRiYI+/i
         uKDA==
X-Gm-Message-State: AAQBX9cS8oJYHWUYllY9TnsvVNaDuQHzDefN/hF+TClilza+vSYcbKGd
	jQKboPZrZnjYBUJrS5oJD6TMP8Of/MC/o7qXUD8=
X-Google-Smtp-Source: AKy350ayv9vRCSk5V5lNJ/J22znmroRutTTgN8blMEt4+Nw4sUcKGnXl0gv9mdcl00lax7BYLRBH6NZHj2pJDaJrBC0=
X-Received: by 2002:a6b:7611:0:b0:760:b1eb:4f52 with SMTP id
 g17-20020a6b7611000000b00760b1eb4f52mr2026070iom.1.1681477247508; Fri, 14 Apr
 2023 06:00:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230414070800.381040-1-xiangyu.chen@eng.windriver.com>
In-Reply-To: <20230414070800.381040-1-xiangyu.chen@eng.windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 14 Apr 2023 09:00:46 -0400
Message-ID: <CADkTA4P8ZJ-wCoJdx8BfXbsQ+9-ixQDYKFmr8oa5FG4105imJg@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] ovs: Uprev from 3.0.3 to 3.0.4
To: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 14 Apr 2023 13:00:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7993

Note that I have a 3.1.x uprev for OVS prepared for post mickledore release=
.

But I'll stage this for now, pending the results of my testing.

I'll also regenerate the commit message, as we should be capturing the
shortlogs of commits that are part of a release.

Bruce


On Fri, Apr 14, 2023 at 3:09=E2=80=AFAM Xiangyu Chen
<xiangyu.chen@eng.windriver.com> wrote:
>
> From: Xiangyu Chen <xiangyu.chen@windriver.com>
>
> Pickup the latest security and bug fixes for the ovs.
>
> Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> ---
>  recipes-networking/openvswitch/openvswitch_git.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/recipes-networking/openvswitch/openvswitch_git.bb b/recipes-=
networking/openvswitch/openvswitch_git.bb
> index 1ad3e57..798c7be 100644
> --- a/recipes-networking/openvswitch/openvswitch_git.bb
> +++ b/recipes-networking/openvswitch/openvswitch_git.bb
> @@ -14,12 +14,12 @@ RDEPENDS:${PN}-ptest +=3D "\
>         "
>
>  S =3D "${WORKDIR}/git"
> -PV =3D "3.0.3+${SRCPV}"
> -CVE_VERSION =3D "3.0.3"
> +PV =3D "3.0.4+${SRCPV}"
> +CVE_VERSION =3D "3.0.4"
>
>  FILESEXTRAPATHS:append :=3D "${THISDIR}/${PN}-git:"
>
> -SRCREV =3D "7b5c4240c1ed5f38e476cf08819869dc14f55e8a"
> +SRCREV =3D "2a98be5adaa6b3bd6c71a0ee01fc2782c67e7c78"
>  SRC_URI +=3D "git://github.com/openvswitch/ovs.git;protocol=3Dhttps;bran=
ch=3Dbranch-3.0 \
>              file://openvswitch-add-ptest-71d553b995d0bd527d3ab1e9fbaf5a2=
ae34de2f3.patch \
>              file://run-ptest \
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7991): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/7991
> Mute This Topic: https://lists.yoctoproject.org/mt/98257376/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

