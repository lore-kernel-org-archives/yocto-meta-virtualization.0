Return-Path: <rfried.dev@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28D7AC27C5F
	for <webhook@archiver.kernel.org>; Mon, 10 Jun 2024 04:22:49 +0000 (UTC)
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
 by mx.groups.io with SMTP id smtpd.web11.12069.1717993366565953561
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 09 Jun 2024 21:22:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LjxW+3O/;
 spf=pass (domain: gmail.com, ip: 209.85.161.43, mailfrom: rfried.dev@gmail.com)
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-5b97a071c92so2015581eaf.1
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 09 Jun 2024 21:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717993366; x=1718598166; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s4Ibfk6kl5bvX6jjWYMu73grQy7dWefkn56JTJ+u6us=;
        b=LjxW+3O/Csiv+lWvzF56YDqnloti46/Nj+03MahU2g7pJrbIfBqATobGV2XiXn0TG+
         famRX0s7l9+TKEEi4NFgrglxuseU+Bf4AgOGPkr0H3a7sdFpeTe4CQMVNZ8KOT9XOBZl
         azVzwVo70LBiuwpIRwAn1W7QTiLl5ditwuHE+vyWjzBNPyEjzrmCfEssynylkAlId2Ab
         UjbTSH9fceAjVaLK5MAu2zJgsndsRbg5wi7N+xKm9Tw6tA/7joE1MxfYtpGr3X9/YCHo
         vA3AB0NY51Ri+2ygajVZ7IAodk8K2Y84lKx7aMSmoZFP+h5O2ne2BmshBIFFzyLjFVu0
         MqqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717993366; x=1718598166;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s4Ibfk6kl5bvX6jjWYMu73grQy7dWefkn56JTJ+u6us=;
        b=A1ajPRNPmIaVQDD4tktiAgxoczukwTVeOXTLhfu/VfvPmRwgMdzfodDoOX++430rr0
         dr+LFBtBr/6zFym2HN0WhWQZy4ZZweSS0XpU+dIQbXiCH48vIMZqQlxNeccGMW3/C1KY
         nFT9NowRcxGpGmC2FrEYpAMN7kj6syRhmqQjinXNZDbrD4Ou7yGT6kjjdcKm+qlS8brG
         4vnfYVd1ObbDyfZU7Q8Dnk4csmbFOVRRswT4nvW5e6IDvDT6krEz5ffj5GzK0kQye+Lv
         OrClsobXzzmfsuUv/imZHMdQjXLloa0duQ8687pVjkDoQvr6YB3WnyAL+pWQHSt1+rRE
         2J7Q==
X-Gm-Message-State: AOJu0YyOSO0ecMPKmDFxjU3Wm14iQOPxE5mPTxBJys0aFvuLbq1NnzRy
	GOgMynzkFyYZVejAOjWxX1uaPTbh3s/Q7oJwRiuHGOz9mpa5Xvo/OHhz7tmMyP8Cstr3QGsELLm
	KPa2OkRCqZ7okG8QY468bfGgbGspV0ldV8jU=
X-Google-Smtp-Source: AGHT+IEucHHWe2MYUWgJ94fKYizi+n7wmR6RidKkuZY+Dxoscjiax0gaoh89xk1qaKHNrtBo0t5rL6vaWIIBGaiif7U=
X-Received: by 2002:a05:6820:810:b0:5ba:f55f:83e2 with SMTP id
 006d021491bc7-5baf55f84c9mr2203995eaf.2.1717993365705; Sun, 09 Jun 2024
 21:22:45 -0700 (PDT)
MIME-Version: 1.0
References: <CAGi-RUK7ARiAVcS-in3m_E1EjCOzFvPb=k=WYBJZCWQB_fT7UQ@mail.gmail.com>
 <CADkTA4Me4M4qEeyvNWhHQ32m=9iuef4HRCSGTfNmst53KyW7MQ@mail.gmail.com>
In-Reply-To: <CADkTA4Me4M4qEeyvNWhHQ32m=9iuef4HRCSGTfNmst53KyW7MQ@mail.gmail.com>
From: Ramon Fried <rfried.dev@gmail.com>
Date: Mon, 10 Jun 2024 07:22:35 +0300
Message-ID: <CAGi-RUL5ac3U-fh_Q5V2KiwHf8p_0H2zDwCmiMJjj7dCpHRs8w@mail.gmail.com>
Subject: Re: [meta-virtualization] mickledore - packagegroup-kubernetes-node
 pulls k3s instead of k8s
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 10 Jun 2024 04:22:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8794

On Mon, Jun 10, 2024 at 6:01=E2=80=AFAM Bruce Ashfield <bruce.ashfield@gmai=
l.com> wrote:
>
> On Sat, Jun 8, 2024 at 5:15=E2=80=AFPM Ramon Fried via lists.yoctoproject=
.org
> <rfried.dev=3Dgmail.com@lists.yoctoproject.org> wrote:
> >
> > Hi.
> > On mickledore, when directly selecting kubernetes, only k8s is built.
> > I recently noticed the packagegroup-kubernetes-node and decided to use
> > that instead of kubernetes.
> > When Iuse that, we see k3s is also pulled and built.
> >
> > I masked the k3s.bb to understand the dependencies and it looks like th=
at:
> >
> > Missing or unbuildable dependency chain was: ['k3s-server']
> > NOTE: Runtime target 'packagegroup-k8s-node' is unbuildable, removing..=
.
> > Missing or unbuildable dependency chain was: ['packagegroup-k8s-node',
> > 'k3s-server']
> > NOTE: Runtime target 'packagegroup-core-boot' is unbuildable, removing.=
..
> > Missing or unbuildable dependency chain was:
> > ['packagegroup-core-boot', 'packagegroup-k8s-node', 'k3s-server']
> > NOTE: Runtime target 'core-image-minimal' is unbuildable, removing...
> > Missing or unbuildable dependency chain was: ['core-image-minimal',
> > 'packagegroup-core-boot', 'packagegroup-k8s-node', 'k3s-server']
> >
> > Is it intentional, or is there a problem here ?
> >
>
> It's more the way that packagegroups work.
>
> How are you building packagegroup-k8s-node ? is it from your own
> image (and rdepends) ? or is it from the command line on bitbake
> (which shouldn't work as it is only rprovided).
Building the complete image. The packagegroup was added to
MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS.

