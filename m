Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AC6FC25B74
	for <webhook@archiver.kernel.org>; Fri, 24 May 2024 19:21:51 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.3768.1716578508327031872
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 24 May 2024 12:21:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VgiPPBxt;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1f44b51b367so7688205ad.1
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 24 May 2024 12:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716578508; x=1717183308; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CqYEK3glwScecoOqKf9/6jPbo+n6m5Lomy78f9Hz7kk=;
        b=VgiPPBxtxv0yibVB6DssHJ1oHrh9RnLThVebA2s79wRdpq0lY8cNXPQt9e5QE5N8jp
         F7LlkDUGo71lMUjouMHQmdHPCR61t+75DrduTStXA7qzW3GbotYq2Y84wOFb/VegRIm1
         Z41MJaPBSUW6tlImv59NK3o1WqpNoHBfKTUsENpGDdaK/n2f+nH2ii/V4TcKE7vys/uQ
         H/itjZjpWeh/l9Qf/Xs8zLjtN6/D3ArsSh8mHncpO4IYIQvdq1tO/W53B0t4/t5NzfVn
         FN6htBFRVWS52rpbv6Z3bQfoMuKPYCFx/au3GGxqQUAY3r3WWo2seCYEVixcanhqAscf
         UlFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716578508; x=1717183308;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CqYEK3glwScecoOqKf9/6jPbo+n6m5Lomy78f9Hz7kk=;
        b=CxP+A7Hm2/OCo9ykhW0hMT3CQNgGMVgfASjvVQedxQBprPaHCu0ZPQDJVMI+AEq+SE
         b/Ve6pqn8Ly/FiT1+vRSyU3iQkKpEFukNJ0aynGDZQ3sy9XMX/B52PWVlMGURJUJswBy
         dm9fzjHTX5bmj5euWvQiqMn1O/xg/BFc4hn7Wv/CKHB+OAS7egQUBkfnbtemSdilC84D
         D1i5GMh649ObIKxVn2qsLJZlrUbxPOTvaRqkJl7ltFi7IY9nFVVkNH3Ql8iXSkW+VUih
         4NHQK7kD/inoN2pvu6FrkKW7OI/ovCyl91gKvC+tjdrU66zmQJYFeezccZv6ee/6y1rQ
         IBjQ==
X-Gm-Message-State: AOJu0YyK1Kfw+ao3HTMMrpbjyYAZ4JM5mlk0ALoKXfM13EUa1N9Tm0Bg
	BtwALCRYyDmqzSPLK1oKm1mU/5la2GV2x0ZzUVib+bQzwGeO654szFYn6FHwVQCjhtl99ep+KID
	5WsfxIwys4xAtO50BFF4d8PNQAD8=
X-Google-Smtp-Source: AGHT+IHC/W+bclhga4nwxkMEF/tWaFjBlcRKwQEFbR+d3BZEl9FyTZXfvUJ3t47af4E1T2md2sA1Q6v6VOuGBnvDeMU=
X-Received: by 2002:a17:903:294d:b0:1f3:2c64:bbf4 with SMTP id
 d9443c01a7336-1f4498ec096mr27155845ad.53.1716578507668; Fri, 24 May 2024
 12:21:47 -0700 (PDT)
MIME-Version: 1.0
References: <20240524190915.1241716-1-martin.jansa@gmail.com>
In-Reply-To: <20240524190915.1241716-1-martin.jansa@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 24 May 2024 15:21:36 -0400
Message-ID: <CADkTA4Pb85Zakj8LxfFrYhaxL1S0N4qjHpt=DKg3ZADLbbw1VA@mail.gmail.com>
Subject: Re: [meta-virtualization] [RFC][PATCH 1/3] netns: use GO_SRCURI_DESTSUFFIX
To: martin.jansa@gmail.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 24 May 2024 19:21:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8758

Thanks!

I've already fixed this one locally, will push everything once my
image testing is done

Bruce

On Fri, May 24, 2024 at 3:09=E2=80=AFPM Martin Jansa via
lists.yoctoproject.org <martin.jansa=3Dgmail.com@lists.yoctoproject.org>
wrote:
>
> * see:
>   https://lists.openembedded.org/g/openembedded-architecture/message/2007
>   https://git.openembedded.org/openembedded-core/commit/?id=3Dcc4ec43a2b6=
57fb4c58429ab14f1edc2473c1327
>
> * fixes:
>   http://errors.yoctoproject.org/Errors/Details/772686/
>
> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> ---
>  recipes-networking/netns/netns_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-networking/netns/netns_git.bb b/recipes-networking/n=
etns/netns_git.bb
> index 357275c1..be41d2b8 100644
> --- a/recipes-networking/netns/netns_git.bb
> +++ b/recipes-networking/netns/netns_git.bb
> @@ -3,7 +3,7 @@ SUMMARY =3D "Runc hook for setting up default bridge netw=
orking."
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://src/import/LICENSE;md5=3D7bac31faf84a2d7e88=
972f562a3ebbe5"
>
> -SRC_URI =3D "git://github.com/genuinetools/netns;branch=3Dmaster;protoco=
l=3Dhttps \
> +SRC_URI =3D "git://github.com/genuinetools/netns;branch=3Dmaster;protoco=
l=3Dhttps;destsuffix=3D${GO_SRCURI_DESTSUFFIX} \
>             file://Makefile-force-rebuilding-all-packages-to-avoid-cgo.pa=
tch \
>            "
>  SRCREV =3D "00d5d07ab1c8afcf481ffa5958719943b6ecfde4"
> --
> 2.45.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8755): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8755
> Mute This Topic: https://lists.yoctoproject.org/mt/106287450/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

