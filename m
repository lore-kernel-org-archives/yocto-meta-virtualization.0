Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2746CC77B75
	for <webhook@archiver.kernel.org>; Fri, 21 Apr 2023 13:03:32 +0000 (UTC)
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
 by mx.groups.io with SMTP id smtpd.web10.10961.1682082207623623427
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 21 Apr 2023 06:03:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=pBSZgxiE;
 spf=pass (domain: gmail.com, ip: 209.85.166.176, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-329465f10fbso5238075ab.1
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 21 Apr 2023 06:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682082207; x=1684674207;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2cKGmI8ka/IsfXANytoymy3CyV2RGyADG5an6amBVpA=;
        b=pBSZgxiEmgwa9CYfe2UA1Ia+k26Haq54dG2g7Bo8JAGu2nuHXDuaE4oPzIMoN/oibg
         Dz5izMZ6d3M4E0U+16LIynpEe9EDhP/Ssu7znISd5cnZQwDHXhmB+EKbrKkmy0MbTHrU
         D2TrnrXJ//nTGvzAYQ/HAtTVxl+hAMLaM5hshnpHN8B5q/WlXHECi646rPC3UeC0Ffzf
         JOUEn/fK1pgW7E0zgOBXiVXKLsWRXQuXdDriB2H16cQPQDbVlr7PddmgHT5QUVaPmHek
         iPuduTs/H9qVtDVYKT/q+aAw9x0/jB+JEeqN8XEsIQGdyxTGns9DgNHFQRv98FOVIm5E
         Yfkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682082207; x=1684674207;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2cKGmI8ka/IsfXANytoymy3CyV2RGyADG5an6amBVpA=;
        b=Vi6cJKqZUVwZxNZb1MgMRTv4cVsnS93XN14Koffoc8p7+Pc1k0yT4aI5VD6B+mBKP6
         hQXyDO3mJx88yEugY9GR2aecJyOQKSvoTa2cfTteFq6kJ0ZLm2qO/p3DVEbk3FqSN1jR
         Pl1Sp/eemvWJkOe7IJe4YdXw+TPRWZEmlHQBOWzv4MNLe3w55KeIloMk1YvniP0gRb20
         G/8DWdK/tE6h0YutJ9urJIsqEge2f0dEQ+dpxDM+bJVmCC0WCTju9PkUNpCuQI2SB8bF
         5Y4OSQ+1nV6GnvdO3R1ozh5P/zRaBgr+EJIyJSG0ro+QOAOVhjS1idfzUv0RTc2/d/3e
         5PCQ==
X-Gm-Message-State: AAQBX9fNRdaZlKUTMn6ABSXJUIupZaElvFqTR/eOaZ6FaQYqVtDgvz+E
	qSU47w24yXZfRTQASAaRl7vODTcmDGTQO9wk2b1kf9nFjNI=
X-Google-Smtp-Source: AKy350aeCvDH+u3z46J19cgY12MkZ/LK+LoK7RL34ZWqzl5Qg4P7uLeQkq6+i4Y657Wbi+VBZsme9ybMQanb+gJaEHc=
X-Received: by 2002:a92:2908:0:b0:32a:b2e2:b11 with SMTP id
 l8-20020a922908000000b0032ab2e20b11mr3224761ilg.8.1682082206718; Fri, 21 Apr
 2023 06:03:26 -0700 (PDT)
MIME-Version: 1.0
References: <Y/ThAuqvluHZM+/x@gmail.com> <27624.1681984477160553329@lists.yoctoproject.org>
In-Reply-To: <27624.1681984477160553329@lists.yoctoproject.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 21 Apr 2023 09:03:15 -0400
Message-ID: <CADkTA4NJx-UmYgD=hW8dTANC1rXzkTSi2n8AHO8ShPO0_RHfyw@mail.gmail.com>
Subject: Re: [meta-virtualization] [dunfell][PATCH] lxc: Fix CVE-2022-47952
To: ranjitsinh.rathod@kpit.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 21 Apr 2023 13:03:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8008

On Thu, Apr 20, 2023 at 5:54=E2=80=AFAM Ranjitsinh Rathod via
lists.yoctoproject.org
<ranjitsinh.rathod=3Dkpit.com@lists.yoctoproject.org> wrote:
>
> Hi Bruce,
>
> When I checked in https://github.com/lxc/lxc/compare/stable-4.0 branch an=
d check, it seems the CVE is not fixed there and so this fix is not availab=
le for the 4.0.12 version as well if we sned the bump.
>
> Please suggest what we can do here to fix the CVE at least for the dunfel=
l branch.
>
> If CVE is not fixed in the stable branch for lxc upstream, do we not goin=
g to fix this CVE by applying a patch?
>

In a situation like this, we should still do the bump .. as there are
obviously more bugfixes than just the CVE in the newer version.

So do the bump, and then include the CVE patch as an explicit backport
from upstream at the same time.

Bruce

> Thanks,
> Ranjitsinh Rathod
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8002): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8002
> Mute This Topic: https://lists.yoctoproject.org/mt/97081672/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

