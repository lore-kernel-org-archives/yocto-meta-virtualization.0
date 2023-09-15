Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3E15EED61C
	for <webhook@archiver.kernel.org>; Fri, 15 Sep 2023 17:31:47 +0000 (UTC)
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
 by mx.groups.io with SMTP id smtpd.web11.27401.1694799104988623139
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 15 Sep 2023 10:31:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LsubUWLK;
 spf=pass (domain: gmail.com, ip: 209.85.166.181, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-34ccedcc584so6195475ab.0
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 15 Sep 2023 10:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694799104; x=1695403904; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WmQ0VmgKBw1OhXrZ6SdNEaCM35yeEej3TBbi+TKNHpg=;
        b=LsubUWLKByFAZhhNa8/SNbW11gErLYKt1STPDUeS4cIFSvC+AXrCO6unclh6Ln6Nz9
         LWmDjCgzg6ygwYgyVH7zhQRqNLFFLanfcCCZZHxzWn4/YDcprKuem24vZCQIYAeMM2EM
         uo0eKtSdbBCENOa+PP4XfjuvReYwQxV8uqQJoiH82JGKep0p4MluvKQ+xBcj13fUkK3H
         d+beXUQPxhpGmXYU18pMir9J3yENuz1YYitoEjnTSf8kNZgjXFMrOP206FYbI1uF/ygu
         TsoKriXF3Whviji/qAI2frdY2jgOMxdXsYE011Zi+Q1D60L3qK12nR8Rc6XUCZ4ahwH+
         UdPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694799104; x=1695403904;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WmQ0VmgKBw1OhXrZ6SdNEaCM35yeEej3TBbi+TKNHpg=;
        b=rGNKv1DypMiZzuMl8EsK2DmvRWznuqKC5ukNaCP41nPw0rerTM4OPcS3kuA7msMsRK
         LwkP0CCcB+r3q1YmQPwBfGMufka9ioa1QpMOYHllh1xHbqPD021dKSYhoNHY9WjBDK2O
         0kczyOK1gIV8lyYDUEYao1DdgkGnHvyD1fQ3JZ9Qi4YWJrm4VzPs8FWHB5PVHbcwDqmO
         ipr6nDqDn5O6BLV/Dd0+OTVRvJFbsCUG77HMCIZlcrCRhOM27gbb2IFnN0TktsTKTGY3
         RY1Z7Fn98ZRUOZgVhDaSPuoeJPZZ7eP1dKNq+YlThA13Vld2t9qhCoQP6aclLb1VOF0A
         Ux0w==
X-Gm-Message-State: AOJu0YwWPkKiqGHrxcGVubYhuEd9feVpgcOOhBSsytaggJZ4eLjqCFuR
	bSd+BX5118hTYBXTkD9Jut9B1EMCOE/xW/i3AZIzpqrZaHg=
X-Google-Smtp-Source: AGHT+IEF30BeCv2/uI4H5NVhwNzRY62Fz/wkzEaIuszMDLvRwEo7zf6QVu1I4Bu6aWM76KIbk0yY24nARSz55/BQtw8=
X-Received: by 2002:a92:c546:0:b0:34a:95f9:650c with SMTP id
 a6-20020a92c546000000b0034a95f9650cmr6040978ilj.10.1694799104254; Fri, 15 Sep
 2023 10:31:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230914075300.773380-1-kai.kang@windriver.com>
In-Reply-To: <20230914075300.773380-1-kai.kang@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 15 Sep 2023 13:31:33 -0400
Message-ID: <CADkTA4NHAnuTYY_6mGGXXN4C0vDjFUVPH-hfKr0JSNWT8AmCrQ@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH v2 0/4] Update COMPATIBLE_HOST
To: Kai Kang <kai.kang@eng.windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 15 Sep 2023 17:31:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8311

merged.

Bruce

On Thu, Sep 14, 2023 at 3:53=E2=80=AFAM Kai Kang <kai.kang@eng.windriver.co=
m> wrote:
>
> From: Kai Kang <kai.kang@windriver.com>
>
> tested with
> $ for m in qemuriscv32 qemuriscv64 qemumips qemux86; do
>           MACHINE=3D$m bitbake -n world
>   done
>
> Kai Kang (4):
>   packagegroup-container: not compatible with mips and riscv
>   docker-compose: not compatible with mips
>   packagegroup-kubernetes: set COMPATIBLE_HOST
>   k3s: not compatible with mips
>
>  recipes-containers/docker-compose/docker-compose_git.bb | 2 ++
>  recipes-containers/k3s/k3s_git.bb                       | 2 ++
>  recipes-core/packagegroups/packagegroup-container.bb    | 2 +-
>  recipes-core/packagegroups/packagegroup-kubernetes.bb   | 2 +-
>  4 files changed, 6 insertions(+), 2 deletions(-)
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8305): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8305
> Mute This Topic: https://lists.yoctoproject.org/mt/101354132/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

